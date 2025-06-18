Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238BB78F36;
	Wed, 18 Jun 2025 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234046; cv=none; b=rtmk4TBylyacrv7Vna9cKczqkoCx67LnmL9HY3jvkcCxFawZ8pp13AhVeSkdWKN9bvPS1fJkSVQSPe/DO1M5UtejoSNP+d1qHx7MpHDXT0glfI3sfDXSQHXKm2nhDEp5hYHd7HVdfFvOJT/SmPcQndG20mKRA/t6eyRf9EvUtUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234046; c=relaxed/simple;
	bh=0CxXiHMNWdqRvtpwE5o8atpBN4w63+FFTrT6OWHeM0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bajuiGT8t6FJOTK9IF5LIuZZT3D2uS+gmWsxVU7rePA66pfsuegzOtt9r4okuYOS2x7BV4mO6wIOOCUwmOfjkI3E+D3onwQyHT5GwIbPWQj6s/1nwJgwea/ei7bFBuhQE0j1Y0UZCUjGRlNID5sijpu7IE8bG61cMbYEktIM6MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S2Ky0lTw; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S2Ky0lTw"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55I87DhT259017;
	Wed, 18 Jun 2025 03:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750234033;
	bh=hzR9hY3aXReIKLQjddUokZ+nDxBACqmL6T3xJ8Hz+fQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S2Ky0lTwzwJf346PBx5hp+UNqUP1H3e9hAyTUWWSw5N4NEXnXOjKZGn7k2wZYMDwl
	 b8pyqKMaoqiGNEhQgpIJ7jgvDSMlupMoQdNElvlmwYKof9/XQ8DEM5npSA4yst+rjt
	 WiuYJf3CZ+LK5Pj6qDzqY+ZxamavbToUsrbdgsvI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55I87Co93736222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 03:07:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 03:07:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 03:07:12 -0500
Received: from [172.24.227.143] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.143])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55I879ec3363501;
	Wed, 18 Jun 2025 03:07:10 -0500
Message-ID: <f2e54128-f7c1-4193-a511-13775559e261@ti.com>
Date: Wed, 18 Jun 2025 13:37:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Add clk_determine_rate function call
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
References: <20250616103527.509999-1-j-choudhary@ti.com>
 <aFHr9sVnU3Nx6yh0@shell.armlinux.org.uk>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <aFHr9sVnU3Nx6yh0@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Russell,

Thank you for the review.

On 18/06/25 03:58, Russell King (Oracle) wrote:
> On Mon, Jun 16, 2025 at 04:05:27PM +0530, Jayesh Choudhary wrote:
>> Add a function to determine if a particular rate can be set for a clock
>> with its argument being the clock and the desired rate so that it could
>> be exposed to other peripherals.
>> For example, the display controllers typically has to perform multiple
>> checks for supported display resolutions including those related to
>> clock rates. The controller has to check this way before it actually
>> enables the clock and has to do it multiple times (typically for each
>> mode), and therefore using the clk_set_rate when its not needed, does
>> not make sense.
> 
> So what's up with using clk_round_rate(), which returns the clock rate
> that one would actually get if one calls clk_set_rate() with the the
> value passed into clk_round_rate() ?
> 
> Why is clk_round_rate() not sufficient?
> 

I missed this. Sorry about that. My bad.

In the driver I see that clk_core_determine_round_nolock() will call
determine_rate() op if it is defined. And since clk_round_rate() also
calls this, it is sufficient!!!

I have tested this with my display controller TIDSS on TI's SoC and
have posted that patch upstream:
https://lore.kernel.org/all/20250618075804.139844-1-j-choudhary@ti.com/

This patch is no longer required.

Thanks and Warm Regards,
Jayesh
