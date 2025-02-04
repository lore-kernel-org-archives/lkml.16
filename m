Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42420DD4B;
	Tue,  4 Feb 2025 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694026; cv=none; b=TwbVg2AyWym189EuPfd33HaDwnP/azorS6bu5eCUDbXUtgegngJHzTgn0HvurGQj01qa1mpqoSBlNWUUkcg/Be7CAhhiQBsc4Xy1HjLwR/Y0pln43djgr1CNsrJqP98ocBO0pcGtxR5R0ehs9lwUrXf1bAMn0z9QB6uCtF5x6ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694026; c=relaxed/simple;
	bh=gsCjHli5AUFPsuFvvTAvSQ2JfSxqZ7R7aIG/CH7gPUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSwfuGiJb7j1sIMNrIqu94jT/pcE6uURjQk77YiIX1HnKnYz+DIAMVyVKLbBkbLqnLXP/kYxwAoGkbE6j+KMtWDY4kSJ6HOFATd+U6baIrToGWGasCckzt8dzj9I1aIgRXlAipLFvh0696IsiiLfkfn04MlRgNcQwkE/qGIFeQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBw5+4hO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBw5+4hO"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dcd3454922so1005234a12.1;
        Tue, 04 Feb 2025 10:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738694023; x=1739298823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/nvmGiG6t9ytyA672y6bjV3f0iGxkpD3Qq0f/9h6o4=;
        b=CBw5+4hOtOlHxErYdxZx9VfLRYcdRO0EyKm6HhYVhdSj7ozWf/Es8/M0Ksh3+yA4QB
         vr+lVOeWPCoC4AW6FEzwK2pi4fMsUk+zk2IqwEbWa2sdPNu+opcLTFomtrF0IXGnZxcN
         25kxKWIU/b8yU8UHluqmtoVI7nFnCSOlKXeYZC43ZGUksmYK6yW+4h5dXAeyWgEy+HYc
         9nrhB0pPEQ/Ut7CuiMpMhwuPXY7B5jkq+cbwyD0LA8Uzhyz+8jkWn1fYfCgC7RlkicLH
         +7hUZAkCmzeqisEdfF2Bo3vNqrzs0JXn9iF6N4U8o6ZLLmQp8/SAlj50QcvtWSYewoF8
         t6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738694023; x=1739298823;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/nvmGiG6t9ytyA672y6bjV3f0iGxkpD3Qq0f/9h6o4=;
        b=XPFQzNq0Y1p22R6uEPjDqerHnHYtehWxV2E2EPBaWjkydt1tHFBOPnqNERa6NB7gn8
         Btdn/aI212f7rA2w6ZgZr/exRZm2GnH2Fm2FyAQrRnhNhoqxvzKhHKMtS5SghNllS9j8
         f8iB2DGmz1byxNvaMXpQc1zAhY6+kUL7m08l9DMQFwsmJWG/+LAFz7a5LWgF4EQm49r/
         FeRnEpD39FlhvSOLC0e6xHnMx2IWkJxOlvH5/TobI8zj5eOQ/d+vru2XmxU9Anrwei8z
         1rkAUZ4bueX+s5lbylcRoUsiCtP46XwdkJFx3nyGQviMsFnyj4fbGRQBzJLeYZjMtKHg
         L3Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUG2k1q9z6h/GB+pSjc15lPlZldY5zAW2BU52/N1CMVBQF9VtdgmursI3kXf9E4XNRVp/YgbBRbjt4n@vger.kernel.org, AJvYcCUQ/kkdlCYZ/Q35rCcTbGf/y27WaCfUnlk1ewd1vyBk3dLtPhWx9P5ApArtsbEt6Sz5FDUZnm00HFeyQjpz@vger.kernel.org
X-Gm-Message-State: AOJu0YzSw6EAHwWUz2bOl7ji/dG6mtcBv7j2cMH3MMsqLWnUL6jKC/IB
	6MqeJNMsOixPfegHm5sI9qPx73i3LyBk2fu7PqrjJ2mItwT8ieCZ
