/* ══ FoodieHub Admin Panel JS ══ */

/* ── Sidebar Toggle ── */
function toggleSidebar(){
  document.querySelector('.admin-sidebar')?.classList.toggle('open');
  document.querySelector('.sidebar-overlay')?.classList.toggle('show');
}
document.addEventListener('click',function(e){
  if(e.target.classList.contains('sidebar-overlay'))toggleSidebar();
});

/* ── Profile Dropdown ── */
function toggleProfileDropdown(){
  document.querySelector('.profile-dropdown')?.classList.toggle('show');
}
document.addEventListener('click',function(e){
  if(!e.target.closest('.admin-profile')&&!e.target.closest('.profile-dropdown')){
    document.querySelector('.profile-dropdown')?.classList.remove('show');
  }
});

/* ── Toast ── */
function showAdminToast(msg,type='success'){
  let t=document.getElementById('adminToast');
  if(!t)return;
  t.textContent=msg;t.className='admin-toast '+type+' show';
  setTimeout(()=>t.classList.remove('show'),2500);
}

/* ── Modal ── */
function showModal(title,message,onConfirm){
  let o=document.getElementById('modalOverlay');
  if(!o)return;
  o.querySelector('h3').textContent=title;
  o.querySelector('p').textContent=message;
  o.classList.add('show');
  o._onConfirm=onConfirm;
}
function closeModal(){document.getElementById('modalOverlay')?.classList.remove('show')}
function confirmModal(){
  let o=document.getElementById('modalOverlay');
  if(o&&o._onConfirm)o._onConfirm();
  closeModal();showAdminToast('Action completed successfully');
}

/* ── Password Toggle ── */
function togglePassword(inputId){
  let i=document.getElementById(inputId);
  if(!i)return;
  let btn=i.nextElementSibling||i.parentElement.querySelector('button');
  if(i.type==='password'){i.type='text';if(btn)btn.innerHTML='<i class="fa-solid fa-eye-slash"></i>';}
  else{i.type='password';if(btn)btn.innerHTML='<i class="fa-solid fa-eye"></i>';}
}

/* ── Demo Login ── */
function handleAdminLogin(e){
  e.preventDefault();
  let email=document.getElementById('adminEmail')?.value;
  let pass=document.getElementById('adminPassword')?.value;
  if(!email||!pass){showAdminToast('Please fill all fields','error');return;}
  sessionStorage.setItem('adminLoggedIn','true');
  showAdminToast('Login successful! Redirecting...');
  setTimeout(()=>window.location.href='dashboard.aspx',1200);
}

/* ── Demo Logout ── */
function adminLogout(){sessionStorage.removeItem('adminLoggedIn');showAdminToast('Logging out...');setTimeout(()=>window.location.href='login.aspx',800);}

/* ── Chart Drawing (Canvas) ── */
function drawBarChart(canvasId,labels,data,color='#ff5a1f'){
  let c=document.getElementById(canvasId);if(!c)return;
  let ctx=c.getContext('2d');
  let W=c.width=c.parentElement.clientWidth;
  let H=c.height=c.parentElement.clientHeight||280;
  let max=Math.max(...data)*1.2||1;
  let barW=(W-80)/(labels.length*2);
  let startX=50;let baseY=H-40;
  ctx.clearRect(0,0,W,H);
  // Grid
  ctx.strokeStyle='#e8ecf1';ctx.lineWidth=1;
  for(let i=0;i<=4;i++){
    let y=baseY-(baseY-20)*(i/4);
    ctx.beginPath();ctx.moveTo(40,y);ctx.lineTo(W-10,y);ctx.stroke();
    ctx.fillStyle='#6c757d';ctx.font='11px Poppins';ctx.textAlign='right';
    ctx.fillText(Math.round(max*i/4),35,y+4);
  }
  // Bars
  data.forEach((v,i)=>{
    let barH=(v/max)*(baseY-20);
    let x=startX+i*(barW*2+8);
    let grad=ctx.createLinearGradient(0,baseY-barH,0,baseY);
    grad.addColorStop(0,color);grad.addColorStop(1,color+'66');
    ctx.fillStyle=grad;
    ctx.beginPath();ctx.roundRect(x,baseY-barH,barW,barH,[6,6,0,0]);ctx.fill();
    ctx.fillStyle='#6c757d';ctx.font='10px Poppins';ctx.textAlign='center';
    ctx.fillText(labels[i],x+barW/2,baseY+16);
  });
}

