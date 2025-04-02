Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8391DDE9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606737; cv=none; b=fu4nykRD4lCeZwmAbKKMPWsg9jHNww89wcWuJJ/F6K+2XX0Y2CJd2QKUz8iY70jBiqjvCijX0GJKYmiBgyBejcHLZZObFeTJ4zC4XNRopcVyge345uv0kccqYG8vZlbOHZWfczh0AzbZeCDoVBxhEX2oizLysemb5lwxoKVZPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606737; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFCRW1QVUkDB2/QBJIlYXoeOfgfB6FG/7LmlOZgHZoXYMnca/brm4FY0aeQb9yTPJD8LkEjcVOEeYOoGn4c4s86AF8aD3UfTDRE22C1WuyBMtBX09N11LnK96O8f9Zo2WnB8ly0qbYIgsqTgWCxJKue+BUKvnDbpxH+9C1BkkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTdX36xH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTdX36xH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso58747075e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606734; x=1744211534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=TTdX36xH8hrJp5ifkBsW1iHlWCpLJDn+0b/ysZ7xiE2b5L6zJc1UwAfVAth5RPNFeK
         cLUsZ5SUXdwcFqkjMDjcGeSw4OA6ZPbSLac10qgYquBh/pS82VrMm7Pe1FdqcDhP9FDx
         atJoUOTkvfS/FYVBPi9H7Ps4xWoyqpXkJhw7SygORH/wy4PXhYAOklbQyhUuG6UR1ton
         wbUypC+cDgwDh6+Ou6vhgN0E0fxfBki+fg9SWHyUAZ3aKHNlETqogsmt/beGEWHx0xEu
         MYac/HpYzuzqd5f3i3SeiqZuSPku8cfmxjuyCZLKVNoZs5frLcNMc3SmjGtWaZgCqEkN
         I1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606734; x=1744211534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=IXdkKgPg2HEhjKsU46/umnk3Xt0oCpCFG2f4NAQIdj49CrYPRLJQ6tKAC6yrcWXgQM
         uIV1sUDFGuPtGjrGAUDaWejFez2ZtGnLKRr+iHNYnfsqAasnSl02Qkf+JicEXa1y4wYr
         nJCtBMTRGigZ7ulCSd4VbNBLt+yERHwLHCZZB9zHosLFTAuhJC1LL9skVnO3EDj1EDDN
         ddVUvGg4R/2/dD5ckHdnqLoUJnu2Y5tZvx5VgOCRc2wW94nLvYvYiLnJvYv0PI9yg52f
         80CUf51TlXO/hzE1CR6rJOwaE90oDWvke+lVitWkujLpJS5aWPeF44dRKmW8xDWpdIdH
         tjwA==
X-Forwarded-Encrypted: i=1; AJvYcCXOlfPj0g3Yuv4R2T4zCAA+YolNZK4Wz2IpnLkQHtcpiK5UrWRsAxX7FkK/jq0oV2j1o/t9DJOy0niplKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEglp1pqTQlEuqt5uysiJnsbwwk9AlnDKU893idoCDtF2wsTC9
	3T41bk9i1lsFaRhccvOLvlBZQGr4rGMEaXHb44j0MGXUj2qEBBAPOHLCIPL2VnY=
X-Gm-Gg: ASbGncvpfpdl70Hqc5NebPv+0UxV1lhCBf/utubOPPHWJiH6hjNE5Ei9eqSwWC/rxzU
	lQ/gVJNp2As4bQi3drfREDFpDxi1ONI7LvF0pZN5ZZnPf5RtVyOX0V7dwFlKobjJKJ+fjm+6BXr
	etpjmjrV/RWlMjbVyoxRIgqnCYVFAXQjGWwoVVsfNkUKy4ncEnrlEsJsZuZGL7jHLJZWI6BIAhR
	+FMKB6P6SIsg1UMWmY8UYIXzjeQhFsy6Ko1xz3RlqaP7bVem+BXyF29rzdbs5/49plcNxrLfVCa
	yRV8WK1az4ooUKryKHhzaNLHvNflNItdq+B9Wlhdk3nJ3Qo9Hxx6FA==
X-Google-Smtp-Source: AGHT+IEujW2Y9DeKZ1kwEmbjU1Q/Gf57l4gnJlvnBBZWjVD+/kyGdLGojDZmD6x8y8kOaBXZhA/wVA==
X-Received: by 2002:a05:600c:818c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43eb5c1813emr28858845e9.7.1743606733947;
        Wed, 02 Apr 2025 08:12:13 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcf42asm23611135e9.15.2025.04.02.08.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:12:13 -0700 (PDT)
Message-ID: <d76631bb-68f6-465f-8fe6-5bff8fd2fcc2@linaro.org>
Date: Wed, 2 Apr 2025 16:12:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] mtd: spinand: Use more specific naming for the
 program execution op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-12-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-12-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
