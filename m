Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8947F18EFD4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748666; cv=none; b=eXY2r3PkvcuUhts4gtTpSx2nGbDSNXfOJxAMYhF7xoP6rIf8TWste8xbeMFqyBsZYHprKj+k1XFRqCFCP3LfD12yOUxtP2No5UyfuNyV+tPRLgpySczVZIsyWzC8VnRkwY0CmdR1HmPK2aMP9OAahyfdniMP9xBWk8tAXzAJt9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748666; c=relaxed/simple;
	bh=A+EYzZLGQHIPJ5VAoM/+3fe53Af6CgodqviiAM/ONBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOkq1AKqJTVs637+LFYEDiA80A0iPRYdOY5y5QxCmQgGdnsjBtlPFEZAI2KRntpNYtYEzNu1irypbAuwH1SRhwGrkq+i8EHYzk7bbpHT81/Yj+W67U/8zqPy/1zDGo2i6Gva2+3aCV5rJ3MKwHgzjENiax0nZKg+Af2s57N0khA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SuJ/HdOA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SuJ/HdOA"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bee278c2aso29076661fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748662; x=1744353462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=SuJ/HdOAi0xoPXS9rZe+WQUKD8sk6tvc60gxsdCvKk6yPyRLSIriLfMCYqg4Pj5QCk
         bRBW8dADviYbrFIXdIk4B4pfV60J/Iya7N81NGyV6cqaVM3rPuDVWu0owhzQrEN0AfaZ
         mgs2n3FNuXkaStTViPf0gEZOm9Kty5v1kr11Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748662; x=1744353462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=oYWj3P40oOPN66mpc43qRsX4jUb4tPK89516vUdsA40tptdq08eAmiSUchelqVXOgK
         tc9ne9Dwky/K8o8gawugki2zwyHSgjjKwJYObMm5JDPv5lAPVHbOXvR0/Dznsl99qZ6i
         JdJzIqUkL9A/4WKhaiFaLPTOoACJyVaiajeoUsmCi8PewygodDkbt/EGpC05ECTCUCip
         W2yiSCs8bPUux+OZi0a8EVSgKH1M75XMahZ5fBOKmEsJ+iy1jR2Ng1EhYkH2EhRR7aBX
         gUVKS+9SMgRDHEgxA2zVpZHoRoSbCC/WNTdgN792uDLj/XqU6mjRq+omTK3x1jT87f4R
         Vd7A==
X-Forwarded-Encrypted: i=1; AJvYcCW2xnK6wwwaSml42Gf0uMZhhnQuFAo1tVyFnABT7YMdlKf+lMe4hThdHVdYVbGZuCjkPKcZRJvLlTlQbHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz3S62dRSAdhPAwqr/1zgN53mvtNv61tSPXIeU1A6RT+6KbK+
	MvejLdENdF86aFYiVj9EntF4TfgcDJ+RMjairMgRHZUFeICVvshRjTsRTZFQZGtbZtc2d+C7G34
	=
X-Gm-Gg: ASbGncuoAW2ENMqlnEl17AOvdEL/wHtJ+XeIvnPcBJkbe/vcgZzSlL5sOaIjKTUO1MW
	EBvcjyVxrE430DexzvrBwEQuEf7NtuotZBs+HWgX2FRTzubKCdibVTyxaDQUi9YUduut5SFvvg6
	f0zMNnT3rpzrq+5Pq0Owxzp9kG7MzzVEpU6J0aNkl+csBtNXpBSoi88tQmJkHjaA3WUcRbIwsFs
	Q0jPI2nfw3vdVZPbsItY9NHLteflNX1k8GS663n+GOL5ccWsn6ykW2/Pgy9BbiJ/Kf7McPkk3sH
	lx/c6/9XkkxQYcxXWmpSVKr/z8RAdm2IJPgyP9DVvjRLWAX6g1peyjFIf5AXX0zbjGsO+rHIN3o
	gAtV0PIsjvEQQLiTlLJwL0LI3fbN01YRUrvU=
X-Google-Smtp-Source: AGHT+IF/wt1Uxur7keuKQbSIAvPFmsIoQlSPiqbrU44NDcgTLn1iSIA3tNK/AaEw+pgVlogdaFQe2w==
X-Received: by 2002:a05:6512:3501:b0:545:4ca:d395 with SMTP id 2adb3069b0e04-54c225afc3fmr610345e87.2.1743748659727;
        Thu, 03 Apr 2025 23:37:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:35 +0000
Subject: [PATCH v5 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
+        never copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.49.0.504.g3bcea36a83-goog

