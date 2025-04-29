Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC72741C8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907548; cv=none; b=qut6ldHgAzhVPR1G9BNQF5UbnAIRu30iS5u1i3TcTp3C85zCMji0he+EXk8Qs1SqfrnTYLvEStgSKIkoM6AQrCpI0hMCMI0i9RipZ3fdsa48fLP0wANmnHyXc1+UnriCPutVkSMAw9f2Ae3so+mpI6d/cgSeOF+1mcYtEum69z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907548; c=relaxed/simple;
	bh=Rp3cJHHmTx7PeP2hBYT2wQr82zD5tAALg+YJNXZeNEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rlK08NdPX2dF7WZmR+a+3ExZOiVoMVjQI6PT2ONYDHS7UxjHZ6anAQ5RRPL+yPDgl1Z0q1k8GwbVKdZixXRslr/gpEhVP6YnvXy9maIHVlQ6E6K//sHX8fnBN0Wv8Nt/jskhOmDllRu5g6g2odyiXmlKNYLPDT1ITe8EIIrWLGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PV9bzNe7; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PV9bzNe7"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T6IZbb3603302
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 01:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745907515;
	bh=DabvRdYFWGduGnW6eb29i9SQxqUOvxHEet2tbUqVCSU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PV9bzNe75ccEsbtETXF8C6hyk2cn4dKQVf4Q45xzanGRw3kWUO36g+BoLsQPe7b3Z
	 e0hjn7fT/RWZQiJyezcDVK0rkZk2fv8KO7fsY+j4kG78p9I/wbaEgmUECVLR3NNJI1
	 g+oU+8Lpn2jHOn2eM1TRUW/Q6sNMkGN3XDdlyJGk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T6IZVe099945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 01:18:35 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 01:18:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 01:18:35 -0500
Received: from [172.24.19.207] (lt9560gk3.dhcp.ti.com [172.24.19.207])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T6ITaV009260;
	Tue, 29 Apr 2025 01:18:30 -0500
Message-ID: <5a5584be-670c-46f1-a66a-3b95ef81cf1c@ti.com>
Date: Tue, 29 Apr 2025 11:48:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable XDP socket
 support for high-performance networking
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <arnd@arndb.de>, <lumag@kernel.org>,
        <geert+renesas@glider.be>, <bjorn.andersson@oss.qualcomm.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250428121025.246119-1-m-malladi@ti.com>
 <1df9b47a-d20e-4755-9b30-75d8ff150551@linaro.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <1df9b47a-d20e-4755-9b30-75d8ff150551@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,

On 4/28/2025 6:18 PM, Krzysztof Kozlowski wrote:
> On 28/04/2025 14: 10, Meghana Malladi wrote: > From: MD Danish Anwar 
> <danishanwar@ ti. com> > > Enable CONFIG_XDP_SOCKETS to allow for 
> eXpress Data Path (XDP) socket > support specifically on TI SoC 
> platforms such as the AM64x
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updqN51OXC2bwCXOvJOJf0uHOQ4u3JTTnIdRY_6gd786E07eEGpwtXIyCGLsDPJV6_rRmpwjb3dBOwY_bDAu4CiUT0pGPU8$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 28/04/2025 14:10, Meghana Malladi wrote:
>> From: MD Danish Anwar <danishanwar@ti.com>
>> 
>> Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
>> support specifically on TI SoC platforms such as the AM64x and AM65x.
>> This enables the use of XDP sockets for high-performance, low-latency
>> networking applications, allowing for efficient processing of network
>> packets and improved overall system performance.
> 
> High performance, low-latency network applications do not use defconfig.
> That's a development config.
> 

Oh got it, will drop upstreaming this patch then. Thanks.

> Best regards,
> Krzysztof
> 

-- 
Thanks,
Meghana Malladi

