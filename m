Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE078F52
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071060; cv=none; b=QMmwIhLFxprq6ZkR0Pbz0Aj0tItPKXh1c16oUkfQU51hBr9Whd0OvHi6U4mkr2+SRIEWFeW9SCL9coDYy2lZVlJ25AQEKHowABoaWta2Umjl8LjO++ZpcTDwjq1yF3d9IXyZgcj2EXhR0pAy4JgbA+dCSyy+SHv+a1UDkCqEfZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071060; c=relaxed/simple;
	bh=E9ESfUj2WpfAG3ZXR2IjD+sEGB/Jc66yklwYO9G2ZtM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QvEaUAIZqgH26cPombHC6fnlmnuaa5KSYfyj/MiRo2izMYznjXUhnoflQ2N0vJmyMZbkh6lWMirTkzgDeMLYAHpoilG8wSrYnWHcB++YBZrcTmwn5JUrIB5K+Ouahon3mAaOdFDEIWLMvD3Ewk5eRr10czAV+buxZXLYKkXkOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hnU0z3mv; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hnU0z3mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747071049; x=1747330249;
	bh=jZB1nicxWGlckxXy4g4z7NQCQ6SF2nkWYs9QJ8KThJg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hnU0z3mv0v1aQKbYN4eYUoAu1Cn2A0EOwpQz2VOqoUbf7FMZffgduPBswVNAg2bO1
	 AlIX8FUJlImsDUZIvAWZlveHZjnDkSsRD6JSolNg/sLCe/gEzRYTE4aKshjC9vQzjB
	 /PKN5KM3sGFubVCVwYZEgXGM+9Y+zRRCz3hQaHuFJ/iqJKGEY0/8YldpLiJ/FHP5bP
	 RoGHqM0F2D3qPPTcr/VYORXpO3tXWoeYQzRmg9A7mLEwMuGCJUGtzc0XaMQ2GXwzLg
	 YRoGkltyvzu0+7qC1aCQ3SXdKVIpfWB1VTMuJ3hvygC7pDdXQdNXkDDATPvyammK4I
	 p4iYIQXl8KVFQ==
Date: Mon, 12 May 2025 17:30:45 +0000
To: Vignesh Raman <vignesh.raman@collabora.com>
From: dmkhn@proton.me
Cc: Ingo Molnar <mingo@kernel.org>, dmukhin@ford.com, mingo@redhat.com, andriy.shevchenko@linux.intel.com, x86@kernel.org, daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>, robdclark <robdclark@gmail.com>, lumag@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: x86: Boot failure on select chromebooks with v6.15-rc5
Message-ID: <aCIwQHABCPufAQWr@kraken>
In-Reply-To: <45450eeb-1866-4bf6-a83b-1f28e26f311c@collabora.com>
References: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com> <aB2bStp8efMHPjet@gmail.com> <d966d626-458b-4a29-abe1-b645317e15d2@collabora.com> <aB2itc2-5h3LEJi6@gmail.com> <45450eeb-1866-4bf6-a83b-1f28e26f311c@collabora.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a49518909be0c153ec45816968a30cf2458eeb5e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,=20

On Fri, May 09, 2025 at 01:07:54PM +0530, Vignesh Raman wrote:
> Hi Ingo,
>=20
> On 09/05/25 12:07, Ingo Molnar wrote:
> >=20
> > * Vignesh Raman <vignesh.raman@collabora.com> wrote:
> >=20
> > > > What boot cmdline does your kernel have? The MMIO-UART patches shou=
ld
> > > > only have an effect if the feature is specifically enabled via a bo=
ot
> > > > option:
> > > >=20
> > > > +               if (!strncmp(buf, "mmio32", 6)) {
> > > > +=09=09=09buf +=3D 6;
> > > > +                       early_mmio_serial_init(buf);
> > > > +                       early_console_register(&early_serial_consol=
e, keep);
> > > > +                       buf +=3D 4;
> > > > +               }
> > > >=20
> > >=20
> > > amdgpu:stoney:
> > > earlyprintk=3Duart8250,mmio32,0xfedc6000,115200n8  console=3DttyS0,11=
5200n8
> > > root=3D/dev/nfs rw nfsroot=3D192.168.201.1:/var/lib/lava/dispatcher/t=
mp/18598802/extract-nfsrootfs-wgn1xjer,tcp,hard,v3
> > > init=3D/init rootwait usbcore.quirks=3D0bda:8153:k ip=3Ddhcp
> > > tftpserverip=3D192.168.201.1
> > >=20
> > > i915:amly:
> > > earlyprintk=3Duart8250,mmio32,0xde000000,115200n8  console=3DttyS0,11=
5200n8
> > > root=3D/dev/nfs rw nfsroot=3D192.168.201.1:/var/lib/lava/dispatcher/t=
mp/18598804/extract-nfsrootfs-5rlm_b6z,tcp,hard,v3
> > > init=3D/init rootwait usbcore.quirks=3D0bda:8153:k ip=3Ddhcp
> > > tftpserverip=3D192.168.201.1
> > >=20
> > > i915:whl:
> > > earlyprintk=3Duart8250,mmio32,0xde000000,115200n8  console=3DttyS0,11=
5200n8
> > > root=3D/dev/nfs rw nfsroot=3D192.168.201.1:/var/lib/lava/dispatcher/t=
mp/18598833/extract-nfsrootfs-3w0w5_mi,tcp,hard,v3
> > > init=3D/init rootwait usbcore.quirks=3D0bda:8153:k ip=3Ddhcp
> > > tftpserverip=3D192.168.201.1
> >=20
> > Well, if you remove the earlyprintk option then it will boot fine,
> > right?
>=20
> Yes, it works when mmio32 option is removed.
>=20
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76005338
>=20
> earlyprintk=3Duart8250,0xde000000,115200n8  console=3DttyS0,115200n8
> root=3D/dev/nfs rw nfsroot=3D192.168.201.1:/var/lib/lava/dispatcher/tmp/1=
8599938/extract-nfsrootfs-neuejjq0,tcp,hard,v3
> init=3D/init rootwait usbcore.quirks=3D0bda:8153:k ip=3Ddhcp
> tftpserverip=3D192.168.201.1

For the above example, can you please try something like

  earlyprintk=3Dmmio32,0xde000000,nocfg

?

In my case, configuring exact baud rate did not work. I started to dig that=
,
but did not finish, because `nocfg` worked (firmware happened to configure =
the
UART correctly). Using `nocfg` was sufficient for the system bringup debugg=
ing.

>=20
> >=20
> > The earlyprintk=3Dmmio32 in v6.15 is a new debugging feature that was
> > tested on a single board by Denis Mukhin AFAIK, and it may or may not
> > work on your particular UART - even assuming that all the parameters
> > are correct.

Correct, I have tested with one board only and with limited UART configurat=
ion
combinations.

>=20
> So the earlyprintk=3Dmmio32 debugging feature is needed only for v6.15 an=
d is
> not necessary in previous kernels (e.g., v6.14 and earlier). Is my
> understanding correct?
>=20
> Regards,
> Vignesh
>=20
> >=20
> > Thanks,
> >=20
> > =09Ingo
>=20

Thanks,
Denis

