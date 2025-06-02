Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D871A2547
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877944; cv=none; b=lb/qqg8Jm7pL0kaozKlNs0ECiPLNkE7lPibHFSWVWH7e5byX5y2N9WjIYPlYDahhE8GddoPL3ilgL0C06D1DOUH9iKm2a0SJsqNB42gcVcekUT38zF8O+Fsn9JN0jUYd2r2/dzZN9f6ier0iubH4csqZvc/jS4Q7x8mESriYRkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877944; c=relaxed/simple;
	bh=V9qpyVj2qptNPmcnnNYN1gSodzoegKuzkukODxhm+tw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=frCOj9NA0bY0jEUNq0RFs+5WdLX0c3XIrQlwYwX+FMqqJpwKGSRxA1MNlqbs1tY8AMUEtivdwgkMj1wn+i1onLlnqCENH2CnCZcvbE6//r2DsFaXeqLO8gc8trtkvxxMDA61CHgjMcsjRWi1RDeZkW8zjgzSM8MIOTCnVgljbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=2Mua7UF0; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="2Mua7UF0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nmh8hZH+/SkrQ4KvtitpdeGoe8YXi7dLPYr07tqnxos=; b=2Mua7UF01GNpCzUMIxS/ZiKXJM
	jZHDEFWxEs4Ej9+FidHAo96puvIJtuNQnA8iT/5HlYMHfplHLMaNhvWBNh/UloDdvs8qziLqyX3cf
	XXZju6U5t+HPejFUcVci/oTaWahQyvDiOEhWXc01S1SScdcuzeQRfNDWd27lx9bwV8WX1Fa47E5HE
	uIN6TcN2TNUNY2ntZSvrSrXHLGsMdxV8d64aeU/9Z9RrpyboMKi3UDlpH3EsK8ZSz/AnArrbMzdXv
	XoDakYxtDLWAU6Xua6jBI3wVQ25zMPfiPAIJtOwnNB9gnNn7Eq4pAbcvn30VTKGbfoaKs16ftCEfC
	AS+mEvJw==;
Received: from [213.55.223.191] (helo=[10.108.88.253])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uM6d8-00Ara5-8a; Mon, 02 Jun 2025 15:59:14 +0100
Message-ID: <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: luca abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Vineeth Pillai	 <vineeth@bitbyteword.org>
Date: Mon, 02 Jun 2025 16:59:11 +0200
In-Reply-To: <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	 <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	 <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	 <20250507222549.183e0b4a@nowhere>
	 <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	 <20250523214603.043833e3@nowhere>
	 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
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

Hi Juri

On Thu, 2025-05-29 at 11:39 +0200, Juri Lelli wrote:
> Hi Marcel,
>=20
> On 25/05/25 21:29, Marcel Ziswiler wrote:
> > Hi Luca
> >=20
> > On Fri, 2025-05-23 at 21:46 +0200, luca abeni wrote:
> > > Hi Marcel,
> > >=20
> > > sorry, but I have some additional questions to fully understand your
> > > setup...
> >=20
> > No Problem, I am happy to answer any questions :)
> >=20
> > > On Mon, 19 May 2025 15:32:27 +0200
> > > Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
> > > [...]
> > > > > just a quick question to better understand your setup (and check
> > > > > where the issue comes from):
> > > > > in the email below, you say that tasks are statically assigned to
> > > > > cores; how did you do this? Did you use isolated cpusets,=C2=A0=
=20
> > > >=20
> > > > Yes, we use the cpuset controller from the cgroup-v2 APIs in the
> > > > linux kernel in order to partition CPUs and memory nodes. In detail=
,
> > > > we use the AllowedCPUs and AllowedMemoryNodes in systemd's slice
> > > > configurations.
> > >=20
> > > How do you configure systemd? I am having troubles in reproducing you=
r
> > > AllowedCPUs configuration... This is an example of what I am trying:
> > > 	sudo systemctl set-property --runtime custom-workload.slice AllowedC=
PUs=3D1
> > > 	sudo systemctl set-property --runtime init.scope AllowedCPUs=3D0,2,3
> > > 	sudo systemctl set-property --runtime system.slice AllowedCPUs=3D0,2=
,3
> > > 	sudo systemctl set-property --runtime user.slice AllowedCPUs=3D0,2,3
> > > and then I try to run a SCHED_DEADLINE application with
> > > 	sudo systemd-run --scope -p Slice=3Dcustom-workload.slice <applicati=
on>
> >=20
> > We just use a bunch of systemd configuration files as follows:
> >=20
>=20
> ...
>=20
> > > How are you configuring the cpusets?
> >=20
> > See above.
> >=20
>=20
> Could you please add 'debug sched_debug sched_verbose' to your kernel
> cmdline and share the complete dmesg before starting your tests?

Sure, here you go [1].

> Also, I am attaching a script that should be able to retrieve cpuset
> information if you run it with
>=20
> # python3 get_cpuset_info.py > cpuset.out
>=20
> Could you please also do that and share the collected information?

[root@localhost ~]# python3 get_cpuset_info.py > cpuset.out
[root@localhost ~]# cat cpuset.out=20
Recursively retrieving cpuset information from /sys/fs/cgroup (cgroup v2):

Cgroup: /
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
------------------------------
Cgroup: /safety3.slice
  cpuset.cpus: 3
  cpuset.mems:=20
  cpuset.cpus.effective: 3
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective: 3
  cpuset.cpus.partition: root
------------------------------
Cgroup: /sys-fs-fuse-connections.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /sys-kernel-debug.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /dev-mqueue.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /user.slice
  cpuset.cpus: 0
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /monitor.slice
  cpuset.cpus: 0
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /safety1.slice
  cpuset.cpus: 1
  cpuset.mems:=20
  cpuset.cpus.effective: 1
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective: 1
  cpuset.cpus.partition: root
------------------------------
Cgroup: /sys-kernel-tracing.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /init.scope
  cpuset.cpus: 0
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice
  cpuset.cpus: 0
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-networkd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-udevd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/system-serial\x2dgetty.slice
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/boot.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/var-lib-containers.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/auditd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/system-modprobe.slice
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-journald.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-nsresourced.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/sshd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/var-tmp.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/test-audio.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/tmp.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-userdbd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/test-speaker.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-oomd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-resolved.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/dbus.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-timesyncd.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/system-getty.slice
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/systemd-logind.service
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /system.slice/system-disk\x2dstat\x2dmonitoring.slice
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------
Cgroup: /safety2.slice
  cpuset.cpus: 2
  cpuset.mems:=20
  cpuset.cpus.effective: 2
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective: 2
  cpuset.cpus.partition: root
------------------------------
Cgroup: /dev-hugepages.mount
  cpuset.cpus:=20
  cpuset.mems:=20
  cpuset.cpus.effective: 0
  cpuset.mems.effective: 0
  cpuset.cpus.exclusive:=20
  cpuset.cpus.exclusive.effective:=20
  cpuset.cpus.partition: member
------------------------------

> It should help us to better understand your setup and possibly reproduce
> the problem you are seeing.

Sure, I am happy to help.

> Thanks!

Thanks you!

> Juri

[1] https://pastebin.com/khFApYgf

Cheers

Marcel
