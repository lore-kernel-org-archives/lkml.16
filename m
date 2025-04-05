Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43973C8E0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 03:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822790; cv=none; b=BnjXJ9MBqrRtjyRjubxZ+QzgK85UdbUR/TleIL3JtKSMT2z8ME7M4XtI2lsFTxRX14h2XubVW6XYe3tGUsK7AbBEiTpLEMz8AA1yPZgdyfOD7UydIW78MZl4u9zuo2AXKHOijcpBtM1z3uY3Y5b2M4ANiMPQVNqi5Rew4z9Z+p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822790; c=relaxed/simple;
	bh=Bb75jtm3IVebkmKjRhWClSL7Y9x2u/I2UpcE3E99ogU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IeG6y6/l9aaNwmcQsO/nbustI6gj2fCOazihuP052nLDgPyuHW5fj8Tv/xsNxhflCHl8jL7E9JZl6+f9qQpA1Noaom70R3uy5A2ZfsL0PjMjgxDVYkGWDhWEINagOfmn5STgz57ArHyPvAFWSLZ5QY1ZQKCyra+E3nkcgn1qxGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SquuwFY2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SquuwFY2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227d6b530d8so24020165ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 20:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743822788; x=1744427588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=drXA/ORq1/goPnK4FHQgOKB7BhpRoZK6LoRjQ5OhHHo=;
        b=SquuwFY2NC+rTwUDhmIqy1rMDvfbY5VOLSfPkVw83+gZ6WwO901VxlkqIOtTvimNv9
         EOJXSdpDqrJ6DE14Bm61Sk1anpJw+udeE5seDo1b08dvptoEXIFZLPSYwHMUKJCrJqMU
         h1zn1qfkLPeqZgmNTuaP+ol6u+kKlykjjwxXr1kG0Y5JWqu4Sj0jsDez53gsL5c7Pz7O
         ZaTs2+lNZD0hBAL0evLAmerlTDzGsc+l717SS5qhnZSg1Qc1v4ImTzLeowEvGQto9ajv
         Zue6LX+1Rb3dTrVwE23qhdOvYDW860ir6yRwRkyc4DvAFhsloJKcbCoNK25lahUpfvFM
         DrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743822788; x=1744427588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drXA/ORq1/goPnK4FHQgOKB7BhpRoZK6LoRjQ5OhHHo=;
        b=Mr5natnp61nbD3az/CDj1hu2ZuHs//jVylRRppOccWKHgUwTkeVaa2FVDntoOXsYRG
         86gPYX46NtjyKUIhQSm/z8fkhv+i5/czDTdfCVTA0Ylcu3rMHAMrSGEfvYQ3W38x3zkm
         m6NcghTfaJsN6EtOyZln9Afh0f5EHn8/6XSWNyw5mKIOZRzVcra1dcrA/8br60qlKOLK
         zu7ItiidExggQDtjeQ22ufeIV04sd/4HTi9ECcu597jG5stXvAZMpSsgO7oJqQ935MHj
         SikcIZ98XTP5tR0xuu6uq/Cv7UWN1fyokcch1J8017VBqP1VLtAABNXhb661BBifLPSn
         P3nA==
X-Forwarded-Encrypted: i=1; AJvYcCWRzXp+4DLRMgFOnVla0cxvaQS38IohOnkrg6W8jwX2gJ4OuG8eVitD6IOq11v2mN9n/wLiPrXWXfaOsG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdiIzLdY3kTzl1T/b6O4PSoLB9i4gci3xFJGY1a7wpHKPvdsR
	XMlNCk0sc0cz2DAcfdGRWNNFRe6pLo3CuffRyza8j2G/Ah2isnQH
X-Gm-Gg: ASbGncu0EXcq6D+IaXLQCzJrBJM3asmjlRbgAlGVRfMYai5C6UJq04APQrR+dLaHfpF
	SJeNHt3vbo8RBKRHwa1n8NxPGdnyzs/YuVj74eybQkAw3xJiRQ7eBaPwiIliBB8+O6XOQCCQ2Jm
	rMd1eASBCda+7CkHxeCSaxuDcVkaabwLT5JzEGBBeB+5u/+7J59zXKewGuAeOg/pQD0zqKMw9Gj
	/RCPxCanGa7Libh99L9pD1KdXbl7x9dXYvql/SUJa1HFjvQtWOcAToCx6x6hcQSAUz9OBHxF6es
	BkhIbMmCwBefCSKVvL/01AjSEyB0hhtbytfeejLfXgdW8ODKQ5453ubXdgX8GnpF
X-Google-Smtp-Source: AGHT+IE3iEB32WmiGNtkvgzjIzILnbvUYJ6xa15e+n+H/vT9fCrVReqQW9kxkhkIbU/RbmW5+vXFnA==
X-Received: by 2002:a17:903:1209:b0:224:76f:9e4a with SMTP id d9443c01a7336-22a8a05b5cdmr75324725ad.14.1743822788103;
        Fri, 04 Apr 2025 20:13:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:60dc:5afc:cf4e:e4c3:6b7:3c11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad8d6sm40514395ad.1.2025.04.04.20.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:13:07 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	sunil.khatri@amd.com,
	mario.limonciello@amd.com,
	aurabindo.pillai@amd.com,
	boyuan.zhang@amd.com,
	sunpeng.li@amd.com,
	dominik.kaszewski@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
Subject: [PATCH] Fixed the warning at  ./drivers/gpu/drm/amd/include/amd_shared.h:369
Date: Sat,  5 Apr 2025 08:42:42 +0530
Message-Id: <20250405031242.64373-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

warning: Incorrect use of kernel-doc format:
* @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
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
2.39.5

