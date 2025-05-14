Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0A1F4C96
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747258582; cv=none; b=py5UFd6iCz4OrsB8ezuo11bW+Z9NECK9wNqpnLPkbtQ3cP5uOJ+bUQv4yDRJR68EFleUmKTRO5NWINMtPeVsPnUVFPxEbLT6wSkcJ0KkTcjaZQBS57EBDWugaW2eglTKV0j+Bbw5Q3RH2NAR+p2gGoDUialVIN7/Ix4eS+H4zC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747258582; c=relaxed/simple;
	bh=FIQf+pI+HA3ZvOhS2Ssnr8uj7ZeK3pm+nL4eDCGxlqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrWagEi28vB6EKo0MqjwZ2fl7Y4dy/yeqFZWWoVY/8PHl7Tibv4RhOzTfuY6kjnTRsSA9NkiX+a6QDvgv/vx3G09a9hfCKnG8fkmcwK2rzCjv1+1yROlyB92S2ix4NCma28sH9Njs+C3EJqQkgT1MmsidGul7vByDpNXL5vIDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYyLmtMP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYyLmtMP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a89c31ae7so355014a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747258578; x=1747863378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5+DNS9xaFvD08mwIBHjANTPXx95oyivENI1zztffOE=;
        b=UYyLmtMPK54BzLMgE8DTWk6rdQymQIcOE1mibvWA3wpYgakmUraONacQi3t0YUQnUc
         ENBwAtd7OV18xWW5PmXylm8HkC3zodN4JmWC19AEnevQibTkIyHYju1t5O/MY/JVP84p
         64ZGzq36QUHk2mf2Shol4bVU4/TRQf0xn4DWE7qNFgOZrKXCYqNzpSaBAk/FEf0rzizO
         wtPKvm4kb13QTwhazJayS8y43yg+ZrgV0/1CGiMgWhOffEbJ6Kn/iGe4ml5sSk4uqNGG
         l80fPYp38i4TQ6s+SF2pgrCGqujzCj0LOhw8HnJApNB61aYqjfoPIJJ2c4s3uq473i0S
         wVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747258578; x=1747863378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5+DNS9xaFvD08mwIBHjANTPXx95oyivENI1zztffOE=;
        b=TQzCUjBW116RD6/hw2H3T/MjIom5Sb5d3e1bhLM9oZ8SkAaI0MiCZdcgQYNUAvUOrU
         e49GLkiHUYFWJUvO4TCQ7UvLFVIutFPMSzNU+1gdTIkNfvFbUs0LH4/kXDvoxX0m5Kf4
         M7lXSs725juokdMYq6peV/dNDeeKxw2IW5FUoqa1ym5B32KPCFE8Jz1bbDM8r0kN/sPj
         VTVnfP7zruhtzuu5y1j7YIXG9zX0gSdKFzIuSwFfuJKzIgmmGRv+xgGBAtznlPfLh4jJ
         HTZ6tc1M2EPuQnjrdnABbGx8BOOknVEYxgL/X0/CqjrOproNTNdP98uFTvzkJcpKD0jE
         fQdA==
X-Forwarded-Encrypted: i=1; AJvYcCUF0f2an8BsRoRkIqz/kiredcoc5pu3vqGmP3GnEWtExldWTpCGfO7fNL3a0Ggs6eijlBH20y0pJLCY36M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyYklOGb7aHuLScaJ927/EZGksBnbbcTkFGHEJddmyEBkpW3F
	78WrzonwPRn7Sljaqz75/dq5Xmcq0FxHh3QgeEPYzm6hH7sIEJXY
X-Gm-Gg: ASbGncsIAjH3IMjL5X0PEyFeT2qXE60yQ+fhHM2rz5Jbv55WDAs7AzHN4TlCet52HVc
	pwHxYYuvGzUm6Z/yWjjW+twENKhEM0mHDKWrkx3QQMEUHU01HelN9GH8HQIRxeqzvXkhLd172oo
	fzG1eD+DBe4FBh5+5qilXd9gClaLh5bcIHyeT3ZXziEsPxm0r9Qo+uu0hWmfJTJ1tNlu1CZSELG
	6SXX7mj+hLgpKu7gIHdQ6FmI2UAVaxYJ7tjQ3eUxrfWB2UUKwJhg1RwuNHsVdxHoY5Ji6TOMEyz
	Hpj3sxBYKVKcI6+uWSE0las4NvsJs+nQzVzr3j8Ay3LD7En+62X8cFQXv2BTnXFvhw==
X-Google-Smtp-Source: AGHT+IHOlcKTEqpmbbwYa6fymXr66iLa7UzzLeEx4mTbWzk9LmvInpwWaQApBbo8ZP8SyJLL2+etOQ==
X-Received: by 2002:a17:90b:1c09:b0:30c:540b:99e with SMTP id 98e67ed59e1d1-30e2e5b678cmr7925932a91.13.1747258578130;
        Wed, 14 May 2025 14:36:18 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33425194sm2026770a91.14.2025.05.14.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:36:17 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	rk0006818@gmail.com
Subject: [PATCH] docs: fix doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK in amd_shared.h
Date: Thu, 15 May 2025 03:05:11 +0530
Message-ID: <20250514213511.380890-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a kernel-doc warning by correctly documenting the enum value
`DC_HDCP_LC_ENABLE_SW_FALLBACK` in the DC_DEBUG_MASK enum.

The previous documentation was incorrectly formatted and incomplete.
Updated to follow proper kernel-doc syntax with a full description.

Verified fix using `make htmldocs`, and the warning is no longer present.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..ebe0caf1fda4 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: Enables software fallback for HDCP locality check if the firmware fails.
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.43.0

