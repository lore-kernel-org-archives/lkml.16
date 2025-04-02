Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84823237B;
	Wed,  2 Apr 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574368; cv=none; b=jl6M314IK9tSXzQDV6NmiZXchMtySuZYdOLC+wqJut3M05mDoHo6d4315qH8Y5TsOPDU2VV5W2mhCSvIUWrW04c0nQGMCAlBhx5y9Fuc28hHA95jSPhs9NFjZ47v8c2V51HOMZp7gvk0mALqJmbIAvzDZbJZAXsonXnftEhQKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574368; c=relaxed/simple;
	bh=dtSEtwC8H+CpvFv+jyq4hRv6iC0m6GDU67J6rIoLIGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZF8Cuy0zXJEf1/HOId8jGSp95B/KbYr9SpDDp7VsGQVRqjTUwyfTSctp2DjGKRupkNoQonfwQsZEVvBhB6DqgyJH1yVojnFhqheOPFyP7nQWC+AuSCaOa6AMkmfW+mqUxvB0P0B81EDax73CYmaLn/8knKOiq7ZzWv7QnK8hBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l20KAjft; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l20KAjft"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a04so64330081fa.2;
        Tue, 01 Apr 2025 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743574364; x=1744179164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5IKCpj0oMEBpJadgyoV7jDPfWfy4VMRLV22ZDS4/uw=;
        b=l20KAjftyp1YVogep0OVnKYKfqOvnhTY6hqbPrwMYHe5e8PnYnnAxch40aSGyc+Np3
         UlDwQO5iDmTHvcB/5nD9O2vneDHowEeEivrl1NGtKRGhhcGMHpMmMYBgXwPYZfRtYUfE
         BMCSP7tEm83kAlYuBBTPhPSSmH7UaZe3iNU2JMvzBgJtPDFHYACvnD/IVGK0HXI78px8
         VqoKxIny5+LoGjWbCnsyAa3V8PWXrnbUggDJvml0J8Ur4rzQ2RUWI3NJJcFfOxMVy6xZ
         h8sjmimlyFh++OvjaSiBDKlUH7OLaTdUbHqn634RuTNnz+sWocr0rZLDH4+wcftCyJKm
         lkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743574364; x=1744179164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5IKCpj0oMEBpJadgyoV7jDPfWfy4VMRLV22ZDS4/uw=;
        b=VsBX7Hscs/R3UTqI1vJb3Gb4N1FNwxPpR7ym6l3MvQ9z5sCLW/6WLQNGImfMJOBkoy
         8+8waDm6hQdEnAY+jNXbXV+peqAT2llZIiHO63ZlDeD+6hEyHliWcwYIcK2TqJkZwH1n
         mg2vpMZO/dUy/HXoMXWmkz/Swya44wHnkR9kvK/LvgGrE0Bqw8QoQ8lf/MrpW1PGvK1U
         iK4UR25pyVmzF9EoCRDciDzctA3nCwFzfOZK9hWkxGxSF+TkTopUqQ7SULiP6PyEdJlc
         xp9fLfkH2AKRc+IwuQcXMAWRPk6Di3ackU0ToUph3THXKNZtDVjSw+NWTZ0n/c3dV7ry
         zPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVaRCEClR+u7PxO/jKFTWTGpe2Sf3pISgl2DSkfssoXDEbLHvuzCWrSdMDfMSe8uYxCktKqngrYSQcJjks@vger.kernel.org, AJvYcCWiLcZaJxQYXpzAf5y/CACk/oa5LeoTSwfN0gllY7JsNWfXpI04kkcehKa6AhFDSz+f6EqRzSXEfLCx@vger.kernel.org
X-Gm-Message-State: AOJu0YytW+lsXm74TEkQIq1HWju6r+kTUa3ITcSqK7sIxKOdoKehxBIn
	6h676mSVTtHwYh8RoR6/dulj7Of0vu3NH/UgKGHLM6EKpTQuyLUQ
X-Gm-Gg: ASbGnctHgql5U6ffouxOPz5urVlmcMDxUSUoZmJFCwF7J5L+j58ens2HgoEGtr8Edbz
	tFjdKWCL+HUdkSxtqIkOq0cVGZdDSSHWeKHvUJ/Ez31RjspZMiYMoc5qU3LVBR4cH8d9Cn0PjVL
	g5R1pzK8Mgu6UOZkQ5NVl5MFo426hxdGD5sytZ1B4onCTvp1yiInil2OsU83zpK41Zwxlgf2LS+
	r/01uEmMkeRL/0vfwKRAyqYdAqWpmgIiMsJgygeKgxNtT3zymXbwdBYwIuXadQfxJDb3j8Qr3eg
	tx75DQHNfL+0xBoNP8jJY2KZ1RW6eWd2EbEXvuRLzyU4aGFELPJXNLdZ2mvz59yVZWQAh2uGMYp
	U0rJ9bNh7gbXQ
X-Google-Smtp-Source: AGHT+IE3Xek1eWBz2rPg/t6DOGrGPCI4yOiCOyocMpZtm9LdLXUZyNdRj/gglChvFsmeZjOHr95wtw==
X-Received: by 2002:a2e:bd81:0:b0:30b:c3ce:ea1f with SMTP id 38308e7fff4ca-30ef90f9907mr3124251fa.15.1743574364342;
        Tue, 01 Apr 2025 23:12:44 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:12:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 02 Apr 2025 08:12:12 +0200
Subject: [PATCH 3/3] MAINTAINERS: add antry for Sitronix ST7571 LCD
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-st7571-v1-3-351d6b9eeb4a@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
In-Reply-To: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=dtSEtwC8H+CpvFv+jyq4hRv6iC0m6GDU67J6rIoLIGY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVRO6OWWtMvHUt6pKtvaDRkAxJB+E4FWveSD
 H7kL6SpjMmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVUQAKCRCIgE5vWV1S
 Mp5eD/9A+/xujBrr5sGpXr7f1PH4ivOZCIFLSfbwEkx/HY65z2asgyJAnubDQMywXXS0C9Ka+L4
 OTnlNtwpzkj6QTK4v8Tc1RrTTxB7LwlhAY503AQAYOM08b0uaLIXLtrczqD4eFkXhThnbkNSGYE
 X7Jnm+5P3dVDjMETJB0ZCREBzz3142pnA63FEBOKYLWbE9rUeVnQ/zpZHuG1hM3cdNO8wBLdaHM
 fMaBX0e17nWAZFRCTCVcMnDY0hdenx3Q14oolOWJdvByY/DMB/UYME15AVwWuTxh2ybwyT8qzqg
 wpGLpQ3z2jZEw4QMkBvPf65ya/3BSuElidSCb7d4v3WEtmb7sGOjsydlAnZsUjSARc2omG0Kuce
 vIWkbqMwQbI0S0oKDdAvFF8rrS+6CjKbK2p5cHagEoRSF4YGmPj00eCA1H1HOvdaN6UrKkT/nmO
 RW58J4mBTFkgndNRg3wGZnoz8jduoDu6ZDY3oil/3H5CAKJp0OWmVCjIsncgZclxwb0YMPqUeRH
 sjHZrZC2Okl2JxREG77x142l8nWjx+4osKxPX6z6/6Azcjg+qc8PUvQ1P7XLlJHzI3DPc5ucyF3
 qzx53gR2RQeyqfZSByiQlSBXWExZaf/6/bkWrOgH3uQwIVRwD2dlhf+Ar8qXtxtpzepIyDB6r64
 xYfPdEN4d5g1H4w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..00d19d45679f6d18a7e9c9e619b7642176b7ef95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.48.1

