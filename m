Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494CF156C6F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745035969; cv=none; b=fRQc7Elg9iWmR/o+Jl36j+bUlb/HH27U/v/Ox8RXAPm9b8fzkWwlJlGyJUBNF2NymNTKEIXY0eh75lW4n/WKnyxg2HPr/mKRBzUk3UiSydZHNJ/KAcq6PVKMU/cRF/q7O7YCyLu33LOqAwxNpM+tH0JlYqY7xvrCC6C1qnR3xv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745035969; c=relaxed/simple;
	bh=r4P4faQo3K4Pk8DLJe0/hmSVY38h4RWkl3vibJhDgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXPGkJxQfiR5MkgPtVGqNYyA2qIbRwon0sKY8enizi90n8UOPCy2BiK4iS5gSPmC07X4P+JJ6mK3/MVoDj8GsWMX7az4IRWnn0qXPFmm4sJGARYIwljbUnrlUQTQG5j73HXon5U5iHnhXz8hsf1D2wtZ5RXkHEpUDimPmP6REKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hix307o7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hix307o7"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so1599203a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745035967; x=1745640767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2EEU4lAECRnBASq+mrLLeIBt7peza+IbheB4UcrfQE=;
        b=Hix307o7i/7tN3O62Umr5j+VQHSUCLaP6P6e208dF04QFCGYhzLkmgcQomVkmFhtuD
         w+H6ubZlu1sAjZb08e2Pwn1P+Ij92VksfsmP+Dy7tHGFXoGtRog2GgpsW3nHNHbGxGRz
         6/1RezSeBywei34RcHTQPQPtlEqZArel8gpIY3Vx4Jshbgm1tcMDRmM0QZFXmdo7VJLj
         ToBHjPizNE4tpsWk96ydCctv6+imG5T/lhgwjorxHeZ8BsBKcbztTa1JsBn1NgzwLSpV
         Hoh+3wEMMhXg+o++LKLAlbHapDpCdFqHVlRvUsaxgl9Ri8icUukvCQqDYd+D9PtMsS75
         2Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745035967; x=1745640767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2EEU4lAECRnBASq+mrLLeIBt7peza+IbheB4UcrfQE=;
        b=i612+es5yTG7UvedpYRgxB6zvPvtqKcokVVHksb1cv3uP0x3GyFDy1ISpBHhfDBx+V
         tXD8JdqFyQ8g6MeEdxJqT/3F+HisIF/8RcN6vJQbwCBEzU7kj0Zv6l4WA4AHlU/1lqM3
         KrLaBYEwOxyyQ/pmNqMlPkYfVkW0PXyFua3Oa4EfbmKmRxynX/XtLUIF/nzwBCqzrlp2
         zN8MvGw4repw/6Yk5C7wNeBC3dqLysbdXtOjjMLAIzKSDi1eZbuy787vSN27PO87zhXs
         9sOCzApI2Jk1GUcreglvsO9+BjmAqvFz6oXxhxVEIBNf33O1MauYKhHGkdEb9lIIhnQq
         JOTw==
X-Forwarded-Encrypted: i=1; AJvYcCXGP/MGZ6hZbiAkNtgzfmzKSfoI4dXk0e7hnMiOIAR2QX0uRWYP/4dAU0qT8ikaMUzr48FWolffXF80sV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HIgaBM5y2nG7VGbT5w33ljxjJL18PxoKs3YrwuqkwdvKoS3+
	t3TTOHXF9it6kNPPZVw+NtgyXjWC5vNA8zSGUc/hp+Cvap/KpjrI
X-Gm-Gg: ASbGncu4OwHeyeuFDS5GtBvJp6ZNkuYM48vrdo6402/a4SbguOJVsOR3HiI21KRir1+
	h8yX/pEcCLSsyVcaXk1jMR9rS2VcccvzFes/xpIppuF4rLEXnMlyIFlM0L5G3l+OWKVBL4yVcla
	7nZJSFiWsw+Q2MsfumeoRP0zTHFKcBPIGDAmsH1yU/k1geBjGWguezSjBwW7UoFHPyal9deUBoO
	zK4it4weRehPrLX9IE5jOmguqz+0sj/YqMDx5P4qLkRvvhqBNrlnKkLA3CP2jTsF8GkjocJx9vG
	xT1jUDLgi3f44RJsqiOvTgi+Riyxfxx1N4eI0/ZRSTvwF7OETjVRdAiuMls=
X-Google-Smtp-Source: AGHT+IFueTZgV/3cVROXVf2/9ezTnpmIjBgGyIsCuJh58nnz8D7r00Dtgd3pGYWX5jwTrtUtU+MweQ==
X-Received: by 2002:a17:90a:fc44:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-3087bb53f21mr7425566a91.8.1745035967512;
        Fri, 18 Apr 2025 21:12:47 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde283sm25296545ad.6.2025.04.18.21.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 21:12:47 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	asrivats@redhat.com,
	Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 2/2] drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
Date: Sat, 19 Apr 2025 09:42:10 +0530
Message-ID: <20250419041210.515517-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419041210.515517-1-tejasvipin76@gmail.com>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no remaining users of mipi_dsi_dcs_write_seq and it can be
removed in favor of mipi_dsi_dcs_write_seq_multi.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index bd40a443385c..0d6e0d03d802 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -416,28 +416,6 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
-/**
- * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_dcs_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @cmd: Command
- * @seq: buffer containing data to be transmitted
- */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                               \
-	do {                                                                   \
-		static const u8 d[] = { cmd, seq };                            \
-		int ret;                                                       \
-		ret = mipi_dsi_dcs_write_buffer_chatty(dsi, d, ARRAY_SIZE(d)); \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_dcs_write_seq_multi - transmit a DCS command with payload
  *
-- 
2.49.0

