Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B914601C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745084848; cv=none; b=HVIsAQ1dPwMCBv3PJ3o21CSfRRDlHaPZzo/O/JKc/03UckI/E5YHiaYhpk79adfukgNSu63hWoVFI6qKTAu+tXkFlqO/Ii+VE43CHSOowjOgH+W1VB2q7Uw6Xn+GvwxFIkwzmXA1nCIyTqkR+zteeA8daGGY9gOJrd4wH5WW6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745084848; c=relaxed/simple;
	bh=8rdRVsiRgEQBAfCISbqGX0xI9hmN+uhxTp3GrzN2J9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ohdYfvkZeFIfBlENm6RG6ys6dysmpo07JCjvEKESpUdk5G6vulLx5nJgCcQaQgtmv7iUKNbjnSIprxTVfITRfyYjNC8dB/8fkioIFLPLSRiDYjyrH0dpgXX8fG2d5ZWU0SxjimUrved0qY5/TdiuyGtBThCAGgfcegZfm89kJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFcQxBfv; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFcQxBfv"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bd5f25ea6so666430a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745084846; x=1745689646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9p/9GPno78DZ3qtYAcJxFBAogUfeTY9SwXa+83U50I=;
        b=RFcQxBfvMTpscbZ+1lqt9THAl2b6jf/OJFgIAsVD0oSdqvHIBV2w/t/feTJ4fBKJUS
         4EHLSFL0aVKdXSYZh75OlbmiwYsC+s9QbiM5zT3uFow6Er/JbFhkEWiRamvLgkeBInVn
         xbZNYR1xUOGB5s9alFslkHmIk/mLS2+ZKg4GljUzNX7KBXVY/xVoJUxLj4wJA+ToImJW
         1slzLjiQgkiuAR1ABE4K2Rx9n0JkCxpRIvDc/AxSOBAGSuLy9Ru7tqZIyXff01w3GGHO
         BcUToiLK70gY4AMb3gpJPdqrgiMzyHC1U7uALlmhe9jFvII20SIxKAkhFDh0lVy8Stej
         7q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745084846; x=1745689646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9p/9GPno78DZ3qtYAcJxFBAogUfeTY9SwXa+83U50I=;
        b=V2BiE3N2e0G1t3A8ttCNIFma3HyOTNTUwiCa4/xLzllyAFxfil3bQuZ0/ZAH2ENSJL
         393WMNjegW4IaExKPFOZIYEpwMVb7PKdO+/K/bLTYIWUPPzg1QJ7xs0IXAhZ8MTYHPlR
         UugPDgSmHrNfgX7XhSr0xwibTTsuws1J1wolA4zTXHhq1IFrIGmQoUX9wsWZTrsY3YYn
         nvwilialXZFo8LfHDqg5MPQ5UMG+srK3BNCd4jNRoveQCsRV3SjdkLh3RP2+GMAx2ceV
         dlJALS4fK33LrUCSEfuk8q9ogi1sP3gHvXpu7kee+g2DgnrhWTSj1a9pBclqJNkpZ+Cl
         +nVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSqCF6QkewAhNzvk8RCP9W/1UJVgSV/2BILme2EQ9a09g3FghBxJP4Sy26WgFep0W7knqwf7eykpadibA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5J+omUtRbhcBGPsDMV2RWwOrfxIEjo4LDUpw6mbjOlwJv65N
	Ez4sTi+/bMIxx3JaB6YaKCMNnbibRsGO5hhyWFfqVDVhZr0m7D89
X-Gm-Gg: ASbGncufZgGMuv1G7S+bmk5ymcq3i5+I/CUaTHl/+jBSRmV3EJa3uDsSgYbNicYAe8Z
	SNLMR0n/+gWORo0Vmoe3fFSS/VTRsTNKD5gRwbjehnxh8crM8KZU6LfpCqaoNZyTAwpmn9obtFj
	FTsTTNHqzFxSGNSMLacvYWdfqxl7h3wgyKxUVI1Lln+RUgrWT4X3SskhVtkEk53HQ1jsPYubXhH
	FXqNdARLZnhbUXMZZQ0HtrKgv9zNGZkvIxrYCqwngkrYvjrA7OEY2lCVHH00/6To2k+jxj8xKVf
	zL8p3PIKoy3JTpd8gcRzqj5GrlA12PXu0C8BZSGIpzgU5sFDZbSVpeGITGT0otweMA==
X-Google-Smtp-Source: AGHT+IH7fN/A8iC5n1j7ocQhspXTJ6+h7siteXgS4p4hgqZk5bAH4bdltKLh7cf5EfIBHx46fSjAIg==
X-Received: by 2002:a05:6830:3696:b0:72a:327:eed3 with SMTP id 46e09a7af769-730061fb6d7mr4115147a34.5.1745084846232;
        Sat, 19 Apr 2025 10:47:26 -0700 (PDT)
Received: from c65201v1.fyre.ibm.com ([170.225.223.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047af85bsm773268a34.19.2025.04.19.10.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 10:47:25 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	sunil.khatri@amd.com,
	mario.limonciello@amd.com,
	aurabindo.pillai@amd.com
Cc: boyuan.zhang@amd.com,
	sunpeng.li@amd.com,
	dominik.kaszewski@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] drm: Fix for kernel doc warning
Date: Sat, 19 Apr 2025 10:46:08 -0700
Message-ID: <20250419174608.20993-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added colon in kernel-doc comment to fix the warning.

drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.43.0

