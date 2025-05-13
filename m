Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DBDF42
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146666; cv=none; b=sHsQ/6SV8y2tLMQJx4DcRgbYIKL5kTGnwA3dDjNt1oFJZj1oBHNRleV1R721BafIWtiv7dCSzTJr48JpAfGW9+MpGrDlyVlR5qXUN70cebt/VoGkY/3esLwA4Vzx0fEUfp05FStVmRTnrIxn0eMUMyPcnwI5SC0lrWaFOvEzb1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146666; c=relaxed/simple;
	bh=GoMTa1oiBRufAMk+TJR19hVLI1uHIVu+p5+V59bCmTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8ccxsvt4e/CWR4rHqQpfxJcCGUx/3ji9b9PnokQciSKO7aldNTLiE2WZ4vQKgla64xdioFhjUp8Ia2YO8xheNkAUBo8AOeTCoqzJLZgejZoJj+jX15WvtVQxOpM7LeSeA2apCYtBf0ev7ytxBNZVmyEviY4ikt/9m8INtoH8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CseQ8F+H; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CseQ8F+H"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea95f738so8881295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146663; x=1747751463; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yyty9J7oFX8g3fubknNJuxgnKh0O3w+60/UN3l+3UkA=;
        b=CseQ8F+HhATdy8UD/Y+r1Nw+BSzQWu7Btu4Q6Dkj3y5GT2XE9kCgFDppS+YmhdBCd1
         hXqK24KnczpB0lsPg4Af0MWBv93V8KdOjJn0X/fDKMog4/SL1nW9oG/71M2sp126dN7P
         rucLcOmKO0PYOWkVlvUHVlJ9O0FC4GLrN9sol6IN+l9Id6GgFF5p19Zxdp6QJYJfrvVB
         Pj6WUj9YE1581+6yFou+NDuKJfGjmbO3+hyUVgk9sobrMj7lLEvduJ8TuzuJ1AT0uZej
         l9Y7bSW3qivT3edVWv678uHXrZl8fZWwkQF5fxGePn7n3Bk9wzJ3jiOzoyFRefUF0Cyj
         mbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146663; x=1747751463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyty9J7oFX8g3fubknNJuxgnKh0O3w+60/UN3l+3UkA=;
        b=KTkK8gU/IVn3woXNlsdZFd9nTAhhp9w3AbnhS/msQjyrw8FTsIXOVJ9YlCUWeoNxeY
         gzLM6af1MokQ1TVcivL5SYNFJggGmR0J7SgitHm5D6Da+LUwBRsE3fNW5LO74eS/jKx7
         Tmeyo9W0rCTq0ZVW4HmzvecjaY/wSIWIe6IPMC8ijppzxXcPTfeuHEQdJcTe7wfGlQF3
         C7jGLS2hhZ22nPOhnHGVXmfgwt0ejN94Y5/rX28oKPiSdPNegVjBGIiAgJ/QlVa3aEyK
         0e4ajvHw+6EhDZkGRcHneV4V+DedqMP+B/wTpfF07jWXiOpn5ZxsUcW4udvXHN7cNWo3
         ilzg==
X-Forwarded-Encrypted: i=1; AJvYcCXkG5RXZzViQ5yGArebME3r+FF5OOlj6nqtxK/qsHWLFbbRdvS6jKawWW7Mbbmqu4Vp6agV8CREU8Gu4M0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUawb8tbS6xrAQri3dCS8j6ZXYecrB/BddXVqpVq5SA6KV8kP
	P/wok+9qbX4tkJiQUG3forU9b1A09v1I88Xa7nyKP2t1VfM6yUVKTPjei5mgakA=
X-Gm-Gg: ASbGncuvKR2ep17DkavNV8COzy/Xug+fynKtV7LrDMyfy3Wd+8r+pvkRN3Y+K+1LKOg
	KWyj2VmotKDZvZFt2ndej5eslyCZZNmNmKS7z5Z9EIAFhCd19t4c3NfnlG4ejuq31drSr8tUGuC
	W/DtG8b3iqDuCbpWURmmBgObE6P0dgYdRnh2WxVQC3ynQ0mb3nsR+0Iyb8RiiaFRIIwH/MOSAhE
	GGTdEFSlzfBbk/Kjz86+c+b5J5eXUEgZYBnBmcVmsQE4mY/nbJqhGmTTkPHen+p10jeVVlc3VXP
	B+B1dxTBll8CVDYFhf3xvjBHM5lpsw9YAXNdYWzIZbMWwt4hU0PZwcok9TtUAa/9sdZ2iXp60uA
	0rZ29g01xhQYAcA==
X-Google-Smtp-Source: AGHT+IGyf1wD89DJXcgW642MDWFrZO+pHlL+xumUMPnNlympatoSZi++X3uov9+a1oXYEtcPTWl+zw==
X-Received: by 2002:a05:600c:a00a:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-442d6dc7cd1mr139332205e9.21.1747146662687;
        Tue, 13 May 2025 07:31:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d6858626sm174090695e9.27.2025.05.13.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:31:02 -0700 (PDT)
Date: Tue, 13 May 2025 16:31:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert cnxt,cx92755-timer to DT
 schema
Message-ID: <aCNXpHegnr4_FjfT@mai.linaro.org>
References: <20250506022232.2587186-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022232.2587186-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:31PM -0500, Rob Herring wrote:
> Convert the Conexant Digicolor SoCs Timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
