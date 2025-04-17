Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6B253F1A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904599; cv=none; b=UoDIfQaMn9b1KH/95iK6wq2nRhXMCFaALC3WqOiIU1gY14Aexd/4MkJc+J47I3Wd2xkgpvEkvBHlFL/ROTFShhXtev3i6p7UcmBugUITFpfahkG/TS8Ihv23XSzgBu9uU0WIvk/kw+KVXwnRRg5+p6GzUCsOnDnjhb6GJErBcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904599; c=relaxed/simple;
	bh=3xZTPoJDnTR2ZNrT+amq61JFizgrmqJzF9AZziFoneI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vda2+bpFqzxq7igo3ojl93szlHDf8tCSBqvnDYrIEXeONA4SQ4dvATj0fVYHyxrHG7ZHpysHAGYZEuq38TO/n3lZXLKp3v5sr5EF/mufGh2Qm1i5RGeqdJW6qeenlxfjcgG+Z0+vaJXWt5fLbHbTq09RLJFG5/zTFpUxZ2VFWhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPMBTYJg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPMBTYJg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso965973f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904595; x=1745509395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS+iMVPzLszyvK1ef5pz0a8ecHJhiCbYxQ8pLZG1LMM=;
        b=TPMBTYJgAjSzATlJfHgBwIVZqLa1xAqDVSpHmavzbZaNoUJwmTF0Dwt/NxXD7hV3jP
         jJI+fOCQHK3lf1YW91/SkUuxVlHfh9olXpe6vZZmqLgXEqQC5KnaN27cXTeQzRc9xrTN
         o1VIP+EddNy/6ds11ujuzpHR5f5iMsQKunqVx3g0MKAQEaXyWYSDhnm/f4yyW0seKuAg
         rk2LoLIGJF4L6DJHUBpfbPMikZ7pTWUlHJpHRG8FiMI2mKIY/t3klxN1aU+qwIGUKIsR
         LA4qh4iEdoCpThvIgkqK6FMzJHaa/8loB8BOL71AP5JA0MiTAzDkWledLBheC67YgFVY
         HNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904595; x=1745509395;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nS+iMVPzLszyvK1ef5pz0a8ecHJhiCbYxQ8pLZG1LMM=;
        b=M+0S1zVka4zM8hMlu7fAyC8vsMtVgkQYUqvCAX5dMBcw7rf2TEozlX6GKdodd/w+bx
         4xfnWZFDnNKKVns0h5+VkonLnUwf6Iu8YdveZ3mF6A4jsNXxxnV9xCdAWnbNXn6ySBLK
         gaFjjWj6YhNtih23Rgtbzhh9cPIsMgZW5igX/Cj6LCcy1sQdZ8nbXlmlkycdsctRZtxu
         OY38CvUIJt9xfQWOXn/XdUAVpkVaZGOShdZyb+vflQiA0YuD0WRMnNhVY2Z0X6CoHhAz
         jWhHy2NdlGyS6CDxpHKdulp7rfvgF6sZCD8tETIeyv8SRzGfPcL3nXZiae9D5dfpgOWL
         y2iA==
X-Forwarded-Encrypted: i=1; AJvYcCX9GBOd5MyEL7iQbEL10EYCQvjUqnTWhCAFRqnHyHFcPLY63ZTy/g/nRadKh9e/LDZgnm2GG+IWrC6qpKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzI9/zTmx/QDPgdPC4esVbKJlYFAIW/57GLKMhzdPjwotOg5u
	uFm8AXsuytAN903XRHv52DN0CFqwgL73//vEp77oeWcOx3wlKFzeMiH/ZawCRlzK6FfFvRkodbS
	Z
X-Gm-Gg: ASbGnctRE5Kgy50QQZXKsdK7E42fLoaNeGwR/SmEz2YWFmVIC4yf5ngQB1SAl0S1uqE
	0/5aKKCvkR4cVQ43c6CGbL1KX2fkyjEsvI+SX4B+GeZXNlGUbXIVpcO5AAfSD15pO2hJiaf+hcS
	2h5R85KRyvDRLTK0DgxE5YJtEJxEJ4Qt7MJ22f6eIReGZghnegDEJm/yf5MWV0k5XzV2Ua9lXFg
	1iycUwBi2uBNEra/xJdmwX1tqTQN+8RWTPC1HeXO+/Y+Uw2JdKezmmQBnRdh/NPVKsyV7gjRrcW
	OiG0jYSzuUE0/OMe+CkCmGSC7vcyIul+uVKZoIlAhV3Z7iW+V/iTqiF3g2oElg==
X-Google-Smtp-Source: AGHT+IGryh9t6uhy66lrT8gQ3EODPyMha/2rPVIOWr8w58yUILTFXYIOWehquSJJiWUu1ku4BKDX9w==
X-Received: by 2002:a05:6000:2505:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39ee5b373d3mr5516764f8f.30.1744904594884;
        Thu, 17 Apr 2025 08:43:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm20773640f8f.94.2025.04.17.08.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:43:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com, 
 christophe.jaillet@wanadoo.fr
In-Reply-To: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
References: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/3] Add driver for Himax HX8279 DriverIC panels
Message-Id: <174490459408.1152288.4538582198698733279.b4-ty@linaro.org>
Date: Thu, 17 Apr 2025 17:43:14 +0200
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

On Mon, 14 Apr 2025 10:29:15 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v4:
>  - Changed hx8279_set_page() and all other utilities to void (Neil)
>  - Changed hx8279_{on,prepare,unprepare}() to return dsi_ctx.accum_err (Neil)
>  - Switched to devm_drm_panel_alloc() as suggested (Neil)
> 
> Changes in v3:
>  - Added support for setting digital gamma parameters and validity check
>  - Added support for setting analog gamma parameters
>  - Changed gout_{l,r} to a structure and added a description
>  - Fixed DSI LPM/HS setting in prepare/unprepare callbacks
>  - Remove forced panel off in probe function as that was simply
>    useless
>  - Renamed function hx8279_check_config to hx8279_check_params
>    as that is actually checking multiple parameters and not just
>    basic DDIC configuration
>  - Moved the GMUX and GOA validation to their own functions to
>    improve readability
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a1958a56e52c87aea94c5cb0c08fe61ede929e7c
[2/3] dt-bindings: display: panel: Add Himax HX8279/HX8279-D DDIC panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a424c93db7ea8ffd18c6c170501bb898abf05932
[3/3] drm: panel: Add driver for Himax HX8279 DDIC panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/38d42c261389985e8dd4739dbd97e2dc855e8dd0

-- 
Neil

