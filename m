Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BEA21CC62;
	Fri, 25 Apr 2025 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574380; cv=none; b=KWXSaB0ggIgIDOKMYVDRYdKoXIj5gA9QQT/+II3+ZhpMnCmmpOLzWVRRls7AnLJc8TlslTlGA+qDcA1zeDyc3G60i1pQGiM766B8Eg2P17txf2hDr47y4vg7MO4a7lSVZ/F+i/ZN8YM+S7jpU68oL9QUZfcxgWLGzoQhtl/FfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574380; c=relaxed/simple;
	bh=lbHCAUcJiqFBb9oSVZO3x35jBLSGHVixZR3edNDteGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLAokAJR+1nkckkulgx1AGeLR+iosXwWTGTskWA422pz3E11sYl7EozztKOcEZ4VYF4WYduSEOxKwFgK5aVsuZeCwxN/79X+ilod0aGxn0JVTBO79vMYC1YFyejwoidsxpVvlzMleDWCbYqXVRnb90EHh3YcqiHL8D3wx/ApjNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20689106F;
	Fri, 25 Apr 2025 02:46:13 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9D43F59E;
	Fri, 25 Apr 2025 02:46:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:46:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, <dlan@gentoo.org>,
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <jernej.skrabec@gmail.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <robh@kernel.org>, <samuel@sholland.org>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250425104614.7efdd6c1@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
References: <20250425023527-GYA50272@gentoo>
	<20250425030006.45169-1-amadeus@jmu.edu.cn>
	<CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025 11:52:42 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> =
wrote:
> >
> > Hi,
> > =20
> > > It seems I'm a little bit late for this, but while we are here,
> > > Can we also append 'cubie' to dts file name?
> > > e.g. - sun55i-a527-radxa-cubie-a5e.dts =20
> >
> > Usually we use the device name (without the vendor name),
> > maybe sun55i-a527-cubie-a5e.dts would be better? =20
>=20
> I agree with this one.
>=20
> I can probably squash in a name change (since I'll be squashing in the
> SD card slot fix anyway). Andre?

Yes, I noticed that yesterday as well. So that's fine with me: both the
name change and the squash.

Cheers,
Andre

> In that case would you prefer to keep your current patch separate, or
> squashed in so that everything is clean from the first commit?
>=20
> It's up to you since you lose out on commit stats.
>=20
>=20
> Thanks
> ChenYu
>=20
> > Thanks,
> > Chukun
> >
> > --
> > 2.25.1
> >
> > =20

