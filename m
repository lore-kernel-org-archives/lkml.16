Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09101EA7F1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849639; cv=none; b=KmjmF/pPcMI7HRL3L+Bupgfb7bG8tXIkSRYINqiNIMj/mnUzoXWjoaEIeRtKjNBERHVKkoZHArv3vNQjmnGHu+0pYTBc9HWhyzmMnITUXuXQxvG9/mBxwutEkHhHbog5EWTUVbrFwqSFOLV+4bz7OjRhcZHZCp0FjAXXAEYVYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849639; c=relaxed/simple;
	bh=8iEHX/rMdmM46NpCJ4QL9LafktkSchlktlovTx/K5+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ahuRcZkYfQoj7/R3WMaJGAtXZXoR6sQDmVQJjRWGR8XEzsm4jUxswTST97vvVsVUU3ciwhutFcIe4CrhJVWqzURR2regtgZ2X5M3jeVKcTK64j7IhdkyPbKo0czhC5Utc5f5q/QbB6W1tPQBucEY8VK6Sy16myApisxhJnRA848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmqE9JBL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmqE9JBL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f3c119fe6so11869675ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738849634; x=1739454434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+sjsR0TGjlYkPY95WD+GDrP0sLrBBkK9ZreKrBKyuM=;
        b=GmqE9JBLUrlBwsMdrF5eBmQkLD2jGLzQ/dKRaWwJNEx3QupKTgEIMdo6ltOKovwgSa
         +BaFoqB/+bkt7MSEebXUTVn5cnMts4ghOrMekl2xqpc+bw+DfB4mVf8wVjR8kXSNfyL4
         WejkZ5s1ptacpZXc+LXDPYQ/dOSskhyuXIHNn/CmvjXk/ohsEBXqq5h0C14sjapXpQYs
         4N0k4qTrATcr1MoEbzT1PcB2LjycJJ2iQQpLvDMA1jv4UskHeu6CsZzKgS1mmsV5ucVA
         j8zImezaGnWoB+KtdHMmA1Q9Nzewxc7qxsgKnFxVO7OACwRP1O7N34cSGw1Qru1zrhJH
         byVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849634; x=1739454434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+sjsR0TGjlYkPY95WD+GDrP0sLrBBkK9ZreKrBKyuM=;
        b=XmPPVOsRj1LFFP3GWuzx6ZN2grx4iVkcDqrv72P8E2/oE+x267v1/VhnwhHkt9DRSj
         chyefAnWigpiK4hlZwjBZ1EEjOqkUiPBTla4B9zz5Gu6+nx0iZ4ZJaDkBm26tLFhioy7
         vjWq37Ym7PQEqwMnk4GedMalgLfzAv64FDt5l2glFNO46Yvyw87lZ7hyO9BrFPpVoIGq
         KpgcezofJ1LW24u727EOWQKxl1Xa5DgyEf+buw+m7krH9yTc95ZSh1eCTTnLTQ6d0SAZ
         r851AvFmA3YfAaa9rIWOLiDuDHlvn78m/JmKTSXJ4I/fNE0UhLc32FFBo/SSyfUEkLnA
         cQAA==
X-Forwarded-Encrypted: i=1; AJvYcCWWG0h5QhwzHQSH10bMKr44v5JRA2dDvmbgj4zw1xOEQBGBfDTNmV5bM49Gcv8jJZKmoD8BAAQol3VoNXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcvcrs6I+lrY8SKXlXvnq1B+uABmJ4HOvfLeiGmPO2rlVFrgwp
	Rqr4YD3IHHhYSg/A2uPutY4GJfv5y8z1bciw14X2DXVPDtlJWugw
X-Gm-Gg: ASbGncu9LK8M4VYkjhEJm2nQcltTCLnOtJI3z61UWFR2nNSvns8yuhlm+Da3BT8u1Y4
	FMWeq6O7Nn/CL+qKQ7EWdK8v6FVSdPWl7pqZD4lChotoqPWRcnqdu98QL3bp71/+WGQNhUDEWeN
	FjPhSXA+XmDTvsOmbpqqw3ynE9S+U0MAadxwOSP4DrZ5oDoUgNkEnEFpcqKVCNG0+54BJRR0srg
	Ul9Ckc7eRXSTryXLoV0f6mmORQcZmHto+jEUf10sCrXNW9MvIry01TV8H5jJW0KkKJvtMg+HXZT
	poIQfs1iI6Su+5zGU9k=
X-Google-Smtp-Source: AGHT+IHIWj5TBEZvrKQkfJtcsPBegkXHSYFiyuIxgjCbRiWoQPQaoe5UdHXHXpr3HmYIuRs7vMhqvA==
X-Received: by 2002:a05:6a21:99a9:b0:1dc:2a02:913b with SMTP id adf61e73a8af0-1ede883b817mr12845474637.15.1738849634084;
        Thu, 06 Feb 2025 05:47:14 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af77c63sm1144158a12.65.2025.02.06.05.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:47:13 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH] drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo
Date: Thu,  6 Feb 2025 19:17:06 +0530
Message-Id: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xe_vm_bind_kernel_bo() declares the variable fence without initializing
it. If an error occurs before fence is assigned a valid value, the
function may return an uninitialized pointer.

Specifically, this can happen if:

- vm_bind_ioctl_ops_create() fails, leading to release_vm_lock error
  path

Initialize fence to NULL at declaration.

Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..b6ca53ede904 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3184,7 +3184,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 {
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
-	struct dma_fence *fence;
+	struct dma_fence *fence = NULL;
 	int err;
 
 	xe_bo_get(bo);
-- 
2.34.1