X-Gm-Gg: ASbGncu7YXuO5KzotJW6+vmIhfw0AL7QWB1qM2yet2dbl1g7Zy7IwqWHsr0Sy8qu38/
	37di3R0H4/fWlJvFmGldaPhWpld68pdL+2YN/I+BZ3pwbE16K4KdLZX9rbuUjGcxDcFII9I/VJR
	g6M3+0Si3f6hHdWwn9hQLlXIsINxqQc2ePJusRH3TI3oBa8R+EP5k54wA7+zDF8STaIBL0wGIYw
	3GJkQXQV2kEXZsL956BDGHNJpi2UsxQTafwukzRP/I7rgWXjLQHewgxvZz5TWjvfnm+eLy2E5RM
	FtACR9a5GFXUbb166Zo2WBplLNvJ6YCNCAxQCrc5oVypb6ZbLImECJTHacn5bJA+Yw==
X-Google-Smtp-Source: AGHT+IHRS/PweE+sCHAZYI/yhUAnmQnwu2gyEspPMa8B0HrAlqSGbvy/xe8cpTz4qnewXCnhJmcyYw==
X-Received: by 2002:a05:6402:3899:b0:5d0:e826:f0dc with SMTP id 4fb4d7f45d1cf-5dcdb71b995mr65267a12.12.1738694022505;
        Tue, 04 Feb 2025 10:33:42 -0800 (PST)
Received: from [192.168.50.244] (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724a9c76sm9951957a12.53.2025.02.04.10.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:33:42 -0800 (PST)
Message-ID: <d63009eb-654f-440b-8e59-441ed6b9606b@gmail.com>
Date: Tue, 4 Feb 2025 19:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
 <20250202-mindful-seahorse-of-action-ba6ee7@krzk-bin>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250202-mindful-seahorse-of-action-ba6ee7@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2.02.2025 14:27, Krzysztof Kozlowski wrote:
> On Fri, Jan 31, 2025 at 07:13:49PM +0100, Artur Weber wrote:
>> +$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM590xx Power Management IC
>> +
>> +maintainers:
>> +  - Artur Weber <aweber.kernel@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,bcm59056
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +    description: Container node for regulators.
>> +    $ref: ../regulator/brcm,bcm59056.yaml
> 
> Does this device have any other function? RTC? Charger? If not, maybe
> just put everything in one binding in regulator dir.
> 

Yes, the BCM590xx PMICs have multiple other functions: power-on key,
RTC, charger/fuel gauge and some USB/audio related controls. I am
planning to extend the driver to support all of these features in the
near future; when the time comes, the DT bindings will have to be
updated as well.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pmic: bcm59056@8 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 

I will fix this in the next version.

>> +            compatible = "brcm,bcm59056";
>> +            reg = <0x08>;
>> +            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            regulators {
>> +                rfldo_reg: rfldo {
>> +                    regulator-min-microvolt = <1200000>;
>> +                    regulator-max-microvolt = <3300000>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM59056 Power Management IC regulators
>> +
>> +description: |
>> +  This is a part of device tree bindings for the BCM590XX family of power
>> +  management ICs.
>> +
>> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
>> +  additional information and example.
>> +
>> +maintainers:
>> +  - Artur Weber <aweber.kernel@gmail.com>
>> +
>> +# The valid regulator node names for BCM59056 are:
>> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
>> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
>> +#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
>> +#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
>> +#   vbus
> 
> patternProperties should define this. No need to repeat schema in
> freeform text.

IMO a full list is a bit easier to read than the regexes (another
suggestion was to move the list to the description [1]), but I don't
mind dropping it. For the most part, it's a carryover from the TXT
binding.

Best regards
Artur

[1] https://lore.kernel.org/lkml/Z59BQB_cBgTDm4ie@standask-GA-A55M-S2HP/
