Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D30224240
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744059467; cv=none; b=kX09exg1HDLqbchRxzRJH/aH4lqBhl8+GMAlD/K9ZW0MuhzmlC1UsB0wuHmpvyxuHdZhV1kcSFrakVStkmsrVVk3QYvOQ5E5aMrbRRd7I/1Kffa5BscH+aJe0TKcRzehiPrSYkEuIrgXBEazj6k6v3DlkZBL0vreruoYIcJdYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744059467; c=relaxed/simple;
	bh=79PDk3ouoTDCbg9EC4eLer8PC7RI3PbFhi2CX7eUjt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyjAq68Bh8bPTtcnv5vVPNRdDqSnayrXrdionqt014pqx9acORptEQkUUCgZLwtHiwzUtpeLEFkqZDDo3wUpydq18c4QJtnqSw0E/uxTWnz9E0ugu2sJdJcV+WHY6TkKwY79p3HnrVGRUdFQZ1VZkdvIMbyAO3oJN2cB4czar9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JDhgumvW; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JDhgumvW"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bd78e695dso1388446a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744059465; x=1744664265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1P1bB50EoqnLQLyqYMszDdM6AI6/6Y+zrQz9fxoUI6k=;
        b=JDhgumvWeWhmg6TVNh1dfBEbL0jCaisNolTLMxvRav5LetDhTw1TnaFLXWZ+d/aQx3
         3NZmXeJtcaNTiSf40zD5F4bG0dLjd4gJN0gezxGL5Yu3xs7JRfZxZ/0peaLQ8zhTB32G
         4VgNNb12kl9meW0WTMgo4cmNUtt0/HElbwrAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744059465; x=1744664265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P1bB50EoqnLQLyqYMszDdM6AI6/6Y+zrQz9fxoUI6k=;
        b=pt5nbQEyOEgePFJ4/6XfjDPVA8zOpYs/aLu0DqpyYpjNTPIjXNDPBX7SjhRqoSp9cA
         QjF/E3umA+Eo58JrumgAZgTjHUdgVaG5eTjcFgcNSW+rJIifZq43wxyuni2vAGOEbcE1
         YlBVM5IEgIvgkyfRGHzopA4DGZLupIB3Ry/qr74cw3LE0UAmDJlslQTTkChnCul/6VyY
         hW2y5FDewbk6c89TwAPuwVs2ogwUWj0xDd9nz6KQZ4G63P/Nx4RC3TVHAfRAY7xVjCYy
         Xt7my+UxhhSjCK6Ww1+n1zr6aX0nRAMP6Oo2HB6SG9zNtUEwjs/jW8cc3cncF1oOCaSR
         9uIg==
X-Forwarded-Encrypted: i=1; AJvYcCVErvZCyM8+GoKTMsalcO3asWEzAZXIYp19BAWe+nyofLNKD2MjLl50AYgtUflkW/nGC8ZXjaPChfHUsZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKZVD9THKpcBFoPbeGMCsNSWQZ/Rc1gzftI4fLH9xWupk8eAg
	FBdSd10VdBAVnrBeXQjjwXF/Dm7pzqY5Sy6/aD4GGDr75edTJyjL+n4QyPgxMQ==
X-Gm-Gg: ASbGncsSO8uQLMLlD8Y1T522svqhZMSppwsaIXXElCEtrs3AIdy2Q1sYRKR4cErrSwh
	X0J7/LBOAY5sYKRbN+om6/GFVXvUeTjtZKjyHlAuIVBgDMowVa09lm7MBOKgS3aagfVxMqGkHGp
	j3EWnuYXXnw03huBcjfIt1Rdm/cnLWLdTrT0YS55WD5Te+s39ObWY0bcv+g9MoEWKyOYANhYfJJ
	/t5wfpdViS00zDYfIz6xYh/VNe3YiCiKER+YjP3w2NsbHupSFkodVRB4rdIWK4iy/QUZk2I9ZV5
	7vsbyWF9aX1s5XR4gAEsbxZwYRpfYIok7IrUDAMDwYCA9WqjFpQB+loaLLdUb0BHW26OUV99ew0
	MXemNSnq/hXAlSA==
X-Google-Smtp-Source: AGHT+IEgB2cpBsVgFxIZDN4uHbzal3DgE5qQcSbB5Pp7Ye6e6rk2ZIUvtGVUOARB/OFjKfpS9l0J5g==
X-Received: by 2002:a05:6830:4413:b0:72a:449e:2b6e with SMTP id 46e09a7af769-72e40d1f54dmr6733882a34.5.1744059464658;
        Mon, 07 Apr 2025 13:57:44 -0700 (PDT)
Received: from [10.69.70.230] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e652545c1sm92973a34.51.2025.04.07.13.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 13:57:44 -0700 (PDT)
Message-ID: <9088acd0-4650-4b10-88f9-6b6c0b1f9978@broadcom.com>
Date: Mon, 7 Apr 2025 13:57:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: Add support for bcm74110
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250404222058.396134-1-justin.chen@broadcom.com>
 <20250404222058.396134-2-justin.chen@broadcom.com>
 <b32aa644-6984-476b-abc0-a5416f551bba@kernel.org>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <b32aa644-6984-476b-abc0-a5416f551bba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/6/25 5:27 AM, Krzysztof Kozlowski wrote:
> On 05/04/2025 00:20, justin.chen@broadcom.com wrote:
>> +
>> +maintainers:
>> +  - Justin Chen <justin.chen@broadcom.com>
>> +  - Florian Fainelli <florian.fainelli@broadcom.com>
>> +
>> +description: Broadcom mailbox hardware first introduced with 74110
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - brcm,bcm74110-mbox
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
> 
> Third version of patchset, third entirely different code.
> 
> Decide finally what is the hardware and send binding matching it.
> Hardware did not change last one week three times.
> 
> Drop minItems or explain why this is flexible on the same SoC or between
> boards using same SoC. You can always point me to upstream DTS, which
> would solve many questions.
> 

We do not have an upstream DTS. We have a scripting engine that 
generates a DTS and we distribute DTBs to our customers. The example 
from v2 of my patch was copied from said generated DTS.

Apologies as I navigate through the different yaml keywords here. The HW
isn't changing, I am just struggling with representing the HW using the
different keywords. And the different implications of using said keywords.

Here is what I have for v4.
      items:
        - description: RX doorbell and watermark interrupts
        - description: TX doorbell and watermark interrupts
+    description:
+      RX interrupts are required to notify the host of pending messages. TX
+      interrupts are optional. The TX doorbell interrupt is not used by the
+      host, but watermark interrupts may be used to notify a host 
waiting on
+      a full out queue.

Thanks,
Justin

>> +    items:
>> +      - description: RX doorbell and watermark interrupts
>> +      - description: TX doorbell and watermark interrupts
>> +
> 
> 
> Best regards,
> Krzysztof

