Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986E280337
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297818; cv=none; b=mkMZFI4M3WXzgLvP7vp5nrh8kZz1uaX4G1H235iwDo7/aGnFGuif0DNmNUjX/E4v/LG6gJWHU9kpWy/jB+DV0CEhZB8SeE1WDQd10RPmuLuvzUa+NITv5aXPerGfdtg37XgjIGzzinba+BVahj6aP6EO6T8/q25alirH1DjoRL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297818; c=relaxed/simple;
	bh=y+8BrIOfnnrnk3+SMIKaYOUf1eyNC+YkXE2nzzf2z64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlXpvtVGdZPwa8XBIJPWFWq8jB03I00s2NnJtNLR8zfoi4zJWjs9GgeOZ+AyMwtpwaHmWcISsnov2rFskIpp9DL37oHndk+Cfgd/Ne9CZLfgpGwpdJlbiwnoHJJ/Qhg7/EkF+wCF0vKEsGvgCqhokEmJEV2eMDm9zV72WCZjFR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVE7aIVc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVE7aIVc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4979825e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297814; x=1747902614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0+YXZ/oDbqLw7+Vd2GiuP1N8dvsFe7slNn6cmLA7TZ0=;
        b=lVE7aIVc4sYrOppeGuhU+CKIQ4vQzpsRrpd/xp/kVi4fUby54sGbHTfxOYUCTfJ5kK
         MAFAdZzRrPrpWrwCN6vDcpkLDPRMZaL8LvqKN59ZNdlTXR0bsLVm91uoyVOFvEhygqCo
         Zr3l8MiKDqyKEuH7Rx4+IqwGKAIh/1D8jDjSwjJQaaWwFQUumrUH0+DliHfHdWiQsX9t
         lwnElec0hCBNQIreaSmCaIwR/oKtdSpqdB6r4rb8+TKfD093quJSuVZYssXgWv/+JUCD
         lr3Ed3LdufNlIfkVnjXSGO+6LnBCSYnuL4Gr6CwAESm5DGQoZOgUpnazYtR/UTDY3WOR
         Mqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297814; x=1747902614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+YXZ/oDbqLw7+Vd2GiuP1N8dvsFe7slNn6cmLA7TZ0=;
        b=JC8oBVVApZsCYIBX/Qrr4feExmVvVBKX7IRarwcd6QLlhrkSGZEGcipGVi5uiQwYbB
         5INffDOJvSpDf3ZVoNEZOJciIFBtytHAUw7Po1nn6VuRUpmXca+OCYLFlU5f8yrh5Oih
         Z+J90Qeo1uLr0bRfy9bsN4bOa95+yKLTnZIYyX1h31tts7aSULe2v1lBMtOSii+xpfSQ
         H2mdxsvhbJNmL91O3F7MRODvD8dgEvbs++pVbTNdUNNC7rQfc6zdlyE0QEGzyn7GGMoU
         oV+/dMZkKIealxlTtydkbAtRJ8PV4TqDilMna0yB9KBxxqpkdk+XTGBC7eaus3nwOfjd
         rNnw==
X-Forwarded-Encrypted: i=1; AJvYcCVPFuFtqRX+xtoN6CC0io5iXabDeBevBJIxj2HbqHoB7uVT503JWhJF6uxVRBoK0lQfoJUDXELdlshTo7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+q52wl+k8574jHOtFh9Px0zMFIQ3ZEzK+EokBhQIerOeddQI
	afNUFvshwcZdmYcpMAosYX8leKqpo9lCMbcCSspB3p9dshDy00IPE4dX6fE1rdU=
X-Gm-Gg: ASbGncsdD0EKVXnOYVJRucx5c4TawaLS5eDVc2TZTp6UlcZw3Oeza/IyZjIl+lWPk3j
	SHDAmGc5Pb6XgUeLUaMEYZq0e+FodxPIzfhVJsOZMCmNt67LKdJEARiX7LuBZqci5lHYnxbcdFx
	SgbuJ9GZMq6nn/Z30Bdagw1PPzHYQRXCWKBCp3U5amc1cJ5piNaDCIKslKpSGQL/81zUAdOQFGN
	kKDSpSSqSl0+8q4fTHmjmiYLS7q/sTX8fGiFbu8bG9YEfxt0tPpYf0BNhmHiIT+ov3pSEKdvse3
	TJnYS1o/nG4Q2bdFC08AnEdi7i1xtjnYdVJiCUNzUKfjDNM6qpODje/WLmgIijT99KsKE+eNuWC
	8LJ1GrWQd7hCdiA==
X-Google-Smtp-Source: AGHT+IH5peHWutJFJT2NwIw03M3g4B59q1DYIT/LoEtkCOPQXGJ34Y7jqqGK8fYeQz95JAJJR7gkYA==
X-Received: by 2002:a05:600c:609a:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-442f1dd31f4mr70973345e9.0.1747297813006;
        Thu, 15 May 2025 01:30:13 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm61866995e9.11.2025.05.15.01.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:30:12 -0700 (PDT)
Date: Thu, 15 May 2025 10:30:11 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert ti,keystone-timer to DT
 schema
Message-ID: <aCWmExc45V4ciTdf@mai.linaro.org>
References: <20250506022330.2589598-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022330.2589598-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:29PM -0500, Rob Herring wrote:
> Convert the TI Keystone Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
