Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578AF1459F7
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201362; cv=none; b=g5VDepabfVpLDipO32TxfETNxHf6bK86hW2oqYhTksxr0foZUL/DK33cM9IwR7+UQ6CsZGjZ2Vs8Y/JA89sCBd5Y4UQ2ghT+ksjTBctqbHZXLIhXslel+rTrr6WnZZ/HiM+Z2jUs8RwM+ToPJ01ahx09nadjb3n3g3PQIXQDMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201362; c=relaxed/simple;
	bh=Axm+7r8Kc0NjsgD/OXoJ4BEfE9SdEOb30aAW9yJdywM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQ+KyCmIllPtZ+Q3Csww/X8krL4skPTn91xzufgJXHwk2PBCdDZ+Q+Bum+aebJIs7xDPAzItiV09An1gJikrn46DiZJoxc73gDQ5xS797pYr0hup0OO5ynAHnysyGsbQj4obikl8j1llUwZpL72RmzA1f/NqeQSs2412EwccJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=op7V86hp; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="op7V86hp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1iRUDFGUOzoLMzhB6jIn1giipXv7IB2sCvufSfloeHs=; b=op7V86hpMOOf/gTiDSnx/R3Gm1
	E3b/hbrIN1SI7s40iT5DwQlRzCDaLRXf6+ZB1fb7TgNRnr2rOpF7V85F4KNOIuhIVBaihhFQ0IpMR
	/us3zmHe9ITwrstVDJtQTYBS97OvauhoGVD8WpaNr/x+ng0Pn/vNT2VFnrSGEENzTTUtY70BwZ7do
	Nyk18mhIVIR37GVkL5Uyg+wkkB5ccehS74BdTtFiTrhe0uRNCEv/R6nRwxHZKZ/0cCUQZk4V4JoMt
	V/tRj0ycBOzXsQuL+nMTWr/rkApJUnTYVwyKQ1V8SYNGa0HMA9ABlxdFpHj7EbkoiNP6riGYXb8/h
	DN865SUA==;
Received: from [213.55.187.158] (helo=[10.108.88.253])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uJH1t-0027Eh-GI; Sun, 25 May 2025 20:29:06 +0100
Message-ID: <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Date: Sun, 25 May 2025 21:29:05 +0200
In-Reply-To: <20250523214603.043833e3@nowhere>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
		<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
		<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
		<20250507222549.183e0b4a@nowhere>
		<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	 <20250523214603.043833e3@nowhere>
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

On Fri, 2025-05-23 at 21:46 +0200, luca abeni wrote:
> Hi Marcel,
>=20
> sorry, but I have some additional questions to fully understand your
> setup...

No Problem, I am happy to answer any questions :)

> On Mon, 19 May 2025 15:32:27 +0200
> Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
> [...]
> > > just a quick question to better understand your setup (and check
> > > where the issue comes from):
> > > in the email below, you say that tasks are statically assigned to
> > > cores; how did you do this? Did you use isolated cpusets,=C2=A0=20
> >=20
> > Yes, we use the cpuset controller from the cgroup-v2 APIs in the
> > linux kernel in order to partition CPUs and memory nodes. In detail,
> > we use the AllowedCPUs and AllowedMemoryNodes in systemd's slice
> > configurations.
>=20
> How do you configure systemd? I am having troubles in reproducing your
> AllowedCPUs configuration... This is an example of what I am trying:
> 	sudo systemctl set-property --runtime custom-workload.slice AllowedCPUs=
=3D1
> 	sudo systemctl set-property --runtime init.scope AllowedCPUs=3D0,2,3
> 	sudo systemctl set-property --runtime system.slice AllowedCPUs=3D0,2,3
> 	sudo systemctl set-property --runtime user.slice AllowedCPUs=3D0,2,3
> and then I try to run a SCHED_DEADLINE application with
> 	sudo systemd-run --scope -p Slice=3Dcustom-workload.slice <application>

We just use a bunch of systemd configuration files as follows:

