Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211D1F418B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820374; cv=none; b=JFZJe7s4jS5+BJhVJKhMrzs/GAdxg9FFzXUFd/AIHZHVfSoI+I+xzqPehpFQZxunUV722MsuQYeSyb4hOHWCM388PlrT80yCGj1CzUJvlYcb3eeeJ0yhORAdrtvJrwoofzTjGsJzKxS1W74sjDJa4Ji1zSiLlR0wSgXqYWora+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820374; c=relaxed/simple;
	bh=lN7BvZoRd8noli8YskFQWCbRMWwGrkqjMl/Itdy6NqU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odOoczhrIH89fq/QUhFO4oKAGV03OWJv5xj60iBmWlBQGwY9v77BI6YN3TW49lSDAUtQTgJ0f49GfUGifr5zNEXxeuinNQxviNxDRlOoPM92sQGIW4FkiHDLGbZ+KATA+rVuTpB+ME/wVuoxws+m0yaG9zaG/X3zPlHhw/v2UlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4KfsO4p; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4KfsO4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744820372; x=1776356372;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lN7BvZoRd8noli8YskFQWCbRMWwGrkqjMl/Itdy6NqU=;
  b=N4KfsO4pCv9wF+13wpxHcd9P0s5r9dkPOdsC+uhS8cG4uLdpLbXUuBLF
   DbJ88S2AJvdpn8NUhfQ/4g9wkba/HdsK0CllfQ1I/+lr1WgYY9G7UVH7H
   T6wOGtc8gZ5iPbirWbXCXNsLarj/N/LorM8DvRJVDfr1sJkoS9aUVwlPN
   fUWUwzp/cDzp6yaKr3DUROlzLJzr+Vv9P9966etLoBRiKd+QJ7XM8kxvM
   n1xAa7/lsD1HIjutP09Bf6r7eQLJzDI+tw52Yh0NDm0O5XfGKR1AXr9Re
   XL288n8NEf9tfa329POIZnYyb8JowhvNhqh1Tup2ahcSqDbkBtjbTyjUr
   w==;
X-CSE-ConnectionGUID: 1IxVERZORvisgyh249egGg==
X-CSE-MsgGUID: ppgrXCKfSpe35wt4vgSFgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="33998975"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="33998975"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:19:31 -0700
X-CSE-ConnectionGUID: HKeGjqQjS56WHzfCJFXFkA==
X-CSE-MsgGUID: jSlVe6e9T7q6EjfwWGI6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131079341"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [10.125.109.241]) ([10.125.109.241])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:19:31 -0700
Message-ID: <23e05939e7a19151d9b17d011e48a85d650b4e8a.camel@linux.intel.com>
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition
 if load balance is not due
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, "Chen, Yu C"
 <yu.c.chen@intel.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Doug Nelson
 <doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>, 
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@kernel.org>
Date: Wed, 16 Apr 2025 09:19:30 -0700
In-Reply-To: <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
	 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
	 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
	 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
Autocrypt: addr=tim.c.chen@linux.intel.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-16 at 14:46 +0530, Shrikanth Hegde wrote:
>=20
> On 4/16/25 11:58, Chen, Yu C wrote:
> > Hi Shrikanth,
> >=20
> > On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
> > >=20
> > >=20
> > > On 4/16/25 09:28, Tim Chen wrote:
> > > > At load balance time, balance of last level cache domains and
> > > > above needs to be serialized. The scheduler checks the atomic var
> > > > sched_balance_running first and then see if time is due for a load
> > > > balance. This is an expensive operation as multiple CPUs can attemp=
t
> > > > sched_balance_running acquisition at the same time.
> > > >=20
> > > > On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> > > > running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> > > > sched_balance_running.=C2=A0 Most of the time, a balance attempt is=
 aborted
