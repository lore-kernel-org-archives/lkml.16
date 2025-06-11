Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CB3286A9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608538; cv=none; b=EQ/A0nm7RDPFFKoGcD2f1yvdPmTc2qoOedE9Eo3Rd+lWDnSb0WqWiZET0CsAQvr12HUIhNNTWz5Kb5mDlzy2p/pivc4hncbUlb4W+bkFcjwJUJOvQ2vr0PGK9eDLpJ6wLgrEKvqbHqxoBF/FAPWpqAtT+W8Oo+PcsLf217nD05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608538; c=relaxed/simple;
	bh=kttmabwtfnsssz+jfoWHq3kZbsIQMCMcGmB6maL2Mbo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VLeh0p9e6iQtqPHIuXwa8FhjJK8+hysT7AUqDiyxk7xg3hR+ZMEzoK10PyqiCZSIW0QN06Sb9Q+GVG+pXfB+dQh9clUEebVDVd5BwV0cw06tGtVYHC7a+Wz+27Q6C0Gcx8wH7DvlugdTmwlYSQ7BiQI3kDo5y01JYyElP8dhbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bH8Wd4LSGzYlQsr;
	Wed, 11 Jun 2025 10:20:13 +0800 (CST)
Received: from a006.hihonor.com (10.68.23.242) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 11 Jun
 2025 10:22:12 +0800
Received: from a007.hihonor.com (10.68.22.31) by a006.hihonor.com
 (10.68.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 11 Jun
 2025 10:22:11 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Wed, 11 Jun 2025 10:22:11 +0800
From: liuwenfang <liuwenfang@honor.com>
To: 'Tejun Heo' <tj@kernel.org>
CC: 'David Vernet' <void@manifault.com>, 'Andrea Righi' <arighi@nvidia.com>,
	'Changwoo Min' <changwoo@igalia.com>, 'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>, 'Juri Lelli'
	<juri.lelli@redhat.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>, 'Steven Rostedt'
	<rostedt@goodmis.org>, 'Ben Segall' <bsegall@google.com>, 'Mel Gorman'
	<mgorman@suse.de>, 'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
Subject: Re: [PATCH] sched_ext: introduce cpu tick
Thread-Topic: [PATCH] sched_ext: introduce cpu tick
Thread-Index: AdvZ5c7hIXmwXDnLSNSIS/I8IvaoagACHrYAAA8t8VY=
Date: Wed, 11 Jun 2025 02:22:11 +0000
Message-ID: <7ce25e0b235f4339893f5e74ad9c7d36@honor.com>
References: <2d771c1f293845e09edf73f5db5b2837@honor.com>
 <aEhyZJmjhYJfVe9v@slm.duckdns.org>
In-Reply-To: <aEhyZJmjhYJfVe9v@slm.duckdns.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for your feedback.

Another one issue is that if a runnable local SCX task has p->nr_cpus_allow=
ed equal to 1,
and there are RT tasks on this CPU's runqueue, we need a chance to let BPF =
scheduler to adjust RT=20
throttle param properly(or other methods), so that the local boud SCX task =
will be scheduled
in time. This is important for the mobile scenario to render smoothly at 12=
0 frames per second.
scx_bpf_reenqueue_local will not work for the local SCX when p->nr_cpus_all=
owed =3D=3D 1.

Also some tradeoff methods can be taken to balance the performance:
If the running SCX task is preempted by one short-running RT task(predicted=
 by its history),
then it is better for the BPF scheduler to keep this SCX task on its local =
dsq, rather than directly calling
scx_bpf_reenqueue_local(). However, we still need protection for this situa=
tion in case the
short RT task become long-running task(perhaps due to some exception).

Any suggestions and comments are welcome!

Best regards

>=20
> Hello,
>=20
> On Tue, Jun 10, 2025 at 08:59:45AM +0000, liuwenfang wrote:
> > Assume one CPU is running one RT task and one runnable scx task on its
> > local dsq, the scx task cannot be scheduled until RT task enters
> > sleep, if RT task will run for 100ms, the scx task should be migrated
> > to other dsqs, then it can have a chance to be scheduled by other CPUs.
> >
> > So cpu_tick is added to notitfy BPF scheduler to check long runnable
> > scx on its local dsq, related policy can be taken to improve the
> > performance.
>=20
> (cc'ing Kumar as we discussed similar issue recently)
>=20
> There are some race conditions we need to address but calling
> scx_bpf_reenqueue_local() from ops.cpu_release() is the intended way of
> handling these situations. I don't think periodically polling from ticks =
is a good
> approach, especially given that ticks can be skipped w/ nohz_full.
>=20
> Thanks.
>=20
> --
> tejun
