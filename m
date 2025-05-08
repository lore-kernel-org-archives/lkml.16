Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B7F220F42
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734691; cv=none; b=D03uoSJJPbh9Lhc2DDLJFwbAbPHTj+cIDhrglhWfzdhsXMMllUxG/KQ48OLOMn7YU1r8Hm8RTcRExkh5HQqpPHsL4WXqEp+Yp9hBdMakGXnnnvpMWfRB0fMN/COoA64MptPZLkVhbCDyoBp9ybSh5fdsV0d+1Mt3N4oe9PrJ5UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734691; c=relaxed/simple;
	bh=clyZCS+y49UfoFWdDhvIwuMYnV42vxhXHsId2Em8rLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR7OpSrlPYuvm1Ee78RkqbxrhYHd1wQQZGxKk4Fk6sbKeQmE79awj0XHu+rADpK5kBPTdeb5QM/B7Z7v8gcNYO1Zuz47Q5wO/o0tLxNlyLwqgc/rP03ZXhl6V+m3HVd+h6XFiQYfeXnDYK7OviQV7Qn5iGvAEfZDZnDI2/AxB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=X5VzeinL; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="X5VzeinL"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d965c64d53so6675195ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734689; x=1747339489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BZjOLU7Mj7gmvFl5R7+Ucy0sGYtXH0NW6caQm2Jkt0=;
        b=X5VzeinLQMrK6IEP6HKIUXLJeXyc6N2+PBNbvxU3V8DsmIlLdlmkYzVCs9ERjPWKm6
         p8cQCPZaHbTCZAecDF29ctnE79Lt1uTs67Wtt9Z7QrlpkmjJhMLBnLgIMkRMMcXlQgdC
         CNDNPqBdea/955WOPTxRYqpv6TwcUwRSEtifSMaKrl1WometrVEDndlJA4zcc41kLPB2
         2cwp8z8OUKCSnFGgHE1yNxkLmIgQ0JCBwnxFBA65oyjul2/ewRitQVhbd2+FHGDgPUVU
         8SVYNLkDYIgBuPx490b3sO5zhAySU+EjF4TP35O6UUXh5i3DicWfjn03trzRVfvJy1kP
         7WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734689; x=1747339489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BZjOLU7Mj7gmvFl5R7+Ucy0sGYtXH0NW6caQm2Jkt0=;
        b=FROvK5tw5PjSljFxlpgnfsxYm499zRJYzbtqexgPHNaROMgs4Cbqv/ug4CJWhQB57D
         rvbr+RBHBe3TwkZ0SAl7p43Nzid7SjoxtsDnyBHmZls/KijCt5OMkExtRgVQRPI1EF22
         9XXw964Y0dLDh65832kV42kIVpLgvEviXgy2wLL0bLlskHP4bKH7wzMFwlEQ2pijqubK
         iRbHWRo4Gi5BGmxPPE5IJJXkiQiNkQCWaQKAsgWpj/Xo7fjMriEzZUYtQfxLnXdJ66GD
         kCaI++1NUe/2GtOEj0ngTSHbZyMSawGwpxo1Q+L2en6sXvosEgZsP8ObKXnBGakIz/Xe
         dMKg==
X-Forwarded-Encrypted: i=1; AJvYcCV0/4/KaBi0Orv7OA88lk3CEsb16/eLPENYQ81gXJfAgeSW0yHHdu0P6+lyu2V/gaS7aP0a+M2e1d7izpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNh3nNJbYixyZBSUezSh2q4A/BEC19l98B2qCZa7uPBLJKv/hS
	T/wrqors23k1Fa4aF2GEwXPHc4AJJx+7Zrq8Tqv5vQxThbALxT524Y+Zejutbus=
