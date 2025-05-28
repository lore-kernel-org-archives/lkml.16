Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B96A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431350; cv=none; b=qEMso0FHg5rMyipAQmTdxcX6+bASYtRv614bNcWNnq3iE7BkLFt/+8WoIKEA9ucVnhncPLvGZWXKTLznrh7/yZVPmzT/UClxHm08s9VT3TyrqHQZR3oyZjFjEwv1vaHG5Oek8xc/pZbAjP/jUhCUgosVcZc4v9LsSO4usNDKgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431350; c=relaxed/simple;
	bh=10PVymAmcGCTR/6W21iG1eqNwdFqvazhU8h4mfFwtLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPcqnZHhaVOcWvQ7tKDsMDysLKprXWfuKkv9/6j0ykLtFxc9wgLCfgT2aYs3+eqeUZGBSSxVUMHNwGexS3DNRvCy8YRSfzwoMUaOvhbY8F5TDTsXjrFSd+1KPozlNVvZam4H/keEu3FZOoQ4EoNDhDQEVL6g1RQL6Jn6mOpkoD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQVoAbyh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQVoAbyh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so69359f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748431347; x=1749036147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tRdSg+ES8rqgc/LyI/xNmB9YhTxqTSjvA2Sa1o6EE/k=;
        b=zQVoAbyhV3Ypd5KuJWvKh2KkoFsp+gi0YEL4rV0h/9Y8E8jk9AGxMHcug/sB+Sh7Ye
         XhuqMJhyKHbgyAl5hmPv7ucVOlTUaGuS5UBnTYeOqd1hflFt5V/DKTAKm8IC/1HHuJyL
         8st1S/8rjEKOMJJRoDQLAR5cqC0j7cmW+FbYdqdQeB2lN+XIJeROUQ7HftOm6r0L1NLp
         c5h8D+njsxXpZJej5mmc9oYvzwiHhudT8EkCvvR38Vbqm+o7GdmY4kfUPWRQNkN7yPIS
         l3ItuyeLHnH061rJzzdVIyY8j/7T/kLenRIMQqg9ersbt59/EhM8RsMS/ToyD3mgDpsX
         iZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431347; x=1749036147;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRdSg+ES8rqgc/LyI/xNmB9YhTxqTSjvA2Sa1o6EE/k=;
        b=IK1J9Tw6wHH8Whee19gjdXSqD49NXJU+aqN4VbmMx0wkZbMdPxo13szSwhgN91fvZQ
         1uff36f8u/dSVUDW58k6RBk+8hEXVVS4I0wfZc5uZj/dY1y4wPLdVfzA4JaaOQBKc3Tq
         YQS1Krx5ye2pw06NzoE/UpXpSF6S+BvG9awpsZ0YK4qKGsPdgyiO/o7OuHaItX9HaMMV
         Z4OJIIEhxb/zwyF4ji2LxoNJqwTjN57NptLpZuI1FZAlnwa1JTIvB9woSR/wQFzJgEL4
         y6ZFhhuvqPhJ5j1HCrP2nChx21C99bI7/+RnmRjBXQfL/IDNQU7JkRjp8vd75MAXQqVw
         LKbw==
X-Forwarded-Encrypted: i=1; AJvYcCXIUU5h7cpeoE2IIsYalFWWDaou/xaxKZ9Mu+0knJpBbrY8FsjO1psmqhX+Kz3HS/zjZ2FQvZorusjRXys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpqxDwe9/zKdngi/WUiDEdoIQqHh1DGOQIRPUpKVzJoGF7I0+
	1d3zCPAyYhYRsNhBjbhs1cQDf4f7Gei5UDBd9fLAlNTpF5DdF1kwSP0BTS5qaWWO2SU=
X-Gm-Gg: ASbGnctUSl8TLyBKIzUQO2rSKgg9nU+8kltse4dk8qwcIK6VPHNz/a1N76jKaYpP2D3
	Hw+vhQhTzpMUucMJfjdEDEKMrPpNVjWfsD7//GwGGEZpAEr27SUMe4RT6O26eNKpJXEtqVlSkSS
	6uh6V1JPJtnLVIHWEUgDmbD4dmgwvHzGZwGWILA0w7QQPlAhJQXu+L9+OoZWVFK0hYba7rKQfiD
	4IwFMvN8Sen3D/ql3ms7nsxugldQPeKkr9edDqW8RMhq1M6b5zXprtLInCcS0z6YZbiVALaSelt
	JpYETFq6WhAFuK89YkmiJNpGzY/pqPjshsuJ/a7R1nBcfMs5UCXK73MXWYXl+oN4bEwB1C4=
X-Google-Smtp-Source: AGHT+IF10Djn/+417XqgzjwYR53SwB6YsQXDnUYQvUgzphkE8hm7GNKdlPw/JrJhOZ3z/6T2T6Nnmg==
X-Received: by 2002:a05:600c:1d0d:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-44c934e5f3cmr49189875e9.1.1748431347165;
        Wed, 28 May 2025 04:22:27 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4509a0452f4sm13604245e9.28.2025.05.28.04.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:22:26 -0700 (PDT)
Message-ID: <71db5dad-de6f-4573-b764-cba5c28e271d@linaro.org>
Date: Wed, 28 May 2025 13:22:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] arm64: defconfig: Enable BST SoC
To: Albert Yang <yangzh0906@thundersoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <lumag@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Taniya Das <quic_tdas@quicinc.com>, Eric Biggers <ebiggers@google.com>,
 Ross Burton <ross.burton@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ge Gordon <gordon.ge@bst.ai>
References: <20250528085459.481424-1-yangzh0906@thundersoft.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250528085459.481424-1-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 10:54, Albert Yang wrote:
> Enable BST C1200 SoC support at ARM64 defconfig
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
Squash with previous.

Best regards,
Krzysztof
