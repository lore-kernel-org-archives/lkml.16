Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40196284691
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415498; cv=none; b=MX3oecAFokZVvNL0ZLSr3DY8z0q0bw7G/SG0CX2E0XsVjeB2EUIq3POOzn+IBxyUaCCZ9fqi/6ow0yW9ONNxB8c24PRfLUaqQWK74OlWDHuLdH3jzSfYkGq/UrsoXYBGHTuiNd0z3lywIoUGmipKSLY2vhqiE+yRoCAU+CA+kqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415498; c=relaxed/simple;
	bh=WbYAkf28JuDB96zhXvwINlUm7Z+jr4BgOqrEfl46LOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cn5uqE46aRG9NOC8YAkCAw3dUcWmznEe8CHFMnlHVPm7ZI+Q4NN+B1Z6auEv3gyzHuqiAq2z+C8F2UEymYMLltMoPRsX3NV7BcXYB7zMBC+wmRJ3L1b6DVADv+VAR3W/mLkGMHcxsRLAdgGLtwfAavU+szH5oLe6p0Wlwp+Rv+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0YERWasn; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0YERWasn"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so292254466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750415494; x=1751020294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8TW+dnA/RLSUCo5w0FhkO5CxTqAKcs/iJjNLMWWbto=;
        b=0YERWasncf+NVmlsSfe8Cv1whAklJamFlVlB7/HIsEaUEq8YeXWyCvEjSYDSxCZsja
         bn67UXwW55iwrWuYTe9uhhTarQ6Cy+o+ThNOPy4NACCB+tIfEPtDNVg8xk1fZBoZSX1b
         ZiOruCxw2qdq6mQwTWc7e2wm1is132LuTqyp+fG92tfOhkPGVo17WnslDgb+uPeiyIee
         9BtXInIW8VQg4LjOHf4Z+4a8qHafFUPkT94nHmp34PJewSC8nw0XXMlwiP1gS4GbiewR
         zhydQFMMw+zqR3K5FlZA0509eKb+ySUXM3iOKqkDIKV3LYi+XDFQJQiI62RX3l3C5WIx
         8PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415494; x=1751020294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8TW+dnA/RLSUCo5w0FhkO5CxTqAKcs/iJjNLMWWbto=;
        b=StiSRQHstwFwM+hvrxEA3VR0J1A2l8WjQ3kU9VFvueLpcWEXX+8zUjg3thikQf1u9N
         QwVluEPiOa8B8xXsVPGw99VoLVwi9z+aaOBItbnV4Yud0u+iReNlQNynrc8eF1EDfmCk
         L6T1qytjjkKaQDNyTrYwR1sh0HWdDCu/cyeCh9kDTH5/43FXEB1zMoOAzcu9txpr9O5X
         /K5Oo6TsUVLsa68wTAFCEWeDMGYbwEkZ83Mbty5MJy66PlxoPQjia0kJn1B9mj1HUJhJ
         dMhhePrE45NTPQ1iZ54cpVC9Lmef76JkQpZQKopVV0f7IC++HtpFyzWMuxrNSvjtArzA
         0JDg==
X-Forwarded-Encrypted: i=1; AJvYcCWOOlRQOCFLQstC+NaadhSPDjcFaPiucj0DAo9I6wlG1ITwc/JAFqKMC/WDmzLDYTVnYMX6W6q4sBiavts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAmADCDkfi/JXDy5d1PQFG3GMEoUXYGCsGso/sGUWs35yxr9O+
	vwSOeXXdzRFMZFZeYyQHmL9+tDZLxMjSz9vq5MqdXL0TQulCgygcqaanQGwNtTt1MwY=
X-Gm-Gg: ASbGnctbudwFJrnnelf0sdMfTb++oMp5RyvHVRXpjr+IvZh+b8WIFVgMirBzGAbMM3f
	vohkYDy3hW6MD6OiR8SkbMCie4cBIYnZGifcteMnXEXqGNxn0UXyVMiUbKfPgxchYjKGP8y1YDb
	HYPLKL8hVNOj1a3KO4DGVvy6U7RJFRAn6sspIQ+TnuDDE8xvSoRbWlHdHltskspeFjdbvddH0vD
	LBOiG0exJGBLVvOAiw6rmmcEkWkTD4TSZmOpPbi/hlnvdjt3n5IK4vIdpm2F+wz9gFHSL8NrTAl
	iwwqKPyz15hM2SwJMfp0MT4ZSSy+nraBpZ9UfK1JDMo2WbE65OZv5mW9e1w6voKvGbI2A9vQmQX
	bbVcw9DiN0vw4HzoxudNroXR+Itve/Ysj
X-Google-Smtp-Source: AGHT+IE9P6hDfRXmnpE+5S+EKxKkHp70DsQJ2ovXtC7hTz0ZIMVcZscGLt+vhpJFn076myB8MB2log==
X-Received: by 2002:a17:906:dc8d:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ae0578f527emr214907766b.3.1750415494301;
        Fri, 20 Jun 2025 03:31:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:31:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Jun 2025 12:31:25 +0200
Subject: [PATCH 1/3] dt-bindings: display: simple-framebuffer: Add
 interconnects property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-simple-drm-fb-icc-v1-1-d92142e8f74f@fairphone.com>
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
In-Reply-To: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=1090;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WbYAkf28JuDB96zhXvwINlUm7Z+jr4BgOqrEfl46LOQ=;
 b=Y2GDVlFS+pU31aOX4ttTn8hlbLrxRlFtAH65SYN7sC9Zi1EhHz2D8Jo4kgsda6sDYGZfr6MTp
 AOzkGxhs9TXBET7U25bdMMFdcIgeFo2aN4c/Q85bn4pS2/9RgeCHpZw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the interconnects property which is a list of interconnect
paths that is used by the framebuffer and therefore needs to be kept
alive when the framebuffer is being used.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -79,6 +79,9 @@ properties:
   power-domains:
     description: List of power domains used by the framebuffer.
 
+  interconnects:
+    description: List of interconnect paths used by the framebuffer.
+
   width:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width of the framebuffer in pixels

-- 
2.50.0

