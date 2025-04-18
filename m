Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316EB1DA21;
	Fri, 18 Apr 2025 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744952075; cv=none; b=qqrmVfM1w7hFDqsvIrXcmNb8ILtnzmr45vq4iCQqepT05PVKa6/VhgiPrUH5Sy3Q+wFDt/YWZ023gvSe0Sn2tQKbDQd6TW0HIgKOEeEt4y3t0vjjeI2WSRTyK6TP1641FnfOivdf+hAFO3fkgvDLgvZh2lg1wg6RiIeNzuCarR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744952075; c=relaxed/simple;
	bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5124bC2ZDAKSDofOyG0ONoyUmIZUpbw8tOOi5p3q5W1n/s8dq1Rx7rfhSQfifasYqHouXtzkb5xf+a0Lg+/1wM/5XY3sdzA1oyORShLPBTVD5457FIs9pEcp6cqFGEIHnKI+mmWqdB2nI8D7UR519E0Q2uAc4imkJyPrGgLmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2KEmUav; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2KEmUav"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22928d629faso17513815ad.3;
        Thu, 17 Apr 2025 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744952073; x=1745556873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
        b=W2KEmUavZk5qHQm0PtN3lRE1Gj1QX888C80FwC3lcK7cJqkIPSSJW+xCjBs8Yh5O9N
         TqsRYJQ52nInTmzWgzcGUXqhfa1Pe/F2ne4fKcRJlODkmwFayZ5H/YHVOLzclsDcM7+f
         6tZ/Ga1CwH709TcClhrS6DFCMjRJzKDA5Epa+gb2tX/SiKBdUPuAU6+Q5XWscCwSXhfQ
         PNglDs9cGo8uCtaTP2muBh3x3BjO1MmBOkcYRgphODUn7+5/Bx3lUzM7mqptLNS0ujZ1
         bt4A+lKBkI2vpe49DUB8RTEmNlYfuX81Sog74tGMXRmlIx8bNoB/cUOX0Z1D6iR2OyRb
         luKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744952073; x=1745556873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
        b=P9aeIBmGaUhXCpB6ZlB9EW3MBfSIN4JRbGg0OWi6DFhA8GXwQP5QIGpLQeF1xT7MCJ
         7Y7YBnT3Osd02JGjW7pyYFqqW6mX/Xp4h7u/u/bFnf77epe2552iHc6H1A6Df7NTrkmM
         M0PmvG1Bup7mUTh+hcSU3J60InnF99NkLJy7a3s9XE1lZvnFvWDuzu1tMN8sNpkpEifr
         PnheUGc3q/F2N3uZkQkGVXsrhOjD92OhQHiT5bhLTH5RCGyRQ1bnT9Rt7aZDBJozG+5I
         RyL7XgsasqUkFHB7Y3YWyA0bdAEjF/lbNY4z97nyXcuiwIqo12cxH/s65twbOkWFdQ7K
         8Xlw==
X-Forwarded-Encrypted: i=1; AJvYcCUT9+KS2Bcps+4Sp/cxb1fMAGgNpD6qeJwVCkQVwyl6XytVDeYEKfu85B9FF56bzw3OEYrgEZW6UWIJ@vger.kernel.org, AJvYcCWagN/6H6qwBgjoBbYl7HsCSB4UJByG9dL7TUu2U4/j4aOqDnIpuUTiarjyYuc4oY+LnZta1nCPstkNtNeL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkd1kkEochrzPq/fhIPZzOrEojR7MLiR37R7GV6Yn+3uCqd9gT
	pa6VdNw7Nvb63fcMi3+CzM9aoRAkhz31bS6efdxICL5cDrJ2u4pl
X-Gm-Gg: ASbGncs9yDxiRV/XK7BseHYs/vr7J26kJVCmlH5Koz+hTwHPcPhcT1wZoRElOuoqS2H
	HPlwqweDD0p5FBfqOlpSkeEqCsWp5uIMWRT+HZfUMs9gKV6pWj901DKMiQ4HF8+5Qp3vc05TmZG
	cVAc5A0c8t9/srwHr8cnCrbA1aq3iQlTpDtIcC+ZXE4iMmMHgzsYQiApVsN9TXWwyg4hB1o1l8L
	shotE9JkETpKHXLCVex2jPwfzTDcKtj4TantddX1Ph+VReefKGO4TQCOelZsriT9ZZ2UFRgcxsQ
	gX9iYJaCD+PlWENgFnNLO7C+kAUzouOsHXEZLBENpG4vge/PFMcKJwGYHA7MerhnXGvcMg==
X-Google-Smtp-Source: AGHT+IGV/fWbJMmWtA4WBhTr5NRFS7XNEqC6SndfF5cUfWSxSGh8GbNlHBkKJARuTfoFoRcRWxs5jw==
X-Received: by 2002:a17:902:f708:b0:224:ab0:9b00 with SMTP id d9443c01a7336-22c535ac5d7mr21475505ad.27.1744952073304;
        Thu, 17 Apr 2025 21:54:33 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf1424sm9178635ad.53.2025.04.17.21.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 21:54:32 -0700 (PDT)
Message-ID: <06b513ac-1734-452c-a967-de3c178ce80c@gmail.com>
Date: Fri, 18 Apr 2025 12:54:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add PMU NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/4/18 凌晨4:14 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> Add device tree entries for NVMEM cells present on the PMU
The commit message should say PMIC instead of PMU.
With that in mind,
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
[...]

Nick Chan
