Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDFE347D5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702770; cv=none; b=o6q9XaXxhjV9TD0IYUKOAzurfIc/vQ9wMSToD5AYhKXnwuxEkDcbf1tFU8cDGlaFYq6qpZTYDDz2qYDqeyexKNEAtRF41ibS/bKcd5Ru3QPBAfw58eqHrF8zRZwL2GSM7VXmn+s2XZA+CMc7O1k3RKyhh/tMuQNuEJ37lNsxVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702770; c=relaxed/simple;
	bh=/inVwIYak9saPWTFKih1dwNa8gI+kgVgA0TwpJ3AEiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pc3o6T5Css0gD+0Jibwt/L8QMz572W/tuwj8w3vq9BZZs+D9dHMINiWkPDnSnMEkWKzptMy7DoQffw13tqmkRHBfU2A+HvxuD27aJBH9fPFQK4L0vLRmfFNaKgSju/dk1uGgASzWuArd6QgD3l2EWG8gymbd7gZOJLfmXOcVNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvIUw1Dt; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvIUw1Dt"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso2160478a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751702768; x=1752307568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YZ16XW5/oaudvAcjdRll9Pwcbdl4hYkpk0raAHNXFw=;
        b=VvIUw1Dt67YrHs5gbM6pjjlB3VKfzZ9+tYAvrkXN2TYW9ztdf72dVtM7bOjGEhMdnp
         cu0mTS2X/bpmzrBlsQnuN3DSwSHmBqIu8PJliJnoIR1Sm7oyoaDek9cDvtQiWiQ90UFp
         LvrqoCSh4uB7Ic0sk6WDe22WgtzwJmRQswhY6/kG2wA7XqHg25ITdNFnU9h4v12MhHQy
         8zF/Hf/yB1d2o2Zw3Dg0IHPOrXV2mha8ZdDuulwjGpUWcrpvkGbQwpBhjHsDSITavYTU
         I/1ZNh5wELx1ej7NIj7MxD40ANMW32Yp8nPD6W7MGrD0oS/FctTAwd0wG909zXiLJ+DO
         zR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751702768; x=1752307568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YZ16XW5/oaudvAcjdRll9Pwcbdl4hYkpk0raAHNXFw=;
        b=iMZwLlFOdSjJbvO8EodqTcnzmyb3mGq0eMJkslHajep9SAggqNd+fihTO1ZfSMPHGI
         YFkhd86g/m9etU2CBbIN4xXl+zPpBVIHjVaGfFzgSDOlc9QgoKTKmKOCS4pkAhAUeQkR
         DdC+WENnCcoQpECf2Lq/kF3YrY28OKzQHO8Op/WAViLLTleZmSVoJnkxZpZxDdwvHjfg
         Hp1q5g9EzlCKPJBX5ULFFtoN862lC/3bBUarN/OZqARJrfNKJKap+nLKltj1w7vQ11Je
         M8vISYhTVVCJqFIolNQxzxCYwcyimrsJn4mboHA510U7XEBAlzBFz4SiSvtD0GVAclCE
         1gHw==
X-Forwarded-Encrypted: i=1; AJvYcCUn/A2velXUn4X5qr8cG66glNsYaI8XBTZfVdrzZj5BB67sDPxivwW6PDwx2E/36o3ruwxDhjjPsxUkV8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaRsbrpv9ZgYTl0TJeyfxhF00xXEoxNYIhCrou/+GGuJ5N/77
	y4i+A8vfWsHubLTMZxcfgPnd/wVspw41rQgUAzyy0dMmuhnhtfcNA70/
X-Gm-Gg: ASbGnct4D3jRwHRXZUE1HKmmcaepIwwRDcBNUPikcc3tY/lx18RWjPJKjOZSjbW9oqS
	0CRqFE04o2K4dT4KaW2zwPPeamTIO1RJd+5ypK0e71BYURdDRmjrad7DC5iCvsLo05DTxX8lxCy
	6KB76JvBRdFB10UKt/iE5e18xY9M/nOYH/iWHEfYaBKifSJTE3eEAUNQCjYJp3OVI18NeoJXVny
	jNzeblc+rQmGDUdTOcjr2aXzvgwZuCNa1Js/VBTICHiQm7c5CUppDInMWgl7j3gB7G1JMMNL29y
	sRDApIyBoeRe7IV5f5/wPc9fbm0fQtR2sow1lQrnaVDEsshvgUfeBSAfMV2C5vOL3QIy0lurbxt
	38afBc2Q=
X-Google-Smtp-Source: AGHT+IGTWL+LXaCE0s7SVZTJw0Dw926iGaq0yWHgQOoV3X86xxB0l6u8NCO6LtHsTJv7Lmyc64Fp3Q==
X-Received: by 2002:a17:90b:1f87:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31aba8d2954mr1758967a91.23.1751702767425;
        Sat, 05 Jul 2025 01:06:07 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e3a3sm4010095a91.4.2025.07.05.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:06:06 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Han Gao <rabenda.cn@gmail.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] drm/amdkfd: enable kfd on LoongArch systems
Date: Sat,  5 Jul 2025 16:05:40 +0800
Message-ID: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KFD has been confirmed that can run on LoongArch systems.
It's necessary to support CONFIG_HSA_AMD on LoongArch.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 62e88e5362e9..b2387d529bf0 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@
 
 config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
-	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
+	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT) || LOONGARCH)
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
-- 
2.47.2

