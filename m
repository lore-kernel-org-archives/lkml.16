Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933361DF27D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751003825; cv=none; b=LxBgNVQ7fwlZngoqrKPPW0fa12ef+QsBhy4jDOp9TyCis8OqkAvQeDw2PLLxj0b/vZPxVHtVloVPrY3NVNzV1XAUmem0A4jCZq7FLRmBdVFsyrhls2S1YuWeJsDWpCUlm3vLS8j7JWM3UujTJcafTecAksy49xFeG5N+8LkU65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751003825; c=relaxed/simple;
	bh=+h6UbanBcEDSczpIUGbKBBHkAMzPJzRTwr8Ng2Y2WlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aqidfm3MXsCm/kDyXLdNPWD5JSPiWk27BUQF5/SFLvMT25H9AUil0Cuy/AvIssxeHoRoSJTzLNFAg71WKlm+kiS1XqyZuBAb3VfywUJsthLt/IfxctFZPzcZZBoxyO/8qv5EcSNoRj0BLtpy46D/HUYIH4CAB/JKnRM8P73SASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLdFIPOo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLdFIPOo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso2012665e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751003822; x=1751608622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihA46zUWoj4y9yH4wv6zt6EYeKMN/ZkRKZwdyhiNCYA=;
        b=XLdFIPOomeL0hFHy97Fq9g3eSKdQCxhBlCusbQ1HCPQ2P/6Xke9pPZuoNVaKBp3kwK
         8M4ohqjuw6Bme/9FsiS0xP97drcDLvphzIbH1dVUx3NntQUxyLOMUEaFUEQfh4busfX/
         eg7FLGi2BmSjQEDkFyO/dDumIqB3XY5pZ6mjYerULaLeAKV3G9Un6EOhimewpbUcg+Yh
         biFk1IkpRvK+RVfKEes5ZAjWb8YGnHfITByiEQ+yAT2qykAlX21h7/ll2KnbyYPP/zuw
         /M4IOVe1kntBTvZTVsEcHYXJpQLfXrAhuNctxJl7iFctAW0HZLoPs4n6BuipRhmKeI59
         9rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751003822; x=1751608622;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihA46zUWoj4y9yH4wv6zt6EYeKMN/ZkRKZwdyhiNCYA=;
        b=xAObQkKRhI0L5oO5KjTQw0VsoZi5XotWCpMxMOFtw+6zykMJQwNSFPS6fOHSvJEKtM
         kkAEZblB9dgkHdokjlDxWAu5kTHx1EUUc0bHrMBprQPsgOaIvvhCJrA7mbn8YWQlbYVn
         EqnSXOWz81HYADG3mi1HHrftbUEPAum08uI0wFycsrvdFXWN16slUd7WN8yJTACpGIEx
         6C2mqBrf9FY7XJ7RJZ8kfxAWoyEXz8ClwfAHuK4Mtkozn6woWtoiUo3PE5AzoPSbHeHt
         Bz34W7NHjbRf1s/GVH9cByceJmxQqvawuMbAg6ddkG5m9l9PvbuIiHnn4uBPenhrdhzO
         smww==
X-Gm-Message-State: AOJu0Yzk9b0/c1OjBJKbMthTpFx9tg282BWgF+QmpX6ZEhkXheo6KHGj
	p2dVKtA5j1P7bgq/9lsMEI8V+hrpGOXoErW0e7E55eTxOwcpP7lNR2UfdYnlcIF93kk=
X-Gm-Gg: ASbGnct8eSh8grgdnvwWevlYXeCRoBHL1VRoGZ1jB1fWPExEbxIQueYmpSWukm7a+0B
	EW+fUtERnPJlCFy16DliiMUUCV9kXYYOY/p3rHuNyH8bfK/j4FSh7xhlbrjOjwfleHj15avPCXD
	i9/iT7wMmHlXZXK8e348pdst2WuShvHlKGuf2oyq+gzmFOxvuSdbZbGVq58Da7DwsZvA1WXkhhK
	IH5go32McIDFYKDmHAHe8tILNQ34KmoPSoYf0yb+XfBYZE9fpukIHlUayiJ79XR7uFMrpg0tK6k
	yqZpvTvcbKEwaFq9GM0k9LRDu/zVRPnCBfWdRX76qKYHYRZxmYxbUBQq3f1GqrBP/XHrv72daii
	o
X-Google-Smtp-Source: AGHT+IEO+Lc7qL8+vyNa1Fzk+jCY3AgG5vruLPblFHJDruNTVICQAyjisLLGwKbaVbHs/dAXjI2hxg==
X-Received: by 2002:adf:b650:0:b0:3a5:77ea:2d36 with SMTP id ffacd0b85a97d-3a8ff8f56a0mr556159f8f.10.1751003821836;
        Thu, 26 Jun 2025 22:57:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390bf8sm40414175e9.4.2025.06.26.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 22:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
Subject: Re: [PATCH v2 0/2] Simplify compatible matching for brcmstb_memc
Message-Id: <175100382008.7419.10025995325292671372.b4-ty@linaro.org>
Date: Fri, 27 Jun 2025 07:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 09 Jun 2025 14:23:54 -0700, Florian Fainelli wrote:
> Since the conversation died off in
> https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> here is a second attempt at addressing what I understood from the
> conversation back then.
> 
> Changes in v2:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory-controller: Define fallback compatible
      https://git.kernel.org/krzk/linux-mem-ctrl/c/501be7cecec9aaf9cd52e76d0820efd6d0b952e7
[2/2] memory: brcmstb_memc: Simplify compatible matching
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0e3dd41a94b29d5d9973dac356ebd37f87bd8a37

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

