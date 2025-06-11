Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F712253F3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622791; cv=none; b=X6KVs9SkO4sDtdQQ4kh5N8QUjcboVXkaSQvkzqHIMbnx+7tc+DojQSAY4l1vRDakcCDeqbIWGmIrkpBr8LcXiwTvvm2l434Tq0wMSGxwv3P/N2YPHm6YX3NJLZYgdiGU8UagWcxeCrT8eKiaCugB47HA6CtXpqy61z5sdRKCHTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622791; c=relaxed/simple;
	bh=f+TZIH+OvuMcmsC9YDjDFhI7vhNxroBRVOfK1cNy8Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXA70A5OW1lsb75j3iFQI284ahQqWht93oyS7QL+bwjwMRccS0Knb/EsxzHSzU0h8HTjpvf5BQkdN5WZpHPdL5Z0UaR7+iVdfzhbLOwY1zhbj0WukymDaVccqmH4htfbyGHWwwZNHsyGIPSl10hM+y665cPWUz3zqod1EL/oqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifg4eYR7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifg4eYR7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso418055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622788; x=1750227588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QoR2E6cvbA9nuFXqrIB4RinQ3TDFQBQ7cYzlTTfpPNE=;
        b=ifg4eYR7F9R9pnAMXLV7j10H8aDhgCt+PAbb+yfzSAINEaWAcW9jlnIbRIuRghGylN
         SPEAETV5hLdQI38H7APDNgfXKrHKtrMU8FntztRORdjyFZWRGwLLbFk6mNgS43fBIvPo
         IxLWHDf8nVqY6cIwJ4sxdRfCE20ZZL3b8++92sgYPqge1+mFiQbdKScpMXu/SUjTaFF3
         VXQWGyapJQB5ygsnJvv3OzZmcCBZzyndc9OqIAn0HP4saSG8Ms1pd9WeSRz3UNbW/JzW
         ldXqHM/R9xVpRwDftXMFsuejTRlE3d5lzm4tyzo22ZryXZ8SsljLU/6fp55hWEPqAmov
         IkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622788; x=1750227588;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoR2E6cvbA9nuFXqrIB4RinQ3TDFQBQ7cYzlTTfpPNE=;
        b=uyO0zCz/wsDdj1p7bviweGdyU/TRM5WKNPausf+P1K4b+HK253QFaJU3//QCZ1hV9z
         TMe1MIyp8sA+SUGfy5vNc/hY2IPkRj5cGHuyFN0tnminxY664QoHK6HcWlq2HIYIRZCk
         1ftXOaUgOKe3O3tvze9tWuckLLwMkgy3N+bVxvCPHxXd2nSWAmNFBIOPyjaurqTnppNZ
         +HZwyjPuOyj64N6FJ7ZVfJGPXw9ofky1Njs3NmmXlWb5DIKdMn1o//C9UYwglzAq927M
         KCWbrOq9BDTvcLxU5TU2GDio+6RhJqSQylKCE8LofhLi66b+OqRxoJW2N2r6Qh/+lczy
         AmVg==
X-Forwarded-Encrypted: i=1; AJvYcCWUFOEXgVdAOKST5IHX2NSipQtcOqN8blmWxLJ6iBLzNoc1Fi/kfScmloBciR/i5MxJrdoS822mfZC9NG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylyJC224KrrXYnlPtmfOk3MPJcZjrJGDxtV5jqqYUozREh+sMg
	ZfAPArV3rzgz324cuFY0koyyXiQUZdKalxbNbN8S+rr53CgviiGaDokmtlnHHCdVUeflphcQLUK
	93eAO
X-Gm-Gg: ASbGncsUd8+OtgrLwTSYplGmd79wU0c9CadaJPcGKbYD1DVB4ykVQCt4VKHHqnz2cTv
	GHGAIHEOM4O68aUjsl2GcYpR9uT0Tg+nsj/Zbxlu/Z3CRS6q/5gc7FJ1YnvTDhI7OWdLiRdKCT9
	lDkuWeEBXV3MOGmfpaoHK3tYcgbT7hy3ldAT6Sys92SF51ksEamMJUr9aMKPUsI5oRq7DwI5xQn
	9dqdt+VO4T/pYYt1r7zM9JrZfyJI2+QBCSthKJhfwq2O3pMWctxoAh+O6h4hBtUGXjWOUIDkm1C
	kCjeypeq+JrjXLQR00Pwemv1zOtwKxrUAPunk6JCm6ggr2mofK79mLu3q1SPt9rKxROMcgITNMG
	nInfKgus=
X-Google-Smtp-Source: AGHT+IEwhURta/9QKf3wYw9WrsFgWhhcnAZSph77CJoa4So6G1cKaBJC3KnRcF7Zgczj7b+2JzUvZA==
X-Received: by 2002:a05:6000:2409:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3a558803fa1mr560986f8f.11.1749622787736;
        Tue, 10 Jun 2025 23:19:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm14660068f8f.63.2025.06.10.23.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 23:19:47 -0700 (PDT)
Message-ID: <f193825b-f6d8-4c27-b1f5-286af7affee1@linaro.org>
Date: Wed, 11 Jun 2025 08:19:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: trivial: Add tps53685 support
To: Chiang Brian <chiang.brian@inventec.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <99f846c6-4041-4d68-b2f7-c686aa8c2bca@linaro.org>
 <20250610104146.250692-1-chiang.brian@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250610104146.250692-1-chiang.brian@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2025 12:41, Chiang Brian wrote:
>> On 10/06/2025 12:41, Krzysztof Kozlowski wrote:
>>
>> On 10/06/2025 12:25, Chiang Brian wrote:
>>> Add device type support for tps53685
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
>>> ---
>>> v8 -> v9:
>>> - No code changed, correct the order of Acked-by tag
>>> - Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/
>> Stop sending this to me 6 or more times. Every version you send multiple
>> times, that's way too much.
> 
> But how do I avoid sending to you even though I need to send this patch 
> series?
> I apologize for the spamming due to familiar with the workflow.

You sent three times previous version to me ONLY, for testing or
whatever other process. Now you did the same.

How to avoid it? Well, you type things into the keyboard, so type things
which will do not perform above action. E.g. when executing git
send-email it shows you recipients and then ABORT and correct the git
send-email cc-list so it won't add CC based on tags (see manual).

Best regards,
Krzysztof
