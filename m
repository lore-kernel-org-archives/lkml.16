Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE5243387
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675224; cv=none; b=rqQdRp9/Cv8Q1Om83IRn6OqmJ9ty5MWTzxYiW9YX4t58MDn/cq9keFePET1BJpBRoymGn4nTp4MBUboKJHlJFvB/lTfLxjRXILYTqVci0ucMcxjEJAlLoZxzxaAR2yjxW9WByRlagFruYoCRxTDJJZ8xuE8FszSc4tbrMCvdRYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675224; c=relaxed/simple;
	bh=2DnvMNbbTTKN68Y02RIluOUJeuLsASazfcS+24h4DWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrzMJkHcg3HeSq7usZJ7qEjAgKct0QgHOcSXI/R2qnvz68Ar/zFql+4LYYr4oqb6Y+A8Q5cQmkkmkUJhcd76nC4GMxFnppGNfGJzS3OZDZMgpWijwLH2GN+ekV0fiA5SkCwXKRA+WWh8rOr074S8d10SxH0DfIsOWFiWzG+KsTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QtkfzBLD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QtkfzBLD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913b539aabso394896f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743675221; x=1744280021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUuASJ5hScoSUmLABElHv3yXRMZ9c2GHR1Zzdm5d/R4=;
        b=QtkfzBLDwAYi1dMJKvjbQpDEJo58ayRinpgnHeYd/OWqEGmpGk8rx4ANLZ0tZ7FYO9
         JuMCVhTAhKJ56YOipwDLgWIKBaZ4vABhQboLhqP24ekosq6lT/YzNfeusmQEY8Y4KEWo
         3LXFk3B38R14oYccqCrsCuA0Nc5lmfL9eD5MP/wDgf3LJTj/UrAvfyApBK3BRDWLnL/n
         lRY/p8rQytkNW5ZAgrncwYLSV75PhfJW3tIX4GUXTfunG8BKA5YV2kiKUi5v8ZijWUdL
         XTHmBlmIZuczVrJed8gKrqV9LrJJAAYa0tMwmZ8qpdLphcaHpKULpWru2XRS4QTp0UjU
         EGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675221; x=1744280021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUuASJ5hScoSUmLABElHv3yXRMZ9c2GHR1Zzdm5d/R4=;
        b=LPg/jcWWg9pyX2BwDpFRxL4+ZQxWkSBB4sPxYL89gzkvoRg6PLsE0QpRZOuCpK3vDy
         2V0NY2EE/BUYHl0FA+u5t43uy22EI+o+Vs5onHEN0xAAp3E9dsjnO228C+7MYx8pv3Qf
         MEmGk9ELIsIJdWQp+ilAbTCJz8H+Kks8r3QV6sWr7imd0TIZAAXhMaJh8MGPerifmeod
         yfR7mzoC0rdALZzqPhf96D3LkLpRqg47do1pkWf+YzScZ2zmhSFWBGvOnEfQgl2MSxlH
         dzn/cR21x2n0uQp/J23bUbqsSigioHJY9UrBz/4kPyV4aQ/QtKSfq87wvaWkw2/V3Cm9
         J8tA==
X-Forwarded-Encrypted: i=1; AJvYcCWNSizlDxNPvH7imY5hI+qKtnzI3mOi1xyszu3R3y9PepDWXudm9YzkKI9+bgaX5Ap/QAXSwi9ylAfaPyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQovvPC9i6F2oFlCHKLfKg7TMjMb3/rDbnqhDMtF6nG+EQLIiN
	KtB83Syy9seMIfeiS993cx7irgRdj02zzYEmqoz9rXJqaiq0sIgWP7J3Vd6VZaA=
X-Gm-Gg: ASbGncvyfoNgzOxJ1YZejm8U3KCawq9DXXSdqiKw6JFleXPYFplMR4JRtZjgLvB9qTv
	XyjKrw2enCgwz8ykliB+AjWM3Kp1YDYgZPG8YPxpbc+oe3T1B+EKR/OdRB3DXceFvAXCH3xmuR3
	WlRmXPmtv6TfnL+xDw+jIqoLwuL8LTbDMUrgXwDYVQOu0gOAQV6Z6iawkZAIJu1V3JP61QAHzuG
	hCUmvHMHpeLzCs8ok8DIyxJr6NarSB0c7tPfpuYPy2+G2HMmxy5/jatJEbX5DzA5V+1y+cXYckL
	vY5Y5cRbxXAjruXtvKdBxbLiW23Yu4E+Y1+yoVXKrFklqX53NNXXBQ==
X-Google-Smtp-Source: AGHT+IG0GXKdP7mN6ZM/48dDYRe92ebXdTmaY+mvl8i2Uj/cu3M+nWimnnDDLEpFfJIJ4V2pGTnsuQ==
X-Received: by 2002:a5d:598d:0:b0:39c:30d8:f104 with SMTP id ffacd0b85a97d-39c30d8f30dmr1230973f8f.6.1743675220783;
        Thu, 03 Apr 2025 03:13:40 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342babfsm14099235e9.1.2025.04.03.03.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:13:40 -0700 (PDT)
Message-ID: <05c0fc18-f50f-4f62-bc64-a297cbf927fd@linaro.org>
Date: Thu, 3 Apr 2025 11:13:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/19] mtd: spinand: winbond: Add support for W35N02JW
 and W35N04JW chips
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-19-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-19-7846bd88fe83@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Miquel,

On 4/3/25 10:19 AM, Miquel Raynal wrote:
> These chips support single SPI, octal SPI and octal DDR SPI.
> 
> For now, only the SDR protocols are supported.
> 
> Tested with the W35N02JW variant, but the 04 one just has twice more
> dies and is described in the same datasheet, so we can reasonably expect
> that it will behave identically.
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Checked patches 15-19 now, I'm ok with them. When applying, please
substitute my Reviewed-by tag with Acked-by for patches from 7 to 21.
I explained why in the reply of v2 14/19. Thanks.

Cheers,
ta
