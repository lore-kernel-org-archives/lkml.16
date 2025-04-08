Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07814261360;
	Tue,  8 Apr 2025 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095905; cv=none; b=cTS0E4RABbwEgmEVWu1k2MQYk1REOrDtkAS8+DCbYpQkWrPcRTL/tB/NZvaHVO7wYSTVAJxW1fRVK5IASPd4IWNQwM2qPvWVXyTBXJAFXjSIgw31i/R3YAM9G3rbdSsmu+tDE+LCl3WmWVllm1U1gs5EsiwLe1sD6UC+I4azwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095905; c=relaxed/simple;
	bh=YCGDQojD8nya6OBnR7iagaQHAlVaXzUTMmVsiIk5blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeSMeICr+ntXjNdIzeO2PpFDfCSZA9Ts8Ov6CJKsIMhdIehylqccrkA3hhsZoiLLGq7/HmHtlOXUcHABmKDmjwu7fXepgj3QwQKLOqFXAZFNAPk+hfsBNCFK3KFl244rb3RtvkpFRMRILg3x6Y/+fky/YnRpucY1GncXv1qDF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLXn6B/j; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLXn6B/j"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c461a45f8so51166551fa.1;
        Tue, 08 Apr 2025 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744095902; x=1744700702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
        b=kLXn6B/j00FfQm/HeFGKXD5QtYhE7Qs0tBfpyccMCeYH4EqY3+Zo3piQ71gsx6DLXQ
         T24z0/yWlJ3ZdNsHEAG7/RLyTa7P/iSxclGjT/A3LJrAtSJLhCKPgunUJVZeIUUmoh0A
         qClQLFn5yzkeZTEYPcU6z/g3u+e8R3fxO6nyngTbcrv8mpn9PMxv8hAuWSXkasDnuGiR
         vUJ9FuiNrrtnzfkNPEv7hGDt2+WBOEHbUreE5StpzUg4hONdR5N3ZYqKSHFOgP+qDC5c
         qYVNi79Cl6bwN0/RpKpox5LrFNPLrhCp3cvPrD+c6NaCcsnwqKbynGWZPGcqy9VR7oIR
         I67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095902; x=1744700702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
        b=d/35hNEUP2p0izjT44I+IBCG8npJtrU7T3w3LuixL1NBrkhc5dPKe2azA+BGqabuTw
         ZL6VJCvJ7YcqD6FKqip8yUpgtfLr/HiZEJ9p/nhgcK5BVZ5dDPBlvD3KvWD2Py+NeEjJ
         /Kh7J0tBwJDJip0BVWFij9W1xkB688BtPe1k8O1m4R8MY5Kg6LyrAR7v3/zltrGJ/YKw
         bVEJLRm/zwthyisla0pGJJcbKHSlH9bPy35pq1vfE3uglgpKNQgJdu0Req8+k6Sn4QKi
         +0gPeJdpXzfl0vS5OPgmAuJV9ttd2ZW/u6OpwGbYsLzcCygO6rLK6xt7aIut+T0GpQCO
         4WhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOjKKBPzMaXLpmDMiiD7Rwpht7QENQu0HQvKFrXaqkAleS4Mz8H4vmDLyNLVUF/s6LzmN6grK72vOflEAK@vger.kernel.org, AJvYcCX9j1Oe5lCul70arN/dIYSkNOY7DzhCTcNR2QiBCGzLxFKoZKhk7jk/dIj7tSmDOzaJxKwuvzIATuho@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4usDNOuNb+DOgoVguk1cVFmZbSI7DZahy1HwCe3/47/edUZfG
	CYGgBPTpolJ/vsjcCWeXeU+HD/DDnGHfwj7QMWwz5HVUP1CRIAJ1
X-Gm-Gg: ASbGncvYquUKRGYfebGdI6KEt7cHWPk+QrwhvAUZgJM/l1b7M9Qox3KYOfOQZ164iaf
	nrtg47f8AVNwNzIOtn9D66RhnlN3fXv2mZ6epIlxuXPrSE89Ji5NSJdClH1S7ckq2xL9s2CmFJw
	JBzW9b4s1JvNRuC7QImgKMQKX2Qr5P4vjOAr5CsKiLeVF7eJ8DUFG2gN6S6G4BWlHHW0W0cetoW
	KISPuUfCYa8FRqs9P95KJ0b6Ps2D4eKrXLH6IMt5xy9wrSUlKFHKpueMA4kSqGfKZU28ES/JA4A
	twa898aJduUSyoyRl41mvHCLjCY7viZEpBbOC7CHNJxLSTdmVLDYNgbBa78/M0chQiscVjhm0+O
	4NiBm5Hx5Mlcd
X-Google-Smtp-Source: AGHT+IFweT18OMKEwMuPZL1sAyNuy95xRHNHIIz/+725Kq7sjzQyRwU4H6VFXOnMdyuzO5rCuDw9xg==
X-Received: by 2002:a05:651c:989:b0:309:2ed:72df with SMTP id 38308e7fff4ca-30f0bf50394mr40218871fa.24.1744095901929;
        Tue, 08 Apr 2025 00:05:01 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcd37sm19252841fa.76.2025.04.08.00.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:05:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 08 Apr 2025 09:04:30 +0200
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-st7571-v3-3-200693efec57@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
In-Reply-To: <20250408-st7571-v3-0-200693efec57@gmail.com>
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
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn9MqSKP5h8IxUt3tj8KSjZst0/DK3ePN4fRnIZ
 RaulY19LpuJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/TKkgAKCRCIgE5vWV1S
 MusgD/0Rm5O0xsoOa0hrInGGh3xTpRan1/qYSMbzqbntwNtFVuAJS2qFMQHUzjRRo876g2wBhrl
 tVHdOa5Mws9M9WDVXV9gl3Y3YUUhb3A73bPu4fcYFezB+l8EKIM/tWCkccAAEdurADlnhlUJT1g
 9KZ433Vf7QjooRYWXmrfs0V2RVyLwKpwtYsncODbhn/psZLl+OCjuEUafXaVUOAnN1HIQgb1vtv
 PyTZKZ6ksGEdozDboo9Y6HU2R++4LO+3ud6mfg+g98HXE02moXFB0N8d8UK8HBfh7OrqNTBcP5a
 kCYoRxhFCvXIy98IT/aE3tlC4O1kvV8DD2JoXLnb6mWFqfeBxOm5elx3apa1NNaE/xJgXVeDA1x
 ZsDYD5aJ5ph61JeRqUkxpO10nrVKxVnSWvfQKkbOA+/ImL7Fy4jcQ1s+YyinLyqWPRJf3dZU5W8
 rfQUFJ/fZla7z/ZqWEmFCm8Rj+zua78TXUKn7ZR8lNmngNo05TuBSkfwmp0NAJrLPz5mNZJ2Z8M
 Ogpc71FndO5Ay+Kx8xbmF+69baWDWfoA/WKnsmZKWKbsn4EhNRQPm4mpFcXdVvlu2poBaudsBCy
 53CRD1jqvNzr/IIC/B5mzSoY9ts5CJpzUFIRrUEYauwXGnHa/AQY4UsfKlFyNH8uRNsOhZcUEc2
 QrrWkW8xBQ2fjnA==
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