[root@localhost ~]# cat /lib/systemd/system/monitor.slice
# Copyright (C) 2024 Codethink Limited
# SPDX-License-Identifier: GPL-2.0-only
[Unit]
Description=3DPrioritized slice for the safety monitor.
Before=3Dslices.target

[Slice]
CPUWeight=3D1000
AllowedCPUs=3D0
MemoryAccounting=3Dtrue
MemoryMin=3D10%
ManagedOOMPreference=3Domit

[Install]
WantedBy=3Dslices.target

[root@localhost ~]# cat /lib/systemd/system/safety1.slice
# Copyright (C) 2024 Codethink Limited
# SPDX-License-Identifier: GPL-2.0-only
[Unit]
Description=3DSlice for Safety case processes.
Before=3Dslices.target

[Slice]
CPUWeight=3D1000
AllowedCPUs=3D1
MemoryAccounting=3Dtrue
MemoryMin=3D10%
ManagedOOMPreference=3Domit

[Install]
WantedBy=3Dslices.target

[root@localhost ~]# cat /lib/systemd/system/safety2.slice
# Copyright (C) 2024 Codethink Limited
# SPDX-License-Identifier: GPL-2.0-only
[Unit]
Description=3DSlice for Safety case processes.
Before=3Dslices.target

[Slice]
CPUWeight=3D1000
AllowedCPUs=3D2
MemoryAccounting=3Dtrue
MemoryMin=3D10%
ManagedOOMPreference=3Domit

[Install]
WantedBy=3Dslices.target

[root@localhost ~]# cat /lib/systemd/system/safety3.slice
# Copyright (C) 2024 Codethink Limited
# SPDX-License-Identifier: GPL-2.0-only
[Unit]
Description=3DSlice for Safety case processes.
Before=3Dslices.target

[Slice]
CPUWeight=3D1000
AllowedCPUs=3D3
MemoryAccounting=3Dtrue
MemoryMin=3D10%
ManagedOOMPreference=3Domit

[Install]
WantedBy=3Dslices.target

[root@localhost ~]# cat /lib/systemd/system/system.slice=20
# Copyright (C) 2024 Codethink Limited
# SPDX-License-Identifier: GPL-2.0-only

#
# This slice will control all processes started by systemd by
# default.
#

[Unit]
Description=3DSystem Slice
Documentation=3Dman:systemd.special(7)
Before=3Dslices.target

[Slice]
CPUQuota=3D150%
AllowedCPUs=3D0
MemoryAccounting=3Dtrue
MemoryMax=3D80%
ManagedOOMSwap=3Dkill
ManagedOOMMemoryPressure=3Dkill

[root@localhost ~]# cat /lib/systemd/system/user.slice=20
# Copyright (C) 2024 Codethink Limited
# SPDX-License-Identifier: GPL-2.0-only

#
# This slice will control all processes started by systemd-logind
#

[Unit]
Description=3DUser and Session Slice
Documentation=3Dman:systemd.special(7)
Before=3Dslices.target

[Slice]
CPUQuota=3D25%
AllowedCPUs=3D0
MemoryAccounting=3Dtrue
MemoryMax=3D80%
ManagedOOMSwap=3Dkill
ManagedOOMMemoryPressure=3Dkill

> However, this does not work because systemd is not creating an isolated
> cpuset... So, the root domain still contains CPUs 0-3, and the
> "custom-workload.slice" cpuset only has CPU 1. Hence, the check
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * =
Don't allow tasks with an affinity mask smaller than
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * =
the entire root_domain to become SCHED_DEADLINE. We
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * =
will also fail if there's no bandwidth available.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cpu=
mask_subset(span, p->cpus_ptr) ||
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 rq->rd->dl_bw.bw =3D=3D 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D -EPERM;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> in sched_setsched() fails.
>=20
>=20
> How are you configuring the cpusets?

See above.

> Also, which kernel version are you using?
> (sorry if you already posted this information in previous emails and I am
> missing something obvious)

Not even sure, whether I explicitly mentioned that other than that we are a=
lways running latest stable.

Two months ago when we last run some extensive tests on this it was actuall=
y v6.13.6.

> 			Thanks,

Thank you!

> 				Luca

Cheers

Marcel
