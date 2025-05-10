Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816332638BF
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839936; cv=none; b=PNp5R6cCU1R7r1p327m7Ivfz95jhyuwSyEjUhRpN+pdB6HGl/qih6arUo4lIyhgEyPSv78nJvtwBPiqQkjQ5w3KjFBwZqdqqNxg0UlFHNV0eoD+KJp9iOn+frV77ujP9FrZARkx0xQTWThwb+4qxjXv6qBlr/aMFFY3XBQgcjQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839936; c=relaxed/simple;
	bh=7xbc5LKo4AePgyLxenx40mfDo6sufo2oJ0TAz8Scl84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ValydzWYti3LzM/E9KAQvhhEoa4j9NYkN88tUCb2vkzHjPuWKbdk+DrZpVRGlUUTD7dZ3NoDAqCMAZby+abQMnby7yaIXyRaD6sXyUTXa65bVUEwScyNypOlBFetHZP5F/GyaWy6KatWCYUeVYluUrCR5HkTYTpNYxxlFjE/4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr4U24i/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr4U24i/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso12433125e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839933; x=1747444733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=;
        b=mr4U24i/xpr7EFo6yS97H5ycRo/SS+9vkPDlDOfNBN5zotSrwWMQix/TLmCvjhXNSu
         zcM7xXHvQLpjUBHB+Np42YBHBt4USjx2hHPMDaeWNyzVZwEhmvadmmFfb3IDKk656z9I
         uwGRFA7ZOPPIL16uR8XbE4oJnMXQAY7eDf3wjbqiJj1S5BOejgNe7t3HQ0KE231EiOn8
         4zEoMPQqakL4lFaP+gBO1Q9qUhYSIKygurqgK0REjJoErsHRlYhMMOz0gQIOq+OA8e6o
         UXPrpOy4MyTHn4txrdazePGvf7zazzu3WMLuXvmWERhSog1pHqpjjcioSTqsK8f9IGB3
         YETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839933; x=1747444733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=;
        b=PPJCT0SJ4fz0f/4KtUdj6rpv1Tch35413x7+7NnJtVIjzc5H/9w17m5kiDccLVqfwo
         koj++JQWWtz/LoeJi0LqyiJJfR92Y5Bqkn1YKBF9Z72lpNdwnQS8Q4lcdetI2OjDrKt2
         wQ5D5FPNQEYw8YN7pkCeomkR53GRQVDdCjzbQCZGcyizVNMZClq3w7aXGvRmgTxAvBxp
         WvajOP5SmT/hYlMvmJQryEp98GY9oOsJmAr4xdUQleEvJg0PzF1ZGajZa+ttLc8avqwK
         nedhEvkGmyvdHcVC3mHtz6GGfRQ+Hr3iK2vOYPiHNFw8gF0K+G2ssuhcsRhfAk/OXpi+
         NHdg==
X-Forwarded-Encrypted: i=1; AJvYcCUlnMv0/+WHyTzF/CU71+FH9aRhWgT9xCrwKj9drKricnn0DpGh1TJQ2HP8K2gruyk8+Aa+cwFcghD0ZlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4QTD2d2IoBmlQln/0uUnKZA9dseEuhxP0pZIpSrPwoFD7xai
	fc6ROKopKgBRLImrHj+DQkEt78zOx00m6bb1XgI7iw0sfS8RwlLb
X-Gm-Gg: ASbGncv1qwcyy3gzulze81PYd/3dRjgRudbrrhEOOt6gO5b4BjXrZ2ZXkGS9aNTDqeC
	CS3CTm+y0sikYSu3CrJl5jNKcj/walf+MzANCDPDdC3QQXS0kaDFW2G+VlaJA3xaBJ4vKhUnDRq
	Blx57a8h/8aRAzS03In4FYrlH/YpZbDLTwZ/2/Ys5ybx6uHiG9V/MeTbxUirerJGgomA7iz6Muk
	oteU9/F3iHKZNhhLB/HDhoTUsSImSxbloBeV5k54zAhtaZ0miaR00c84BUW2pn/HPK6ACbajgIA
	uojz6fDCXI3vF5ad8lHcZuQg6wHPsdOXz6P+XwfXPeQAibKTjebgdjDIf6kin741paNAzXs=
X-Google-Smtp-Source: AGHT+IEE1Is4hilhLo2Uxeuzo3FKadxXFaI6HwNkhnIT+gx3/gSURBsGdbp9t8C674tp4Acuwl2tmA==
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr54963995e9.3.1746839932479;
        Fri, 09 May 2025 18:18:52 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:52 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 2/3] ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:05 +0200
Message-ID: <20250510011806.13470-3-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..22edc6d17520 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -13,6 +13,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_MULTI_V6=y
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX31=y
 CONFIG_SOC_IMX35=y
-- 
2.49.0

