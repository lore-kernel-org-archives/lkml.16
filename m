Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7A257ACA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697158; cv=none; b=lamrIkAqbl8YaQrJozrZhPxWTYLb28RnD5TshE74uA4v1tmqIPtjvroBKpTBoJep0otZSTQJQU+hjFxG7CyR6rd9ieqk/Wog99y4MAfO5Q0sBbFpZlB+dm0V9CX0yv4SltKlNXiyl/LIsn9t4qh5axc0LMoSEixlu3HL7CZq7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697158; c=relaxed/simple;
	bh=PTD3Lnffz3UxuppdSnjmAgp+lvmMLAcpySYUlrRH2dc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkJmhy+Iy7a3Df/Dt/Vw2pAd5YvThyb8OEjwhqCnPActl1nPzwlNOIZViTiUx4sl3iwwp155EYg0tFrSSNC10xxgieVDmsOT/tmQUYJkkKATmkzfaMj4xEtXzhHIu7H/3x4oaCxCEUTqk9OHynyI4V+Hm5qKkahbalVo85F2heM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVq5TrAw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVq5TrAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750697157; x=1782233157;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PTD3Lnffz3UxuppdSnjmAgp+lvmMLAcpySYUlrRH2dc=;
  b=aVq5TrAwAwawQB09h+POho6Vn2TkTkKlV54KNSZfhIDCg7bdTxd0lqm/
   1HgtIUgzpyqD/ybFoMJjqefnIS9NZsO8+yEk4PkEQWD5N2KJp+ILKTH5b
   GPqCUAHb7hBeVRWr36wTPj2xoy929KLc5yKj+YZ672Qcl0z+33gSjo6a1
   s20dCiK0E9UR2PcVq/u6vblv+Dn4dHgbG9HTiga/DUfQjgscM73QND+3+
   YTeq/bhBVDLog6syNXrdToHttjrJV+eRAjCy8E6s5aatf3tTmeiNX973R
   Y5TF1KrcMiKmMJNTomzrN5QdnEluub5NIBfx1djS1Pszqfeu4OWc7Oxvf
   Q==;
X-CSE-ConnectionGUID: JHilAxA0TjKRaUl2BtPnlQ==
X-CSE-MsgGUID: bJFvTmbSTjSEmjUwPTLuQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52029505"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52029505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 09:45:56 -0700
X-CSE-ConnectionGUID: LevOzmC+R0mssUZJXCYS0Q==
X-CSE-MsgGUID: /CQ5fDQSTfqxAGkR9vE7iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="152164351"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.222.214]) ([10.124.222.214])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 09:45:55 -0700
Message-ID: <946aec3cd4fe308b45d0cff661d80a3d75109b7b.camel@linux.intel.com>
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>, Peter Zijlstra
	 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, K Prateek Nayak
	 <kprateek.nayak@amd.com>, "Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>, Hillf Danton <hdanton@sina.com>, Len
 Brown <len.brown@intel.com>, linux-kernel@vger.kernel.org, Chen Yu
 <yu.c.chen@intel.com>
Date: Mon, 23 Jun 2025 09:45:54 -0700
In-Reply-To: <8c98fff7-fef3-494a-98a3-4b6d4cc2e6d1@linux.ibm.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
	 <8c98fff7-fef3-494a-98a3-4b6d4cc2e6d1@linux.ibm.com>
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