function drawLineChart(canvasId,labels,data,color='#ff5a1f'){
  let c=document.getElementById(canvasId);if(!c)return;
  let ctx=c.getContext('2d');
  let W=c.width=c.parentElement.clientWidth;
  let H=c.height=c.parentElement.clientHeight||280;
  let max=Math.max(...data)*1.2||1;
  let startX=50;let baseY=H-40;let gap=(W-70)/(labels.length-1);
  ctx.clearRect(0,0,W,H);
  // Grid
  ctx.strokeStyle='#e8ecf1';ctx.lineWidth=1;
  for(let i=0;i<=4;i++){
    let y=baseY-(baseY-20)*(i/4);
    ctx.beginPath();ctx.moveTo(40,y);ctx.lineTo(W-10,y);ctx.stroke();
    ctx.fillStyle='#6c757d';ctx.font='11px Poppins';ctx.textAlign='right';
    ctx.fillText(Math.round(max*i/4),35,y+4);
  }
  // Area
  ctx.beginPath();
  data.forEach((v,i)=>{let x=startX+i*gap;let y=baseY-(v/max)*(baseY-20);i===0?ctx.moveTo(x,y):ctx.lineTo(x,y);});
  ctx.lineTo(startX+(data.length-1)*gap,baseY);ctx.lineTo(startX,baseY);ctx.closePath();
  ctx.fillStyle=color+'15';ctx.fill();
  // Line
  ctx.beginPath();
  data.forEach((v,i)=>{let x=startX+i*gap;let y=baseY-(v/max)*(baseY-20);i===0?ctx.moveTo(x,y):ctx.lineTo(x,y);});
  ctx.strokeStyle=color;ctx.lineWidth=2.5;ctx.stroke();
  // Dots + Labels
  data.forEach((v,i)=>{
    let x=startX+i*gap;let y=baseY-(v/max)*(baseY-20);
    ctx.beginPath();ctx.arc(x,y,4,0,Math.PI*2);ctx.fillStyle=color;ctx.fill();
    ctx.beginPath();ctx.arc(x,y,2,0,Math.PI*2);ctx.fillStyle='#fff';ctx.fill();
    ctx.fillStyle='#6c757d';ctx.font='10px Poppins';ctx.textAlign='center';
    ctx.fillText(labels[i],x,baseY+16);
  });
}

function drawDoughnutChart(canvasId,labels,data,colors){
  let c=document.getElementById(canvasId);if(!c)return;
  let ctx=c.getContext('2d');
  let size=Math.min(c.parentElement.clientWidth,c.parentElement.clientHeight||250);
  c.width=c.parentElement.clientWidth;c.height=c.parentElement.clientHeight||250;
  let cx=c.width/2;let cy=c.height/2;let r=Math.min(cx,cy)-30;let ir=r*0.6;
  let total=data.reduce((a,b)=>a+b,0);let angle=-Math.PI/2;
  ctx.clearRect(0,0,c.width,c.height);
  data.forEach((v,i)=>{
    let sliceAngle=(v/total)*Math.PI*2;
    ctx.beginPath();ctx.arc(cx,cy,r,angle,angle+sliceAngle);ctx.arc(cx,cy,ir,angle+sliceAngle,angle,true);ctx.closePath();
    ctx.fillStyle=colors[i%colors.length];ctx.fill();
    // Label
    let mid=angle+sliceAngle/2;let lx=cx+Math.cos(mid)*(r+ir)/2;let ly=cy+Math.sin(mid)*(r+ir)/2;
    ctx.fillStyle='#fff';ctx.font='bold 11px Poppins';ctx.textAlign='center';
    ctx.fillText(Math.round(v/total*100)+'%',lx,ly+4);
    angle+=sliceAngle;
  });
  // Center text
  ctx.fillStyle='#2d2d2d';ctx.font='bold 18px Poppins';ctx.textAlign='center';
  ctx.fillText(total,cx,cy);
  ctx.fillStyle='#6c757d';ctx.font='11px Poppins';ctx.fillText('Total',cx,cy+18);
  // Legend
  let lx=10;let ly=c.height-15;
  labels.forEach((l,i)=>{
    ctx.fillStyle=colors[i%colors.length];ctx.fillRect(lx,ly-8,10,10);
    ctx.fillStyle='#6c757d';ctx.font='10px Poppins';ctx.textAlign='left';
    ctx.fillText(l,lx+14,ly);lx+=ctx.measureText(l).width+30;
  });
}

