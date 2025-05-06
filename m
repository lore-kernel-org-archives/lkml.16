Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6C825CC58
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534658; cv=none; b=kdBxwrKBKIPxCXpvGtEe+xfBLQrdkjjS2QnRifdqYDQXTYY6aIHP1idrI3zBfHLmASRwLhgkZwSKbHIFUkVEuzgbtMqNldQ0y6Gqp3EqfK7VIskBck+h1WDwozakpK+WnMQnQc6Z16PCkqWylheArAdlfeX9cT86CwbNQO6QojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534658; c=relaxed/simple;
	bh=+KZf0cG7wbYIf0RyH4LgDDujq/03Q6WGY9SHhu8O7rE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eY1WYFeymK61yhvpbgYutW5Djo+Sn+1rOF9PahCEQNCMbEP4utLcPy3qPSsaAy6nULO2416Qs2olPSfcwK9BScV828LfoRG5DZM7msQew5ARjzQkDxrWNROi7fNUwyaNkZa1Zgxw1zy0rix26v2y5pZBYeT/zSuI1daOnIbMv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1ANCDN4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1ANCDN4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d1ed827cso3415095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746534655; x=1747139455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7IBsGQwGYgPcheDIcojgL5LMCifVqWhnKTxheDU/Zs=;
        b=n1ANCDN4Uq3X9jWGHqlN+CstDRYAeM0280BGvtkJLhDjyzAhGXXxZ9EG2ZIbn7UmlM
         ElF9sg8+TsKIkdWdFqtdO8sldmWn2NBP6pWb4vLAQV9x7fBvZrATEMZ53KSi+8CL/7eE
         8chqXHxLu1K8WbPa9XU2OzT7KXSEJ5V/dvt6fc7yAOhVPzvqOMmXGHh3EoHI2qXwGqk3
         BP9bhi77Gqp3zSQWOG5fBHsnVTMmN3kgNAVkJ9gqSkw1/CvIPxKjSUnJ+JVyXZWoIPcD
         XNG0rct9ssklRjt2aldXmqP2xR/ZvNJL0SwPq+cQUOd6b69VV7F46pd7REuTz0iWT8Fz
         hm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534655; x=1747139455;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7IBsGQwGYgPcheDIcojgL5LMCifVqWhnKTxheDU/Zs=;
        b=l/zj699KojXgpvU4h9Cjv84dYfTTBv085yd/B2c3uPEQHDgiOZGhyYVsN19yY0nSWn
         ivKZmCzYXbDZmJejueiiewJMwNmegqyj3Hi2Dlgk17qy/I2uB+DAIBl/gy9mDVqi0L/I
         EhZTU+k1gu/9OvVyIcHEV/sXU4CNB2Hc+I/Ho4rBAKa9ROe94NbYbm3OB1lOjWAM7w55
         FK0o/fgs7UnL5EQPr11hqHi+pqmCeGkAG85ViHE15aoiLIz2ZvzH5jrdQ3jmqVQ2Y/zN
         HEeVpSgC0k1f4QqNiqbIWTtjT73TeXqPUu8KpD0rJ7ix0MFnV5RuweoF1LWJE0UBFDkh
         Gwgw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Lh4jHdSU2zWqceBlyIB+hoi6qC0BTjtBkzJks1M7J2DP8jX/ZQV9fSdLIafI3DsOH753HhKGU2PSqKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3fw0BGSlfXsQw7bgLQhVp76N7D9b6mnZPc1yiHZ7J+4jPlcxy
	ly+IdqNlnr1LFWDkgfcD2ya3VDtvt7KqXnXYTq3RwY+fejBC+eKa+zUQ/OiAH0E=
X-Gm-Gg: ASbGncvuw1wFK2ccoWIn062R70BdxpAd4+zJIV+iZULdAXgwFyX1XpWS1jQzQxR7yp6
	N9YCff7Gjr38aX+gCyL9sQldEX6A/mtNDOGkOH1a/kSYg8TwSGG7lzd4t4MhduVUejEkeIlPaaX
	aaSX+MDoPKe7l8p22BIK7pxYwGIsGEJ/nBm2g7uGNRu6AANK681j5B9xV+ppWeNn/Yj8LwQCE0x
	F5fcVWxDQQwpvdZJwOoeymiFATFCSvpdoIa3Pr937D5Nfzs7+u32b/4T5mGB/YQVjPozPRvNU6A
	S2Iw6/jzrh3u9o3u2fdg7wf3Ys7Cf80buCwI3VBt6ceNG2s1VTS8QaTywqVvkg==
X-Google-Smtp-Source: AGHT+IFiNduezl2ORHpPQhoDSRGna6T9OnPBxShMP1wby802ouYlA9QnFT7yGrjYy5zvoNLkJmiZAA==
X-Received: by 2002:a05:6000:18a5:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a0ac0cb0abmr2175514f8f.8.1746534654686;
        Tue, 06 May 2025 05:30:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af32a0sm217429775e9.23.2025.05.06.05.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:30:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, 
 Kevin Baker <kevinb@ventureresearch.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alex Gonzalez <alex.gonzalez@digi.com>, Thierry Reding <treding@nvidia.com>, 
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505170256.1385113-1-kevinb@ventureresearch.com>
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO
 G101EVN010
Message-Id: <174653465377.4169673.5902707474315665274.b4-ty@linaro.org>
Date: Tue, 06 May 2025 14:30:53 +0200
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

On Mon, 05 May 2025 12:02:56 -0500, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: simple: Update timings for AUO G101EVN010
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7c6fa1797a725732981f2d77711c867166737719

-- 
Neil

