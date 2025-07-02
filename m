Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501223505F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492826; cv=none; b=GCcqTeBwJycdxk3kebeDzVcvjftDitrEMd/ACEEMiFrvKcM1DfsItUrt8XX/YkjSiXwG3pPpdHByJmIbcgXGzFlqOb5jujsWxRstKeyauTfhPIJ48XfxaihQRFHhOQEoxZZ8pmWnDCNf4pe7yJRbzOiniG+FAgqS33nVnzojwA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492826; c=relaxed/simple;
	bh=FL4kUo8mHAVesuwgPCGTOIQodyAWzHv1PD1PHaRmn1g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TDNjLcC41gv4I86pUGzXvc5sJoizIGR/Hmg1sLuiPTHQYY/ZUrRFgzDiarbIQLIA47N1eZ9/6HFSsNRwzjpc0YoHoNeh3ALdcQdqiTSzIWgEIX0cs0uw3iv9DghQz7KdRMpd24SkEKl9wIuwc2WPqr0OZgj7Ma+QVIjIlfuoNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxVbWRGZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxVbWRGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751492824; x=1783028824;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=FL4kUo8mHAVesuwgPCGTOIQodyAWzHv1PD1PHaRmn1g=;
  b=CxVbWRGZyXqOJsK7WbeNfhj0pK9qzZc7Fz/m+MbvgfKLfCZWIbZ+TREZ
   h15TFgV+bzH+pXQX35/x0JuWngc/ZgmHr8wDftCLFnOOqIw01sf5e07eV
   7CBdDLv05K9XiySLlkF6La8vEXnSqKLcFV61SOHzqLwpn5Buo8ArpTds8
   6f7tcdtTuDAIBUWoJLh+3Xmt4E4smVlOIrJ5cXJAk5FyCca258RNzku65
   tRXu/kzLnUR8wG99Ogs3SanlJNGgVwVyRvdycBqxmAPCPManyvrCMuKqh
   HeZ2b9E1AUyR+SEcEFM87MT2MXjKgDRbGeWZM2LeHn/3rtj/r5L2/Og3D
   A==;
X-CSE-ConnectionGUID: y7gpU8vjTpWJ2KjOSiGXyg==
X-CSE-MsgGUID: E35HmyBrS4u4ApnjPvjlaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64504138"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64504138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:47:03 -0700
X-CSE-ConnectionGUID: aZZvXm1sQIK8HDcnRcekcw==
X-CSE-MsgGUID: pP18faPxS4GZH3kOuFmfUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="159878911"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO [10.124.223.9]) ([10.124.223.9])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:47:03 -0700
Message-ID: <1cc0429d0d15d98362f48be0460bc978d90a4c4a.camel@linux.intel.com>
Subject: Re: [RFC patch v3 05/20] sched: Add hysteresis to switch a task's
 preferred LLC
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>, Hillf Danton <hdanton@sina.com>, Len
 Brown <len.brown@intel.com>, linux-kernel@vger.kernel.org, Chen Yu
 <yu.c.chen@intel.com>,  Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,  "Gautham R .
 Shenoy" <gautham.shenoy@amd.com>
Date: Wed, 02 Jul 2025 14:47:01 -0700
In-Reply-To: <85bff038-6bc8-4643-8a15-89ac435206fd@linux.ibm.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
	 <7371f30196b317c0c5a0ae3fa463ec76a4dc69ef.1750268218.git.tim.c.chen@linux.intel.com>
	 <85bff038-6bc8-4643-8a15-89ac435206fd@linux.ibm.com>
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

On Wed, 2025-07-02 at 12:17 +0530, Madadi Vineeth Reddy wrote:
> Hi Tim,
>=20
> On 18/06/25 23:57, Tim Chen wrote:
> > Switching a process's preferred LLC generates lots of task
> > migrations across LLCs. To avoid frequent switches
> > of home LLC, implement the following policy:
> >=20
> > 1. Require a 2x occ change threshold to switch preferred LLC
> > 2. Don't discard preferred LLC for a task
> >=20
> > Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> > ---
> >  kernel/sched/fair.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 6a2678f9d44a..7fb2322c5d9e 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1175,6 +1175,14 @@ static s64 update_curr_se(struct rq *rq, struct =
sched_entity *curr)
> >  #define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
> >  #define EPOCH_OLD	5		/* 50 ms */
> > =20
> > +static int llc_id(int cpu)
> > +{
> > +	if (cpu < 0)
> > +		return -1;
> > +
> > +	return per_cpu(sd_llc_id, cpu);
> > +}
> > +
> >  void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pc=
pu_sched)
> >  {
> >  	unsigned long epoch;
> > @@ -1299,6 +1307,7 @@ static void task_cache_work(struct callback_head =
*work)
> >  	struct task_struct *p =3D current;
> >  	struct mm_struct *mm =3D p->mm;
> >  	unsigned long m_a_occ =3D 0;
> > +	unsigned long last_m_a_occ =3D 0;
> >  	int cpu, m_a_cpu =3D -1;
> >  	cpumask_var_t cpus;
> > =20
> > @@ -1337,11 +1346,13 @@ static void task_cache_work(struct callback_hea=
d *work)
> >  					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
> >  			}
> > =20
> > -			a_occ /=3D nr;
> > +			// a_occ /=3D nr;
>=20
> Is the above by mistake?
> I think we need to have average only and not the total value as that favo=
rs LLCs with
> larger size.
>=20

Actually Chen Yu and I have gone back and forth on this one.  A
different perspective is dividing by nr will disfavor
LLCs of larger size.  You will need way more tasks in larger
LLC to put the tasks there, which may cause over-stacking on the
smaller LLC. We find that not dividing by nr is more stable when
we bring CPU online/offline. =20

Tim

> Thanks,
> Madadi Vineeth Reddy
>=20
> >  			if (a_occ > m_a_occ) {
> >  				m_a_occ =3D a_occ;
> >  				m_a_cpu =3D m_cpu;
> >  			}
> > +			if (llc_id(cpu) =3D=3D llc_id(mm->mm_sched_cpu))
> > +				last_m_a_occ =3D a_occ;
> > =20
> >  			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
> >  				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> > @@ -1355,13 +1366,10 @@ static void task_cache_work(struct callback_hea=
d *work)
> >  		}
> >  	}
> > =20
> > -	/*
> > -	 * If the max average cache occupancy is 'small' we don't care.
> > -	 */
> > -	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> > -		m_a_cpu =3D -1;
> > -
> > -	mm->mm_sched_cpu =3D m_a_cpu;
> > +	if (m_a_occ > (2 * last_m_a_occ)) {
> > +		/* avoid the bouncing of mm_sched_cpu */
> > +		mm->mm_sched_cpu =3D m_a_cpu;
> > +	}
> > =20
> >  	free_cpumask_var(cpus);
> >  }
>=20

