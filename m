Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FA220E023
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059941; cv=none; b=qfSLDhadQScqwn/FuDwq8kQV+Yzk46zgCncaN9vDuLPSBwT/p8yYxb+HRKVk41/BnWbEBh8Q4piZmBP5SyTv7js/ixI2qHQUJBEAIzmmpGid0bQZh+FmsEexNKgJ7MFvhFE2IwNYmraNhA684j+0bRiCcXF/UWYl7A4LkPgqz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059941; c=relaxed/simple;
	bh=emuYZRRsAsbfW8dtLwfIHR1XhI9Ti0TeclpaLXuKj8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nh5KMmk6LOCJzPH6R0jrjdxgLxGaRDuK7iuNotlfncYrNUS+JZF0jjqRSzy/FTxC3aWLm+oRk2mZAEMO1N/CnXgeGLVdpOafa/D9D5peUsV8f7WCbxE3EPHtewHcgD58ViqqrgyfhHwyHoNbVMcDJMuxPwBc1qzQrSOKdsSQins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rwr5uj6i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rwr5uj6i"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2402273f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059938; x=1750664738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkcvPSidlO7p10vWDcll4mLBY5FWBOj4Z5ozH1tkERw=;
        b=Rwr5uj6iG7+A25+ymEVrEZn9F3u5jsC6JRLVR7SNXGU5QCK+i3GObrIW0VCEfcj5vs
         hT8e862H5y9uxoIUYSTsRKAeotcSV0HJIemrpN28NFzPvI8J3mbwGTmaGeqQ8sMVsN/Z
         KUyGmd0XNuNaDHaWVqizcrtRm7YMDS3CDWqggq9jnlH/DgiMhkyUax5lm7xivfz7+Jk7
         HR/+RPYLcGbGC/V7sGkgwQRvkXWGHcIPyg5POIE1rvXXeZIZe8bdj/gzCpfGe6B3Qs4h
         i4+uP/3nxDtjSqKfu//B7TBUedStmSttiOeeBQFDmHfSWy7WMgbSs0DQxqc5iaAlkQF+
         uAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059938; x=1750664738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkcvPSidlO7p10vWDcll4mLBY5FWBOj4Z5ozH1tkERw=;
        b=Au3O37+jZRRtyNvFef10QnCS6BudWTbnsQ3Dk+urkDhyEewJLmM3QPwBQOulGEc2i/
         /XPQKLrDoVbWM8N/kau7VYZqfyR8U9IFmnvpf47SZWlhMXkOOnkXP0rR/9W+8qVI3Cs5
         GZ2khVzkl+pfH+gO1SS+3tC6nC3VbniEPHv/XwGh29TnDFwBXbQI+tovJQsPAqDlkLbj
         kF6vV+xSzl5c7JcOtUEAxd9VyjGiRaLVRIQzMCVciqXYQjG+CCqGOCAn6X8ha2KsUNV3
         Qq+2H5es8pBq4cJbJnWwcXrECJsLa8ajVnyXtLJd/a8rfuyjngn5tKpubPL1+PEWCb/m
         hBMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKJjSUnvUTCSgQlKScIjIdn6K1Gi7AWqiTFDLDzPJLDsoWvk0qcTF6ZVyUP8aev/1yzLFr0cu7Pag60Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5EFyCb/x1AlCxclrF2aGOrgTwSMLuxjSkVfN717RWhdOZ/dSF
	2FEWjfv4694s6lZumVI1uu4cKz63H+RCZrcK8XIwSCMi0ScZ5DZF2W+VGMvzIut+WS0=
X-Gm-Gg: ASbGnct1h0aMbwRtHtkNiZKNfmdWpyRRp3VwNQNATMcqvuzEjzH/dFbojlSO6HJs/Qh
	26zu56o6kLbcgpyW3SbEP3uBtxve9O5SGmhef4JGIAgSXPs1QBZsosMWoUQjtf5kYp1yyU7QzyI
	3VOU1U3wBufIAqxbAO2J/TSdCEP6x6J2BNpqso9W9EuyUCNladH6A8QP1OSEdS0oNI/ubMH3aqB
	c4v1nwVZFawd953R9JRhPQHUypJIdx5gQQUTvXEE528OeQ47KCphBxiyfYoo7B1HJtPjXjt8jSA
	c8WWqr6RR/p3mX4B9tjiTHJSKXHXrQTbGJfPH14HbbTotWhDimHrMOjoDqiDenE=
X-Google-Smtp-Source: AGHT+IHa3z0ZuONg+scxBHZPdfzZc35NbDeT4H9xI2j2Jv9Zpz8bLhlsMxdnKEUqdd/SI/I3ccpjFA==
X-Received: by 2002:a05:6000:2289:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3a5723a3af6mr6913868f8f.27.1750059937840;
        Mon, 16 Jun 2025 00:45:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2b113sm10297163f8f.75.2025.06.16.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:45:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping
Date: Mon, 16 Jun 2025 09:45:33 +0200
Message-ID: <175005992380.16166.15596259788808709225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
References: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 09:16:28 +0200, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
> 
> 

Applied, thanks!

[1/1] gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping
      https://git.kernel.org/brgl/linux/c/bddfad9f7ef3fc73f0a6fb05996719adcb5082fc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
