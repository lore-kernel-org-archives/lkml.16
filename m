Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949A258CC2;
	Thu, 22 May 2025 23:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955515; cv=none; b=rGuDRHdupdRsQSHiGli3KOyRC+o1iWcVzC7z5D4cAmBpZxK6JxwPKnNKrMvFie7JmFqT/goV1XEx2LKSujB/V2fmz7krFZFmh+CCG6pUs6KS+MI6qfE/9HXOiZdZIy0slOgDXsVDV0FEzcAekKeVzdHKB2Zhq/8KYVmPTdYLzN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955515; c=relaxed/simple;
	bh=GdgwDP/G2YbRSycSz415s/ivN3fJsMLeSCALtGmBj4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JqqVw7547aDFixvJcaXJdOsbsMQonMFTRVGoB9da4WMojaXxQSpWoIe9t+x3vRh5eWdYNgytwBe1p7hHaPij88pAKc0mOzw0quRbQKRntrYvwRCDHfKc6QWa54mHKT9nkUacf5bjvET53wo6PZ8LxJOOy7iLGqbt5QKaEZrOLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbkSPPzW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbkSPPzW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231ecd4f2a5so56807435ad.0;
        Thu, 22 May 2025 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747955514; x=1748560314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=jbkSPPzWTcbnPm1IYqIAHSV5QglYrFSIzeE0e9qL3cd4F7QUdndP7nDYx0ZzfNLp/G
         MOYU4qTnmmuR72vzF5KVUGyXCGFQ0txeiIG7ijgwk/IR15wAx8NHVl2SK/UGc7dvF2ao
         QZjrqTkH/nvCTp+aXFdozx8K2ujbC4AIoRRoEtWMWLpvVi2Tyc78Hj0cqLiWL14qhAqW
         CQ9ExD0cyHWxtpvg3EIBLjLv2X5/1TyRtgp0hlBj9pg5bLC2S3xbf7dA8MV+TXl5CBBJ
         ER1rJ+ZogAjHRhIyJ2ir8zKz858jt7woqumzHkB68H4+K0o9XHGAZfQQnSi7jh/YI3PG
         AfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747955514; x=1748560314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=EmMOlxS4LO0L1OVzvOmBfkiuULkrheGF7n+H1QhQu7P+TkldEPUhsJ16xpNnRaws7z
         Ecshb11+wMIYh54UCvxCZHLlVBX7Zr7Uv8We1k0ngYOutCQRnULwcY0PgDfQqijWAIZf
         kuZfifT14HKf30CnpBPjKC1a7OrefxZZ2ifxD27GvKYmONhB4YynvyxF8R9fbtPfXWkh
         lWnDA8RkfnNaFezdFTEdfe0SmYt2QCIYEl3hShpWfN9GpXfii8LTj30lYPU6N8EUPBem
         +eItpvTZ+pCIxIWZaszS9M7vJy82/An4gKDGx4qI9hSrk6UIXUlstbdYAIkYOBrHNUvZ
         O7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUe6X0A4qZC2ZkrNmwMGEVept/nFnO6BvdQFn3B3TPikug3sf+5XEd6etcuDG1+TwzK4bO1caca+HlG7VF+@vger.kernel.org, AJvYcCVeatTlYSt+6a/6oDV/oiXLeDtmf2ahmNWac/DjEmIiiVG8vGfF8ULyCsRqZNJ+YzN/6ka9+0LI9sk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk2rrAE1rBMFBzwxRKHGryvUDC0a9Js1XWZREmU4Dv+tZ8rfuv
	qAYk0SD0WVX1z/d/C8BeznIALMBkWlZ4rV2A0CCa4FnGEfqOrb2EOkMi
X-Gm-Gg: ASbGncs2NqE9MvlwZeirJc78Avv33EIn69OltEtEsVvRaF6tjcN+tFJM+XPvJvLIWjT
	BzT679VRi4U290YwntCcPXzOdjYmaUipPa3oBBjoocGKXMR3D6bFq82oyBOGsW3RyAe7CVFTQaP
	h6PmD6FDdq4jyKclpFDCQbX9+bpniQ8HhuNIMGuS5/yxogMdlIy+bHMVKuuyA+1jT//e8S6m7sU
	xBG3Fdlpal5z5Qns74PluTjQmiXY1INs2U+k9QIPLTuuqgMmoWtaMQsOcM/oeed5WTckxn9A8Qt
	5vbk5bagChk+guUNIiaoPgN2G7AByk5FmV2xntmAhDZQB0eCM8k=
X-Google-Smtp-Source: AGHT+IHN2IHNLfIyDfm43matCU/9U2DrcurgLiHntbJ7BKX4MZIQqns7rwRLTJsFuyHbEtct9cWmaA==
X-Received: by 2002:a17:903:41c7:b0:224:1221:1ab4 with SMTP id d9443c01a7336-231de317b43mr401656225ad.22.1747955513690;
        Thu, 22 May 2025 16:11:53 -0700 (PDT)
Received: from fedora.. ([103.91.123.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm113511815ad.149.2025.05.22.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:11:53 -0700 (PDT)
From: Nidhish Chauhan <solemnsquire@gmail.com>
To: skhan@linuxfoundation.org,
	corbet@lwn.net
Cc: Nidhish Chauhan <solemnsquire@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: filesystems: removed repeated word
Date: Fri, 23 May 2025 04:41:43 +0530
Message-ID: <20250522231145.3698-1-solemnsquire@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed a repeated word 'at' from journalling.rst at line no. 96 in
filesystems directory.

Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
---
 Documentation/filesystems/journalling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
index 863e93e623f7..2825f6c030c2 100644
--- a/Documentation/filesystems/journalling.rst
+++ b/Documentation/filesystems/journalling.rst
@@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
-transaction. I advise having a look at at least ext4_jbd.h to see the
+transaction. I advise having a look at least ext4_jbd.h to see the
 basis on which ext4 uses to make these decisions.
 
 Another wriggle to watch out for is your on-disk block allocation
-- 
2.49.0

