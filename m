Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89E28ECF5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298084; cv=none; b=u8B0CubxVOEv3D2GA9KdrFaBQU55Yr2u7Ybg8UNR417wLLk+aT7TWgzf+5uRqIYYU+KKJTv06ldWYa15Oexlr+VRcRD23u76FGlGJ8nbk5jO158fVIDYyZCTw6yX6zNK0viDQd+GyAG3q160N3BB0Ov4Gvntt+2R7Op/8x/UnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298084; c=relaxed/simple;
	bh=kcww9wBiqPSzvqjPQo84zSy1NaSjWgVfuxgtY1ZQxPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kLZws3GNFBycmP7Ig04M+g7vAz/kTot+NUd5aFyrqQrREkw5n2Kw8S0opRaniOnsWL1GGpYzINHXeD2fmAeN4UhXV7voj9lBonfVPXzt8x1VkZvbZ1GZfM6UxLnUQXSMp5FAxkv68GpIiJDRiSYacXxMb8ycp5VQJzjsRHjN90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNSd9ir4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNSd9ir4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45377776935so26547105e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298081; x=1751902881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z60LJpeCsx+DQYSsYPaFihy+XtLiJlbKQXXW44rZ4Q=;
        b=sNSd9ir4fAyl0rZ91Wr/0Xkf+sWZMVWK3JiieLEsXIk6gJ0qSzO0bDad4v3R1ZXRxy
         ezH6g5QtdmdjjmVkN21juRU+bEkv7jvQxtXPban7PjDNFIIHN94xNGDCqpcbhM9+Acpz
         eEXnxahb2lutxmouPdyPdXwfliBRmEleu2NHEU9vrS1OkE5HOcjHnyCto3Y4FhDPAFG1
         xjHBPwLwpn9EpIN8VZ9kojxXrb7QtDbYP4JGJEGdUDdIQVusx/4GpuwoF7N7myb6lxV5
         zfVD8HPoiwNE1CdVkHT9f/OObKp/av9zUewcA8ITLKiLAw2N1b2/KG7FiKp0gAGl+sXA
         C2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298081; x=1751902881;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z60LJpeCsx+DQYSsYPaFihy+XtLiJlbKQXXW44rZ4Q=;
        b=ocNS80cwn+OzYFePEdsDR4OM7xeQCQEpymROioxrah7koSeALmGEyAjEzO8s+pnU7Q
         UWs8PFC41VfLCiGy71IYk97ZmeqG0ZpZMWhphiKeBJkRkYCrCRzDIBeNkgl0BN0NmFdo
         EctH+RSHHvHMBBCwpp3DxdJXt6v9vXAYJ3KbaWnc8W+ZEYlG0wqKuTXAIcAYqv9Rdkxw
         QWMnE+c5cg+LrW2d4BLnKdFXWUFqJvNq6V0kptZuHUeByA1OvX1Q+kazFT+5YXxk2AhI
         sRlV/Pd6r0oeoCBsN4c1Rj1lpV22XvhNQZzSs7rfg1ZJtHVpi1qmIPL0wKK3g3OQlFCw
         ABEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU48qRxRtU4Gp2LGoZc9yE1V8IHsCp92JsLf6Z8a1CSx/37p42QHhHVL5dUjrRiNxvQLbqPUtffO+6/cI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy129qWdBWVDGgP+KWSwybQ2Er8NPigP3Q3YGUtZqBYCyB3ith3
	l2bSYYNiRTV/gHx4mEseqWmfKFMGckbq/S5PJWj6BcioIqWzAP6dR0b+sbtCkn3DTrw=
X-Gm-Gg: ASbGncuW1Y6uyTVPrK5SjharxYEpasaZdVnT1VtNTWEJaM37IkZaqUgR7m+IBwhmCfa
	xD0m/LGpWd6VRZC6rhfK01aJZtor/6zHSU7BRJuOR9/xVsp27hkwwmBFQYAZypW90Siw+zxxA4S
	YTOlAVk2Q1kTT8Ksydw6wH6SXO80ByXDn70R6QIhvQjmV/xe1HJnLy8TEVaxBwQ7mfAqP5y7KP1
	G8EA7ppNRau5hR+wRQAheWQfgAo4MuiJWQ/gBMbH6A28/q/lcLkbJiRW5DmqUP8OnOk3IFpIHAL
	FNSqi2u4c443l1Gc3a3IIHKUAjlnT5etaPrp++HL0/Kyv5FDkZHjOZvYr3HqntuMvsvL7/15ZAm
	N9X4nVsygRBhVitglGQ==
X-Google-Smtp-Source: AGHT+IEwZYeQq7R6iX1m5jsexMwhCGBbiitsk8fXsOHSKTMoDV4VyRKhA0M48JTMKvtM+bpQkMOr1w==
X-Received: by 2002:a05:600c:4f16:b0:450:cf00:20f5 with SMTP id 5b1f17b1804b1-4538ee578c4mr147054525e9.9.1751298081295;
        Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250618091520.691590-1-andyshrk@163.com>
References: <20250618091520.691590-1-andyshrk@163.com>
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Move initialization from
 enable() to prepare stage
Message-Id: <175129808078.2286551.2035019384518524281.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:20 +0200
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

On Wed, 18 Jun 2025 17:15:20 +0800, Andy Yan wrote:
> The DSI host has different modes in prepare() and enable() functions,
> prepare() is in LP command mode and enable() is in HS video mode.
> 
> >From our experience, generally the initialization sequence needs to be
> sent in the LP command mode.
> 
> Move the setup init function from enable() to prepare() to fix a display
> shift on rk3568 evb.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: raydium-rm67200: Move initialization from enable() to prepare stage
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/691674a282bdbf8f8bce4094369a2d1e4b5645e9

-- 
Neil