X-Gm-Gg: ASbGncs5kwXhwyWZ1eH8k8LFbzaLG5vaIdbmVCxhN/bJPmc6tQ/upw+WtTcn2nPuBNY
	T9+umbj3tfTgweIjlCymWfLrpoVIu/BVHCOc5j49OfesbrUvzfNk1gxGhKwwJiwZy0ENheEF/Bf
	ljACCXLTBqlLzhVgYNL8EZT+H8kyzt8oegV4EkjD8MQteRH3MHeaX/Uy9F8scZof0i2JJg2XTOz
	j29F3MsjFmjY+UAFrXqaFbV1mT97cX2pZvGsRQkt41xi3xsAf3YfPIzlVEcV6YRR0wy5urlrYEx
	zU4Zsq3kKA530hXNwn5rKdVs8EvOxAiBjyx2dis0Hh+FheyKc/53Hw51k+EiNqdkwfGiShwEaLV
	I/4NT
X-Google-Smtp-Source: AGHT+IFxdpedis8rLgUjioQVN/bR03F5zkFpjU6epV5YkxNIoc+m7l63P5vylXM+RdtkVFMExNl8uQ==
X-Received: by 2002:a05:6e02:1845:b0:3d9:34c8:54ce with SMTP id e9e14a558f8ab-3da7e2103c5mr13250945ab.18.1746734688787;
        Thu, 08 May 2025 13:04:48 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158bfcsm1192895ab.58.2025.05.08.13.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:04:48 -0700 (PDT)
Message-ID: <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
Date: Thu, 8 May 2025 15:04:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-4-elder@riscstar.com> <aBw3KNwjMeCIfnNR@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBw3KNwjMeCIfnNR@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 11:46 PM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:34PM -0500, Alex Elder wrote:
>> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
>> non-null, the CCU implements a reset controller, and the name will be
>> used as the name for the auxiliary device that implements it.
>>
>> Define a new type to hold an auxiliary device as well as the regmap
>> pointer that will be needed by CCU reset controllers.  Set up code to
>> initialize and add an auxiliary device for any CCU that implements reset
>> functionality.
>>
>> Make it optional for a CCU to implement a clock controller.  This
>> doesn't apply to any of the existing CCUs but will for some new ones
>> that will be added soon.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
>>   include/soc/spacemit/ccu_k1.h | 12 +++++
>>   2 files changed, 89 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 9545cfe60b92b..6b1845e899e5f 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
>> +static void spacemit_cadev_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +	kfree(to_spacemit_ccu_adev(adev));
>> +}
> 
> spacemit_ccu_adev structures are allocated with devm_kzalloc() in
> spacemit_ccu_reset_register(), which means its lifetime is bound to the
> driver and it'll be automatically released after driver removal; won't
> there be a possibility of double-free? I think the release callback
> could be simply dropped.

You are correct.  And unfortunately I didn't include the fix
for this in the patches I just posted, because somehow this
message was not included with the group in my mail program.

I'm going to send v8 after I fix this and verify it again.

					-Alex


> ...
> 
>> +static int spacemit_ccu_reset_register(struct device *dev,
>> +				       struct regmap *regmap,
>> +				       const char *reset_name)
>> +{
>> +	struct spacemit_ccu_adev *cadev;
>> +	struct auxiliary_device *adev;
>> +	static u32 next_id;
>> +	int ret;
>> +
>> +	/* Nothing to do if the CCU does not implement a reset controller */
>> +	if (!reset_name)
>> +		return 0;
>> +
>> +	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
> 
> Here spacemit_ccu_adev is allocated.
> 
>> +	if (!cadev)
>> +		return -ENOMEM;
>> +	cadev->regmap = regmap;
>> +
>> +	adev = &cadev->adev;
>> +	adev->name = reset_name;
>> +	adev->dev.parent = dev;
>> +	adev->dev.release = spacemit_cadev_release;
>> +	adev->dev.of_node = dev->of_node;
>> +	adev->id = next_id++;
>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = auxiliary_device_add(adev);
>> +	if (ret) {
>> +		auxiliary_device_uninit(adev);
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
>> +}
>> +
> 
> Best regards,
> Haylen Chu

