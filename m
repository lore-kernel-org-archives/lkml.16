Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163EC1922C0;
	Sat, 19 Apr 2025 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055011; cv=none; b=PVZ9EXpH9+0GgywxmNiln/meBFJ08T+P0Y0lejX0kexG8I4agYehw4BzqtURj2EnTSmo0JnUUgbNm0gdhcqt/rvHr7BxxkjYEzZMjX4wIrlxnFgtTGfAmxvCjLTzs9zGUccrRS4dLzKs2oHN+5qgSQ+uBrDkiGxa3/MHw6nFu5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055011; c=relaxed/simple;
	bh=rbqQQPZAKPophQt044pA8iOjknBIZ1RqqgNVi+H02OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kHIq2WjmjHzyggiY7/OI31Zfgugd6nmaO+p0niWsN2cIwZCLCy20S3qNEYKsqq+ZyrRslLikK2pZREuPM1AXbhXj/erptQACKWW8mb46psSOP6Eg166xBs64vNlB64s2PejdcQllP3Jn4W536z690FZ/cBx98nE2E79kF8GjOOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qK8qWIVT; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qK8qWIVT"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9TpKA473892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 04:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745054991;
	bh=tUoEpxJAPpePFUnYzadpeX3o71EYpvH2B9GUgZ/Ia3g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qK8qWIVT8IVJlD91hhub8378U7hhcJ0sKLPzsaNs2sMq9pTMRrqxsKMzOAeF66Iha
	 Czf1mSeFsYns282PK+m2ZxYlKNX8XX3cDwrzZuDC2uu1v4RpHNT8ftL9tdkhOMiUuf
	 bY0MeDfka0/dlHPQlCWTrQ1a/xPbObjSYxeoo2g0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9TpoW113705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 04:29:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 04:29:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 04:29:51 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J9TlrM075765;
	Sat, 19 Apr 2025 04:29:48 -0500
Message-ID: <945e0247-a971-48de-adb1-60a1e7fe5f24@ti.com>
Date: Sat, 19 Apr 2025 14:59:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 DisplayPort-1
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-7-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411105155.303657-7-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
> Enable DSI display for J721S2 EVM.
>
> Add the endpoint nodes to describe connection from:
> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>
> Set status for all required nodes for DisplayPort-1 as 'okay'.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 95 +++++++++++++++++++
>   1 file changed, 95 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index f691ae4c19e6..15a7d9b813d3 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>   			 <3300000 0x1>;
>   	};
>   
> [..]
> +
> +&dss {
> +	/*
> +	 * These clock assignments are chosen to enable the following outputs:
> +	 *
> +	 * VP0 - DisplayPort SST
> +	 * VP1 - DPI0
> +	 * VP2 - DSI
> +	 * VP3 - DPI1
> +	 */

Sorry for basic question,  In this series , you are enabling only DSI 
interface.

why you need clocking for other interfaces ?


> +	status = "okay";
> [..]
