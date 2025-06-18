Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E022DF3D4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246944; cv=none; b=FQNtYjjrju/mYZW9mXxh/NMwizgiTm4VrKyUP66h3DpL83kU2GDiVMj5KGDhlzIRn+n+RszrkrUT+ljfMWcrknsmS8ijyGrkzSyVOPJ9HzKTRmRx0lqjxFtTL8lFJga9ZSANIg06sQN56yTo1N+nEVRlu03wrg/aBOvRZofHMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246944; c=relaxed/simple;
	bh=Bqx7nYXPk7+x8RpONNnSG7vtyH7Y7MIyIgUrVtpA5Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDsyP9El4koD3pE8HvcBwxnfNPniOgOluovgB4sjP4itorNFCMVRzULWTREs2gRt4OwGC3ud9N1pLXcIcbpz8j3q0xFQRF9NeBWbMM5id0nManmVps9m0kjCtyz8qU60CufGQwUqm4U1wxREOK2mNAWdzkC/lCaUImefv9WRoto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JgLjXdRv; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JgLjXdRv"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86d00726631so177583039f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750246939; x=1750851739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=JgLjXdRvX24KVUIZOipvw3RiFGWCroYgATTFQU+u9keWi+oCec16z5kIi4aG+wl19b
         Jm7LRBDdcMHDIB7/krJmjP7ePerbhyP1jUWOvryEc9iflfLUqmd44GRhkFuqxZiynYP9
         fwh9wXH6RZ9OfKljjsZDr/5jNLSW06u+qw7MmbxQBao0R1ZTBpedH93jHACKxuFhOE4X
         l2OI1/i1c9YBEOhgSBq+CBhmhzgLVgNhgLBA/37tignahxFK2S1oh3IyGZXBRgllg52+
         uGlSXWXSxOtYb5m/fptPFpcYbPK06WlFrOMJP+P8NMX2naOgY7YgUNHFShJqqrTYsCZ6
         UP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246939; x=1750851739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=p5T0+WH6aRlSO5QWjloDNAcZhPpduYA8+CPkBciqJbeJ8Xp1BBPkW9UWVtOrxexOys
         Lu2KHrDxrR60Nd429KQvyJIPkyLeFp2cYiU6AYMscT0ppMqifoOKBq7pZW+5CCBKPM1e
         zMqobhnOY23vXLe9sWWcdOZswD7c2ZaHBh0MhuBwqjS2FLBTWLx7LukZejCXruPf8CJG
         CEe9tShtaLFQTWe9DLWvAPp0IK4+dlWnqa046GlJQqJz2P49/PmUunpepJiMbX5XuZYc
         GemA3u9Lo3EisvLLxQ39wDO9af8rq2iZblHLGQlGqsGz4hUZ1mhnOiFR/PJqplVeFw1y
         DYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtEwxnGW8wj6guk/MHUiZjcI83WxxyEds0tWE9VWRDeVKvYzwsl+JyyemWP0U6MONAmvdWRQijjjJ8QI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTcQFdkNPdhPNwBCccZf24NJiLtp99NPuVoWIybdgFozCqBnp
	/4m2brc+DB+ERJYW2yuDrfun9GuHS3uw+2sj6R5FuFjuY7vEj/CH5yBIeD4+A+kYd4o=
X-Gm-Gg: ASbGnct+eEejXHYVGW9sh1lMKLjdIoJlzNgaYgxhiyAli7V4yfsN+uT6wzgre5WdO+M
	8KAGxDqOXrLCTJo2akPVlhH/tZ7Jfod/l2ndVTh3p67lCR+FfQSppizUjaelAmnbyfFYcp/yAG0
	7iyfCjCmuXh/NbEk+jN/obReYZ7s60hmhodML80MFJn1FjUr1jdj+sGaFfIiNCIceCFEWCAy1tj
	lVwsVIyyf63MKth9AHYPUmwExLzU98+sjdsYMDu+od+zFlX+iVDBFt3Sem6uMMd7l6foukLVPAl
	hrRUbu3fWXJB3iCGNfimngcE/Ajbg3ve7RbRjPOB5ReN/8bbkTKDGmkSPFZGrSPhaR/sPb00Eni
	iBHady3i2C7GfUbKzY/tg7lm46Q==
X-Google-Smtp-Source: AGHT+IGZEcu6gwBAOkwxavLZ+RywP72ic1e+8WKzjWeayufFiBzYjvq43wkZd9VQN5U2/4NY0wJZaQ==
X-Received: by 2002:a05:6e02:2493:b0:3dd:ebb5:6382 with SMTP id e9e14a558f8ab-3de07c40cf8mr191072635ab.4.1750246939145;
        Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149b9d9b0sm2675217173.38.2025.06.18.04.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:42:18 -0700 (PDT)
Message-ID: <5be51d5f-67cf-4e47-9bdd-e1e5956e184a@riscstar.com>
Date: Wed, 18 Jun 2025 06:42:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
 <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
 <20250618111935-GYA156140@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250618111935-GYA156140@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 6:19 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 21:44 Sat 14 Jun     , Alex Elder wrote:
>> On 6/12/25 8:11 PM, Alex Elder wrote:
>>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>>> device is an auxiliary device associated with a clock controller (CCU).
>>>
>>> This patch defines the reset controllers for the MPMU, APBC, and MPMU
>>> CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
>>> and ACPB2 CCUs, which only define resets.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> v11: Redefined combined reset definitions into individual ones
>>
>> After I sent this, I realized the clocks use a different
>> naming convention for two of the PCIe symbols.  I think
>> reset should follow the same convention.
>>
>> Yixun if you accept this series, would you mind updating
>> these?
>>
>>     RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
>>     RESET_PCIE0_MSTR -> RESET_PCIE_MASTER
>>
>> (And similar changes for PCIE1 and PCIE2.)
>>
> sure, done, check here (let me know if I did wrong)
>   https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17

Looks good to me.  Thank you.	-Alex

> 
>> Thank you.
>>
>> 					-Alex

