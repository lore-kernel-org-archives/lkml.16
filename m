Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE1293452;
	Wed, 23 Apr 2025 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435032; cv=none; b=eM454HH7mYt1o+ND/SFG0yFgtxmyWZ10LBVaDYarp0ZvMxMSjxOSVE4pYAx9YXjJ1nR6JjyXnrDkhbBATbamLnxESt47BF72q94MB3oRrfu/e0H+UNFfi2QuSARIpC987TP2SONN2Mk54JWnxqP84NpvKOT8YDIR5QHeye/vbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435032; c=relaxed/simple;
	bh=xiAk+ddYinxUgC9Hz4BM5RvVJX8mskoni8HwaHWzwjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3QSYFBpwt+okhlgvAPFbzySwJjUYJZTOgCL8sCI6OyoLaJhaGC2TUul2iE26MD5aJKvV+y1x8dnoVGCdZKprylqWFdwXoVQgb0Yc5gM7VuBj+FpRnspPl6xXP3MxoEF5CIDoMQhAe31X8AoG4ygaYC74q+5v3Gmv8+hnSeP7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/d4vi4b; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/d4vi4b"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a070so2587711fa.2;
        Wed, 23 Apr 2025 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435029; x=1746039829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LuhtW5tfnv74ISfwTqYLQ3czllGmI8LVC1e0ZexWu8=;
        b=Y/d4vi4bqi5aGsGTBdNJ0BmmuaER6RjnNjdrT+xqDxVRDNS6I9u7DhEG+r4xe2hsk5
         1j/PQvSaspGhY4xDGZ2uEjUoU1lVH3fb+f3EUSx50TmrF9nQwHTQNNyz3hNL/8EAEueG
         A3619odp/GRXsglK3A9MrD32bdqn5SgBuTzZEUvXh0Xs/w33X9bUNT6yQ5tzVP9LUZnD
         turdOoD9QFxhXMUsXCm2xUf8ywwjISM9RJzgrWru25DAXc1ddZPZ1SuxVGbEzD2zNUIc
         2PKSdeq3+KOuOrUY797rmGDlaqH+q1R5S0qSf+FwdqUcMRjrXV72Zh0SJW6kjfUasGZp
         k+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435029; x=1746039829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LuhtW5tfnv74ISfwTqYLQ3czllGmI8LVC1e0ZexWu8=;
        b=OIZsDJYdHUKwso8Pg7Md12E5fA+gOMr5TDqoPTC3b8pUEm4cTomv2yJ8NieNlpNidq
         MHD/vJur9UdokjeNQSUMaEaTi4szHMwo+C4A3xMIGxoQGjEtqC8fy2h22wds53vQ5KDK
         +dQ2M4LnslCumNxsAto6XuBMQOrml20HEJuIpHaZsv5Waoc5iNC4NCIc562ReK6fZF2e
         RQG/hJXeQcuOvslIp8/m6lsgWNGcmKNqKUSgoc0OFz5d3waqRnpqq5PLFoMXpSPqso2H
         qq+SVD4Wqs44MBJAvo4Uq93Ca4n/PP1ryz2z5sfur9Bj/I1zOHM/8w2zG2XrLhk4YNFl
         zBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAo5GQhVTJUkrDl/DBDVJSUxjOyGKZcuo5vOofzkt6CbEF0XIldxLg2pXpudhZ0u5PchciDlj3aP5K@vger.kernel.org, AJvYcCUDAu/FDWr/JL/NSeHfR97DVmQzSsLOXCle5wsafBnlvfhG6VPyV2fykgEl7XMbzNKd+48b0LUndK8TAYY7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7mxaDFhCNPtCRz0i6gqncD1FmmzFKrIqU+3j0Is2P5XkVqAbc
	eDiNXX4BgC+JyLChJ1bEarejI/5TOqy/ryYRjaIFKiEyZrtM/f9p
X-Gm-Gg: ASbGnctt2QQWrcEv99WFRWWlK4nSOjLWClPnfqJpTaK69f6OoDyDpuoeoZemtRt6W6o
	nCQn0FhlZKd6Fpa7y37xpXjUJx4xWaMufMGqS9QoJRjEFGmBs+FYPsoINa2FWXdn9HuIPCiGnXd
	mvPXrdyzTxbIksV5fJV2TaMYGLWrNhX2t4bjx5tOEbQbBrj6OWUKwN4ZaUuAuyKbCrTzdvNCGCP
	b5UMHFkDxuwoLrSFyITHsDMf7+RzY6kc0RW7H0GB4cwpxfcTuARR+yH1jKwvI2TmV4kmtnEkRb6
	5OIoEfVXEuCC42YtMwPvkDGlSXmCgmi+f05z3z+S/SINzoQs68J3aKyvW1m3f8ZbSm/FBruJFbL
	RJ27cc9EO
X-Google-Smtp-Source: AGHT+IGMbEsjVQru0dx5wwlUTch0T9ZdZNISzut3C5NNKy3xvn8oL2J1bLuI35icszl9MyIYEtlSkg==
X-Received: by 2002:a05:651c:242:b0:310:8258:c09f with SMTP id 38308e7fff4ca-3179facac43mr325291fa.26.1745435028622;
        Wed, 23 Apr 2025 12:03:48 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm19475141fa.97.2025.04.23.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:03:47 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 21:03:22 +0200
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v6-3-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
In-Reply-To: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=xiAk+ddYinxUgC9Hz4BM5RvVJX8mskoni8HwaHWzwjg=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCTmJzO7f1FM50qHzchOePigynZ6h4tldEcHZT
 pucZGMIZ9KJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAk5iQAKCRCIgE5vWV1S
 MnO/D/0QIfSBBND3WCKgBt9NAphpk4C8PUpI/FuAsIH+cSRoeLmswfuINaDDP62Dh/zgSs5N0yy
 4gfcs5eKnF2VFLHzTo4O9JUmbTj/AYD4BW+oYTg5SVAIn2KStcNFP5BsqXkU5GKLX25TKaBYbbJ
 g/+D0q6Sy6dhlHVXyNEGRhMBJur6635+4Eo86Oz9kF1tO/Sl0giRCtY5/tH2f40TMnhp48Kjo9A
 IQfUKPp+qoKOU4OSI3ei6IDEiWhg7eULVEj2sjbNUUE7HYmZDQA/p43dGLM3XsK9x+achvTp9nR
 2pdDw2F2lcrzYpT+JJi5WBhZNZf0t44xi5rugRFabIQh6ycIMHRHm5q99JdYI4tgVY7Dm+sgjxd
 JlCPBPD4o+Hn810j6Zkh0y2m2pVOoe0EG3BiIfvD5waTnU4MIVDg1TUGHVFMOXH/7nMN8SiG84s
 n46YAIUxTQGINeAc0z3kV8Cn1ivAphHfGB0HqaCVSPOSsYD3ssr6SeP84+R0gJbb/acyukYveIm
 s1AhjZv+sCnYwRvvvCbbLhVXmCRfeUZYz3plzbmIKUT064ecJGP0R+uczOfwc27HIGhg1GqnP5K
 pvap3cJIWh7QuJKtT2WzCbX+6MnX1Q6DjCWsf09NprvxkdwtBQoK7zDvWCY8Ce/WWoPV6+nZNn4
 27MLGZ9RisY3llg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 251b1f3d0e9225f79fb500f563f35a21510090c6..81b81cc68ca2482f2965b801693ff8a43bbf2053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7682,6 +7682,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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

