Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A1129A9C9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072993; cv=none; b=cZ+LPnT18Qdc7rjaWRJ/a3WUnVbiUBTSq95InHCzkd/k+qdamh8t0gR3M1MknbhO+S87QCjUMs8Fx4nZNdT1qYUQwYR48VfnCadRS4yRUFZJdVbtlrt7sTOrofgu9/RxvhPRHVS0Mbu2Rr8iV6VGmqVGVN+b/dqJVgM2z77eUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072993; c=relaxed/simple;
	bh=TBUqiwzRtaQezUHBGrBX7U4S1bkx0b7ClUZFpNH8YFI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=T0YGeyrtKw6bY2bc/+hMZTXK2PAjyV411QW9cy8JxxovsSz6ooog8tHjOJ2PvGIzJBX3z/kc+ZSIc4LZwjyQ1AriOhhbaFyNmeS0WIsufyOdvF9XDR5cFHN5nzc5xoRmQUbqa8sYqLf/rqHC7aMkz0F+FcF5qukYFyIuscsii3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JKHhXktw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKHhXktw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e62619afso358738f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072990; x=1750677790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2lfnLj0M65lIIz8l2ArV9cQwaq0ywx1I5Ll3Uz7hkVE=;
        b=JKHhXktwyBboDLFR46y33xripsg71o8eLb9YM0+sn+LZ8doyKbJzRlc5/sbogqR5Xs
         RQNPrg7SNlbn1140Qn49C+qgi8IG6DzeN4Qm118vb4UNM2Ij6PftXfbDo1wyV6X8Sdxf
         nAQdQhdpN9mwedM2yCQG27A2jqHm4hqu41xlHp2TblyMbqUc7x34CVNyVL3kIt03vsgf
         0oCvEu7AnVSXSofH7FWgfRWTxeqmwFaiWraGJ91iWYx2prx4bLTCNt4sE/2S5Jx0OAki
         AMyqp2aXbDlCd8GnMh4KphP+Y51ohwofLrMYuWh6jaVHgZt9qjpxZ/GV8Ts0JUPeiF4P
         ddgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072990; x=1750677790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lfnLj0M65lIIz8l2ArV9cQwaq0ywx1I5Ll3Uz7hkVE=;
        b=mvji9jZhkW2JszSgJINQaAUBaOXfoszLPUbJqVWSwG8P2RmyI9kT/38VczFf7NSpCf
         GpIga7DAUPq6RPEJ1ZnHdjAlhlIvK7LlHHgCpUDXVJP8HuMCD+/G0NQg8LmKTj7yNmYw
         Mq+j0szZYzufQyHoUOHUsidxBMybVyGjYzNALFgzV7oFyXa92TvjgOzS03kkwly08XXn
         U0gdWYZiWkxD78sAqCphoMV4EP5zh7739E51nntJbu128OHLNRzLsmgIfKrZlGM+9gZv
         lB0X4NS8KCnL/UMZ9afhyjjD1XjpuuRngEGYF8ZrtZIlH/FOEs9Kq70nJUiQSTAGZR4Q
         GWAg==
X-Forwarded-Encrypted: i=1; AJvYcCWo1QSU+Ix9g/hay6FDkHD/zahWC8tZeUSAX/vDROYn+Oknwh6jaqhitnuCwGD3B2U8JY60WMWsFVUct7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJssVkrBFWkojjro1GtC+1pqJ9bjNOOPsSgqUC1yJPO8aNUz2h
	C9Dk+C8q2l75z8bm4IvTgbyP5sQXGT+aJAlE8Gq2U8L9/x1NowegET00zDoxOH3HJCY=
X-Gm-Gg: ASbGncsAQQZePZ7cgA6eGDk80nAGluf9d2D3tbLtThx3lT2XwMCO/RP3/DaPWZT12Yy
	2r4DJs2jXFGlhyYpES/DF9FYbr7UESXjoQn8aVFVsmbceZHVgKgyJAn7bhQU1uvpIbFjTcO7T7h
	bneEilwzD9w2V+o3kwVX9APlnyV+g9UiUcWKnOJDO8rPlKwgOPb15l6PPWC3BOmGwuBlbNVs/hf
	szgzuQTDr1ljpJrMyKr43Iy28gOszYiXpg+Vrcz2U4HR2SRPQJ4MnHWuAYGACadGARlqkh83B3t
	xiMj97ioQy5o7suURFrqBdOklqJwU48THixGpMATX7DSXgy91ieyfEl55yRgGebyZ4aNQj2SiSH
	rFQ0ahOY=
X-Google-Smtp-Source: AGHT+IG5vtOhFMtmACAMxc1csTvRVmwkDe3M0Ca3uK/TQLNKVNimgzJ9jqEqjXWfsZ5zQ2okWkbh4Q==
X-Received: by 2002:a05:6000:4313:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a57189709emr2830597f8f.0.1750072990395;
        Mon, 16 Jun 2025 04:23:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe85260sm143710155e9.0.2025.06.16.04.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:23:09 -0700 (PDT)
Message-ID: <6232e835-921d-4855-8b10-8f873a4e3c30@linaro.org>
Date: Mon, 16 Jun 2025 13:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Vinod Koul <vkoul@kernel.org>
References: <20250616103252.32642-1-johan+linaro@kernel.org>
 <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 13:20, Krzysztof Kozlowski wrote:
> On 16/06/2025 12:32, Johan Hovold wrote:
>> The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
>> its Kconfig symbol but the defconfig was never updated (which breaks USB
>> on a number of Qualcomm platforms).
>>
>> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Thanks. This was sent on the lists some time ago and since a week is
> already in pending-fixes. Should be in coming RC as well.

Uh, now I noticed that due some other work I put it on different fixes
branch and that fixes branch was not feeding pending-fixes. That's my
bad, I need to fix my workflow.

It was in linux-next, though.

Best regards,
Krzysztof