/* ── Chart Tab Switching ── */
function switchChartTab(btn,chartFn){
  btn.parentElement.querySelectorAll('.chart-tab').forEach(t=>t.classList.remove('active'));
  btn.classList.add('active');
  if(chartFn)chartFn();
}

/* ── Demo Data ── */
const demoOrders=[
  {id:'#FH1001',customer:'Ava Johnson',avatar:'https://i.pravatar.cc/40?img=1',items:'Pepperoni Pizza x2',amount:'₹649',payment:'Online',status:'Delivered',date:'Aug 8, 2026'},
  {id:'#FH1002',customer:'John Smith',avatar:'https://i.pravatar.cc/40?img=3',items:'Smoky Burger x1, Fries',amount:'₹399',payment:'COD',status:'Preparing',date:'Aug 8, 2026'},
  {id:'#FH1003',customer:'Mina Patel',avatar:'https://i.pravatar.cc/40?img=5',items:'Biryani x1',amount:'₹299',payment:'Online',status:'Pending',date:'Aug 7, 2026'},
  {id:'#FH1004',customer:'Raj Kumar',avatar:'https://i.pravatar.cc/40?img=8',items:'Pizza + Drink Combo',amount:'₹549',payment:'UPI',status:'Confirmed',date:'Aug 7, 2026'},
  {id:'#FH1005',customer:'Sara Ali',avatar:'https://i.pravatar.cc/40?img=9',items:'Club Sandwich x2',amount:'₹349',payment:'Online',status:'Out for Delivery',date:'Aug 7, 2026'},
  {id:'#FH1006',customer:'Mike Chen',avatar:'https://i.pravatar.cc/40?img=11',items:'Hot Noodles x1',amount:'₹249',payment:'COD',status:'Delivered',date:'Aug 6, 2026'},
  {id:'#FH1007',customer:'Priya Sharma',avatar:'https://i.pravatar.cc/40?img=16',items:'Chocolate Lava x2',amount:'₹199',payment:'Online',status:'Cancelled',date:'Aug 6, 2026'},
  {id:'#FH1008',customer:'Tom Wilson',avatar:'https://i.pravatar.cc/40?img=12',items:'Veggie Wrap x3',amount:'₹449',payment:'UPI',status:'Delivered',date:'Aug 5, 2026'},
  {id:'#FH1009',customer:'Neha Gupta',avatar:'https://i.pravatar.cc/40?img=20',items:'Mango Lassi x4',amount:'₹319',payment:'COD',status:'Pending',date:'Aug 5, 2026'},
  {id:'#FH1010',customer:'David Lee',avatar:'https://i.pravatar.cc/40?img=14',items:'Garlic Noodles x1',amount:'₹279',payment:'Online',status:'Delivered',date:'Aug 4, 2026'}
];

