Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE01DB951
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379534; cv=none; b=OttJQwJ2CJ5Sb+nC+ssqwqoWiHrIh+D/nofXtpfhwzTcbQDzPHFQd7g5NU26m+Glvln5V31YFsOP6LzTi8SONuyEI5B5U+sZlizmr31Yi0NimtzXHcUTrXb9DYrw53vYm55lBBhBKuM9dsANvEFsKgkV8I3qGyvMLJxLr27jOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379534; c=relaxed/simple;
	bh=LLUpa6OoFpwK/QocB7/f/ssBSF18d7TH01+hJNejA2Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L/pouFQdORlCQHNpv5qoQc5Yt/bK5JMzvDmDj8tF5Ia4i1dqhPSlVQVyZSi1JQu1kAV+b3Mcqbh1joEnsFo03WlHATGddwH6rJe9vqWGOHbxUtgQmxoNAGp8Fz2r8SH2clh/klOC8zjVcZKenfH44kDH5nd3BinOdmnHvJ/q43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DwAdDbM5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DwAdDbM5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so3896395e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379530; x=1746984330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nftdTmO05SB8jR5Xb7BUqAjqS2OUIEJt/PoKCc26nJ8=;
        b=DwAdDbM5JMl0QOKDr9DdI6knL97aAAZRY64fHXmMhhxG5N5IhGDF16UO6IsZVzm1b8
         lKsXupsFZZFF0MOuomjs42sYPSIb92rPw+wdesYGGNJTpqZHrzLeU9WPM9yBpouA0Ji+
         z1pwhsyfrhOQTwuyyFE4f1GJKpdtCtHKvmbN/PMSaVni8cSmd9eYw2PqA6AJmawIt7nI
         7YLfN/QjdbvoD5q9SbuqwV8tDA7wpSCkuFQ5kEfQY5c1ArwS4BDFa2O5NXgQCXIsV9TB
         ig/YF4thUeuplfYyAqzIY4i+A30FncwkVGHPB1+c1MZgE1e4HEl+j7Lld1HdCrSkB0vk
         hV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379530; x=1746984330;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nftdTmO05SB8jR5Xb7BUqAjqS2OUIEJt/PoKCc26nJ8=;
        b=St9C4WIsIHWavAzLkzLL27GwmzTz+jnURqbOGI2OmDSPWGswmeLDy3bABPomD6+CJ0
         mzcyFsah+D4yxxWEQ6VU6/y8vMamaiuvFZkkTS+UA1p0B5fMCkS2Ltty+v3hTGky7ADd
         MCNtE/WITmIXPyXpW3XY52kOnOQ3Nndr64iXMUNR6ZVA5qrW8lL/92ojWhSMA/Uzlcnk
         NYCal8SDp9o3lBurPYVMYzbDhwByL5Aa0rfsQkaNkZXvfv/NcKIZ033gczGAhxAc1023
         8WOv32h6qpHlBv1B1qHQQRQLPbnas8+1L3U7XRrSs3Up9moBgGqncP+O5Iki1rHxlPjK
         pXuA==
X-Forwarded-Encrypted: i=1; AJvYcCUKWyHhypvDs53nvqD21QrCLznFi6linzqP8FUgC4b4xtc6VUgSIIjFeci90fPwbpfya9edL6vq6Fli5UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkxOl+sZ2W+Hu4rlux4JesDPv+SWHVLsVBUV5ha4fdBPb+VU5I
	vXHf+iy4c/OnTc6oBU3wLIbkA+FExlPDNJt5SAe7kgh9RuIyTeVUjaS/Nv1KHS8=
X-Gm-Gg: ASbGncvVunjvuEvxOa8YYvgvgIJzeEpiIdhDsMaUkMbCOUjicv3q3FQj4VGkNKJVYb8
	xvu9imfz/v7cYYaoWdpY5sP5f1dvgbMgSIpxF3xwvoNfMaYdVqTFc0g+GGTuTCT5n+2puYDCG+7
	miclRynLLGc3HWoKyeelhl2meMj87cTZYDrbJvlWY042UUuViRj3MkupJDjKMewoKVDyoEjJB+h
	cOCqRT0m5o+SEu3+1Qtk28lAj9cIt3USqz5CGXdiDoN8VKGFIdxcamnDdmKIVSYSYpG9TRlMrDQ
	+ChnGszAyHW9wYchSJWG/+Z/Cem8FB2wTs5YqWy4mXDHn94mz5OWLdzgK7Q=
X-Google-Smtp-Source: AGHT+IHYxvC6/SbBjRB3SVOL7PO5uHXZWOYurYW2a5R+02/GlhMX29rSr+LzjDeYnzALWWnO129Amw==
X-Received: by 2002:a05:6000:1789:b0:3a0:9538:8579 with SMTP id ffacd0b85a97d-3a099ad5a67mr2224721f8f.2.1746379530154;
        Sun, 04 May 2025 10:25:30 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm7896332f8f.71.2025.05.04.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: hwinfo: Add
 VIA/WonderMedia SoC identification
Message-Id: <174637952896.102764.7995048226726382118.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 03 May 2025 15:52:31 +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoC's have a chip ID register inside their system
> configuration controller space, which can be used to identify
> appropriate hardware quirks at runtime. Add binding for it.
> 
> 

Applied, thanks!

[1/3] dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      https://git.kernel.org/krzk/linux-dt/c/04e394d6e2a349d0522a6afe6db22f1f1a843e3a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

