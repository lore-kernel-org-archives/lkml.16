Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084515B554;
	Mon,  7 Apr 2025 21:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744061678; cv=none; b=Dgzpo0GhImVeYOuk6GopXgmDfGpS7M9S/t7OofU+W5yaOM+uDYCfEDjpBnxUliVwYLaeifZ4dhYib+DFS+0/U1MZnInU3ih1LoXU9vaJYmvlEuOFT7L1KQfBCyYIUsU56BGFWZWewPuEPsGPpEgzi2QgN8XbKEYUaqNRE/je23w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744061678; c=relaxed/simple;
	bh=diYSXx9lBmoAqlgbO65iylXkx2XNDbAAYunEOK8li2o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tw/FNuMCSjYN0sbQHtd9HV6cOpG4RjGXel3yfmECh0rDxyCAPH3JniYKzr4neKfuBmHj0VHwKpFFqDF+BxEuh3diMEDQImSxsPfDyafiVDTABBlQACmTKXCcK1QcBo6QtATWuPeBP1zXDPIi6hq9+nk2BLGcKMpnO1lX03RhI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GEQfehUG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GEQfehUG"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537LYRec1024896
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 16:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744061667;
	bh=eYWazmmfD/ANxoGU9LJS/ciQ9FZGln7uKvv9Wh4ZZrw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GEQfehUG3BYjl1WUo1gBNftT/qaJEGcrPyaodQ8+yWcuZLE4taqN3rJUd4GFpuJGG
	 wPdyuJzcgBAhLawpXMK3YuO2HkWoxsckBGq1ygmY8mqAD/yeARsJFJWQvg0dMnKORu
	 4NgRWggKwCZjzmHgOYaH7Zu9JjR5A7KKeXzX/wE8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537LYRWZ027597
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 16:34:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 16:34:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 16:34:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537LYQSA015167;
	Mon, 7 Apr 2025 16:34:26 -0500
Date: Mon, 7 Apr 2025 16:34:26 -0500
From: Bryan Brattlof <bb@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250407213426.gkhes7oh5f7vg36q@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <20250407174648.exd57yivoj4rvson@going>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250407174648.exd57yivoj4rvson@going>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April  7, 2025 thus sayeth Nishanth Menon:
> On 10:34-20250407, Bryan Brattlof wrote:
> [..]
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> > new file mode 100644
> > index 0000000000000..697181c2e7f51
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> > @@ -0,0 +1,672 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree file for the AM62L main domain peripherals
> > + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> 
> Fix the copyright year please. We are in 2025.

Ah thanks, time flies. I'll update that.

~Bryan
