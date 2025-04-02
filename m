Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611D211299
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606843; cv=none; b=U9OJ8LT9/HDiBSyRJtrk4dz5hVsQq0rpcEJjyBKJ/42e8Ept9M3RwcLMg16JWyLemn3WWcOCpFBWLwTXMnV0VxLcCkzX9ipLu2a1jmRyjw82ayi8LjCXaI9ymxtfBUjxZWvBvOTsj7o6jLE4VnIKZ3wn6svNVAMgIaqnWHtAd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606843; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXjt7qteXK95Le2RVLv7sRe6Vxw7C1g6PIoI8Q8ykv34i9IYhtVTkSmZ+72uwZmpSDRlTKT8La3C71Lm5ePsCtwBNGgj8Xfp0ZVPne1mBh+4e7Dy7+L+zZJ5ZzwYhH6+4g+dCj8rF8rNfyXNoXJsFfWYd7204NdHYPpLUYR9T1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvDZ6fXb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvDZ6fXb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso32581165e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606840; x=1744211640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=JvDZ6fXbDHuNjqOCj4zmYm8QDr2d7BfWPaBvV6gl0mGDfWtA4GgcldMpCPxfyEjqpt
         +FS42RFFcB8mrYIZ9EwH43uBJoh3ffdAUhm+iRXq6KfbWa6nzo1FL+mzVWKTOwV0F4Ci
         XxKF74K/jxBEQUR/4N7xScSD2RnyN1RaRltEmG6gemBkg6YjfciOaVbidkyhWZHWJacz
         wPhv2AwCKJyNRaJy43BT/BkGcQfIf7WDjGr83LaphzVegAZfIA5ixL/wF0dVLOq74A37
         351vRNPZ2Alzhz568OymABnFTf7JhRyZeaJ5I8PwWGCbcs7b43h/j3Fy891Ve9HwkXrD
         F4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606840; x=1744211640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=f86jqIo1gIcTmOrVvBM91UfulfPFsxsqpKgH03mlPBTp6LUo5PxmuNH3+qg9RWer3q
         m6VMUcgC71xIreiP+GksQigZ/ojTIoiFfZXmXKufGhhFSFnzkPBMGkFQZgPbgJNIg4Ll
         E61EJe/D1FEICcy8aobog90xrKn89AZj8FlAPIONP+aCpxdo6xQuTwgwIg5K3tvrWazf
         1iI19pG2VRNod9XV6WRRRuVohBAqPoJZRa6I71TKUmlGdOxWpHSQsdF+9ZV9TldzU/nO
         wJx1wRGUVOIbF3R/jGwJgtD2IF3v32f0SGJP1klnjA52uY40abFWXBWR7mPvjkKkG6Pv
         qK2g==
X-Forwarded-Encrypted: i=1; AJvYcCWE7kqvsLM218S4qg54Wh9HWlbiTjFkgSuHYrrvwc0yApue3zSvBVV9wKnQtCJlVKlQQk/jFRYGEmX90No=@vger.kernel.org
X-Gm-Message-State: AOJu0YxavCtQ06Hr/JKybL1lLSO0UECpfwHgqnkiTeWs8WmP+jq7Uq47
	DHNYmTYzV/GGtbvVwdWGdxZ4eVS1R4OTwpLoOWPf1qWO8CSkV95wjjm72SbY/nU=
X-Gm-Gg: ASbGncvlm0G5Uc+HXMtKQomo09TiHgiD/7iLoLDi4Uwym4YL0/g0f8TMZtIIi1hc2sc
	e/LqxCsi5HD54DFJVzxjNACjbbqp7FYrBkuX7Pw53vGzk4qYPGyawXay2mjTj5/ro8qRmHkQ+W2
	wmqRdy2CRMZDxpWu5vDGXCvB6m2Kt69q9ZJ+ca0t1En2x9+EU8KUSCsxhkYybRYvr5lKB0Fh1qk
	1+agsz3GO+vx5MnbP53gwosaVEza9pxx+8b95J4REed7d+Z9eTaxbL56BEOU/5kbrbFVfWYFQKH
	iUBZIwrNK/oc99MWuE7SJsIIQQ3zr5Vbwwa1AAHj3UZymyJGSWC4VA==
X-Google-Smtp-Source: AGHT+IG6p3UHT9VfN8elbbIcomUrX8igQSBx7GXK+qu6zBuYsACWtZ6EtMj3y0kC69/t3Mx0577lqA==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr142290465e9.5.1743606839846;
        Wed, 02 Apr 2025 08:13:59 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ec915sm23620405e9.28.2025.04.02.08.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:13:59 -0700 (PDT)
Message-ID: <da84d300-0af5-4ee0-a6ca-4bad3df39eb9@linaro.org>
Date: Wed, 2 Apr 2025 16:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] mtd: spinand: Use more specific naming for the
 (quad) program load op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-14-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-14-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

