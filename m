Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322D433C8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949514; cv=none; b=e2S5EUd13J3/kS/se91jBp4soV4iBPEHJYvyHs0SC78365JDD33qCO5NS+gtuyfz5vX7IeOoG/SF8lvjKotv40zhFCve9wtneZ7hCWotea8vo8Rb9ZOrwBNSPWtp5u9irj7IOMTNa/PPIrtI7ECpc1a10GGVR7G3NferK14B5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949514; c=relaxed/simple;
	bh=BNZf46n8bhMvCu6po1vY+NpCyR4ldrzinm43uMZLqjE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PD6+hYmvhIatgHe4MjXzqXUROGYawV7Y6pS7IYomfGwAOxye2XaoUKbt4FSf1YthVnt1MWlIVdbRbbpARK5hHBor+XCeBRGaGT+xCV5FE4qhijICHu6HrxMBR2DBGS4AYxJv6GHJwak7E1XIKsFaYhJlPeUgUTz60vRn81Hu/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=VrMbUxnV; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="VrMbUxnV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YvLbDRcHa7wX4WiP9G+A3NJkTto/DIwUq6NuKgsu3fE=; b=VrMbUxnVUZ2IhZzp/YjOOXdW6e
	yA3vJGqTB4EGCvLBgACTFDbch+njKKMhtthlDVrfSiVo6NOnpgRnF4xEyrpDnBoZ9MScf/fgdt/cF
	o65S36RB/d8PwyPObA43k4PwnMpZiRdl5Jy2NUZXPaej0/4NsG+KgbppChzX6yhqy3rv4gWkXlslE
	71xjnhTIJGdFfktfJgFeCBbFVTwL/uy5Mp0z/ndIwXcxfKYTanxOdciWTve2Zsntv9inMA2m3xc70
	JY865gS4Ygvwi7KiW6CBDPU5rbQGhi4eUSgA00LbBZ2giF3OGAcIpiNNOu6G+8YBEHkV+TrdBhvsm
	ichahRRA==;
Received: from [167.98.27.226] (helo=[10.17.2.162])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uMPez-00BREJ-VB; Tue, 03 Jun 2025 12:18:26 +0100
Message-ID: <84b4ab9d1402e4308bf4738e2c53203975ab855a.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Date: Tue, 03 Jun 2025 13:18:23 +0200
In-Reply-To: <20250530112108.63a24cde@luca64>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
		<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
		<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
		<20250507222549.183e0b4a@nowhere>
		<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
		<20250523214603.043833e3@nowhere>
		<c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	 <20250530112108.63a24cde@luca64>
Organization: Codethink
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk

Hi Luca

Thank you very much!

On Fri, 2025-05-30 at 11:21 +0200, luca abeni wrote:
> Hi Marcel,
>=20
> On Sun, 25 May 2025 21:29:05 +0200
> Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
> [...]
> > > How do you configure systemd? I am having troubles in reproducing
> > > your AllowedCPUs configuration... This is an example of what I am
> > > trying: sudo systemctl set-property --runtime custom-workload.slice
> > > AllowedCPUs=3D1 sudo systemctl set-property --runtime init.scope
> > > AllowedCPUs=3D0,2,3 sudo systemctl set-property --runtime
> > > system.slice AllowedCPUs=3D0,2,3 sudo systemctl set-property
> > > --runtime user.slice AllowedCPUs=3D0,2,3 and then I try to run a
> > > SCHED_DEADLINE application with sudo systemd-run --scope -p
> > > Slice=3Dcustom-workload.slice <application>=C2=A0=20
> >=20
> > We just use a bunch of systemd configuration files as follows:
> >=20
> > [root@localhost ~]# cat /lib/systemd/system/monitor.slice
> > # Copyright (C) 2024 Codethink Limited
> > # SPDX-License-Identifier: GPL-2.0-only
> [...]
>=20
> So, I copied your *.slice files in /lib/systemd/system (and I added
> them to the "Wants=3D" entry of /lib/systemd/system/slices.target,
> otherwise the slices are not created), but I am still unable to run
> SCHED_DEADLINE applications in these slices.

We just link them there e.g.

[root@localhost ~]# ls -l /etc/systemd/system/slices.target.wants/safety1.s=
lice
lrwxrwxrwx 1 root root 37 Nov 10  2011 /etc/systemd/system/slices.target.wa=
nts/safety1.slice ->
/usr/lib/systemd/system/safety1.slice

BTW: /lib is just sym-linked to /usr/lib in our setup.

> This is due to the fact that the kernel does not create a new root
> domain for these cpusets (probably because the cpusets' CPUs are not
> exclusive and the cpuset is not "isolated": for example,
> /sys/fs/cgroup/safety1.slice/cpuset.cpus.partition is set to "member",
> not to "isolated").

Not sure, but for me it is indeed root e.g.

[root@localhost ~]# cat /sys/fs/cgroup/safety1.slice/cpuset.cpus.partition
root

> So, the "cpumask_subset(span, p->cpus_ptr)" in
> sched_setsched() is still false and the syscall returns -EPERM.
>=20
>=20
> Since I do not know how to obtain an isolated cpuset with cgroup v2 and
> systemd, I tried using the old cgroup v1, as described in the
> SCHED_DEADLINE documentation.

I would have thought it should not make any difference whether cgroup v1 or=
 v2 is used, but then who knows.

> This worked fine, and enabling SCHED_FLAG_RECLAIM actually reduced the
> number of missed deadlines (I tried with a set of periodic tasks having
> the same parameters as the ones you described). So, it looks like
> reclaiming is working correctly (at least, as far as I can see) when
> using cgroup v1 to configure the CPU partitions... Maybe there is some
> bug triggered by cgroup v2,