const demoCustomers=[
  {name:'Ava Johnson',email:'ava@email.com',phone:'+1 234-567-8901',orders:12,spent:'₹8,450',status:'Active',joined:'Jan 15, 2026',avatar:'https://i.pravatar.cc/40?img=1'},
  {name:'John Smith',email:'john@email.com',phone:'+1 234-567-8902',orders:8,spent:'₹5,200',status:'Active',joined:'Feb 20, 2026',avatar:'https://i.pravatar.cc/40?img=3'},
  {name:'Mina Patel',email:'mina@email.com',phone:'+91 98765-43210',orders:15,spent:'₹12,300',status:'Active',joined:'Dec 5, 2025',avatar:'https://i.pravatar.cc/40?img=5'},
  {name:'Raj Kumar',email:'raj@email.com',phone:'+91 87654-32109',orders:6,spent:'₹3,800',status:'Active',joined:'Mar 10, 2026',avatar:'https://i.pravatar.cc/40?img=8'},
  {name:'Sara Ali',email:'sara@email.com',phone:'+1 345-678-9012',orders:3,spent:'₹1,900',status:'Blocked',joined:'Apr 1, 2026',avatar:'https://i.pravatar.cc/40?img=9'},
  {name:'Mike Chen',email:'mike@email.com',phone:'+1 456-789-0123',orders:20,spent:'₹15,600',status:'Active',joined:'Nov 8, 2025',avatar:'https://i.pravatar.cc/40?img=11'},
  {name:'Priya Sharma',email:'priya@email.com',phone:'+91 76543-21098',orders:9,spent:'₹6,700',status:'Active',joined:'Jan 28, 2026',avatar:'https://i.pravatar.cc/40?img=16'},
  {name:'Tom Wilson',email:'tom@email.com',phone:'+1 567-890-1234',orders:4,spent:'₹2,400',status:'Active',joined:'May 15, 2026',avatar:'https://i.pravatar.cc/40?img=12'}
];

const demoPayments=[
  {id:'PAY-5001',orderId:'#FH1001',customer:'Ava Johnson',amount:'₹649',method:'Credit Card',txnId:'TXN78291034',status:'Paid',date:'Aug 8, 2026'},
  {id:'PAY-5002',orderId:'#FH1002',customer:'John Smith',amount:'₹399',method:'Cash on Delivery',txnId:'—',status:'Pending',date:'Aug 8, 2026'},
  {id:'PAY-5003',orderId:'#FH1003',customer:'Mina Patel',amount:'₹299',method:'UPI',txnId:'TXN78291035',status:'Paid',date:'Aug 7, 2026'},
  {id:'PAY-5004',orderId:'#FH1004',customer:'Raj Kumar',amount:'₹549',method:'UPI',txnId:'TXN78291036',status:'Paid',date:'Aug 7, 2026'},
  {id:'PAY-5005',orderId:'#FH1005',customer:'Sara Ali',amount:'₹349',method:'Credit Card',txnId:'TXN78291037',status:'Failed',date:'Aug 7, 2026'},
  {id:'PAY-5006',orderId:'#FH1007',customer:'Priya Sharma',amount:'₹199',method:'Net Banking',txnId:'TXN78291038',status:'Refunded',date:'Aug 6, 2026'}
];

const demoCoupons=[
  {code:'WELCOME50',type:'Percentage',value:'50%',minOrder:'₹299',maxDiscount:'₹100',start:'Aug 1, 2026',end:'Aug 31, 2026',usage:'100',status:'Active'},
  {code:'FLAT100',type:'Flat',value:'₹100',minOrder:'₹499',maxDiscount:'₹100',start:'Jul 15, 2026',end:'Sep 15, 2026',usage:'200',status:'Active'},
  {code:'NEWUSER20',type:'Percentage',value:'20%',minOrder:'₹199',maxDiscount:'₹80',start:'Jun 1, 2026',end:'Dec 31, 2026',usage:'500',status:'Active'},
  {code:'FREEDEL',type:'Free Delivery',value:'Free',minOrder:'₹149',maxDiscount:'₹50',start:'Aug 5, 2026',end:'Aug 20, 2026',usage:'50',status:'Expired'}
];

