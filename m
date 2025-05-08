Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FE27935C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720006; cv=none; b=rwFBJF8Unhn6O7/WVRMTQ+uFzv8/eFyoJeG2d5oMussurluLMMjjHdJKnVnF2bLlhIdg3YYUF1jnkyOJZh9WFZgDLMiUtiB2M0fsnjR3XkmYf7b4v33PWc0CP/tCO3fZJ0Q+wD1f6EjiHSUQih1UokP7uvAR0fKr5eF6BJVqWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720006; c=relaxed/simple;
	bh=Pg/ij7OhCm2tYpKU5R0gaI7jIv/pNM6ggm2h6aZ7CS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UtI5CcWsj/FlI9+IRLQtwd4GPbIjtx1sMkCOwJUBU+fQWamjrMGcKc3aXlr4fkT9aNBfwJxybQD7dg8puy6pxta6z5umIGlj74Mv98NK13knsGTW/hds1NCAMalJLNbPDWm7XOeKd/xZw8lBnAGJbw6KyE71OkgVZUKUg8gtiYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKVgbcpR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKVgbcpR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso8193485e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746720003; x=1747324803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lto75e4LcteqoafW12Fg61u3EViZNOc4137QZAwHJ4Q=;
        b=MKVgbcpRPhCK8PnsWhVH55YnvxCPGdZiPJ+om7sr3lKnTmQlhKx/IRWY8LwsitH1UE
         Yz2a2/hugaJZe0iT9Drt6AITZTCG5xZf/vLrms7HcMCM3apWV0EOHa7Ih+tQ+huNBtlh
         86JBDCLq+t27785tA797BIerrwjPbPbfB8VEe45RIaVPfin9SL2PL7/caqv0ly3/5OLH
         2Urk5F2m9hbde4HGfXj6RlP0IdnYVoIMNxxRcJjiSaZlabwtwtH23miIXtU24mCc1Qyk
         duiJsHra2UxftEfjERM05yxEvWBlo1uhsec8OxDF844RHHpH9j13VXyaM8XfNIwBSMIl
         XjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720003; x=1747324803;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lto75e4LcteqoafW12Fg61u3EViZNOc4137QZAwHJ4Q=;
        b=r0tGqacOIHqI7mLNXIjBAWUc6BbQ6aBgfzmRkFDGdSBiDSnIAkf3VNntWSo7kQVrXH
         DCuHB4k0JjJ/8dVApb8D8Cp2OvVlZ7MmXMo0JPglR7AfGyvRA8a1UaDhoazBHKS5vikx
         g5Xez6VuWCeHAEBdDts+5+uhUSLwzOhHvns3oXeTx+cDaxSgaLUQxxpKritUubIiGjX7
         oBtwt34SQ7cE6/3ncmKHfWXCS1adGzAHTrNv5aWBM/qixEoRN3qR4FaG17jS2jMQUNfV
         eWHtsSY/wxKCN5QZy7HdOaDI1LIOzmjSL/JJys6l/snKNQ8T/rEVpL/gdI97lsMBgmF+
         O9mw==
X-Forwarded-Encrypted: i=1; AJvYcCWqzfQvYbsJcKzJGMZ6v76WIIYIZFrxqabyO44qlq0ySBZ22lZ+nJBi42Ac/4/MLWqyZc8LT+e7JoXw0S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzI0RlcsyuqoafU19CZTqv6/wFUDA2Z8qsDDhcXOcABhddcMU
	QCN4sQ7MvqCONwxWVtBW8hVhJV6aTBJf1XD5EY5VJf+FEuoYqzA32JMAtkvVUrY=
X-Gm-Gg: ASbGnctxn/kKGioCpxoa7yqzKo687klgT3kfy/aumkR/GSHC4jb3V/ZoXVIJgX2GonC
	P+D90+4e9SR4APgWaHVmUkOEwAjjcCbov87b+JK7oq3OiyfwmAcmHLvyKXRePWP8dnEwXz5N+Hw
	HitAm0mC5jl03UbivgQGVA9ZnVEQrezCvnFyNR5zQ4lSAdA7HaQCn/2edS7LFXNUNBI90M1tfWF
	TlX95herW6I92kLK8tx3p+/pxzR0cMXjR2oMAA1yZNNxjKRBoVCUwITDnggtC5V9KW3xqHgKGOB
	IZ5oariBGlpMBShzxzS7TwU4ds8SamkL7ICg3ES2ATG3d2pDspPghOIU7XPtSA==
X-Google-Smtp-Source: AGHT+IHGh7pry40R1R5S0vzwYBv9QiYLXrctllxajG/Law1YVfbMcDbFKmJfKNCqz30hlRaA+hAD2w==
X-Received: by 2002:a05:600c:a413:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441d44dd4a6mr61912635e9.24.1746720002650;
        Thu, 08 May 2025 09:00:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d676ef1csm43535e9.0.2025.05.08.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:00:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
References: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
Message-Id: <174672000196.3610792.15233043209666142507.b4-ty@linaro.org>
Date: Thu, 08 May 2025 18:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 08 May 2025 16:34:46 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Use devm_drm_panel_alloc (Neil)
> - Add novatek_nt37801_switch_page (Linus)
> - Add Rb tags
> - Link to v1: https://lore.kernel.org/r/20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org
> 
> Add driver for the Novatek NT37801 or NT37810 AMOLED DSI panel, used on
> Qualcomm MTP8750 board (SM8750).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT37801
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0311e0fd07919b4b8ea651a632eedb0e3f9f540c
[2/2] drm/panel: Add Novatek NT37801 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4fca6849864d78e55f005115c143257e6566c89c

-- 
Neil

