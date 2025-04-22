Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DA11E7C32
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307893; cv=none; b=gT+mI7kzEEMzxtqIzjj/0yTAKyefhubSAayHI3BIEZEfiA2s9Xz9dAPBr3gHrFjjZmH5jCdIwYFC5Zhsbl2EzwBVPICmqfeVtSS9Zvj+LoJDtYfQe7dfq9Djz3eO4SADRx1mCcAAYakG/NDVTxX0ccEw+2K8lZkXJ8J6TNnG8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307893; c=relaxed/simple;
	bh=5yz43yL7k3tfBxAmtI0zYzcrPR23DOuFrXMUCxKyO3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D+e1rUhiipKu5zF/i+KcK+5YsmGt2C1yAZRdZvn/kluClcvJmrqYPQbG6Yt7ku4cbQLQqOyWElqAmV35XB8EL6PBxqKtOSme8tWwOwuQ9nKgY/lVbIGKf78mLeEiy+DKsAvL4lzqJXtNsIU4euSh2cQ6PdK5zTvQG2W69KErphI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VY9c+Gan; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VY9c+Gan"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso52507595e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307890; x=1745912690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgK3a7wLnoljW2o1N7kchVd14A0Rfs+vpaS3Ag30LgM=;
        b=VY9c+GanrN7+b5Z/ZQxof5vvHUydLVkNJ4LQcbJOjkABiRyBENElwLHHEcc31LLmOW
         24TTtl/mLXZ4FwqxKm0eAegOPQPQHl7fuSjOgq1OmLZFoiy5gMMg8Tte8FeCLofdzfJu
         byJ7iIfhvQEbsVYsrO0jnIvgDryWOD3uoqes2YtLiLqwXWMvvpW3ra8gtzvoyjrZNFvW
         +XQzLXeTPytjNH0Ulcr/buCvXasG3e4R31aEMvJJ03L+M+szbh9jNPxQZGFo8BrWbaQE
         +6K+7kooNJndU4vF13rRGzuDCx5RRuRmbfAQlx/+y/FZyb9gYk0UQHrPgjumuMDtaca8
         esxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307890; x=1745912690;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgK3a7wLnoljW2o1N7kchVd14A0Rfs+vpaS3Ag30LgM=;
        b=PBJTcy1tJQMy26Q2po783YGSBL88gr119WpWIqbo3xzr+PfiN8Y7J6yqSZoYbkGM0/
         wbcZakY/QFGNIBoom4hchUNNH8aRnS7gilHEVe4qn1hjdygxWznk+4GoW3JxXj7brsh0
         ihssM/ni/WD03VsMLMHVz+2DD8sOaIqURS+p6C1AwK0kslz7FB1KaKUwHi9J3QrYp2eG
         3ISGZGuEviBpXndYxOSlVgI2uystNW+8Oa6j6gb1SOqbNsbP7jHgJ77WYVhLajrhXWWD
         cPO/aJxruOfcUDLSG4EBiaQLulnbhASh8NkFPPmXv1m3Q6pWanXfQD8jOpcfR6qJnJqZ
         5zrA==
X-Forwarded-Encrypted: i=1; AJvYcCX3rseMXcJnkjWlZ9LZEhYVVcybYsVx/7QvMb8dK/T3cw48uDu45CliwwoTWTAH/rEIiEtFsAXw0ton4lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSjHYG5JQQy0Uy48RRHqceJSJOBKX/Ap2qxh5FfKNjRouBaMx
	qfefmnVoYCj9BEyDU65DtirMArp+u3ddVk1A19sovIh0AJ73mzhXLoqz6LlRl6Y=
X-Gm-Gg: ASbGncvOVqcZze9AH1sZJ1tflgFHPvX//v7zl9UgcYkCMfb8I4gDFD+pzcuOwbUlL1C
	aSZa/lbgraE2ReJ7mTljlWXgbcw91ue4nppo2Txp32KHDStTyFIeRDqh2OWFEsGLLdUL1HGJDIe
	Q57/N5GygMI2NuC/7MlcNc3Uv2uPSJkWN5GN36A5auoaCbxo1dMo21RpxxOP2W3Xx/uwhlEr73l
	McnA5zsSec0nMLOfRR23HDppgqOx9cd/UCOg560naT+A0B7YxFblWfzGE8Zi86511S84EEVNKM+
	fv3k0aMXSJNXZlxN40SVux17e2sgccG+rzLqJDPdrvLaeg1KHVwjeJ3ANqb8nw==
X-Google-Smtp-Source: AGHT+IGLlnDAxBOPlwHZaIDg6mBq4R6Kpd8YZK+9dm41VFGVOnrsjJ4xvgJsjjZwn8EYlnSwLGHSqg==
X-Received: by 2002:a05:600c:4708:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-4406ab97c6cmr118259525e9.12.1745307890356;
        Tue, 22 Apr 2025 00:44:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e38sm166628775e9.2.2025.04.22.00.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:44:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@edgeble.ai>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Hugo Villeneuve <hugo@hugovil.com>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250417195507.778731-1-hugo@hugovil.com>
References: <20250417195507.778731-1-hugo@hugovil.com>
Subject: Re: [PATCH] drm: panel: jd9365da: fix reset signal polarity in
 unprepare
Message-Id: <174530788965.2868524.14547275141165599808.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:44:49 +0200
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

On Thu, 17 Apr 2025 15:55:06 -0400, Hugo Villeneuve wrote:
> commit a8972d5a49b4 ("drm: panel: jd9365da-h3: fix reset signal polarity")
> fixed reset signal polarity in jadard_dsi_probe() and jadard_prepare().
> 
> It was not done in jadard_unprepare() because of an incorrect assumption
> about reset line handling in power off mode. After looking into the
> datasheet, it now appears that before disabling regulators, the reset line
> is deasserted first, and if reset_before_power_off_vcioo is true, then the
> reset line is asserted.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm: panel: jd9365da: fix reset signal polarity in unprepare
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/095c8e61f4c71cd4630ee11a82e82cc341b38464

-- 
Neil