const demoReviews=[
  {customer:'Ava Johnson',avatar:'https://i.pravatar.cc/40?img=1',food:'Pepperoni Pizza',rating:5,review:'Absolutely delicious! Best pizza I\'ve had in a long time.','date':'Aug 8, 2026',status:'Approved'},
  {customer:'John Smith',avatar:'https://i.pravatar.cc/40?img=3',food:'Smoky Burger',rating:4,review:'Great taste but took a bit longer to deliver.','date':'Aug 7, 2026',status:'Approved'},
  {customer:'Mina Patel',avatar:'https://i.pravatar.cc/40?img=5',food:'Hyderabadi Biryani',rating:5,review:'Authentic flavors! Will definitely order again.','date':'Aug 7, 2026',status:'Pending'},
  {customer:'Raj Kumar',avatar:'https://i.pravatar.cc/40?img=8',food:'Hot Noodles',rating:3,review:'Average taste. Expected more spice.','date':'Aug 6, 2026',status:'Approved'},
  {customer:'Sara Ali',avatar:'https://i.pravatar.cc/40?img=9',food:'Club Sandwich',rating:4,review:'Fresh and filling. Good portion size.','date':'Aug 5, 2026',status:'Hidden'}
];

const demoDeliveryPartners=[
  {name:'Ravi Verma',avatar:'https://i.pravatar.cc/48?img=52',phone:'+91 98765-11111',status:'Available',assigned:0,completed:145,earnings:'₹12,500'},
  {name:'Amit Singh',avatar:'https://i.pravatar.cc/48?img=53',phone:'+91 98765-22222',status:'Busy',assigned:2,completed:203,earnings:'₹18,200'},
  {name:'Suresh Nair',avatar:'https://i.pravatar.cc/48?img=54',phone:'+91 98765-33333',status:'Available',assigned:0,completed:98,earnings:'₹8,400'},
  {name:'Kiran Rao',avatar:'https://i.pravatar.cc/48?img=55',phone:'+91 98765-44444',status:'Offline',assigned:0,completed:67,earnings:'₹5,800'},
  {name:'Deepak Joshi',avatar:'https://i.pravatar.cc/48?img=56',phone:'+91 98765-55555',status:'Busy',assigned:1,completed:178,earnings:'₹15,300'},
  {name:'Manoj Tiwari',avatar:'https://i.pravatar.cc/48?img=57',phone:'+91 98765-66666',status:'Available',assigned:0,completed:112,earnings:'₹9,700'}
];

const demoFoodItems=[
  {id:1,name:'Pepperoni Pizza',category:'Pizza',price:'₹349',discount:'₹299',type:'Non-Veg',rating:4.8,available:true,featured:true,image:'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=100&q=80'},
  {id:2,name:'Smoky Burger',category:'Burger',price:'₹249',discount:'',type:'Non-Veg',rating:4.6,available:true,featured:false,image:'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=100&q=80'},
  {id:3,name:'Hyderabadi Biryani',category:'Biryani',price:'₹299',discount:'₹269',type:'Non-Veg',rating:4.9,available:true,featured:true,image:'https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=100&q=80'},
  {id:4,name:'Hot Noodles',category:'Chinese',price:'₹199',discount:'',type:'Veg',rating:4.5,available:true,featured:false,image:'https://images.unsplash.com/photo-1526318896980-cf78c088247c?auto=format&fit=crop&w=100&q=80'},
  {id:5,name:'Club Sandwich',category:'Sandwich',price:'₹179',discount:'₹149',type:'Non-Veg',rating:4.4,available:false,featured:false,image:'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?auto=format&fit=crop&w=100&q=80'},
  {id:6,name:'Berry Smoothie',category:'Drinks',price:'₹149',discount:'',type:'Veg',rating:4.7,available:true,featured:false,image:'https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&w=100&q=80'},
  {id:7,name:'Chocolate Lava',category:'Desserts',price:'₹189',discount:'₹159',type:'Veg',rating:4.8,available:true,featured:true,image:'https://images.unsplash.com/photo-1621303837174-89787a7d4729?auto=format&fit=crop&w=100&q=80'},
  {id:8,name:'Veggie Wrap',category:'Sandwich',price:'₹169',discount:'',type:'Veg',rating:4.5,available:true,featured:false,image:'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=100&q=80'}
];