Could be, but anyway would be good to also update the SCHED_DEADLINE docume=
ntation to cgroup v2.

> or maybe I am misunderstanding your setup.

No, there should be nothing else special really.

> I think the experiment suggested by Juri can help in understanding
> where the issue can be.

Yes, I already did all that and hope you guys can get some insights from th=
at experiment.

And remember, if I can help in any other way just let me know. Thanks!

> 			Thanks,
> 				Luca
>=20
>=20
> > [Unit]
> > Description=3DPrioritized slice for the safety monitor.
> > Before=3Dslices.target
> >=20
> > [Slice]
> > CPUWeight=3D1000
> > AllowedCPUs=3D0
> > MemoryAccounting=3Dtrue
> > MemoryMin=3D10%
> > ManagedOOMPreference=3Domit
> >=20
> > [Install]
> > WantedBy=3Dslices.target
> >=20
> > [root@localhost ~]# cat /lib/systemd/system/safety1.slice
> > # Copyright (C) 2024 Codethink Limited
> > # SPDX-License-Identifier: GPL-2.0-only
> > [Unit]
> > Description=3DSlice for Safety case processes.
> > Before=3Dslices.target
> >=20
> > [Slice]
> > CPUWeight=3D1000
> > AllowedCPUs=3D1
> > MemoryAccounting=3Dtrue
> > MemoryMin=3D10%
> > ManagedOOMPreference=3Domit
> >=20
> > [Install]
> > WantedBy=3Dslices.target
> >=20
> > [root@localhost ~]# cat /lib/systemd/system/safety2.slice
> > # Copyright (C) 2024 Codethink Limited
> > # SPDX-License-Identifier: GPL-2.0-only
> > [Unit]
> > Description=3DSlice for Safety case processes.
> > Before=3Dslices.target
> >=20
> > [Slice]
> > CPUWeight=3D1000
> > AllowedCPUs=3D2
> > MemoryAccounting=3Dtrue
> > MemoryMin=3D10%
> > ManagedOOMPreference=3Domit
> >=20
> > [Install]
> > WantedBy=3Dslices.target
> >=20
> > [root@localhost ~]# cat /lib/systemd/system/safety3.slice
> > # Copyright (C) 2024 Codethink Limited
> > # SPDX-License-Identifier: GPL-2.0-only
> > [Unit]
> > Description=3DSlice for Safety case processes.
> > Before=3Dslices.target
> >=20
> > [Slice]
> > CPUWeight=3D1000
> > AllowedCPUs=3D3
> > MemoryAccounting=3Dtrue
> > MemoryMin=3D10%
> > ManagedOOMPreference=3Domit
> >=20
> > [Install]
> > WantedBy=3Dslices.target
> >=20
> > [root@localhost ~]# cat /lib/systemd/system/system.slice=20
> > # Copyright (C) 2024 Codethink Limited
> > # SPDX-License-Identifier: GPL-2.0-only
> >=20
> > #
> > # This slice will control all processes started by systemd by
> > # default.
> > #
> >=20
> > [Unit]
> > Description=3DSystem Slice
> > Documentation=3Dman:systemd.special(7)
> > Before=3Dslices.target
> >=20
> > [Slice]
> > CPUQuota=3D150%
> > AllowedCPUs=3D0
> > MemoryAccounting=3Dtrue
> > MemoryMax=3D80%
> > ManagedOOMSwap=3Dkill
> > ManagedOOMMemoryPressure=3Dkill
> >=20
> > [root@localhost ~]# cat /lib/systemd/system/user.slice=20
> > # Copyright (C) 2024 Codethink Limited
> > # SPDX-License-Identifier: GPL-2.0-only
> >=20
> > #
> > # This slice will control all processes started by systemd-logind
> > #
> >=20
> > [Unit]
> > Description=3DUser and Session Slice
> > Documentation=3Dman:systemd.special(7)
> > Before=3Dslices.target
> >=20
> > [Slice]
> > CPUQuota=3D25%
> > AllowedCPUs=3D0
> > MemoryAccounting=3Dtrue
> > MemoryMax=3D80%
> > ManagedOOMSwap=3Dkill
> > ManagedOOMMemoryPressure=3Dkill
> >=20
> > > However, this does not work because systemd is not creating an
> > > isolated cpuset... So, the root domain still contains CPUs 0-3, and
> > > the "custom-workload.slice" cpuset only has CPU 1. Hence, the check
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * Don't allow tasks with an affinity mask
> > > smaller than
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * the entire root_domain to become
> > > SCHED_DEADLINE. We
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * will also fail if there's no bandwidth
> > > available. */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!=
cpumask_subset(span, p->cpus_ptr) ||
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 rq->rd->dl_bw.bw =3D=3D 0) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D -EPERM;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > in sched_setsched() fails.
> > >=20
> > >=20
> > > How are you configuring the cpusets?=C2=A0=20
> >=20
> > See above.
> >=20
> > > Also, which kernel version are you using?
> > > (sorry if you already posted this information in previous emails
> > > and I am missing something obvious)=C2=A0=20
> >=20
> > Not even sure, whether I explicitly mentioned that other than that we
> > are always running latest stable.
> >=20
> > Two months ago when we last run some extensive tests on this it was
> > actually v6.13.6.
> >=20
> > > 			Thanks,=C2=A0=20
> >=20
> > Thank you!
> >=20
> > > 				Luca

Cheers

Marcel
