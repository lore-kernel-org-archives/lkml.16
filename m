Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3F204583;
	Thu, 17 Apr 2025 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931193; cv=none; b=PaCzchHllP3GS1kbgzdoA41tq/2sNta5gDgMRrQqW+e3nkkvvc7LjLaCXBOOkFY1EurbjBNwmBScnwBMwmIg5liGEHhCm3iXXadZs6rEQFT4TSjIFP1fOP4c00tQm/FziwGtOChRI+tvTYJw/s2gdFv5JCc3B+GizSQMgJJ4p0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931193; c=relaxed/simple;
	bh=dwYIUAaxrBuT5d52ULBPy+sYy2Xy32GxzTmyNZo8OVE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=bt6FEpq3svzqdU/40QzrxG0d9myieHqefkVlKfPOQ2zIfYLAMUDOGdK5i63Kd9N4nVLZ7QANrgm8E32GoTbPEQogUvuy5/DRdH9x+1xK3s/DcDoKtzKkxCRdRoPCmOON76HkpDX+Ta5S/vNlEd7C2ILL7vc8SZZA187wYoy0B5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nbAkbF5w; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nbAkbF5w"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HN6NQc834904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744931183;
	bh=FDH4isnZwqq2l+iCZ39ndDc2NXtb0tzf10xiYUchbHs=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=nbAkbF5wLX6hxe4DxaxeLsAAV/uVi/bXWeCbb85nh4c25IBr/+PT7F2tCgyaDQeJ/
	 AJDRO5oLTK2z5Vyq3P+vAAIr/b4lLANU6+59lZbNtvC8xbUMMI730k508li5JCaH9O
	 2MZsLTPadlPBjYf7BkpiM4UaVPfo+IotvLtJ9cRA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HN6N7f119497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:06:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:06:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:06:23 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HN6N7X128671;
	Thu, 17 Apr 2025 18:06:23 -0500
Message-ID: <4b8dac8a-e6fe-4225-a9e8-ab3b8b9df6f1@ti.com>
Date: Thu, 17 Apr 2025 18:06:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-lp-sk: Add bootph flag to support
 sd boot
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250203215704.1333881-1-jm@ti.com>
Content-Language: en-US
In-Reply-To: <20250203215704.1333881-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 2/3/25 3:57 PM, Judith Mendez wrote:
> In order to boot using SD boot, voltage regulator nodes, io-expander
> nodes, and gpio nodes need to be present in all stages of boot in
> order to do voltage switching, thus add bootph-all flag to these nodes
> to not fail SD boot on am62 lp SK board.
> 
please ignore this patch, I will be adding it to this patch
series when I respin v2:
https://lore.kernel.org/linux-devicetree/20241014194722.358444-1-jm@ti.com/

Thanks,
~ Judith
