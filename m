Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DF42056
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765454; cv=none; b=ODVPutfqkfbEhgHmOIo+PVm0Mc/toazSvZviw7drb4av8BnMAuSOcG4EFnrRra72fDSUR0+6io2rQKmoteH/YaAWkd5AF5CN1gB2N5vJHwyEjSSr8cTHLPvTBz7tc90/PApePCEnUDCgx2aj5q2tg8dRTICQpPTcRXooc2YdYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765454; c=relaxed/simple;
	bh=tObF0ZAoNjU+P345djC814iEdJV+Vcy4YMdGqEpT+Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TF4smlZbmkiF7W4J1ZBy791fT14dxThQCTgs82hzSt4pFQgzoVo3P392at79C2X5OFn/kt+GXOrpSO7ogGNNawjEheUwH6WrJ6f0EclTjLox5azg05xzo7doYwWY5AoEe5YMbJs9/Jk8wtjquAwaKwqS14ABTjv2GgbsL/LcTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=af0ngR1O; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="af0ngR1O"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so3505360a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745765452; x=1746370252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prni5Wsxgki84B5zG41NwbkSnNdh/12yhKmGmuVo/NA=;
        b=af0ngR1O+3mqLs20rhQr7Qh0sYQ4WIApTL7QTo0xJ2Djg/bVbE+KIWSq+C0nzgtZsE
         IuN38Pe+YezbwJd7NJ529YEf83/puA+9+XZv2jHXQezQlKnhMvNavTAuw/Zd0FyczIJB
         PlIZIxI9J88cv0qSM3ACzM3itMofOhVakbSYOwqNWyqfthyL2kPZpv57LFvKpAC/XL8/
         olPqn6eRNaIvwr0PizYEpt1TqxoXmQftjN7sS2Q+Mh1Y3OOKb3fwR0UO3hcfjwiof8k3
         FrR8ddEJGZ7HZus9S3Sko7YXY08GpQziu5YAgV2nX+asKIvGa6sd9AgSkcJH1Ty1XyyJ
         DnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745765452; x=1746370252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prni5Wsxgki84B5zG41NwbkSnNdh/12yhKmGmuVo/NA=;
        b=NOmK85Tkk9yHSOTHg367yj2l7v/MSHPgNXEvOaU76vYa7wo9mDm+KVwo+VZ4FgPV1l
         kRghsEfuQWrseBB+3s9wZiWNuVO+gPQKOkjVtu9vsA0rkuxW3MEvhsqrwbwkP/U5jt5f
         DfgeQLvkymr59030XAgE/DSj3NhUaGlpUoj+P6/6XDFvWS5bVb07flNpYx9M60/Cfpo+
         SfvbPv+ZAfhUgBdf/JfhKE2L7YXKYrockZZiP8Pz2Lt8cMRStUhM2RNWGFNrS/8K4XCv
         cSpz7Ax3hIYakYWwvp4dwO6t0dNTnXRIhxssVgC6HSykZPcI63cscY9HOBNJlFyUPdNm
         /ztA==
X-Forwarded-Encrypted: i=1; AJvYcCUvhuEff5ioKdHPQyaqfL1sQJ/sqfYWM07ipDD4ZjRieyxZUiBFm6CdpmrHc280LcQD/RswPxMMFTi7b/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdQpxw5OzHQ7cebbo2UJnQF8ZnPmSW8giXo2cZPwinNB8WyoPZ
	83UTwR4tvgLw1/f7wB24dtHa3iadSao+DtNGUY95NViQY6hVHI0X
X-Gm-Gg: ASbGncuGcKeyO5uocKiCTKD9S2rkDE8lcrwtT7fC6lqUHIa1KRv2DnmPRYiTLgRzi9x
	Iw55CJG6NuzIpF3Ubr50AfVV39w7B/m7ozbtdQ2cQQ4v5dwvd3RbJWqCmpd2Nf6xhh7R1ptQstG
	SQ8H164VKDkLYdptg829uSJm0Kw+kF1qeBKa0FSvsXDcmqR28kvayU60TwqhmrFZ82WLrMqQl+a
	unknhe6EYMOjrAxHyKqJLVb6Wl4N+R3iMHHguE58JwS16Eu6cWYlWawswv+Q6RQtaoMgiT1jg27
	mf+Qs7DFuua+flyzu69GFfNLOaX4eVK/y88jfGBvaSIEYYZivZf/IAe7ouSlaP+D7B4Q
X-Google-Smtp-Source: AGHT+IHD7cK9sWBfpdVxS1X2IASM6sAyL3HQhKnEwg3V5I3hJ6depSD5Cb334FpoPXEaYIVfKuxjWw==
X-Received: by 2002:a17:90b:3a0e:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-309f7dd8772mr14683538a91.9.1745765452479;
        Sun, 27 Apr 2025 07:50:52 -0700 (PDT)
Received: from fedora.internal.example.org ([2402:7500:a5e:160e:687f:c522:620a:c681])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e752asm64865555ad.158.2025.04.27.07.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:50:51 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH] mm: remove unused macro INIT_PASID
Date: Sun, 27 Apr 2025 22:50:04 +0800
Message-ID: <20250427145004.13049-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro INIT_PASID was originally used by mm_init_pasid. 
However, since commit a6cbd44093ef ("kernel/fork: Initialize mm's PASID"), 
mm_init_pasid has been removed. 
Therefore, INIT_PASID is no longer needed and is removed.

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 include/linux/mm_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f9..e76bade9ebb1 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -28,7 +28,6 @@
 #endif
 #define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
 
-#define INIT_PASID	0
 
 struct address_space;
 struct mem_cgroup;
-- 
2.49.0

