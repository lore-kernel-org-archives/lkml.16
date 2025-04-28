Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D831FFC45
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837196; cv=none; b=REUtaNK34WR/1ehphKZHxIodM0BdROrFtpVimm3kiUmGN5AGAuzIbe9WUDg2hykcYiLNeBz84fH93s468qiLG627tUWCN76lzSxQygIFjuAVJ5qUq1PuD7+bS5TTCIlOFMbNih4SfW7Hp1FE7ZF23d50AeL3jP6RW1NoA/tKG1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837196; c=relaxed/simple;
	bh=VNKA28iLQZN/MlLgYJZk7spEJvKVGzWWO/bzEPlz1L8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlBQ7eQmjV26RyN9laFrCBul6RkSLn1Pu3Wq8aaFGNBgRV0BPKF/wUEdWv7+a41bbkg1A248LgGqnZI0ekw8IwcKkdtVakl/RhzTeRRZQgCircju/59UxF4e8bGJn4HgrEL1kgcAPirLKkuuYW1VtIDSJQXlFyiSN/IEOw2CJPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+fn5uJR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+fn5uJR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso791549666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745837193; x=1746441993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvbdr0JNuifyk5uUnYe0etbSIhAeqsQMJ4amy8aWMqQ=;
        b=B+fn5uJRMe75B6NXNp5bSithuAwa54zDdaCtIC7bK1oBlLHwSDtiU9l76cLp0y/qHM
         zt0GC7ok+uFpe24Ds5hErao/36e3oF5cH5EMKsL5KwCBqbf9ZWEhuv8ASpGYoeapKn+Z
         0TkuRUzqTG5d5YKKoEhXwWCwxmBqjYR54C5HJHYQNyT4KiPzVRNh61z6rviDP57usgZx
         EXDCmogOCQqo9bQKd08prwplDruThu+1PzzFMRteP5Ek1sNYwg21hmPJb+5nwd14nlO/
         T0rkKLbfQQz0SGcryfZubeOXU6dx/9Slwt0ARbxfT5eWIU+qLWYi+z5j0O2rpvwetmsE
         EE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837193; x=1746441993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wvbdr0JNuifyk5uUnYe0etbSIhAeqsQMJ4amy8aWMqQ=;
        b=o/QFQwpRXnWSzN1+4wP0xQdJYXvPWyRFq94UBEeGn0JbbxbzwJy9y0vxwXawMvG0VE
         q3krc31bSrKCBsh8u9T6r1fRX80afho0NlQhI+LUExeu8b4ddE+XeYaw1Mo/qIrJhUzd
         Q894g9Z8En6lLnZlHHNCILunlFSO/X5KLzjQrKxlt/UqOhBrDE/Q8NPBcgSC71BN51wr
         ywHCQb7Kty+S/Iun6GdCjOlU4Pnr2ieR/q9TULzG0pu4+OBRbvPTa0jkZAyHAadre40O
         irsjPfc3Nl99U+GLJA0oxvHNYPq2TLE2jQRZJTzEoUZ4PHu91hW9h7P8Tetrj657WcY3
         FUEw==
X-Forwarded-Encrypted: i=1; AJvYcCXKdSXd9Rn2wspIBKSvxy/IwHws0duFdE6mmNjG7v7/0Z712wErHyyc0G0yfwPB4tR4HMhrgfyndt6m8Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmbtsqENb7sxbQHrxEEk3933Is9EuzGQBieNtWnbCkNJvf8lmk
	IqgOmsDy13F8iZZo+7v8TLP8SI6RqeoOUXCRpPEBhZhSWBIJTd4BLF5U83ElWWU=
X-Gm-Gg: ASbGncvWmF85e1rBGtt1hNxKc2Sjg2b3zzm4vhKmNeYK59FUQTYTiLquaBSzeFD9k2c
	gzZlC+LPMbWHD8VkRFyiVHxKsce9O7sOQ7VHi0+kJSEFfAPA0qYSk0e4jCiYA3GnMbLKHVwhafy
	+P/0MRyCXvLxui4fb4T3ZlNR2t6QDIVGOEmBaGLaNU1bhgoSCYoq4K2XOyAoU7BoU6tKh87/pEs
	Bu7nOuI/eaBLhB3cXsiE49+937MHtgB3iKxZRP3P4yqXLTUyLOo++LZyeaps9F4+aINEoPb+axt
	aKdYQiQNV0zqcS1BKk/BMCcYs2f0Cr8RYOtdZP/Cfhy0Jg==
X-Google-Smtp-Source: AGHT+IHwRoOppXIpij71zjuWnJJzu0zh59DkRNeg5ulYk+IyTgFGTV8x2J19ySlX5bz0MCG5VQ7icA==
X-Received: by 2002:a17:907:3e03:b0:ace:3a27:9413 with SMTP id a640c23a62f3a-ace739dd0b1mr912614666b.11.1745837192384;
        Mon, 28 Apr 2025 03:46:32 -0700 (PDT)
Received: from noctura.suse.cz ([103.210.134.84])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ace6ed70b1fsm602497066b.157.2025.04.28.03.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:46:32 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
X-Google-Original-From: Brahmajit Das <listout@listout.xyz>
To: 
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Boyuan Zhang <boyuan.zhang@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/amd: Fix malformed kerneldoc comment
Date: Mon, 28 Apr 2025 16:16:14 +0530
Message-ID: <20250428104620.12699-1-listout@listout.xyz>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One kerneldoc commets in amd_shared.h failed to adhere to required
format, resulting in these doc-build warnings:

./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'

Adding missing colon symbol and making kernel doc happy :)

Signed-off-by: Brahmajit Das <listout@listout.xyz>
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
2.49.0