> > > > immediately after acquiring sched_balance_running as load balance t=
ime
> > > > is not due.
> > > >=20
> > > > Instead, check balance due time first before acquiring
> > > > sched_balance_running. This skips many useless acquisitions
> > > > of sched_balance_running and knocks the 7.6% CPU overhead on
> > > > sched_balance_domain() down to 0.05%.=C2=A0 Throughput of the OLTP =
workload
> > > > improved by 11%.
> > > >=20
> > >=20
> > > Hi Tim.
> > >=20
> > > Time check makes sense specially on large systems mainly due to=20
> > > NEWIDLE balance.
>=20
> scratch the NEWLY_IDLE part from that comment.
>=20
> > >=20
> >=20
> > Could you elaborate a little on this statement? There is no timeout=20
> > mechanism like periodic load balancer for the NEWLY_IDLE, right?
>=20
> Yes. NEWLY_IDLE is very opportunistic.
>=20
> >=20
> > > One more point to add, A lot of time, the CPU which acquired=20
> > > sched_balance_running,
> > > need not end up doing the load balance, since it not the CPU meant to=
=20
> > > do the load balance.
> > >=20
> > > This thread.
> > > https://lore.kernel.org/all/1e43e783-55e7-417f-=20
> > > a1a7-503229eb163a@linux.ibm.com/
> > >=20
> > >=20
> > > Best thing probably is to acquire it if this CPU has passed the time=
=20
> > > check and as well it is
> > > actually going to do load balance.
> > >=20
> > >=20
> >=20
> > This is a good point, and we might only want to deal with periodic load
> > balancer rather than NEWLY_IDLE balance. Because the latter is too=20
> > frequent and contention on the sched_balance_running might introduce
> > high cache contention.
> >=20
>=20
> But NEWLY_IDLE doesn't serialize using sched_balance_running and can=20
> endup consuming a lot of cycles. But if we serialize using=20
> sched_balance_running, it would definitely cause a lot contention as is.
>=20
>=20
> The point was, before acquiring it, it would be better if this CPU is=20
> definite to do the load balance. Else there are chances to miss the=20
> actual load balance.
>=20
You mean doing a should_we_balance() check?  I think we should not
even consider that if balance time is not due and this balance due check sh=
ould
come first.

Do you have objection to switching the order of the time due check and seri=
alization/sched_balance_running
around as in this patch?  Adding a change to see if this is the right balan=
cing CPU could be
an orthogonal change.=20

97% of CPU cycles in sched_balance_domains() are not spent doing useful loa=
d balancing work,
but simply in the acquisition of sched_balance_running in the OLTP workload=
 we tested.

         :
         : 104              static __always_inline int arch_atomic_cmpxchg(=
atomic_t *v, int old, int new)
         : 105              {
         : 106              return arch_cmpxchg(&v->counter, old, new);
    0.00 :   ffffffff81138f8e:       xor    %eax,%eax
    0.00 :   ffffffff81138f90:       mov    $0x1,%ecx
    0.00 :   ffffffff81138f95:       lock cmpxchg %ecx,0x2577d33(%rip)     =
   # ffffffff836b0cd0 <sched_balance_running>
         : 110              sched_balance_domains():
         : 12146            if (atomic_cmpxchg_acquire(&sched_balance_runni=
ng, 0, 1))
   97.01 :   ffffffff81138f9d:       test   %eax,%eax
    0.00 :   ffffffff81138f9f:       jne    ffffffff81138fbb <sched_balance=
_domains+0x20b>
         : 12150            if (time_after_eq(jiffies, sd->last_balance + i=
nterval)) {
    0.00 :   ffffffff81138fa1:       mov    0x16cfa18(%rip),%rax        # f=
fffffff828089c0 <jiffies_64>
    0.00 :   ffffffff81138fa8:       sub    0x48(%r14),%rax
    0.00 :   ffffffff81138fac:       cmp    %rdx,%rax
    0.00 :   ffffffff81138faf:       jns    ffffffff8113900f <sched_balance=
_domains+0x25f>
         : 12155            raw_atomic_set_release():

So trying to skip this unnecessary acquisition and consider load balancing =
only when time is due.

Tim

>=20
> > thanks,
> > Chenyu
> >=20
> > > > Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> > > > Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> > > > Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
> > > > ---
> > > > =C2=A0 kernel/sched/fair.c | 16 ++++++++--------
> > > > =C2=A0 1 file changed, 8 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index e43993a4e580..5e5f7a770b2f 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct =
rq=20
> > > > *rq, enum cpu_idle_type idle)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interval =3D=
 get_sd_balance_interval(sd, busy);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need_serialize =3D sd->=
flags & SD_SERIALIZE;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (need_serialize) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > -
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (time_aft=
er_eq(jiffies, sd->last_balance + interval)) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 need_serialize =3D sd->flags & SD_SERIALIZE;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (need_serialize) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (atomic_cmpxchg_acquire(&sched_balance_running,=
=20
> > > > 0, 1))
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (sched_balance_rq(cpu, rq, sd, idle,=20
> > > > &continue_balancing)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The LBF_DST_PINNED logic could=
 have changed
> > > > @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq=
=20
> > > > *rq, enum cpu_idle_type idle)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sd->last_balance =3D jiffies;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 interval =3D get_sd_balance_interval(sd, busy);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (need_serialize)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 atomic_set_release(&sched_balance_running, 0);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (need_serialize)
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 atomic_set_release(&sched_balance_running, 0);
> > > > =C2=A0 out:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (time_aft=
er(next_balance, sd->last_balance + interval)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 next_balance =3D sd->last_balance + interval;
> > >=20
>=20
>=20

