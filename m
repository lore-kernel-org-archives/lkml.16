Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79724EF91;
	Sat, 26 Apr 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745675791; cv=none; b=OP5pytDJgBN7eT3//4qXjbASb2lH1mbc6+pQZCxAkm8tQQ2RPcWz9nvPLS0HWmUKPGClm0JPQiSqxXbjUP/kRHSsSGlY4Sli8Un++Top7BQlPsIg2lSj84dkbVYioPPsXXyMwnYxUr2twKri/SYBPPrwmvNFdKI1M4c4iAWZj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745675791; c=relaxed/simple;
	bh=HjEsxHsJLRu2c1XpvTAME47d2FHhpw2EQcrOvq5s3+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cwx4Y2b9kUnksYisNqVcL/P1ufpyqkkMbuGei22YsQE9kk/LWCF2a62gPx3NQEVvkDxVZHaMnFDtK1kIdXyWG5u8+QZ8I334xpTyY5q+42o/l/cFL+3qVTUHfpTI9r3hAsnBgEQvMgswme2Ad5Ck6M5HRblGUcS85ClqOMuUZ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn6/uUOB; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn6/uUOB"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8fce04655so35035846d6.3;
        Sat, 26 Apr 2025 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745675788; x=1746280588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1n7bn3fviWPvz6Rw9RjP7e3YFwmWOwqg06fB5bOqNg=;
        b=dn6/uUOBdNMewk5/2dEvJZsec/8Gr5sw/q82iwYZsAZKqvYE8mpyglpB0Oes9FYUVi
         IUkZ/zK56M8DXSKHH0dwq+5OsaetKQ3F3D73YuQktHtETV2kf9wyziY04JqnDyqIcon/
         WGCeaepikKob5rwrXWVtnS9M+XLH4Stb8mHXBiLNoJrhSISLogS57W3ri6/lMJmvr/7e
         R/+Udvhr3VV6testPP8QBXR7oCHQqH0PBm22NbHvoBJ4tn78a5HaGFnrU5Pin8/y1VKu
         QVraPo1Flnlt8disCT2yv5BDUCOFdpP0qMVQIdeJ8mjiTjL7bGEGhJlTsFWJ6TGrSKkO
         9pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745675788; x=1746280588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1n7bn3fviWPvz6Rw9RjP7e3YFwmWOwqg06fB5bOqNg=;
        b=N4ABIv/i1qX6+1EmfDCoShRTHdMDI5L2XlzdFI2UK93DQvecddJHxNTmzlmoMmrkce
         KNTrLGhhfuhsCDc9GaWlXabcxWqfBnPkHKMTKKCHmZdThzUb2J5oj1dXhfY5W3CtoWTB
         vVg41VQpeixAASSauvtDzeOjn4C0hjlvl7SVkh2QRze/deOhqMx7AfAQWhFcers0fXkc
         WjAsHwTo1fsxEpPjTB+OAxIF1wEncqEYCQTTz0LEMkRH9sX+WtZoRWNNZxPk1CvXMEDF
         HeGr0cEqdmB0DKT9ZBVhBZvI4c8lw9oLGJIkLREoZUi8RAIEr/MkuTEdozADNeVqC3at
         IAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+NmzjQ2AEMmfT7UDLgBJowosKaBSSOhgACtuQbrdr02EdC3opy9TEqVsg2DmV8CLcNCAh80VqPoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysBwzJ1iEAb0m0oNac71B9oQu+qqr8lRLJzYlOn8QpxH0rZDn1
	YVMqNHg2KAz9mOExs+U1f510ZMbTOiqmEIM15Jd2VZ1D2UikpdjE
X-Gm-Gg: ASbGncs2xonb34oaZAGFciavfam4NqUumzIgtEoDZFONeBmqfOe8sap+L1rWPLx5wyU
	DRYaZeNJs9f6zWfJ71yVXt80ekNberwZOLARVWX7TbPr9wei2H9NzoHBtC2u4qScIBgDY+tmIwW
	Ik3duA+6vbMKFsN4jzX3IzhlzWT4t4ADA1a0J3XxVQKEAziApTUlQzhSppT7PQ1Xc8X80/0893H
	YNI+PrccN43QAwJuz6NuwNDLoWE+0H1COA90woKXXGZ6r9YDs59PpEYlrGUh1flFYk11QsyBtZp
	oy0LT/7+jatC6qjMjPEi7a3k0j4L8AFN3iycKyyS69SomtikvnZ+qDUoOqLD9ZcZF9ye
X-Google-Smtp-Source: AGHT+IGxsexQf4apoKG715mJ6JVUh4PQR+eAh20J9Y/sXkltg7AOkr4tsqcsJSuWQrXEQijaWg9hLQ==
X-Received: by 2002:ad4:596a:0:b0:6f4:c8c9:c4fb with SMTP id 6a1803df08f44-6f4cb9d2178mr83177706d6.11.1745675788195;
        Sat, 26 Apr 2025 06:56:28 -0700 (PDT)
Received: from localhost.localdomain ([39.144.154.62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c096eb13sm34901406d6.68.2025.04.26.06.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:56:27 -0700 (PDT)
From: chris.wei.cui@gmail.com
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cui Wei <chris.wei.cui@gmail.com>
Subject: [PATCH] Documentation: fix speculation.rst chapter
Date: Sat, 26 Apr 2025 21:56:09 +0800
Message-ID: <20250426135609.735-1-chris.wei.cui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cui Wei <chris.wei.cui@gmail.com>

'Mitigating speculation side-channels' should be a chapter rather
than title.

Signed-off-by: Cui Wei <chris.wei.cui@gmail.com>
---
 Documentation/staging/speculation.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/staging/speculation.rst b/Documentation/staging/speculation.rst
index 8045d99bcf12..0d526ba55d14 100644
--- a/Documentation/staging/speculation.rst
+++ b/Documentation/staging/speculation.rst
@@ -63,7 +63,6 @@ of an out-of-bounds address, while the second call will influence
 microarchitectural state dependent on this value. This may provide an
 arbitrary read primitive.
 
-====================================
 Mitigating speculation side-channels
 ====================================
 
-- 
2.43.0

