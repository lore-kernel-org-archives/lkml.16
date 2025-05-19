Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21327F75D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663061; cv=none; b=mAF2+JQypMaqupgaz9AjkxcI0sh6gRGBAJEtezbbF5B6JZO0T+MeedrXPBDP58sA5z3omKnTE+sS128gWO87BJZOn2qNNZFEbqB7vAMgi4f8Liu8wP1kfvlG3/vX7oiiAlA0z3NUAGpHON66UuHkyMSwzBzxbx5vJPnSelvhIRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663061; c=relaxed/simple;
	bh=/3d+7p2XGyrBNLdkUtkYQdU5cqgWDCn/zyDD8E0IsCQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qu0e9uWF9IINj3G0H068bbtriyUNEBxHjqTo/MbAHLCw8Mzy9dwPkvSx4APN8iQliY4c/gjkxpimVs9lG5SwXu2OtpIg3MzgG4tQm910emm4hdKmtCuqcW/TwDKZlcLgJY65x/w4ILCr4madrlKGOwQqZt740NkDF4iuuEN9EkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=ZX6LbTY5; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="ZX6LbTY5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JC2I0gVyCfBd3OAMFRX+9D/1gPz2ZjOtZ3VihBkJzow=; b=ZX6LbTY5+WQ/ZRf6j7CNVT4Nuq
	Fxs8K8Jvmx8ZqUGuynK1Tar+cAZZ6tQaiHxVf8ZT1wwFM9jHVTk+11DA8Bee4YMV3bm27pfE6QnYe
	Vbhg9AQhQPDyK+RDNxj/1tgQdyoC4Y0YO/df8UsEuoZZJytTpHcL0zahRyeQ7RdVFvq8qqPwO+o/7
	RjiuTOgKz9nakSOGbD6U4ESrgJequlJEUAR/Fd4u/qIFyE4VFokuAfuXugb8fh0goZmk0Qxu9dF9m
	ozbMfiCT8QZXyvecRACw4zpgy+Wbc5rDNIAjxwWUqx9vvfl16vEFgzlvefajFbVxjVsiE0c4/7jsI
	prRCjqZw==;
Received: from [167.98.27.226] (helo=[10.17.3.142])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uH0bW-00EBO2-Sv; Mon, 19 May 2025 14:32:31 +0100
Message-ID: <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Date: Mon, 19 May 2025 15:32:27 +0200
In-Reply-To: <20250507222549.183e0b4a@nowhere>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
		<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
		<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	 <20250507222549.183e0b4a@nowhere>
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

Thanks and sorry, for my late reply. I was traveling the Cretan wilderness =
without access to any work related
infrastructure.

On Wed, 2025-05-07 at 22:25 +0200, luca abeni wrote:
> Hi Marcel,
>=20
> just a quick question to better understand your setup (and check where
> the issue comes from):
> in the email below, you say that tasks are statically assigned to
> cores; how did you do this? Did you use isolated cpusets,

Yes, we use the cpuset controller from the cgroup-v2 APIs in the linux kern=
el in order to partition CPUs and
memory nodes. In detail, we use the AllowedCPUs and
AllowedMemoryNodes in systemd's slice configurations.

> or did you
> set the tasks affinities after disabling the SCHED_DEADLINE admission
> control (echo -1 > /proc/sys/kernel/sched_rt_runtime_us)?

No.

> Or am I misunderstanding your setup?

No, I don't think so.

> Also, are you using HRTICK_DL?

No, not that I am aware of and definitely not on ROCK5Bs while our amd64 co=
nfiguration currently does not even
enable SCHED_DEBUG. Not sure how to easily judge the specific HRTICK featur=
e set in such case.

> 			Thanks,
> 				Luca

Thank you very much!

Cheers

Marcel

> On Sat, 03 May 2025 13:14:53 +0200
> Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
> [...]
> > We currently use three cores as follows:
> >=20
> > #### core x
> >=20
> > > sched_deadline =3D sched_period | sched_runtime | CP max run time 90%
> > of sched_runtime | utilisation | reclaim | | -- | -- | -- | -- | -- |
> > > =C2=A05 ms=C2=A0 | 0.15 ms | 0.135 ms |=C2=A0 3.00% | no |
> > > 10 ms=C2=A0 | 1.8 ms=C2=A0 | 1.62 ms=C2=A0 | 18.00% | no |
> > > 10 ms=C2=A0 | 2.1 ms=C2=A0 | 1.89 ms=C2=A0 | 21.00% | no |
> > > 14 ms=C2=A0 | 2.3 ms=C2=A0 | 2.07 ms=C2=A0 | 16.43% | no |
> > > 50 ms=C2=A0 | 8.0 ms=C2=A0 | 7.20 ms=C2=A0 | 16:00% | no |
> > > 10 ms=C2=A0 | 0.5 ms=C2=A0 | **1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5.00% | no |
> >=20
> > Total utilisation of core x is 79.43% (less than 100%)
> >=20
> > **1 - this shall be a rogue process. This process will
> > =C2=A0a) run for the maximum allowed workload value=20
> > =C2=A0b) do not collect execution data
> >=20
> > This last rogue process is the one which causes massive issues to the
> > rest of the scheduling if we set it to do reclaim.
> >=20
> > #### core y
> >=20
> > > sched_deadline =3D sched_period | sched_runtime | CP max run time 90%
> > of sched_runtime | utilisation | reclaim | | -- | -- | -- | -- | -- |
> > > =C2=A05 ms=C2=A0 | 0.5 ms | 0.45 ms | 10.00% | no |
> > > 10 ms=C2=A0 | 1.9 ms | 1.71 ms | 19.00% | no |
> > > 12 ms=C2=A0 | 1.8 ms | 1.62 ms | 15.00% | no |
> > > 50 ms=C2=A0 | 5.5 ms | 4.95 ms | 11.00% | no |
> > > 50 ms=C2=A0 | 9.0 ms | 8.10 ms | 18.00% | no |
> >=20
> > Total utilisation of core y is 73.00% (less than 100%)
> >=20
> > #### core z
> >=20
> > The third core is special as it will run 50 jobs with the same
> > configuration as such:
> >=20
> > > sched_deadline =3D sched_period | sched_runtime | CP max run time 90%
> > of sched_runtime | utilisation | | -- | -- | -- | -- |
> > > =C2=A050 ms=C2=A0 | 0.8 ms | 0.72 ms | 1.60% |
> >=20
> > jobs 1-50 should run with reclaim OFF
> >=20
> > Total utilisation of core y is 1.6 * 50 =3D 80.00% (less than 100%)
> >=20
> > Please let me know if you need any further details which may help
> > figuring out what exactly is going on.
> >=20
> > > Adding Luca in Cc so he can also take a look.
> > >=20
> > > Thanks,=C2=A0=20
> >=20
> > Thank you!
> >=20
> > > Juri=C2=A0=20
> >=20
> > Cheers
> >=20
> > Marcel
