Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FFD17B50F;
	Mon,  5 May 2025 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450770; cv=none; b=IjOpl7I5AcZJXmVogQGmX4H4E78NdHbJnAyO3eSZBuY8Epsj7llsx+TaqtUtfhicrP+qndrxbqRaR1LdkU7tRS9YwGKSn4/6ruqrV90iblsmKgp853TZAr9c/zDg2PDmgVWG6ee0mDLMooCquyVlpQ6AWMZE4LA9p8AOxAy681M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450770; c=relaxed/simple;
	bh=wIoatFFvgsMP1WuaOD5gtDxP4rLHaGa3DDS0HmTezAE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTfHwzqG5o/2bWTGoHnK88GX9vaist2sjYde7U2mPmdHUSMzklEwDo6je0hJae124lSFEYQ5+LacW4PWl5cDhX0ki4qNqn7xx2nV3kS/qexQ19qt1kDSNDE4rOJGpt9FfgDHVxuOIKodJG7sFVSDrEbPQbqaOOHN+RLUs042mNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QD7GM8TY; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QD7GM8TY"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545DCU4O946261
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746450751;
	bh=yTfL/fvg5uCjNorELIHZpGNdVVCrNhFU0chckRh1dYo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QD7GM8TYI+aQOACJZ30G/WxcP6GgDD7+w7/oPCOh86Zgy813HxmhMEYpqqBBzOb6m
	 svK3oHoG4S8lKZvG8DOocDIryJidEhr5NUeVQ1EPv7/IB1YJUN0XOPuwO8/W36MQpU
	 uOWVStRJzfsuj0j2yj8pVtkxk7gSu0+5rFD9Sjuk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545DCUGs045176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 08:12:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 08:12:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 08:12:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545DCUnP108695;
	Mon, 5 May 2025 08:12:30 -0500
Date: Mon, 5 May 2025 08:12:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
Message-ID: <20250505131230.3ydwgftnqbbmrt5u@opulently>
References: <20250502142606.2840508-1-d.schultz@phytec.de>
 <20250502142606.2840508-2-d.schultz@phytec.de>
 <20250502144934.t6hjiwp2f64ovb34@deeply>
 <9964aeaa-0169-4596-a33d-c56bdb6edae3@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9964aeaa-0169-4596-a33d-c56bdb6edae3@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 21:11-20250502, Daniel Schultz wrote:
> 
> On 5/2/25 16:49, Nishanth Menon wrote:
> > On 07:26-20250502, Daniel Schultz wrote:
> > > The AM62Ax SoC supports two temperature ranges:
> > > * A: -40 to 105C - Extended Industrial
> > > * I: -40 to 125C - Automotive
> > > 
> > > By default, use the lower limit (105 °C) so that any AM62A running
> > > in Extended Industrial mode will shut down safely before overheating.
> > > 
> > > If the bootloader detects an Automotive-grade device, it should
> > > override this and raise the critical trip point to 125 °C.
> > > 
> > > Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> > > ---
> > >   arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> > > index 39ff9118b6c4..40dcb9bab965 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> > Why not create a separate header for industrial grade and rename this as
> > automotive grade and let the board file pick the right grade used on the
> > board?
> 
> Mostly because I copied this from 10e7bfd8114c207ac and with the most recent
> temperature fixups in U-Boot, we also have the missing bootloader logic.
> 
> I would also prefer an out-of-the-box solution for that.

Personally, I am not in favor of depending on U-boot (there are other
bootloaders as well in the ecosystem) monkeying with dt nodes.

I suggest renaming the dtsi and introducing a industrial dtsi. And
depending on the samples used by the board, use the correct dtsi.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
