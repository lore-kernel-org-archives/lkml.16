Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C61C1F2F;
	Tue,  1 Apr 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505776; cv=none; b=YwUaP+2Bmlr1COYfI1CPSLcL7ztfH19xj4cT5C7hG9XhAU2ieTa0emmVouGhoP7rD0RNS1BZUv7ZYKochnjBz7KXbXO3SI+lc4tSuvYKBMh/VaeOxL2jevQKwGOvaYpa8LZTtINL5Wmi6UBSyMGgVQ2iD1Vh15wpQzNHADXjxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505776; c=relaxed/simple;
	bh=PPv3xZIaLfz6iEjfD3QWE/BzXA85IVTbjNSjcOtzP7U=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=OqGURePjnag0aVhjHSPNRbC3/ey9C3MAv2ie/y5Z9rLrPl4qy1gYJ8XDwTn4MB/g4SKfOUIDTO3LmFZDm4xyU34TKfagsY+iCi8djWsg+lD2iuMaV0mOQ08bLZ4EkUx2WWSUCQ+qYnEr5/G9SJJ6lh0s2O5IVTvWt1SeHgElM7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIRt8ESx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIRt8ESx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D57DC4CEE8;
	Tue,  1 Apr 2025 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743505775;
	bh=PPv3xZIaLfz6iEjfD3QWE/BzXA85IVTbjNSjcOtzP7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HIRt8ESxjaNP4dTFe9O3bTFy/yc4Vu8mZMdpmsTV1O+ZEF+LbVTvmeTdNe5uqlEy8
	 umJiahRypk/xeeWaVMe4va3ULlpaUeYCFlqqL1U4f0cXbqv6v6f3Q4XI5Yygk3r1Wp
	 cEy2UJ7XqYXnGLNXHgSzbpnSZ5OKYv2vUIy/28pHniQp9deAa+5cpxWxPHtDU11q3K
	 zU/WCCttTgF72QlRDoFjFyMmobHsBJ7GMIYVWTjvb/jnBwa8qgAD6BRJfmrJ+eAW5a
	 RlFDzk77WkXP5nhXHns+2iFJ8bEfZyUeOhKnTWLR3Z6IOreQmYw1rAjnvBm14JnHV1
	 lfJAt5Bi2TZhw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 13:09:30 +0200
From: Michael Walle <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
In-Reply-To: <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
 <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
Message-ID: <ea82dc29e93d53b659916f2fed10982b@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Udit,

>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>>>>> [..]
>>>>> For completeness , this is ok to add this node but should be kept 
>>>>> disabled
>>>> Shouldn't it be "reserved" then, see [1].
>>> yes, should be reserved.
>>> 
>>> With marking status as reserved.
>>> 
>>> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
>> Thanks.
>> 
>>>>> similar to
>>>>> 
>>>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
>>>> j784s4, j721e and j721s2 have them enabled. What is the rule here?
>>> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>>> 
>>> example for j721e, one is used by kernel [0] and another by optee 
>>> [1].
>>> 
>>> 
>>>> You also disable the hwrng in optee in your evm according to [2]:
>>>> CFG_WITH_SOFTWARE_PRNG=y
>>> We are planning to use this hardware block by secure firmware.
>>> 
>>> Therefore request not to use by optee as well
>> How will you be able to access the RNG from linux and u-boot? I'm
>> asking because I'll need it in u-boot for the lwip stack and the
>> HTTPS protocol.
> 
> For now,  If you need TRNG then I can suggest to use optee TRNG (ie 
> build
> optee with HW TRNG).

I'll be using an uboot TRNG driver. But how will that work in
the future if the RNG is used by the secure firmware?

-michael
