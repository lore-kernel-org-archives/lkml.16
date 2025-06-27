Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C22F1FEA;
	Fri, 27 Jun 2025 07:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008667; cv=none; b=me32D5GV77OXe7YoqtnjqUdHNe8X/SoztY0gzLsnnp2eKpIS7JxvCuXyzVptEMnCy411VuAq+I4ChJBCjp/dncslZ+wuiQeZLP0dUyvYfGj58y9W8oGWPEcL7rUhrUq/pZgs9MDY2eXNEgGFzNnjdo6+7BPCLkIuNmF+iXwsExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008667; c=relaxed/simple;
	bh=BWGZw+FZlRDQ4aOmdDP8cwTVgpIYK+iKWf50s9UCZoU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F2gGlnPPDRZWzQ3ZQH2ZgvR71gJq+u2a4QQKqYwk8aMzx+zQTBZviGfFSCYTmcpwxbaIHmol1upAwgt2a05g8hoQ80aVmjzUD1jrnE9OrdJ54Y4X0X08BfCgXrx3qh4XNfPVBPxvorlucileEp1H0XEEInCTyfL7ZM4z7OLiM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIy2gxhQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIy2gxhQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1681219b3a.2;
        Fri, 27 Jun 2025 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751008665; x=1751613465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XgMUClXF3KatALn7b4tRRqk6odMfDui0ubzVB6tzUM=;
        b=WIy2gxhQmFb+j3TpLKZZ9We0O9qCzytaNpcd5MEYLB34l3pZd3DRRzPEFXzWuUUUs4
         bq1rDRDb1upiz9uNMMxdMhFKYDCNUlgUKuLJ5PFgT7i0BSDnNwonfYvVI7VT5HYB7Jpx
         lfu10Ekx6U+m+2gHfSYuFmq3HF0zgDh0mtVdmGmI0fWXfRVsvEz5qgFC4TUEFlWplsSc
         VuwB3/9WE4CxCs5m/WEw74ufh/dUbBhSwRdpadFbDjAoodNmzClPU5QqfGo4hNioT+z/
         esSvp2pNrVD7wCf3uI3SyKPezeyJN6KBYe9ITRNyGa7FsBMdLH+T6CY5wLxiZTO54Mdh
         dJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751008665; x=1751613465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XgMUClXF3KatALn7b4tRRqk6odMfDui0ubzVB6tzUM=;
        b=IJi+K3aR/vPc+6nrgzkc7P7nzROZpzLnoFedQrM4wWnI/oqj7XAf4NxPy71Zj8J5Hh
         W+eaI3Lc6cPPlRLk7fD0i9GycOqqRoYZkYc3ALmX/gzFSMietKxMBiS/Tzf8DAUQc3jU
         2FSKFp9OSyOvt1Irer/FfokJnTSlgdF1CN2w2ZhdUFDlr0SLEzirTeSEE3I1dlkxbYQZ
         xPXCKVuqLLkbZod98fOs9/eQdbL2rhZAo6nYsKFlW0tfD++uvrxapgJryVdLD9IVKteT
         zWiofu9ZukqLSBsGPrqvNVcIm+lwBHuLyqRuRiCTpf5SDyToSS77UnwsZInRq/ZkhEul
         /w1g==
X-Forwarded-Encrypted: i=1; AJvYcCWu+tvM4Lt+f1dwg0NvxIEugd11Kfr3ZaEPHeuauYk3LkS8WO0Cg1ZKz8Z/kvuziafqBuV6oTv00/M4angm@vger.kernel.org, AJvYcCXZiN9TQL/imtCFI4/npiBy7svKRjJL1QylADii1wqpSzCecceckJNH9hWi0m9I8OTSICZsCbMdtgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0GrN/w6pzck/j9eVuKSANtVP4FrkY4pppJETsqnc5u/ZllNm
	xeXTYFfBP7NCkRyWyOWcUMSoXR3YBkys9Lb1MrXhTqHPbCwqv5/T+0D58Y7d0dC9oB0=
X-Gm-Gg: ASbGncvlLg+hYVQGkj9lxv06Ok8W2EiUPofNl3MgBLNY9+h/obHPIAH6D8ZCqQODgyd
	lJLPRH4KWwOuFayLZOMwAXAdKY8KWzRv0oA3U8IsIIPCxch9k6qArQhc48pMBRkSJa9EZoiikXM
	/wqcCxIArcL6a3R6gbSfySVQgHR1YxrsffkP+Ml0BRp9xIy9m4YBmjcQJ5U/Lk9ouRSk1EoHJbh
	0hKU8PimuJCTEX22uBB1o2PNC3A13v3qVYpb61tdNH7Aj611/KGrwXrvAyXuDdUe/oX6sGKo+wz
	PjzSjmVkSwzauQFgO4hj28OwLOyy3qEYCAD3ug11ESX9puKtsIn07dRFCrY8dEMLIqOgxyKY7X1
	DohXBSiI=
X-Google-Smtp-Source: AGHT+IEnlgGJKz4hRMQnHG4OUHuPzELReZvtgZ7r6T+KaQ6GH7+zzfmWiDvo5odncMVXtilKmndjbw==
X-Received: by 2002:a05:6a00:c8f:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-74af6e51ea9mr2804852b3a.1.1751008665275;
        Fri, 27 Jun 2025 00:17:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a02c:2fc6:2cad:e985:b61d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54099besm1558667b3a.9.2025.06.27.00.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:17:44 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kevinpaul468@gmail.com
Subject: [PATCH] workaround for Sphinx false positive preventing index
Date: Fri, 27 Jun 2025 12:46:28 +0530
Message-Id: <20250627071628.30258-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
indexed in the documentation because there are structs with the same name 
and sphinx is only indexing one of them, Added them to namespaces as a
workaround for suppressing the warnings and indexing the functions



Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 2 ++
 Documentation/gpu/drm-uapi.rst | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..da865ba1c014 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,6 +357,7 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
+.. c:namespace:: gpu_drm_fourcc
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
 
@@ -473,6 +474,7 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
+.. c:namespace:: gpu_drm_modeset_lock
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..37a2bc461326 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -554,6 +554,7 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
+.. c:namespace:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
 
-- 
2.39.5

