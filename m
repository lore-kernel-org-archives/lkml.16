Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24E20D50B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595431; cv=none; b=HTVr8DB95+WaibcOXmWahD5SZio4m8SpkN3SeWWroWkoo3R8XC6lWAIuL+But99eXh4st4e17P21qA21TH1wa9m0/4OaBEUQD5Ay45RY8HUvA7lb/hY2CDzCdVmYRP4/36CZlkzAAT4KhhvkXWPvIdPE6cxis9XWX4AooJ5ZS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595431; c=relaxed/simple;
	bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTAMQTpjjvObo9fVClwaCNChkn+OdG2n0g/5UQdXakIRU+eZUVN+WT9VWTe+KioDhRYkUBHVWxyvtVByKomCUosXPhe5GQYCsiQ6XdlHDBVpB6A6h0tyYUY3RF8wO60IUy61e6/T2qzFZ3nVt9xKs1+6DaOsqMEps6SJC7RPdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0uRAmAA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0uRAmAA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so72141815e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595427; x=1744200227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=L0uRAmAACXSnUlalpgZ5+1nZapfPh055I4bQbb4nh5cTE5wrhaOFh9nDPe7C8tdNB0
         VtMc1BaUjwCx+T0g5cO9780OQ8a2LmMoleSFni0YVOOCZbsrS8UZNul07Icc0Y2uokUF
         ek+4e9ObfkV+DFxkrBG9/mOSk8/A98e4DYKaQYR2BMqycdbquiZOmhA9Mhkib8wkSR4g
         1cGHgx1xUSzK1hezjYTh7FiHXgee/vtcN6YH1iYVUCHYrh2QwMcGGY2t4bIHaqx0i2QM
         o5zuaJ9cBB0WNptrmyPlVHe7sRa3CeqXebcqBT3em2FDRBiGQdhad2sNX+MAxpRUQADP
         z0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595427; x=1744200227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=pDGhVlxy4/4A0NSZ/bVvKnuq6tddcFjVbJXtXnmy92Mle51dc81vxBDzUIdWTCT5eD
         xxzeS66e806s3z8+l9Cuu2fDyIjDu9dn+3FQKWfqW2plucMxSm/PwqR6rVVEpa8/CHw0
         lMJovH/U8E7CwpTRC+tiyZvFFNgOTASZLZQGu0CeNnlOVGmnnKdGWaluI6bjsYxr2obI
         6wr8UDEvinS4eNssOcEf5tdTpkzXyb9ljxpfAJnufxlLxjtQn8iVjJRgz5SCXPA/WPk4
         bdFSH7ujW4U3y6r112bkwGdqdouAUN1em4r6KTZq9KxOYBHieqjhLz1ibTcjxp/JpSri
         yEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyhjPrFosIZEup60QQYWCi1P+Con7LHOga3VFJcTvCrBgQzB1CeW0oSogeXkPbxxdHM+5j5EBZIepcgpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuU5XQbqaLYkN4rQXc3Sn6KfSUsvoSQQNTGrNacfOTiunpdU/6
	Um7lzkY6xPcsszRIXmQpLyRyynqWJiO8K5efFx9cWrGko3IP28B4jjHNkSZmu0g=
X-Gm-Gg: ASbGncvQ8sHf81W+24FsM7jNzA1LorX/aFYgebJkrL983SOspOFbcFuNt77rrAyupGX
	C7CTymwHx3nhNXd32RDiBFZRvcuu3aSTfx9GMMwErJu3OOukC1HjcZajElxelfxwU01d24LCz8o
	7z6+mDO2swUNl1asht3g88kK6S06yhQCL05BRj5APJhkdy7L1mrEQMQlLm6B5hEF1UIZiDUmIN5
	LOvmfiR1+AywVT3tPRCm4l8IkN5iQ39W7qpsfvhAykovlJj7+JRVPxnqZ3IzXkrWk5LNZ/hiG+r
	bMFsCEYpZ02QPZLAOOuLSNSAsNqs5SjwmyAvDvhQ8W5rkzsWGorFhL98bFnZGJ5T
X-Google-Smtp-Source: AGHT+IGm1YD+wgI4pF1F32H502jsHX4cQgi2yLR0AxNkSjmuUsJo9ZdA4N0/MGN7F4zpw3w+56Q0lg==
X-Received: by 2002:a05:600c:a49:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43e8e3d008dmr142321915e9.11.1743595427547;
        Wed, 02 Apr 2025 05:03:47 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60d1472sm18478575e9.22.2025.04.02.05.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:03:47 -0700 (PDT)
Message-ID: <4f7f8067-cb08-4c42-8460-39370c158896@linaro.org>
Date: Wed, 2 Apr 2025 13:03:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mtd: spi-nor: macronix: Drop the redundant flash info
 fields
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-2-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250402085129.1027670-2-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
