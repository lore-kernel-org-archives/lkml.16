Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877A1D47C7
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 20:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739132015; cv=none; b=WWOBbWBUWe6aiSGBOhXbUmtdg9KlFgggxGmY3RE54BIBM6l0onQAPxTbAYY/WRYe5RJx+Tc9aBnpXd8dD6BbBhph4hUL0jx0y+q7eDQUEw0BcaK/cWMQs1JunrHZQJzI2JLq2FintqWotoflvDJqiq60VjY+4v6h6OtXBmnqYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739132015; c=relaxed/simple;
	bh=3vZjtalIidErWwf5waJaHKi1qXeikMixMz6ezxv4Ls4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUY0CXETXK5K+E1ewkyAkOinChWyM/+npOoR8dUFVcc7098QtuAkqoEaYKOfqA45wYAsQEXqHHYcnunAY5L5sV5AZY7e6T26HZeZvSPUkWDHaAoIxMoss4BOgbA1TDUlebaNKye+OD83ZMl6qWMqwI9qz/TFFDD5uTUBfs3JCyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNBErenT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNBErenT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7b5308a4dso16392966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 12:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739132011; x=1739736811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiYTsuTuzgzPQyFWR4jKg3oel1E5dq+3B8E5LOdMdt8=;
        b=DNBErenTyAgQO7G2LopFKtqGVf88B0JQ297RGBtCKvQwYDedfMtdFrktXI5/B6kED5
         AlfEkDDrRDhCT5wdPuqRvGJ5T8sKm5sWOJiWuKKNpRGeb05kIO90wr183dukeqCrE5eK
         HCkizcbAsW3p8os0DipxhHC84okTDQ9tQNbhYPYOv5/NpfDOEizo7rRhDfmnYwsFUAfg
         RSD+1d9GhCF9K38Ix0ok7JMKca2EEYxZ85IiN9D6gzxcUDOEf9zMyWidpfsXabrmwRTa
         8z6GfrKB+cn1XezcqWFRwhjTqzV/5Z1svsslifFPrJvtu3SgyMlBgAcy9Bg1LEODkpg7
         FfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739132011; x=1739736811;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiYTsuTuzgzPQyFWR4jKg3oel1E5dq+3B8E5LOdMdt8=;
        b=oiE3H20UA0rGWjmmT0B38+xlM2hbmKMAowyneViCki3vn8jrEqISrvlg8e0HCX3p9C
         zOdn0do5ywvheWipOEvvkzj3IxTj/ogcWiORzbQ+zCi4Gaa5TZVWxf3960IAVVcZQNUa
         1z5j3XhH+659xC0x+gMchK6rK5kngr+pb7owkZ6dqBAdNgJYjmu1xGx+wxx/k1FEpSQh
         CIQ0wG9iv0y4O9B1cy1EeSnEjJMx+05f4j34t1VrZXdDGkUSYKknQNDJIPwbazdY42nq
         O49gcLWwi7pnO7oAIYd2IzYTvMjVnAaIW56sozntsuHnPb4BgGVEFSGGn2tK/bsliFJ9
         MFQw==
X-Forwarded-Encrypted: i=1; AJvYcCVg/N7YYN+0jRkm+eM4UTO0H2TX8vXqJhNUBrrGr38/ujjsJyEaJzsWsFJUo7JEGoguYb+yM8oE6NjXajg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCNVmZpM7Ka0hRqu/rLlEcBo8AmtuQOVU81PXvuX3mMAn6elmc
	vZjvgKiru4fjZVx8NglCpyXdWNyjHOweB8cdU/xKYdPeS/5VLfn1Ao15skso/nc=
X-Gm-Gg: ASbGncs4bHlxKqOkZUWPFvKfjzFvSL3+7xtWWgBjDjCnWASBsXO+HiGm2zkdC+7ahG3
	2WipNWsqOcyVOdwbqj/iidbGui7wso8bFRWq7uk9JVAQH3dQpxCVt7UgFU+3JIPnCv1g4qhafRo
	QbmYZ1PHnuI2kGhwfrZQq28MnKjjtLVU5lzi8IJvyci2mKpTlUP2gkIr38RTpgXigjAC3kLHDcT
	txo/rqg77+ZV12naWutNNlx5rTEW05OCTIkKa9CFRGcylC8HXKp23iYnts/5Mj7VRbssVK2wujn
	wbms7wIIM+dWIKKvnKevgK6Wko1BEUhrc00=
X-Google-Smtp-Source: AGHT+IH6LtV6zI+A8y6zJKDx9SBfmOVuWXB20wFH30OGC9aYkEMnkPpyjSJ6uBw2QamPaMtQP9zP3g==
X-Received: by 2002:a17:907:9484:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-ab789bfaef4mr423937766b.8.1739132010736;
        Sun, 09 Feb 2025 12:13:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7736464c8sm725842966b.166.2025.02.09.12.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 12:13:30 -0800 (PST)
Message-ID: <dfd05a5c-60ab-4fb1-bde1-d04e3a108496@linaro.org>
Date: Sun, 9 Feb 2025 21:13:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: media: i2c: align filenames format
 with standard
To: David Heidelberg <david@ixit.cz>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250209195517.148700-1-david@ixit.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250209195517.148700-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 20:53, David Heidelberg wrote:
> Append missing vendor and align with other sony definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
