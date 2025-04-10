Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D0172767;
	Thu, 10 Apr 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325607; cv=none; b=JfGHlDHiTafEIor1dCrEK9EOA4m+vsve189aK8xizHVOPmQvU0i1OgBxSqy9/6/ARjJfq7fURU2vRWFYc6DRv0YujScMJFH2zg8SKHee7RPxB7hqBc/TbI//QCDFBmkpt5PaiuH/ZvseupW7Tkr5H+XQOvq7Ihb2MSMESNOySaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325607; c=relaxed/simple;
	bh=V4mVQZ//Ezj+MDhUUmwsm/fNROxGBSW/cC+lzJA8c/Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaKeZYqmc8m9xRWn76g0t+dsuFUltondp0sP9qFUTaI4nlK1aI8oa9CoD5AFzGY52t0ScdWDNkl0FWLqH5wrezvDR1GealUVzW4YatEmu2C9XgzTd5hSpqoJ9DjwroBtRngL2znsijfN/yfAxYJ2KQjhdK/D/H2yxM/IkYY/l54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=urVlRqb4; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="urVlRqb4"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53AMr2W71399307
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 17:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744325582;
	bh=dr2zDigygCC2C4GSdx8OOUFZ1CPNnNchXON92zqlKB0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=urVlRqb483spdKodj3Dr9LKvkfWZLWEpOvAwJDLkxZ+kqD2WowvYXrkOaLUMxsn2F
	 OzMfcUl7wK7ZksHrxPKiIuskTG0fcUVwPDw9QqU2t1QVEtkLPv5GfdB4RvZmF8gv8y
	 li2mK6eGrEklD1UR6RccLcVK7O6duK/T/4Lo6uJ4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53AMr2AV125532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 17:53:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 17:53:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 17:53:01 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53AMr1Sm093211;
	Thu, 10 Apr 2025 17:53:01 -0500
Date: Thu, 10 Apr 2025 17:53:01 -0500
From: Nishanth Menon <nm@ti.com>
To: Jason Kridner <jkridner@beagleboard.org>
CC: Robert Nelson <robertcnelson@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez
	<jm@ti.com>,
        Andrei Aldea <a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Deepak Khatri <lorforlinux@beagleboard.org>,
        Ayush Singh
	<ayush@beagleboard.org>,
        <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250410225301.orsurkanor52ovmk@native>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com>
 <20250410161509.yviucf36uhox4wvm@unedited>
 <CA+T6QPm2gVSa_+-vj5EA=RAs_sZFjq0LJKYVKPf_LN9Xc9uQQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+T6QPm2gVSa_+-vj5EA=RAs_sZFjq0LJKYVKPf_LN9Xc9uQQQ@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:26-20250410, Jason Kridner wrote:
[...]
> > > +&usb1 {
> > > +     dr_mode = "host";
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&usb1_pins_default>;
> > > +};
> >
> > is'nt this over https://www.beagleboard.org/boards/techlab or
> > https://www.beagleboard.org/boards/pocketbeagle-gamepup-cape or
> > https://github.com/mwelling/pocket-bob ?
> >
> > I think it is better as an overlay? Let us not enable something that
> > will add power for no benefit :)
> > Further USB1.ID has options for PRU as well. Let the daughter overlay
> > deal with it.
> >
> > On the flip side, we could work the other way - since majority of
> > daughter cards use USB host, it could be that the other overlays can
> > just disable usbss1 and usb1
> >
> > Thoughts?
> 
> Since you asked, Being the somewhat unique state of PocketBeagle 2 and
> other Beagle
> single-board computers as rapid-prototyping development platforms, my
> personal general
> preference is to see all the stuff turned on by default and then to
> provide some clear direction
> on what is not necessary such that it lives as documentation forhow to
> enable it and simplify
> the development of overlays. Some of the rationale for this was
> discussed a couple
> of years back in a series of blog posts by Michael Opdenacker. [1][2][3]

OK - Let us document that in the device tree then. For the i2c ports and
usb ports that are implemented in the cape, just add a documentation
note saying enabled for cape header or something for that effect. all
these main USB pins are dedicated functions anyways, so it is unlikely
to see capes that can even attempt to reuse the generic USB data pins
for alternate functions.

If folks do not use that header in some specific overlay, they can
disable the node based on at least some guidance from the documentation.

> 
> My perspective is that the interfaces need to be enabled to define the
> header connector to
> the device tree and that the muxes should further be fully described
> to the system, rather than
> leaving those bits of metadata regarding the running system as an
> exercise for the reader.
> 
> The aforementioned approach of removing all the "dead bits" is great
> until someone is left with
> the challenge of figuring out how to turn them on and/or select
> between them. Providing an
> overlay that disables all the unnecessary bits seems reasonable to me.

I understand the rationale, but, we as Linux community came to this
guideline:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n207
"
Hardware components that are present on the board shall be placed in the
board DTS, not in the SoC or SoM DTSI
"

PB2 being an partial "SOM".

It is a trade-off unfortunately.

> 
> Otherwise, I think we can put the entirety of the header description
> into an overlay for
> cape-specific overlays to use, but I find the lack of an upstream
> definition to make it difficult to
> enable cape makers to define overlays that are likely to actually work.

This is not an unknown problem, though not something pleasant to
live with. Linux community is always happy to review options around
this, there has been attempts to help standardize these daughter card
ecosystems in the past, but none have achieved acceptance.

What we have today is the scheme where we have dts and overlays and
ability to generate a dtb that stitches the two together in a specific
order. That is usually requested to be demonstrated to work prior to
acceptance in upstream. That provides folks at least one specific
combination of things that is known to work. (testing is a case of
effort spent by the community to test things - including overlay,
which is no different from the core dtb). But, yes, there is no do what
you want and it will just work option today.

> 
> Just my $0.0000002.
> 
> [1] https://www.beagleboard.org/blog/2022-02-15-using-device-tree-overlays-example-on-beaglebone-cape-add-on-boards
> [2] https://www.beagleboard.org/blog/2022-03-31-device-tree-supporting-similar-boards-the-beaglebone-example
> [3] https://www.beagleboard.org/blog/2022-06-06-using-the-u-boot-extension-board-manager-beaglebone-boards-example


Thank you for sharing your thoughts.

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
