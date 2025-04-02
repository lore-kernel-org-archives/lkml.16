Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415892D7BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606452; cv=none; b=Tp7sM22emb2ZOWKJAM1WuYf1f8i7SEMnPXqDhCubdIhiftx9Egu7avPyQiGELj95rsnDNK06T00Ou4Dumg4a5qW2h3eIqvA1hZiOZ5sGgaNKGAcZ1T5LIVdaVxyiDsd6k7HbllGlAkt2lr4GMMSGQvwWHdvpjKJpAmTe4DpmqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606452; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9t2UIfIKhy4mo0TGYXkjAWzuPk8TLxYS1CMNc4777KyZKqT1TITr7U97hILAGmd6yK1HGuxUPaOm6B69LeG/X76IwED7Woym7UIt9DJnLba1R0mP81dcHz5q/23b6dyM4OY91IzojgkvPEOiC5kEszJoLWD5aOjk2405GrQHic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQr0oUyJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQr0oUyJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso45285855e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606449; x=1744211249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=rQr0oUyJC0Wb+qH+p23GOmKE+dIDVP7GtEmasF/UtFI3YhwYS8dOyLgc1XaVPDO3NU
         vAchjqq6DE56jB3Bz31A+H2f42g4aLzOnbVKXalat1x6chQ5ciiAz3AqL6oeJPYvSta6
         gEwpZZSCSBFVcBxLuwpvmLVgagFASvtBmmo2hBgCPBoRYRgVtWvq67KfQZ0Td3e8iamQ
         NiXPjG6qziyff9dl7uXzJkIhrs0RAEj4hnx14RkrLNTZO/1vHVSneuiZ1S4QaSz4icUl
         62IxhgEwqFqtsKWrVgBfw9X/MaWxadx1sdANldPtwaa8Dmv1h7RwWwTDskBjFTcFRo3q
         Xy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606449; x=1744211249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=JMJncrH4wa0RNndazkA73ZhdlRrM02ErpR1dxLdVG0XmdhmKed8toW0xkQniwUJwWa
         DS2Uzi5JD4FXdr+yFQfkM3BdS9FL6+atnUu1MLoAQ318Bh3gITTvUIecp5n+oH1o70u4
         H5iRHY32+tXeuvuiXS2yOaAko646s1Xcqw+VgAG7wbpQxDQ+z6ke/6GLJerjl95hK7kf
         9RAqVT3WuN29J2WTHb1l3/QV3Rt5pDAL/alDCdKBKfzVFUHz55ib74JUfT32CPD24jVH
         n4mSwFgnBM8dcEBhQThtPXGt45SJ2HmqslCKmt5sBgJf+gaTGWw2LQ9cQb67eXcgIGVN
         BqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqyU3fx1YTrJX5abm71bWk+vcnRB8AjVV8FRTh6FtcNW0ypE/q6WUjAXdZqHlyaEwGaV1JK3kZeG79aJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyH4Rns95tXx4FSQSnKtseQeRtiUIvV8FXaPBa3q7ojIX9JawX
	kejYcD4qyXd8gt+WVmy+Q10iCGxHSzYOY1oecaWhzozKtnIyxcrRWUdGbobiABM=
X-Gm-Gg: ASbGncsZqHYpg703BDBiSIrixUI9SALeBL5XXV8EjRl2mb1tcyjMdL/Xs0Bz14taUne
	Y9eqqBaWUGS4hpHgJ4iv66Olh+tJYlW8nOQXTCEOyUKV7pIJ7IJwvRc8JD4ybhfELpcSHXZR/X6
	1cmWvxlLKXMKBoeRBepSA+3jVgZ18pI7g0n2ObDKLXeDryEIkoOhURa1P0A9s9JVTaHTaRN4lNu
	McZgenDNW3GBiH0Sg+XlkkYlf/AYR85EoiKU/BAn4K5RPgGkCU8so3bT4vt8PHOQeznJ2kx+pM1
	X87kfG9PT5SRAjxRfFG33y3RZ2H+m23JqkCzJ22YkZ+yasslVdkmSBvaTg+99kOs
X-Google-Smtp-Source: AGHT+IFMWY5ft/pWh29TsxRnhJjL8o/h7m4mXeET6Pc3AiclHVvt0+wB9flt9C+WfTpG9ahC7hQIXw==
X-Received: by 2002:a05:600c:c86:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43db61d1becmr158392515e9.11.1743606449564;
        Wed, 02 Apr 2025 08:07:29 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc662fsm23950335e9.8.2025.04.02.08.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:07:29 -0700 (PDT)
Message-ID: <48ffe3aa-391b-4803-8be0-72ac23cbee5a@linaro.org>
Date: Wed, 2 Apr 2025 16:07:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] mtd: spinand: Use more specific naming for the
 (dual IO) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-9-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-9-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
