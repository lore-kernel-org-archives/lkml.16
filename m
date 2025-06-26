Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B293186E2E;
	Thu, 26 Jun 2025 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750911041; cv=none; b=u3O0rPiEJ066qOGdBnh4esp+yQ7zzxcW4GZQkbk6DH7AScP+NcUpf4kzj/KN8eoXsrY+gSxoOIwFyXC/WVQ66tF9H2RtsqODalEphSk4RXD8bDAfkC6OhHt2X3hJWR5UT3J0n7Voc/nr/jR72KlCuERzpk9SHEoaX6bHbzhg6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750911041; c=relaxed/simple;
	bh=lSiVLKHX5SJAhVrRPW8hKpDz2LjH70kojuxNXvfLuDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dso+A4RoKXzoJ9znCiy+drbgXjII+T6xRmz6P6aQYkT/N5pCWWAoVuJfeIAvqNmYScekLvOpSviUOGgI84wbZrLeO8zmKThQUcQs9/daB2cpA44/tMguxw8ij0z6BArxKCYptJBnt0oDUCJXe7HiXGl7JEQ1luR6oKkEunTTMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yoBW9BSu; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yoBW9BSu"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q4AXAO2344653;
	Wed, 25 Jun 2025 23:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750911033;
	bh=UCimBujHJQrKhwUSEA/OCXaC4BwwJPUOT3BLppQHNzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yoBW9BSuJVEKVc18rrAGHqZCci3vgMjDNl+uJ1iqgNwpOeUiLUD634vahEQ/DV5mK
	 0BHOaai5leUj+7uMjjHgHWXJlTjHnuXA1JUk2ruiLJvG/H84OLO+12HH3ZZr53N7HC
	 eB2reJyW8FbUyzxX5ycixFoULzPBUNIIb1359Y/s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q4AXYs3228081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 23:10:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 23:10:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 23:10:33 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q4ATdY343785;
	Wed, 25 Jun 2025 23:10:30 -0500
Message-ID: <2e397dbf-ac5c-49d3-8176-2022450bf0e2@ti.com>
Date: Thu, 26 Jun 2025 09:40:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for K3 BIST
To: Neha Malcom Francis <n-francis@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 05/06/25 12:05, Neha Malcom Francis wrote:
> BIST (Built-In Self Test) is an IP responsible for triggering hardware
> circuitry tests on both logic as well as memory blocks. This driver is
> currently being upstreamed in U-Boot [1] (on hold till the dt-binding
> is approved here) and triggers these tests on cores. This patch series
> adds the dt-binding as well as a node for BIST on J784S4 and J742S2.
> 
> Changes since v3:
> https://lore.kernel.org/all/20250514072056.639346-1-n-francis@ti.com/
> - Udit
> 	- add support for J742S2
> 
> Changes since v2:
> https://lore.kernel.org/all/20250328111439.374748-1-n-francis@ti.com/
> - Krzysztof
> 	- use existing common definition (ti,sci-dev-id) for grabbing
> 	  the device ID instead of redefining properties
> 
> Changes since v1:
> https://lore.kernel.org/all/20241128140825.263216-1-n-francis@ti.com/
> - Krzysztof
> 	- move from misc/ to soc/ti/
> 	- minor property changes
> 	- drop ti,bist-instance and instead opt for ti,bist-under-test
> 	- correct example dt
> 
> [1] https://lore.kernel.org/all/20250204123147.939917-1-n-francis@ti.com/
> 
> Neha Malcom Francis (2):
>   dt-bindings: soc: ti: bist: Add BIST for K3 devices
>   arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node
> 
>  .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
>  .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 11 ++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
> 


Nishanth,

Ok to take the dt-bindings via ti-k3-dts-next branch? Or would you
prefer to queue bindings and DT changes separately?

-- 
Regards
Vignesh
https://ti.com/opensource

