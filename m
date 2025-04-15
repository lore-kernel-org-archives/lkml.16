Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D543275102;
	Tue, 15 Apr 2025 05:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696773; cv=none; b=Q614ULSsaT+8idnYsBXZV6TCtHAJRUCrmURt6Wafig4HzpW35N38RsEzWJ09CWqXqlmmkxkq4LwflcfXxYJzlftNnULfxV94dyp9QdUw463mleCveXdiunKK5+1yttDg0W319kKspSskwZJFQMlfuvAsaUQpWnEbTU5X/mCKIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696773; c=relaxed/simple;
	bh=YCGDQojD8nya6OBnR7iagaQHAlVaXzUTMmVsiIk5blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/tcF6BX6SyI8QRUQ9bXKJIpjFviZT/jrE6JYHzfYLbRUCkgQ6QCflH5hXwnSgrL1rTsd8yC6qplH9Zns/vWUb36vTNQ21sIg+VwhplGX6rhMJiMUy1oK2d1mRLp6J5hknWhZoXeJ4NQWdg4thBWq5YYWCd4XHx2OfyjHJdA9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKLReZU7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKLReZU7"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54963160818so6312784e87.2;
        Mon, 14 Apr 2025 22:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744696769; x=1745301569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
        b=GKLReZU7WnFEoUJd/VgjnuXFMlrMmTiI7dnP3xDNRcRsd7Sa73Hv1bWTIt9nhU5r24
         ioPLn0SEOcqnum5XMVmyol2JsImvaNlfEPDXTjh2AP+1tB+Bu4tJoJaNszhI1IYAO3Pg
         L+MyTnPWHktCXkZd8O6rb5LFpM8auCVCKOmHCb5eTseDLiSEf5qLcmnDVH0d20VSdt2o
         vE3KQER0c1lwo1k4rzy2PAjubGSAdkPBgZlHEG6lLMAfsmSJ25lyJc7ycHSSz6mBiRpv
         //KZovYu7iwLB9wio6EA+FTGmnZI1J8/2eywDYj0V5fOehnfHp3pTHcdVLiu2ZW3QA0D
         nsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696769; x=1745301569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
        b=h2aAkGKgiV5JyzLQHyHst5k3n/2HvXvVuihXkSZbyypKyp6+7JkME5sI+upQYtGiUS
         3x57YSoNcxeQlfcxxa0tguVC1aLUFga4w47kHqwOa3JuKHsuNfqOmHDMC5ZSwQ7/JZsk
         iUJtAd8FHwziijYhpDyQ84O29LQCg/axypABkKsUCv8uIE30VDrpKD8ZJPfBrlENYDo3
         6MlZEvLs0WkPf/ngA/gQjkGsR6NT4bBF52TRet3wce5/tMyIhoKF7N1lgdqcRDPkEwq9
         2H7LYzmBntj5acyFn8PIQWE4/7UX4SlhuPrFVEcX3CHdI7+dordn7WOOlVtDZeOJUC4i
         3X/A==
X-Forwarded-Encrypted: i=1; AJvYcCX5xxqZiWf0dHsW04OTPx+IsPc45smDTYb/pYGhSwyMIwMnCSsD9zxBa/zB5yssamT+YcoMbgGEnvby@vger.kernel.org, AJvYcCXFGtED2QvGDG/sM1LobheFx+1WNFcU4Zs4MFCza3Il83Qk94Pv2QDCJdeMcpbOsInrX0DMsyDJMP5D5D0b@vger.kernel.org
X-Gm-Message-State: AOJu0YxUoRuK5Ni4CJLWSvg6a9WEXVSzwGQwrs1hJrreu9fFZFfZtMF4
	rgQffCoDdbrgqekFjImHlzMwp5Hat9RO9MVhJveiSZF72Rv1cyZR
X-Gm-Gg: ASbGncvDgx6Krc5Nfxtcow/1F04OHmfk1wRcKdZElxGLcxrPUDMsnH3PQ2CTvvJu7Pl
	Gv0dqQ0hWIl5CpKEGC8J614CU/mZkhM/4s08c01KwBhN6G2E2NdKNxiLP1PCR16wRfm14cCxLax
	4oYjy76sGfE/LbNpH52ziWnSgO5Fs0rrqMxw8W7PGDW4A8xna1KHob/3dxsqntlC+tPyfjVUVtO
	SxKaQ84gZNDoNtd857cFOC5pEpJrcNhqCgSelPCgJygZhFyI8SfHNciJy8qVAwrNquKyiUHEz/x
	frKS4DamV57+wzPfFWcyf3EkHphuyihrGNeI8RS8S1bAAoBTY/zgxi+sIolm+8pYfbqAFRnT+u0
	brGO70FEi
X-Google-Smtp-Source: AGHT+IGGzEQ0x3pZhLyULvXchSuuoFv6C+TX/Gfsfz6VnJM59lAdCP1QkZD/hF7omLQChyBq+YZF/Q==
X-Received: by 2002:a05:6512:31d4:b0:549:9044:94b1 with SMTP id 2adb3069b0e04-54d4529d599mr4513847e87.27.1744696769363;
        Mon, 14 Apr 2025 22:59:29 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238820sm1325471e87.80.2025.04.14.22.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:59:27 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 15 Apr 2025 07:59:00 +0200
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-st7571-v4-3-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
In-Reply-To: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=954;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YCGDQojD8nya6OBnR7iagaQHAlVaXzUTMmVsiIk5blE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn/fWyrMfUB92/ROVnDkWUc+Ca2lw8TH4nKiocQ
 rcfgkm+rE2JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/31sgAKCRCIgE5vWV1S
 MskLD/9Rk5p9Za1MNvrLcfpl/OYBNzjbdp8PdyTAWaUyo7BsYlbOEiZT32ea/LGn33rzskoiZcg
 /52tYVDIPkL5DfuHnWUsQtOc7AXfS4JiTP8sXUWEIu9Vq2zB2y+vPQRoxWEQWE1v4kM9yj4CLHK
 dSoA1YEsiPm6t/VgHk4jzv+anAY3odpFM6Kan7NcgckwWkvm+z2OjdLW+7SzJI6wpHphy1NDS0J
 /f/NXyqehGSWM7+Zv9VTZ4nYsP1JDSWjV3fbugFXVapbNXCAfZKvIhDT7Z+AoDyOg31SJW9mhk+
 TsTxgZcJcvoPnTGconb7khHmlDIY779nB5uPI+1A2rG/ppGPHjfWEKvDcJ+vMPDGZSDTzaTxIa3
 eEVyJjhayRL+gySkGduS+NGuCOTYd1LeExF/8ZsDBhLpmOv08Xc0kJlTdvKehqpey5KD5ldLw7K
 rW20Eaoo2GhIfgCB/u3MAtgpix2T455mEgp9gafdhBJWsVVMb5k9CO0om6s2gwEvKBWw+tymfKU
 ZA/KHukpf3tbVE3AsUyq9HkXSkBro2rXyeVHPe+5BnM/Cmvo7M5p7Z/bPrnu+LFUOS7+WvHqgG0
 1jS7Br6tN6pKTxo5qHq0d/uCL7g8TczQcHUQp9NRX6SOw7pGcKR3uhewoWV/slJ41KluqF7iKv4
 /PKK0f8O20Cpkrw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.49.0

