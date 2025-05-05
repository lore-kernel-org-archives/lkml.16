Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57E2054E4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443826; cv=none; b=V2h2kEBRwS2AcJUwT6cTpdQxGsU8vBgYHLjBaTc+lJZM25Sb/CaWRr7DBBqWW4B6m+zsZHNdUNhPEMsQLoUwrI7ki4aWInX4q8vgxAtSKx+x349VMCGrTSDoQfGGYDYR0/n3tG3lJ9OR8b4HXdWW01uPondbUwJe37N7fu7hojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443826; c=relaxed/simple;
	bh=V8DkUL7VwKllhb1yUSVxhPaI03yBxle7Crwrri6QItc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WANx44bcNWx3oirm2U7RONyFf8DA+axkRQjMVzvN9Wc7haXQ3S6LjcwjKiwnDiSHEjge8XlxQNf4h53KtnmQFVAhcz1ZOzfSsAo/Ke87unlI7kYd+mvfS69c8ixCkIH4iqvOmeoWeRXef24JTj14k3c3VADYbUIfDsdvSyfBPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP3CnStn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP3CnStn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so36174355e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746443822; x=1747048622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=;
        b=NP3CnStn9ST1MXoLK7QiNjzjzmJkP85XVE+dHc7mAK8fde4pc2IUf3SKdPgl+fheC7
         /LPbKVqF9GN3f2S0RIUq8f9AXGbVza4ErSOIhVL57ycakTBwv8ExZG2zSXaygUtWDigA
         otEID9tUlcdmlCtvRPXOuW2GssXqzmfBBMGoMQpJqmc8VOgbSj2s6FabMQfG/NfA9n/X
         hNUYlrHriGU05a29UI6IFtBvpAtNJdgr7QWKi0mxv4CmgnFt3hZ7lvzdS4MIDzUqnCKf
         f8VCPG4vusvl2MFRSGlFKBlfJiJjtOCEmUPedYlKxSO0pTGVnH5Nqgf60EeZTJshHev/
         My1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443822; x=1747048622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=;
        b=oeEW3BtywkJo3oMvqF9guvoVIX5sEvpVigk9DCMPCaYYRk5bwOQFvVQmRkuxDsIpWs
         TXU9t9yokSO0SIh4YpcDeAocPCz0lMyVWYW149tvrJT9y8opKFUEh+gpL0dfjyNTBvtr
         lJwnXpi73dwCvfMiUmfiySupT58JrPdL1V48uMNoGVxhrQfzxg5dIbki/T2n1/LGf4ts
         +1JuCPXzG42VlUtS/wYzJmD9TBKq/WNiYeSPoWDtCHBuNeCdYTTivZRNEH3zBa3T0lPd
         6mUNNIpYv008QCmHTwZ7+yp/V8V2mNqprL0C6cQgH5SxYLDMuaq5cVYdbLfPYLnj4UEv
         NkLw==
X-Forwarded-Encrypted: i=1; AJvYcCXn5gwkkPsaTtN466t4DGL54+3P+K8KXdWiGUdfN8MIXIsIda5NtvlSNPW5+cLUgl91d2/Uxek+0RLmUKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwApAbeuIRB5VuN+scVAcTdybU3ByNuINLDtz+NtFdemEYhpuWa
	k4faZd+IaOJ11pNy34TB/ljGgKUyaxaEyaitKKSjAS/Zc23JUt/CnsDx85W3axw=
X-Gm-Gg: ASbGnctjJJugZRRyT1Qhup8JVsNFUtGf521HvsjOiOAYuJQ5GV/9Avz9w/FRyCj/PW8
	nNspSzALFrIaLTPMuyjMBSuIYMU3bnjGIKcr+Q2xZ9uWpeuWJYN0GMw5u7C8dX42lu7Hmxl2nc0
	CQ0n7yfZIHPrYaUzlAr6FjI46ROqBJMv1L0HY3zLIBthLnvTb0vsQRe8PtKVMfLSLnyk7VVGdmt
	RvNphFkcJbiieKl8er6Vk239R21bPt2aNux2UUvS60ItlEICXR8+qW5LuqegzhGp5Qy7QTcT7Zq
	7XgV0BKW9dg25Zgserm4IqJKZH3vZ6V7Bze8W3k+pk8XFyjmIss+6737H9mAvgE6sHpI6jgH/Pw
	=
X-Google-Smtp-Source: AGHT+IFXGyrq6AF4eSKBqMr0ZHG5ODbF+SMMKNV3Hl/UrsQRAKrSSv09aRoM2DkTJis6kpOovgBnAg==
X-Received: by 2002:a05:600c:83cd:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-441c48aa481mr62039405e9.6.1746443821195;
        Mon, 05 May 2025 04:17:01 -0700 (PDT)
Received: from [10.194.152.213] (71.86.95.79.rev.sfr.net. [79.95.86.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20c3fsm177760595e9.28.2025.05.05.04.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:17:00 -0700 (PDT)
Message-ID: <9b93c67c-b163-4026-be7a-a8761a0f21f0@linaro.org>
Date: Mon, 5 May 2025 13:16:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-6-cjd@cjdns.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250430133433.22222-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/25 15:34, Caleb James DeLisle wrote:
> Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

