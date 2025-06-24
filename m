Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CB2246BAC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760871; cv=none; b=k5gFkLUgC9uu73ADX/xXQJ38v9XpIwsC0p1ddXTicKEy8TKUngppVd66qvAfKIPRwCEnMbYTCYjn31bAVovjp6dlz5DNROJu6LIxPSNao6Tjff9MBu70eSESIV4HCwf+P+8DD8Mk7GOikEoQcPLuXGPYstm/8sP4Yw4EhG1d1FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760871; c=relaxed/simple;
	bh=pDZomwFVAqxwd8ytzWmvj98Fz/CdKe8JzSOM8VijVvM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUx8C08rvT3qduWMNXv1GWXDi3FHQnj6DHC76WGvO+DhZ1IPKTNfLo1W4ldhHt95KUiqTC001GVoTMzNVWVxNGoSqFPQGEejXdPLjdJfTi0sQXvc8BZsOBmmqw7TTcvhLfPAJJ6D04cqnff62yGtGMKm1vO9Upc7F4Fky/98iCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fOi26Anj; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fOi26Anj"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OARREn1136591;
	Tue, 24 Jun 2025 05:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750760847;
	bh=leF+8r/i1VKvIWB6nQ7uhXoKOvqvB/ZNgSapVQ/nSUY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fOi26AnjpKaChSPPaiwmNS5y5+VtZvBBA/Qw7my3g9UJ+XcwkxNAhwA0Z3wiYRGDS
	 93ufb+mC4xsMhZWw6g6VcziaPsYXMtlnTCBX5LgP/d7+gSPYDUSrSzHnrz9V8reaXF
	 HPJwrsaUpaVcpY//eVazK5RMDWnlM0apWSepgibA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OARRKo4126359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 05:27:27 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 05:27:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 05:27:27 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OARQV51344460;
	Tue, 24 Jun 2025 05:27:27 -0500
Date: Tue, 24 Jun 2025 15:57:26 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman
	<khilman@baylibre.com>,
        Sebin Francis <sebin.francis@ti.com>,
        Kendall Willis
	<k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix property name
 in comment
Message-ID: <20250624102726.pzk3zc6hbrmete2g@lcpd911>
References: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
 <20250623-topic-ti-dm-clkevt-v6-16-v1-1-b00086761ee1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250623-topic-ti-dm-clkevt-v6-16-v1-1-b00086761ee1@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Jun 23, 2025 at 21:24:28 +0200, Markus Schneider-Pargmann wrote:
> ti,always-on property doesn't exist. ti,timer-alwon is meant here. Fix
> this minor bug in the comment.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/clocksource/timer-ti-dm-systimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> index 985a6d08512b42f499b3e243eb69cc9674bc8e53..fb0a3cc23b5a35e2906a253d36ccef2baccca50a 100644
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -226,7 +226,7 @@ static bool __init dmtimer_is_preferred(struct device_node *np)
>   * Some omap3 boards with unreliable oscillator must not use the counter_32k
>   * or dmtimer1 with 32 KiHz source. Additionally, the boards with unreliable
>   * oscillator should really set counter_32k as disabled, and delete dmtimer1
> - * ti,always-on property, but let's not count on it. For these quirky cases,
> + * ti,timer-alwon property, but let's not count on it. For these quirky cases,

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
