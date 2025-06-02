Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B4F9D6;
	Mon,  2 Jun 2025 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845717; cv=none; b=j653wkDEjxr9g2IwUhffWN79XojuX4SLOjgt8N4G9eqzD/HhJ5UTQphn1mZBsj0pPJeSzNbU0xjqDq3IrHGvvlnJJzmx/B89CBrgkxjbYUij5TQJLViaerNiCUdY1wtffUEjLJ7wvXQPSU3Hv4N2QXXBFrLqWR55pZpBLO+TpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845717; c=relaxed/simple;
	bh=RFHiCis3XLUYAf7ZTf9arM1h+xYK03arKw9lLjLfuzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uURQZ2r6asVTTIkyegTOwm70IvDrJltBumN19AlqNUmLS6F9R8a6qdCE+1MShjPd6M+8awQFQYcYacDCFN/g27BVHR0CatQ+T/60oi6YCu9HmbB8CybmdZdoBjVOvtV4eAmolCdbLd2QLvViyQk4jBdh/UGrCF27SEkpxKk29MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5Osrdge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5Osrdge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEB4C4CEEB;
	Mon,  2 Jun 2025 06:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748845716;
	bh=RFHiCis3XLUYAf7ZTf9arM1h+xYK03arKw9lLjLfuzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G5OsrdgeThAZ+e7cIqd3PVzpc6j03ZzmstEuZRjOJdxb5sjdV4UESGsHRRJAkBVPZ
	 MKwqoLO24x11KpDDbrm6Ri/HfEjWSjavpx5aLASJ9YKH8MFe6J7x+/cIAwypNjdVcv
	 vEs/cD3YDr+yeHT218GLlkS6HvUO7JQmj897UHrkI8HvP+yH/H9b423/zihAFnII0v
	 0OKePy7d8FavHbWn+7NDAB4ARgpN3efgCmkGQckoSTPVft/gE7mnESjqqMuKwpOp/a
	 xP0G7j98eG2vyqMobkkzlMS4DqhiRwHMUQXcWaqhRIFP2e6/54ftAp1uk8M4qFhLEJ
	 YwVCjuU2QLvYg==
Message-ID: <3c49628c-00b0-488d-a660-4b904febca1e@kernel.org>
Date: Mon, 2 Jun 2025 08:28:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: Add Device Tree binding for ST M24LR
 control interface
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: arnd@arndb.de, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <be95cc2d-f548-4c71-a57b-8107009b8776@kernel.org>
 <20250602034817.2028695-1-abd.masalkhi@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250602034817.2028695-1-abd.masalkhi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2025 05:48, Abd-Alrhman Masalkhi wrote:
> Hi Krzysztof,
> 
> Thank you for the detailed feedback.
> 
>> Do not send next version while the discussion is still happening.
> 
> You're right, I sent the updated version too early while discussion was
> still ongoing. I'll hold off on sending further revisions until the current
> points are fully resolved.
> 
>> Full path, so /schemas/i2c/i2c-mux.... but this is not an i2c mux, at
>> least not in your description, so something feels incomplete or incorrect.
> 
> A Brief Overview of the Device:
> 
> The M24LR series is a dual-interface EEPROM with both I2C and ISO/IEC 15693
> RF support. While it is technically an EEPROM, it also exposes a control
> interface over I2C via a second address, which is used to manage features
> such as password protection, energy harvesting configuration, and UID access.
> This secondary interface is not memory-mapped like traditional EEPROMs, which
> is why I initially considered separating the control aspect in the software.
> 
> How to Access the EEPROM and the System Parameter Sector?
> 
> According to the datasheet for the M24LR04E-R, the E2 bit must be set
> appropriately in the I2C device select code to distinguish between EEPROM
> access and control access.
> 
> What is E2?
> E2 is a bit in the I2C device select code. It determines which internal
> function of the chip is being accessed.
> 
> Device Select Code Format:
> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
> Value:              1   0   1   0   E2  1   1   R/W
> 
> To access the EEPROM memory, E2 (b3) should be 0:
> 
> Device Select Code Format:
> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
> Value:              1   0   1   0   0  1   1   R/W
> 
> To access the system control interface, E2 (b3) should be 1:

So these are just two different addresses. I already commented on this.
This is not I2C mux but a device with two addresses.

> 
> Device Select Code Format:
> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
> Value:              1   0   1   0   0  1   1   R/W
> 
> Is This a Gate?
> Correct me if I'm wrong, but to me this behavior resembles a form of gate,
> instead of using a separate hardware pin to access the EEPROM, the chip
> encodes this selection in the I2C device address. However, the datasheet
> does not explicitly mention anything about a "gate" or "mux," which is
> why I've been careful to not label it as an I2C gate in the binding.
> 
> That said, I see it as a kind of implicit I2C mux (of type gate), where
> the chip use the 0x57 address as in the example and to select the internal
> EEPROM we just reset the b3 in the device select code.
> 
> Why This View Matters in my driver design:

We do not talk here about driver design but bindings.

> 
> Looking at the device from this perspective has helped me keep the driver
> design cleaner while keeping the synchronization issue in mind:
> 
> 1- Avoiding code duplication (such as rewriting parts of the at24 driver).
> 2- Ensuring concurrent access to EEPROM and control areas is properly
>    handled and isolated.
> 3- Representing the dual-role nature of the chip more explicitly.
> 
>> What does "r" stand for?
> 
> The r in st,m24lr04e-r stands for RF, these are the RF-enabled variants
> of the M24LR series, as specified by STMicroelectronics.

It's fine.

> 
>> Do not need '>' unless you need to preserve formatting.
> 
> I'll remove the | and > where formatting preservation is not needed.

Respond inline, not by removing entire context.

Best regards,
Krzysztof
