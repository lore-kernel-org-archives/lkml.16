Received: from mail-m49244.qiye.163.com (mail-m49244.qiye.163.com [45.254.49.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B413E898;
	Wed, 21 May 2025 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789834; cv=none; b=ZcfXSo990aedonrLAuwX3J3AuB/+ngc13j5j3MidVIueWQj0UsKhbR4+4xKEEVonRwCkrq3uu0EZIqiyzQAbUdDp7FIj9ZciT0IuxsxrSZN30pIlEvzrWNbRY3ZiVJkihfZY4wLBKG64xkcHb1EjypP59jmf9TG4EkwXrNC6/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789834; c=relaxed/simple;
	bh=tPcPrXu1kEXwxro07GGPXwoSMTAeYjAQO2QFJZ7Oja4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKjYpEeluSQGs7Unw0tBDA2d6eorvpp4EI0MCAcP5nZxDzndmLWc4fvseAu6tLYtzNQ3DFdVtBg2eMSsT+4gu7qWtrOjmCVHVG8qG3r5mlH2GUFrv/v2YJKLgkajnAIC/wUmv/Ar/QuY2rK8IRReNriZkK0cpJnMe3enDWGbAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Ic2JDMgd; arc=none smtp.client-ip=45.254.49.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ic2JDMgd"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15cf8fc2d;
	Wed, 21 May 2025 09:10:14 +0800 (GMT+08:00)
Message-ID: <3d163ae4-227f-4df0-ac1f-35fbe9e463fb@rock-chips.com>
Date: Wed, 21 May 2025 09:09:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: phy: Convert phy-rockchip-typec.txt to
 yaml
To: Rob Herring <robh@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>,
 Zhang Yubing <yubing.zhang@rock-chips.com>, Dragan Simic
 <dsimic@manjaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519024820.194-1-kernel@airkyi.com>
 <20250519024820.194-3-kernel@airkyi.com>
 <20250520193257.GA1221161-robh@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20250520193257.GA1221161-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xPQlZIQ04ZGEgYQkoeSx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96f0641bb303abkunm8da83e95a0a8a4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhw6HAw*QjE1FBkcNUshIgop
	C1FPCwJVSlVKTE9MTENCQ0lKT0pCVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkJJTjcG
DKIM-Signature:a=rsa-sha256;
	b=Ic2JDMgdqJ0cwLmw9YwQwzBgO6UA6P4emxlyEVfa7Gescg4Yn8Od6zYM7hyTFZfTrQzxXbv9GFf4kXxxPgC8dh8cQR6aZa3YQEJnNPZ56o/hubCEdLRdSaiU12vsBiXS8nHAWmfoy2zqF5p5YnkprSRovspHUzFgrCxE0MIITpI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tPcPrXu1kEXwxro07GGPXwoSMTAeYjAQO2QFJZ7Oja4=;
	h=date:mime-version:subject:message-id:from;

On 2025/5/21 3:32, Rob Herring wrote:

> On Mon, May 19, 2025 at 10:48:20AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Convert phy-rockchip-typec.txt to yaml.
> Thanks, but I already converted this one and it is queued up in
> linux-next. There's still a few more rockchip ones to do:

Oh, I missed it. Thank you!


>
> ['mps,mp8859']
> ['realtek,rt5651']
> ['rockchip,rk3368-mailbox']
> ['rockchip,rk3399-cdn-dp']
> ['rockchip,rk3399-gru-sound']
> ['sitronix,st1624', 'sitronix,st1633']
> ['ti,tsc2007']
>
> I see you already posted cdn-dp. Thanks!
>
> Rob
>
>