On Sat, 2025-06-21 at 00:55 +0530, Madadi Vineeth Reddy wrote:
> Hi Tim,
>=20
> On 18/06/25 23:57, Tim Chen wrote:
> > This is the third revision of the cache aware scheduling patches,
> > based on the original patch proposed by Peter[1].
> > =20
> > The goal of the patch series is to aggregate tasks sharing data
> > to the same cache domain, thereby reducing cache bouncing and
> > cache misses, and improve data access efficiency. In the current
> > implementation, threads within the same process are considered
> > as entities that potentially share resources.
> > =20
> > In previous versions, aggregation of tasks were done in the
> > wake up path, without making load balancing paths aware of
> > LLC (Last-Level-Cache) preference. This led to the following
> > problems:
> >=20
> > 1) Aggregation of tasks during wake up led to load imbalance
> >    between LLCs
> > 2) Load balancing tried to even out the load between LLCs
> > 3) Wake up tasks aggregation happened at a faster rate and
> >    load balancing moved tasks in opposite directions, leading
> >    to continuous and excessive task migrations and regressions
> >    in benchmarks like schbench.
> >=20
> > In this version, load balancing is made cache-aware. The main
> > idea of cache-aware load balancing consists of two parts:
> >=20
> > 1) Identify tasks that prefer to run on their hottest LLC and
> >    move them there.
> > 2) Prevent generic load balancing from moving a task out of
> >    its hottest LLC.
> >=20
> > By default, LLC task aggregation during wake-up is disabled.
> > Conversely, cache-aware load balancing is enabled by default.
> > For easier comparison, two scheduler features are introduced:
> > SCHED_CACHE_WAKE and SCHED_CACHE_LB, which control cache-aware
> > wake up and cache-aware load balancing, respectively. By default,
> > NO_SCHED_CACHE_WAKE and SCHED_CACHE_LB are set, so tasks aggregation
> > is only done on load balancing.
>=20
> Tested this patch series on a Power11 system with 28 cores and 224 CPUs.
> LLC on this platform spans 4 threads.

Hi Madadi,

Thank you for testing this patch series.

If I understand correctly, the Power 11 you tested has 8 threads per core.
My suspicion is we benefit much more from utilizing more cores
than aggregating the load on less cores but sharing the cache
more in this case.


>=20
> schbench:
>                         baseline (sd%)        baseline+cacheaware (sd%)  =
    %change
> Lat 50.0th-worker-1        6.33 (24.12%)           6.00 (28.87%)         =
      5.21%
> Lat 90.0th-worker-1        7.67 ( 7.53%)           7.67 (32.83%)         =
      0.00%
> Lat 99.0th-worker-1        8.67 ( 6.66%)           9.33 (37.63%)         =
     -7.61%
> Lat 99.9th-worker-1       21.33 (63.99%)          12.33 (28.47%)         =
     42.19%
>=20
> Lat 50.0th-worker-2        4.33 (13.32%)           5.67 (10.19%)         =
    -30.95%
> Lat 90.0th-worker-2        5.67 (20.38%)           7.67 ( 7.53%)         =
    -35.27%
> Lat 99.0th-worker-2        7.33 ( 7.87%)           8.33 ( 6.93%)         =
    -13.64%
> Lat 99.9th-worker-2       11.67 (24.74%)          10.33 (11.17%)         =
     11.48%
>=20
> Lat 50.0th-worker-4        5.00 ( 0.00%)           7.00 ( 0.00%)         =
    -40.00%
> Lat 90.0th-worker-4        7.00 ( 0.00%)           9.67 ( 5.97%)         =
    -38.14%
> Lat 99.0th-worker-4        8.00 ( 0.00%)          11.33 (13.48%)         =
    -41.62%
> Lat 99.9th-worker-4       10.33 ( 5.59%)          14.00 ( 7.14%)         =
    -35.53%
>=20
> Lat 50.0th-worker-8        4.33 (13.32%)           5.67 (10.19%)         =
    -30.95%
> Lat 90.0th-worker-8        6.33 (18.23%)           8.67 ( 6.66%)         =
    -36.99%
> Lat 99.0th-worker-8        7.67 ( 7.53%)          10.33 ( 5.59%)         =
    -34.69%
> Lat 99.9th-worker-8       10.00 (10.00%)          12.33 ( 4.68%)         =
    -23.30%
>=20
> Lat 50.0th-worker-16       4.00 ( 0.00%)           5.00 ( 0.00%)         =
    -25.00%
> Lat 90.0th-worker-16       6.33 ( 9.12%)           7.67 ( 7.53%)         =
    -21.21%
> Lat 99.0th-worker-16       8.00 ( 0.00%)          10.33 ( 5.59%)         =
    -29.13%
> Lat 99.9th-worker-16      12.00 ( 8.33%)          13.33 ( 4.33%)         =
    -11.08%
