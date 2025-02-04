Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25DF207A00
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661250; cv=none; b=VALbHO63vkEV0hgvQb/RjQbm/h0QiX0q86ZsXdBbQ8wOJc6ys5i0tDK2OhEErq0lrIe4NHsiiy1NKrI5D4Lg3GOt5pb1ePyrI1s2oS88J0Y8f0lglPDdUSZmBOKgky8fKGi6aX1mhXUy9BfaakA2JFjYw6jo/ZOqug72dkIdB0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661250; c=relaxed/simple;
	bh=JU3Lm+iYLfayKfGR+P1EVlzHSM9OleQsodwCVlE5320=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMuJNTz0sDuz05K2/Xc+VYF4/XmZP5uXbmdqtqzorAH1Hw1TEjCIu5UGktE4RplyyNXAd0wTHBDtkHZT/mR54qyNuRxVmm25hbQalATWkBIOnJHWqazP0+hCl2cI5AD+OvtsIQGAHW4aEdbvy+nx3F9fQgCJLGTFpKMnwqLPbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J525MZqW; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J525MZqW"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5149QlEW3192342
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 03:26:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738661207;
	bh=UmhLG8fj2RQNDb83VwTcmt6NK6fdTtqXuVcY3Pwy504=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=J525MZqWVtgMPiAybEYSXaTk7nnHSHeq/+Hme4xm0AvV78yXeKrNZ5tIq+b1cVMy3
	 G95PvpqtQaqYGXzoU9DN3HLfqQRm5DOpFJSQZ9BJo3RKu/5l+A6SJjnOzePhJkrL5s
	 93MHb3w2wQxgT/PKb8GdwYT9Og8x51NmN6hxPzCw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5149QlIC085742;
	Tue, 4 Feb 2025 03:26:47 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 03:26:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 03:26:46 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5149Qj5V034419;
	Tue, 4 Feb 2025 03:26:46 -0600
Date: Tue, 4 Feb 2025 14:56:45 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and
 Aggregator
Message-ID: <20250204092645.cnu4lnzac7n2dtwx@lcpd911>
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250203150801.2399555-1-vaishnav.a@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Feb 03, 2025 at 20:38:01 +0530, Vaishnav Achath wrote:
> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> for core functionality like DMA, GPIO Interrupts which is necessary
> during boot, thus make them built-in.
> 
> bloat-o-meter summary on vmlinux:
> 	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
> 	...
> 	Total: Before=31615984, After=31778459, chg +0.51%
> 
> Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---

Tested this for basic boot on TI K3 AM625-SK with next-20250204.
Tested-by: Dhruva Gole <d-gole@ti.com>

Also,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
