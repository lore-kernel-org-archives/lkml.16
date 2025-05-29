Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE1C8EB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748502474; cv=none; b=dr4FC55U2112uDXsHoPoTb7zaEghE1O8N3D45j5z7Iuza3AI/y7n15/6nKhkvvA3Xd7DLKaojd7KGHhRf0DAXmSHuIt8PFImoA0p9cucu8dccHQVYyD+4FzU7ZfhH+y5or5pZ0nXnYqK/UCqsV3/WBAndWA4DzxniNFGINzh99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748502474; c=relaxed/simple;
	bh=NKS7iHP1U8FaSTx+hE719FX8UcVVq3PKmV+dcHoNGb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JeT7o0IaYP4Cc9Ljj3p40jZXBWdueECldNdbHVOr0hvr80lm1VLei7Q6HDw9ZSbEpjmsTgNxOvodYSSRDlCSEsXGUascjRJ76zNddbWXHShnDZDd5YUWwL+uz20VRnqzexe8iq3I19gH8FoKfP5Cr2RFtYSh2PvnvhqMQGmB54M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfuJaGSy; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfuJaGSy"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-527a2b89a11so252368e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748502472; x=1749107272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ozEW/wrZwmWJJB1nILynGsjsZetweqaPIqApEnJSpLk=;
        b=RfuJaGSy2bX3/YfheE6BzGfw2gMPMvyMwGicbbAsfPTHWPUpMUCKrqjHUuVdAvb+wn
         PsSK82XRXsvw4YfEQbOcSOdENtCKsapZEYhHrIrVh8AD7hC+AvktveIUOCKcAAWDSnV1
         dU2YiSc32C3E2oqXJ5mc1YaESyFZxtDADR1Wo0I3lQUaTyePqH3RbwzVsrqTINjxxLPw
         ufEGGQTw/vBBfeheOaZ6JnrTeN1AaVHLEmxR40K2IbVE4erFojrxlAobuNAuUHMMefEW
         ernVs/IaIuecnQ6oapNNk58KhfqHFY3BNd+sycEpU0wQ32Q0DHPWH/Q3jQ4BuRDMW4sx
         tmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748502472; x=1749107272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozEW/wrZwmWJJB1nILynGsjsZetweqaPIqApEnJSpLk=;
        b=fBLsT1f+a5PDPl8VHFyauPy3ufbj0C5SO+KuMwg/E8FyJhTqrbcQtvuN6nJHQKqCk4
         OQ87pOs+jYDqbkhqAqjnEpj5Nftv4uUd3fOTsqCfhH4OFR8Z8is2mJNGpNNES3AmRWs3
         fhJQeMcFuhjUDPIEmbMJF7T8am0fRZlv1UT6XMZqPnOj1ZCs4tPuzLKaa4RnSeK2TAJz
         PRQMd/bZ4xlIv3IVxhqaKXSJpPsXPpDDIoJiSWZRz1Co9vzpLewa5DObN99uCsVf0QV9
         g/v5DeqLgU08xbZynCYGZCzBYEMx8CvICBaDr5e+dFgCHsh6vSoLVbadrvjJtj26DQ4b
         kdAA==
X-Forwarded-Encrypted: i=1; AJvYcCU+h03cUUbpLFAoyX0Y2r0WZC8H1iaAUylDuZV9Sjus9ZJFYYSO9ijGye6e393SjkZ2my4NELhQejFsSSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vQ9qaPFmiN/ev2pAC3wRwIf16CDttyCuKpUdvmGxHonx2Wdp
	/deIFCuBdEFUj58Hj6EcjgrJrxinpWe9vuu0FlpdCgnNa/1CzQPt86zG
X-Gm-Gg: ASbGncuwBq/horbrV5MEkeJsLn3Lc3tnu9hP3ot90cdDMR6yN3Wpsf7OkFKtHXTqQYf
	0CImEd/dkdJsEdEbWxNacKrWMbszSJu6z2Od0xtw0sGAORcdKNd0ojJ18JCsF411aTBa6S/0OG5
	DPRR+5ABOn1kuahHE9P0DEWZlVFEmH1t0RYYrEFY/eZK20zsF8ccQkiZswvPh6JjWVGjBh52usz
	t20syARH9JtBODv143jGJ5J33l1zWwJUFgvoV2BlUndscbyRGB6KVrTB4IzNJmq7YWLS+bUiHHB
	RUZ8kTdruXIwiyFG8KDfetXxr2/rSPHzZwNZl7/qQwU2RhDjm7e2mS8kmora5/Tpjhw=
X-Google-Smtp-Source: AGHT+IFssffTkrdSk3dX7r+bIz/Bbwr+R2AK9rju9Jq8PGlJZCwjm+95jxbi1xYALjVUUH/LclZoNQ==
X-Received: by 2002:a05:6122:8c15:b0:52a:7787:53d7 with SMTP id 71dfb90a1353d-53076a84ca9mr484230e0c.6.1748502471651;
        Thu, 29 May 2025 00:07:51 -0700 (PDT)
Received: from localhost.localdomain ([177.34.235.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074b079e0sm695453e0c.24.2025.05.29.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 00:07:51 -0700 (PDT)
From: Diego Viola <diego.viola@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	corbet@lwn.net,
	ritesh.list@gmail.com,
	linux-kernel@vger.kernel.org,
	Diego Viola <diego.viola@gmail.com>
Subject: [PATCH] Documentation: ext4: fix title underlines in atomic_writes.rst
Date: Thu, 29 May 2025 04:06:55 -0300
Message-ID: <20250529070655.21776-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match underline length to titles for consistency.

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 Documentation/filesystems/ext4/atomic_writes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/ext4/atomic_writes.rst b/Documentation/filesystems/ext4/atomic_writes.rst
index f65767df3620..1f7780924400 100644
--- a/Documentation/filesystems/ext4/atomic_writes.rst
+++ b/Documentation/filesystems/ext4/atomic_writes.rst
@@ -2,7 +2,7 @@
 .. _atomic_writes:
 
 Atomic Block Writes
--------------------------
+-------------------
 
 Introduction
 ~~~~~~~~~~~~
@@ -133,7 +133,7 @@ atomic writes are typically constrained to small sizes
 
 
 Handling Journal transactions
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 To support multi-fsblock atomic writes, we ensure enough journal credits are
 reserved during:
-- 
2.49.0