/* ── Status Badge Helper ── */
function statusBadge(s){
  let cls={Pending:'pending',Confirmed:'confirmed',Preparing:'preparing','Out for Delivery':'delivering',Delivered:'delivered',Cancelled:'cancelled',Paid:'paid',Failed:'failed',Refunded:'refunded',Active:'active',Blocked:'blocked',Expired:'cancelled',Approved:'approved',Hidden:'hidden',Available:'available',Busy:'busy',Offline:'offline'};
  return '<span class="badge-admin badge-'+(cls[s]||'pending')+'">'+s+'</span>';
}

function starRating(r){
  let s='';for(let i=1;i<=5;i++)s+='<i class="fa-solid fa-star '+(i<=r?'':'empty')+'"></i>';
  return '<span class="stars">'+s+'</span>';
}

/* ── Table Search ── */
function setupTableSearch(inputId,tableId){
  let input=document.getElementById(inputId);
  if(!input)return;
  input.addEventListener('input',function(){
    let val=this.value.toLowerCase();
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(row=>{
      row.style.display=row.textContent.toLowerCase().includes(val)?'':'none';
    });
  });
}

/* ── Status Filter ── */
function setupStatusFilter(selectId,tableId,colIndex){
  let sel=document.getElementById(selectId);
  if(!sel)return;
  sel.addEventListener('change',function(){
    let val=this.value;
    document.querySelectorAll('#'+tableId+' tbody tr').forEach(row=>{
      if(!val)row.style.display='';
      else{let cell=row.cells[colIndex];row.style.display=cell&&cell.textContent.trim()===val?'':'none';}
    });
  });
}

/* ── Init Charts on Dashboard ── */
function initDashboardCharts(){
  drawLineChart('revenueChart',['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],[4200,5800,3900,7200,6100,8900,7400],'#ff5a1f');
  drawDoughnutChart('ordersPieChart',['Delivered','Pending','Preparing','Cancelled'],[42,15,8,5],['#198754','#ffc107','#6f42c1','#dc3545']);
}

function initReportsCharts(){
  drawBarChart('revenueBarChart',['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug'],[28000,32000,27000,35000,41000,38000,45000,42000],'#ff5a1f');
  drawLineChart('orderLineChart',['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug'],[120,145,132,168,190,175,210,195],'#0d6efd');
  drawDoughnutChart('categoryPieChart',['Pizza','Burger','Biryani','Chinese','Desserts','Drinks'],[85,62,78,45,38,52],['#ff5a1f','#ffc107','#198754','#0d6efd','#6f42c1','#0dcaf0']);
  drawBarChart('foodSalesChart',['Pepperoni','Burger','Biryani','Noodles','Sandwich','Smoothie','Lava Cake','Wrap'],[95,72,88,54,41,63,77,38],'#198754');
}

/* ── Window Resize Handler ── */
window.addEventListener('resize',function(){
  if(document.getElementById('revenueChart'))initDashboardCharts();
  if(document.getElementById('revenueBarChart'))initReportsCharts();
});

/* ── Page Init ── */
document.addEventListener('DOMContentLoaded',function(){
  // Dashboard charts
  if(document.getElementById('revenueChart'))setTimeout(initDashboardCharts,100);
  // Reports charts
  if(document.getElementById('revenueBarChart'))setTimeout(initReportsCharts,100);
  // Table search
  setupTableSearch('orderSearch','ordersTable');
  setupTableSearch('customerSearch','customersTable');
  setupTableSearch('paymentSearch','paymentsTable');
  setupTableSearch('reviewSearch','reviewsTable');
  setupTableSearch('menuSearch','menuTable');
  setupTableSearch('couponSearch','couponsTable');
  // Status filters
  setupStatusFilter('orderStatusFilter','ordersTable',5);
  setupStatusFilter('paymentStatusFilter','paymentsTable',6);
});
