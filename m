Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AB6FB9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112683; cv=none; b=Fg60DlX4xoMlrIxAf7T/wJjFEerWNaUtjPf/+il8RzF9dmqbRxAztsU+0cXDeXJDGbhE7YRTkWcFX1SAv9brluhMQEm8tYE7DLO0i4GBtZxQFkd8T6ZGBweTqJdSesZbochNhn5MyWIlNDai8jRdXQkPgXAJR1I4kUdFgXhv73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112683; c=relaxed/simple;
	bh=VSloGnvEP1Jj2MuoOWA2INAN4bSYkv1/KfAfqFQ82n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRXwVKy1sFgdc/uxhFPEwc1J5d1KS7Joi3K4HXroRJA5GI/Gcce35p9iY8vS+3meFoLFxt01ilOjsW0Uf6dyDbEublhhleVwMlBPhPYjpdEEbUYmkjI1IQYAEx48tIbkCdyAEDPGlOTyiFlAPMdp4EQP4joQ8Cl+oKT1BfQxMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tg+kme/5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tg+kme/5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1667065e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112680; x=1746717480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VdBrsqS/fwD2KLdGvn2Jg7y5QHfaBXccaXFc1HnlML0=;
        b=tg+kme/5EDnOrF+8CGvvc3MYRfvmYkuSvN+82SZR30cpx3RZRWL2NDlLrVHz7m43Aw
         +RyjKVjMLtJNmYnmnFINeqbsfIcKDiRdsxkuHlCIJi+ZFgKwzIfQlaJrSMcvdNhSc5ef
         plFb5y+iaC3ozRK21DPR6M53SxiTA4JcSRvZtFVNCOaNrP3aI1RtjZWl1PKSCryoB57s
         OLAGarHbYzg0fsoF0NdADyFtwEi1j05j/BLuGTlH5ojf9u7ThxN7nSki6PNqGjzt6Tl3
         fZE/yx2JWzeQFkOXhcRvjyRbRCPBDa9jESGQU2TnujqpaKhMn7jtb4SMKKpr8tT7SGkF
         cRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112680; x=1746717480;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdBrsqS/fwD2KLdGvn2Jg7y5QHfaBXccaXFc1HnlML0=;
        b=w5Dbm6Oc6QDQKOJQcRogbgxU7a684XE4CCo3EZEx3Y8B06X5HFl8+cCRjDD0/XYqvC
         md7RuG+z5jNPh85H+JfZVYc43O/oDx72P64ADnIZmjKKyd4RcR1d+2LBDnbaVD+ulIRJ
         i7OCAmWwXtj5ZvejJIKXkix1ZjWQ5heVxUSTA8oOglw1WFqCWXHLdVuZbR6l8PmsEvsS
         X4JN+2Qu7I4g60kVYFCnM9mDGAWTEcKeg9pehs8vjbWd1G5JdgkGCIMH1zAFLLEO1bRy
         RL25A4OFWMD9K2v3bVfWkLySQanNn5K11K84/OCzIW8YshHCD92Ek1BafU+RgWdKRSW5
         C3FA==
X-Forwarded-Encrypted: i=1; AJvYcCVnqjXLPDw6s4GCHUpMSlDwinCJWJupl1KpNtN9kDIskZJnpFf6QtST8s6x1cogixHkyp7yP8HJk4sRXO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6BZKhjd88OkmqOhYf9rckLDj8dL/UHQlBxryPW2Q5AoBQXdZQ
	DSCWNyTxTREltcUWbgSUuJLiRl/oKKJgIK8YU5LZ70Gs1CAYETw0AoOKFWrmwGE=
X-Gm-Gg: ASbGnctRFXxT6jgD6BQD7A4XH+ukioHmOGi2QrojS5ojY4AMJmZGvMRXTZy96XZs4e8
	jUM1F7SFHCheYrSEQ4p02cUSShYzix4DRlVUXYchEDjpLpmNserh7XAKEJwZ2NaiMG9aPtiC3yh
	VOG6hUD9Tc/jte0GwsZJnhy/8kbHT8UvQrD7RD05HR1UmBdpWtwRBJOvbCCo6dB5XAikwXmsQBg
	mVR+mGvHGbNg8TETfjgGlJQhqE19UAN5QmnsLwHGQqe1Gp/J8fugbfxsA42y40nW7Z3X1IMRMSQ
	hxLa4+VOJQAf5VMWFGgdR6ib+PTxJcLINhVrqDCbnrKLhqNeprLY6QP2hpU=
X-Google-Smtp-Source: AGHT+IEGD1y+dDytTkY+YX3J0HazAZYWvZgw3WibrAllavDm/1aaVv3iyWoCloUSi5jre9DaHUOdmg==
X-Received: by 2002:a05:600c:c13:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-441b2dfb921mr24207305e9.8.1746112679841;
        Thu, 01 May 2025 08:17:59 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ad81c19fsm65470055e9.0.2025.05.01.08.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:17:59 -0700 (PDT)
Message-ID: <e368c522-33f2-4651-9f21-e00a37201553@linaro.org>
Date: Thu, 1 May 2025 17:17:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] mfd: max8925: Fix wakeup source leaks on device
 unbind
To: Lee Jones <lee@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
 <20250406-mfd-device-wakekup-leak-v1-6-318e14bdba0a@linaro.org>
 <20250415154820.GX372032@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250415154820.GX372032@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2025 17:48, Lee Jones wrote:
> On Sun, 06 Apr 2025, Krzysztof Kozlowski wrote:
> 
>> Device can be unbound, so driver must also release memory for the wakeup
>> source.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/mfd/max8925-i2c.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
>> index 556aea7ec0a0473edc9291cae0c82fe9b4ecb346..ab19ff0c786732be53e58a0162d2658650d88f47 100644
>> --- a/drivers/mfd/max8925-i2c.c
>> +++ b/drivers/mfd/max8925-i2c.c
>> @@ -201,6 +201,7 @@ static void max8925_remove(struct i2c_client *client)
>>  	struct max8925_chip *chip = i2c_get_clientdata(client);
>>  
>>  	max8925_device_exit(chip);
>> +	device_init_wakeup(&client->dev, false);
> 
> Why not devm_* instead?


Hi Lee,

I am sorry I reply so late - I totally missed your comment/email.

I am not using devm intentionally, because there is cleanup path and
devm() would change the order of things are released.

The rule of thumb is: use devm or manual, don't mix, otherwise you ask
for trouble in weird cases.

Same for the other comment.

Best regards,
Krzysztof
