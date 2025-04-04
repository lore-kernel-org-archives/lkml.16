Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54611F3FD9;
	Fri,  4 Apr 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774665; cv=none; b=SMFp2As9dmMP3WCyiTr+BoisUDM/pkJ0rip9ZrNaY68kNHavO0s6EOD0eL4nbLfzKV7q3QftEDcF5+YOVqLkvO7Z8167iimrYZWevutafsy1RJiT3jE9foPjCzg7uCQUdYfAblAZovIScM1/j1DkZPauTD+r76Rs03+oc13autU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774665; c=relaxed/simple;
	bh=odqQ1fjz8HbSFH/9v9/SL1blNBS1x7rL6Pk/QnF6N+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stuuH8uzS7Z6YwYa+HwqPT2hCS6UgAOTufgIEoEz+8y4Ldb51C3dT8n2o8/RTgksJ2r2PCafypj1l36aqCg3oxyFDCxjig+JLyMPkAIMrz9cNzaN+zJUyhhlWASj1h/bN2mD1LUcQBlucq1jdBKf5JpLs3/CHEZ6wvWInWNXU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQqedVBp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQqedVBp"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2491246e87.1;
        Fri, 04 Apr 2025 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743774662; x=1744379462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oeYXE1eEK0nqbgFOnEoB4sUF240CvHswwo7c3zgx8c=;
        b=RQqedVBpSem4jyla5Iqgjv7nYYEwXzjAprlwOsx1qdJrfmrx6hMPtyKpRE5F8wF46E
         Ov9DNAe0d17/HNpJiur+7TZtdQvaSRkLEE7fmBBp4dv2W+A/bFC1dY4AiUQUbunMD9DS
         yptp4xdxyf5lcoNcTXKBfSBeFTneXfqRkAk+DXK8IbHkxX0uGG8ewhN+kEK2MlaQlN/E
         MAlvEOq44KZHXCFw1nYeDyFUgfjVk3hsChGnQvnSfn3K+ZawLRPdLnSVgZutaC327feI
         ZI8qdO9TjjoOO9MWV6WFMGNMNM7FfShoIjZLARKlGZHUtIggYS2qHD35ufgO8x6yXkye
         X3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774662; x=1744379462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oeYXE1eEK0nqbgFOnEoB4sUF240CvHswwo7c3zgx8c=;
        b=WCg25a65IQJZHiEldukGquso34v6J5GSyYA6RZ7IGcIFC5enhkJ7+JspwzdEjxW3pQ
         H1UhU3mOM2JT15CBW5kJbw7nON6gi2GXzVtU8iKiIG2jwtcY1vz+e2x61uqYjU8tq8i7
         9xtO55lYuc9Zto/MAJlO8rPXpCX2oByEYN3X3BypwXex6c/LwvbWJS/YMaoaCaOZsWil
         sxdses71SlVFLDQuW1W8mZxB4MMJ3AvRo73GuXYKvR2NaVKFrXaHPiyyv/EKPIE8mbaT
         jOUs6E8p44eD1UnqEI5gL+C+s/VVwT/MZwYARFhpJfM3TP7jLwE5kvzIzXWTCCf1ClOj
         eDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNAdhuP+2UM6JWh0zfavKtzOxHU9NE1iu3r+V/aKmwBARqiTLnTxWuDgZDijjKKzxU4/7/nXCexEip68U4@vger.kernel.org, AJvYcCUR0prCrxXomGQtPYXM9ADTwPkpxIafejBKX9ztrXynpl5Ds5iXhRU8cSwODvfHQnH2PetAeLaGxJZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15nHnlBtKMBj/fNtrZXkJMEhySyT7cEYUhRgxw6RpOK+p+YDP
	Q9zSU152yMZL8bfFQSbzJY1+WMmdZBx4V4wF+R4dJi/Cvteojb26Q5CU2wBk4RY=
X-Gm-Gg: ASbGncuySLDrrcdjXvFQ3DtXgSu42UrRZoLPUaLnxkGjOZmLSDz4XtjOpd8oeRnrVLW
	8pQVCdShhO4V87jXvWporKyjIO5ZgaXFRSlbC4DjjaaRMh7X7OF341VPWf255qS1cytG9FL5RvB
	UrEO9YIsTo5LyvxlYDCCZzsQTlvEu1jsZoy121UOUnfDIl280exCwl6dHM+NNp5C54/xSVbHH8M
	Yc0bOkhHvWi9JMgAhw5XJuRxc71cz+qbMeqR4/gEuEtoju34ivdqaQjCI0tI8K4eTtR1yUZBUlJ
	0Bc0TUSgOxHdpJ41ij0URqH5XsO1JDtxGnbi7ERnL1diXPH+1UMJIQEge10vfhAVQuXg3s2G8Bt
	NcBrKw/O5D9dPww==
X-Google-Smtp-Source: AGHT+IEKYC0A+OIpvVVeNH+HCV3q86I0QOTaSCNFYghvEZatVGd3VxKRiKDc4eoS0KWXVEiU7uTTCA==
X-Received: by 2002:a05:6512:39c7:b0:545:1d13:c063 with SMTP id 2adb3069b0e04-54c227787famr786251e87.14.1743774661912;
        Fri, 04 Apr 2025 06:51:01 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:51:01 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 04 Apr 2025 15:50:34 +0200
Subject: [PATCH v2 3/3] MAINTAINERS: add antry for Sitronix ST7571 LCD
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-st7571-v2-3-4c78aab9cd5a@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
In-Reply-To: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=odqQ1fjz8HbSFH/9v9/SL1blNBS1x7rL6Pk/QnF6N+E=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+O7/dA1u7aRKnjw6v3db5mxgQbrWUlUP9vgE
 4r8qX5FcXmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/juwAKCRCIgE5vWV1S
 MpcyD/4q8hgZGdDxFkgpIrAFE6ODVzre4mi3fTpe45o99a6PX2GMAHLSBepOd5lLY3Dc3hY2FLZ
 p3GMptImSkppxlb/YZbH6uRzksUyy/1Iinx/QpxHW8VTa4AJnK04Os4Mp5uOcwMd+6SweW/E6ab
 YFr4H4WH0TRBTHXo7hLnx0iqqqOmZ4THTtxJs7EGhBuF1dn/ioNK2tfYx9xyUMXd/ouzyiMl/ig
 lsq17CTKtqD27zULsC+hJr9jUCpFbCYUKs+vlHh1U6oiEGogux5fzg716px5OhOi1vvIkxWTC1D
 NqSEWMB/kYzSKvx2LhXY3C1S8ZCBof11zTrEtUNXsRKfvRl5lPcx2v/+doH0srAmsTBbT1d+y2c
 7w/gXse04tJT7lmPdVKgT379wB/f9VHQx3nn7FuB9vz9hx31MVIGsLQfh2F0ZPnkLsiaJC/IHmy
 vCfihSShL2kA/sJJnomTBHz1TLjMEC8Q5UlqxbAH9PuYb2FmLSTPOKDm7Oml9zDtg7QThJNWfCL
 qLfaM35vVyboldv/b1M77a58/bFt+1GvcUtDNcnK5mQkPmOz2UbtDnbDQzf2hJIfDC25BYGOzGM
 SoEFcgUaMa3TOUM0X1vMtbi4PDL1Frt39iBe8GOSwl3AQ7CKMlOKTZE+M+8EbDdS5Cc/nc7f67M
 PyVjW+lrVYuHZjA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

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