>=20
> Lat 50.0th-worker-32       5.00 ( 0.00%)           5.33 (10.83%)         =
     -6.60%
> Lat 90.0th-worker-32       7.00 ( 0.00%)           8.67 (17.63%)         =
    -23.86%
> Lat 99.0th-worker-32      10.67 (14.32%)          12.67 ( 4.56%)         =
    -18.75%
> Lat 99.9th-worker-32      14.67 ( 3.94%)          19.00 (13.93%)         =
    -29.49%
>=20
> Lat 50.0th-worker-64       5.33 (10.83%)           6.67 ( 8.66%)         =
    -25.14%
> Lat 90.0th-worker-64      10.00 (17.32%)          14.33 ( 4.03%)         =
    -43.30%
> Lat 99.0th-worker-64      14.00 ( 7.14%)          16.67 ( 3.46%)         =
    -19.07%
> Lat 99.9th-worker-64      55.00 (56.69%)          47.00 (61.92%)         =
     14.55%
>=20
> Lat 50.0th-worker-128      8.00 ( 0.00%)           8.67 (13.32%)         =
     -8.38%
> Lat 90.0th-worker-128     13.33 ( 4.33%)          14.33 ( 8.06%)         =
     -7.50%
> Lat 99.0th-worker-128     16.00 ( 0.00%)          20.00 ( 8.66%)         =
    -25.00%
> Lat 99.9th-worker-128   2258.33 (83.80%)        2974.67 (21.82%)         =
    -31.72%
>=20
> Lat 50.0th-worker-256     47.67 ( 2.42%)          45.33 ( 3.37%)         =
      4.91%
> Lat 90.0th-worker-256   3470.67 ( 1.88%)        3558.67 ( 0.47%)         =
     -2.54%
> Lat 99.0th-worker-256   9040.00 ( 2.76%)        9050.67 ( 0.41%)         =
     -0.12%
> Lat 99.9th-worker-256  13824.00 (20.07%)       13104.00 ( 6.84%)         =
      5.21%
>=20
> The above data shows mostly regression both in the lesser and
> higher load cases.
>=20
>=20
> Hackbench pipe:
>=20
> Pairs   Baseline Avg (s) (Std%)     Patched Avg (s) (Std%)      % Change
> 2       2.987 (1.19%)               2.414 (17.99%)              24.06%
> 4       7.702 (12.53%)              7.228 (18.37%)               6.16%
> 8       14.141 (1.32%)              13.109 (1.46%)               7.29%
> 15      27.571 (6.53%)              29.460 (8.71%)              -6.84%
> 30      65.118 (4.49%)              61.352 (4.00%)               5.78%
> 45      105.086 (9.75%)             97.970 (4.26%)               6.77%
> 60      149.221 (6.91%)             154.176 (4.17%)             -3.32%
> 75      199.278 (1.21%)             198.680 (1.37%)              0.30%
>=20
> A lot of run to run variation is seen in hackbench runs. So hard to tell
> on the performance but looks better than schbench.
>=20
> In Power 10 and Power 11, The LLC size is relatively smaller (4 CPUs)
> when compared to platforms like sapphire rapids and Milan. Didn't go
> through this series yet. Will go through and try to understand why
> schbench is not happy on Power systems.

My guess is having 8 threads per core, LLC aggregation may have
been too aggressive in consolidating tasks on fewer cores and may have left=
 some
cpu cycles unused. Doing experiments by running one thread per core on Powe=
r11
may give us some insights if this conjecture is true.

>=20
> Meanwhile, Wanted to know your thoughts on how does smaller LLC
> size get impacted with this patch?
>=20

This patch series is currently tuned for systems with single threaded core,
and having many cores and large cache per LLC. =C2=A0

With only 4 cores and 32 threads per LLC as in Power 11, we run out of core=
s quickly
and have more cache contention between the tasks consolidated.
We may have to set aggregation threshold (sysctl_llc_aggr_cap) less
than 50% utilization (default), so we consolidate less aggressively
and spread the tasks much sooner.=20


Tim
