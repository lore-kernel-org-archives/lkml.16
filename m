Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E47A33E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750811442; cv=none; b=IqBEPlS9JjLPinfYmXVMCMP317CrR2ubkHBMzdytFsQ0SqswpbD1sEmBUUuoHeKzKvqZiiAQeecGd21J7zQYfHSI9ntrAISBlzUIKgdaymKJ6hX3wcKCLNe97yTRyqz2SjBx8oMJ//zv0OYqFlNtw0rvQh6rYcf+ygUXQuI7an4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750811442; c=relaxed/simple;
	bh=0sRy9wvCO3py8tTUwV3NX85yk5KMmD9jTi5Njxr5ymc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kbFo7LIubaEF3+z1hH1M6lj1jWy4TXnepCgQ0d+v3X3MaVRJtLgT7rJimYXyzbXVTAulblYc4GsBbR8RkgdHPi5rUKjULsGc5rnk57YaJxg9A6QZjik+t1F0p+TKj1jbNHzk8myvfKKERbQqNh82xUkhXxAULWpohnRbXbTl6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVKTnpkB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVKTnpkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750811441; x=1782347441;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0sRy9wvCO3py8tTUwV3NX85yk5KMmD9jTi5Njxr5ymc=;
  b=XVKTnpkBqhNdEDoiVCoMHxVW4Ylbro0nBq/Y7e/+SletwgUnvblC7iAN
   HKMAQvKrcPMMEaUA8x7Nvvyb6Xfz4ct5/xRtmi7WeW8+QgrjRIm7QlgO2
   jJ6saq5EFIOX/ECb+Mb8A7JPyCD3/g7Px5ifnY8DUhBwLT9D1LBZuHzHc
   9fK0CvIMyjWRP7n5L9akGNZVSXtg6KqMLVWrnW4V0RE+WL/80E+Qm/iJm
   ziNjOvMu3OQXs3jYOuextLcy4jhlCpqHuo3v2rP2e4G96ZrA5qMqIHNSA
   E6zx6TCBxgc/AF7QYDCQhCTvSEy91gsk1TpBVqxF5XdTR0ntxqIJ9PJCz
   w==;
X-CSE-ConnectionGUID: DtzLN2I9QxyczTQlpNTXAg==
X-CSE-MsgGUID: ZBAMKNYGR2KuvzQ/RAyS6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70638183"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="70638183"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 17:30:40 -0700
X-CSE-ConnectionGUID: cCDaF9yeSCSAgs2TwA/6zg==
X-CSE-MsgGUID: k5DuHCz4TCCrnYoI+vIxNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151571511"
Received: from mjruhl-desk.amr.corp.intel.com (HELO [10.124.223.69]) ([10.124.223.69])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 17:30:38 -0700
Message-ID: <2c72e2ada1bcc86053c01c67ba4a03cf1b4f132d.camel@linux.intel.com>
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
From: Tim Chen <tim.c.chen@linux.intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Gautham R .
 Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>, Madadi Vineeth Reddy
 <vineethr@linux.ibm.com>,  Hillf Danton <hdanton@sina.com>, Len Brown
 <len.brown@intel.com>, linux-kernel@vger.kernel.org, Chen Yu
 <yu.c.chen@intel.com>
Date: Tue, 24 Jun 2025 17:30:37 -0700
In-Reply-To: <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
	 <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
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

On Tue, 2025-06-24 at 10:30 +0530, K Prateek Nayak wrote:
> Hello Tim,
>=20
> I have similar observation from my testing.
>=20
>=20
Prateek,

Thanks for the testing that you did. Much appreciated.
Some follow up to Chen, Yu's comments.

>=20
> o Benchmark that prefer co-location and run in threaded mode see
>    a benefit including hackbench at high utilization and schbench
>    at low utilization.
>=20
> o schbench (both new and old but particularly the old) regresses
>    quite a bit on the tial latency metric when #workers cross the
>    LLC size.

Will take closer look at the cases where #workers just exceed LLC size.
Perhaps adjusting the threshold to spread the load earlier at a
lower LLC utilization will help.

>=20
> o client-server benchmarks where client and servers are threads
>    from different processes (netserver-netperf, tbench_srv-tbench,
>    services of DeathStarBench) seem to noticeably regress due to
>    lack of co-location between the communicating client and server.
>=20
>    Not sure if WF_SYNC can be an indicator to temporarily ignore
>    the preferred LLC hint.

Currently we do not aggregate tasks from different processes.
The case where client and server actually reside on the same
system I think is the exception rather than the rule for real
workloads where clients and servers reside on different systems.

But I do see tasks from different processes talking to each
other via pipe/socket in real workload.  Do you know of good
use cases for such scenario that would justify extending task
aggregation to multi-processes?
=20
>=20
> o stream regresses in some runs where the occupancy metrics trip
>    and assign a preferred LLC for all the stream threads bringing
>    down performance in !50% of the runs.
>=20

Yes, stream does not have cache benefit from co-locating threads, and
get hurt from sharing common resource like memory controller.


> Full data from my testing is as follows:
>=20
> o Machine details
>=20
> - 3rd Generation EPYC System
> - 2 sockets each with 64C/128T
> - NPS1 (Each socket is a NUMA node)
> - C2 Disabled (POLL and C1(MWAIT) remained enabled)
>=20
>=20
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>      Test          : Various longer running benchmarks
>      Units         : %diff in throughput reported
>      Interpretation: Higher is better
>      Statistic     : Median
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>      Benchmarks:                  %diff
>      ycsb-cassandra              -0.99%
>      ycsb-mongodb                -0.96%
>      deathstarbench-1x           -2.09%
>      deathstarbench-2x           -0.26%
>      deathstarbench-3x           -3.34%
>      deathstarbench-6x           -3.03%
>      hammerdb+mysql 16VU         -2.15%
>      hammerdb+mysql 64VU         -3.77%
>=20

The clients and server of the benchmarks are co-located on the same
system, right?

> >=20
> > This patch set is applied on v6.15 kernel.
> >  =20
> > There are some further work needed for future versions in this
> > patch set.  We will need to align NUMA balancing with LLC aggregations
> > such that LLC aggregation will align with the preferred NUMA node.
> >=20
> > Comments and tests are much appreciated.
>=20
> I'll rerun the test once with the SCHED_FEAT() disabled just to make
> sure I'm not regressing because of some other factors. For the major
> regressions, I'll get the "perf sched stats" data to see if anything
> stands out.
>=20
> I'm also planning on getting the data from a Zen5c system with larger
> LLC to see if there is any difference in the trend (I'll start with the
> microbenchmarks since setting the larger ones will take some time)
>=20
> Sorry for the lack of engagement on previous versions but I plan on
> taking a better look at the series this time around. If you need any
> specific data from my setup, please do let me know.
>=20

Will do.  Thanks.

Tim
