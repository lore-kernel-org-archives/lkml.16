Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDF3FE4;
	Fri,  9 May 2025 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756979; cv=none; b=m5RwdBUIUMhohEiYIs8+qZ7lIUEBbBanLUqg20n4eDjFY243FhhJNhVWtsSogMszyo5lLKBjOWIFMRIT27Sw3eLzJisP55xnwxi3Vbnv9Z7NNUGF+WBUaMxQinxR1TY1DzgP8UJWefzW3S4b77S4mfKvKdPO4wM3lYSRgWbOI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756979; c=relaxed/simple;
	bh=jcDz03GykXpgZhcHsKLE3bBIS6sLvPXKPUZIzKPJA/Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC77Vdmq3GiPFiRNcItBXE+5uBAcLU/330LuVvYnSaUyCZQ9Q5VEn8hSXvZyiRE5aO1TyNTW3x66rpHnBSNMjX3B2ZBI2i290LZ/wRySQIiC/O0EALyNyuUx3zDukTTF8NxCA1T6dC4xzgQOy1EZBaVCmLhydtMvk+cnRwxKKnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=njGFB6Kf; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="njGFB6Kf"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5492G6Vs1272622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 21:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746756966;
	bh=CS/tUAIA1b6CCBXh10C6SNMxVsUo85DYXePoK+bxjKw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=njGFB6KfQhtmDsI/ZzB2KRWKAAsHm43knJdCkczOtmxLG+e8+obmpwefk95YQ+4jc
	 fv64ExsKnp3guxCe6yymutSzGr/ePPCk2Z8NCVuDXtctmmjFblNBGilyKZvi69k8mV
	 qh/bJz5zo7Fc6Uh5sKg0QWn6P6WK6+7tk1hjLSkQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5492G6jY113458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 21:16:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 21:16:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 21:16:06 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5492G5ds106642;
	Thu, 8 May 2025 21:16:05 -0500
Date: Thu, 8 May 2025 21:16:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Paresh Bhagat <p-bhagat@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250509021605.zgfwx5ubbccbxwbb@equator>
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-4-p-bhagat@ti.com>
 <20250509002201.g2db6cf5w4mtow6k@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509002201.g2db6cf5w4mtow6k@bryanbrattlof.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Paresh,


On 19:22-20250508, Bryan Brattlof wrote:
> On May  8, 2025 thus sayeth Paresh Bhagat:
> > AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> > designed for TI’s AM62D2 SoC. It supports the following interfaces:
> > 
> > * 4 GB LPDDR4 RAM
> > * x2 Gigabit Ethernet expansion connectors
> > * x4 3.5mm TRS Audio Jack Line In
> > * x4 3.5mm TRS Audio Jack Line Out
> > * x2 Audio expansion connectors
> > * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> > * x1 UHS-1 capable µSD card slot
> > * 32 GB eMMC Flash
> > * 512 Mb OSPI NOR flash
> > * x4 UARTs via USB 2.0-B
> > * XDS110 for onboard JTAG debug using USB
> > * Temperature sensors, user push buttons and LEDs
> > 
> > AM62A7 and AM62D2 SoCs share several peripherals in wakeup, mcu, thermal,
> > and portions of the main domain. To improve reuse and reduce duplication,
> > common *-wakeup.dtsi, *-mcu.dtsi, *-thermal.dtsi, and *-main.dtsi files
> > have been introduced. Each board will have a dedicated DTS file that
> > includes both the shared and SoC-specific .dtsi files.
> > 

I suggest doing a cleanup and internal review before public next
level patch. We have enough number of patches in upstream to use as
reference as to how to do this correctly.


Let us look at this in the next window, I do encourage using the time to
review internally to use the best practises and have less discussion on
minor organizational topics.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
