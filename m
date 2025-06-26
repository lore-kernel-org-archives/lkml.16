Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E286338;
	Thu, 26 Jun 2025 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918540; cv=none; b=gWDH+PmvS0W9EQpQQB21/wP9/7d7VldSzJkf60zNSWUo01D4qFkh7zc15CcthyKlLz73N68Qd6bA7ZMn6zBXXG8VbnXVBMAjVEPbzn0TjWQYbMjJ2RRocz/TwAGkzbn23QwJ713VT69q8QMUh4r3kPD2uxGvklzhv4ldiMlZoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918540; c=relaxed/simple;
	bh=tVaFi0QQFxJOCGxz5I04EMMBBFJ2MuDd2QlikpakzeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KBTV3MrjBUXRFXkhpT/yoKUcXb+gP9Gfbu5TdX0fjt5Tr+VDMFc6N86dTyQRuKu9fPZBGN3J+PY90WMdX5wsJoiNZ8252V4XtM/GWYYENT4GBMTg8wjMhM+7gqG/KZpv9fSypFbHkIVhiK+eguDZms7hXeTBQ251Xwumj+NIYPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MmymMmnG; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MmymMmnG"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q6FU9O1658138;
	Thu, 26 Jun 2025 01:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750918530;
	bh=BrnBb1u8+xN0axh7RXZF3RUvtezK1itX/RvwUC1NtH0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MmymMmnGVpx24An7rZMbUABpApdcdUpdAEwaML+iE+J6pD7A0v+z94gmACWgZ14ru
	 /b8yCIO+YqaP694skNPA7oxeyieA/GGQU9717Qa+YJbXAggSjOc8hb7sqK9iDFlkck
	 FGmDP88Mr680fn+E60tZtNqrVjGJA1WYcIbCLIsE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q6FU5X1980491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 01:15:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 01:15:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 01:15:29 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q6FQpk506594;
	Thu, 26 Jun 2025 01:15:26 -0500
Message-ID: <0d81594f-ad1a-4c65-a00a-9c97c8b01a65@ti.com>
Date: Thu, 26 Jun 2025 11:45:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add DSI display support for TI's Jacinto platforms
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624082619.324851-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 24/06/25 13:56, Jayesh Choudhary wrote:
> Hello All,
> 
> This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
> - J784S4-EVM
> - J721S2-EVM
> - AM68-SK
> 
> Relevant driver fixes, CDNS-DSI fixes[0] and SN65DSI86 detect fix[1]
> are Reviewed and Tested.
> 

Are these merged?

[...]

-- 
Regards
Vignesh
https://ti.com/opensource

