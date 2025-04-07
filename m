Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC0217663;
	Mon,  7 Apr 2025 17:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048017; cv=none; b=SYtNmqUr3SghSlIA2vsP7SvCeS0arCjc4Ojwu8v50bMzkmIUqG6thNpi5jYgvIY4LCP8oiEUYNUsr9RvBvNhSDLFFX2HyiAZN9uE/ddqb84DtdJMC3cn4PcGOR2LmIkzyeXUCUMHTT3sS0mKTty5/sR0c9S5gpZlb3i/wqxnVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048017; c=relaxed/simple;
	bh=3eN6/YjifecY2HB/tUwnGoB4rpyuQ8SNs7xbMNOujKw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve0nIjTI9gv2YsvrPQImO1/gzLrRy+lF5V66oHJLOQQUaVVoj6oAZ1aqZ3xMEDUalIyL/o2Xh6DmNfLF+wn5WdGG8JMoDHCMtMaPeWH8Qg4QL7ZMeJ1YPOnYkuPj90GZJiPRhSLK3ht1IeLRhcZ0ELGTj6MfNilSqfoeJyRV/EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q34nmnxa; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q34nmnxa"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537HkmVB433156
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 12:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744048008;
	bh=9NeDdgCH1H4EeC0G6DnpevkoDIVJiaLovnZau5WGOP0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q34nmnxaMZ1CS2wyY/kvpvY7APtq9bRgRKyMojLXwf+y8Oe2wXpBU2yoz5nU0mNtp
	 he4X6tYoXu70yXDFSni2VVptH6W25q6/4rcO/b89JCyZUPNRencgfBh30RYvJ90ZLV
	 2imXYtQOCLwy1AXg6/L5FWtFCRrT4Q3r89/VoNAI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537HkmaF102999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 12:46:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 12:46:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 12:46:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537HkmYQ124236;
	Mon, 7 Apr 2025 12:46:48 -0500
Date: Mon, 7 Apr 2025 12:46:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250407174648.exd57yivoj4rvson@going>
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:34-20250407, Bryan Brattlof wrote:
[..]
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> new file mode 100644
> index 0000000000000..697181c2e7f51
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -0,0 +1,672 @@
> +// SPDX-License-Identifier: GPL-2.0-only or MIT
> +/*
> + * Device Tree file for the AM62L main domain peripherals
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/

Fix the copyright year please. We are in 2025.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
