Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3290289E21
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630183; cv=none; b=Rc0mTCKf2C3VamQHeq7KhpQzTNWnOWuuFHjS4w/yPjyABeqNic/9enUo4jMryqDgUrwJrZ4RrqSEsdBinDsPjNClbxMqT9vUEzJOiPUoT2tjwL3fNCNjINI/x6tPplkqyWmg3grcRaW11cbGQJ9c0q7LkfCuIg2pXXOVCWNLKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630183; c=relaxed/simple;
	bh=Z331Xz6BypkZeG6da25QTFR9t+2pjjlYXN249He1Vbo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ofgVmgoHrLXxEHOARt3iBnDVphHLt8RDHzkd7HTqc0J7I6E/XDM+OPSwGKxQItHnoWOTwTBSPoOn5YCl+nJ1TiyaaUlJ/ghTLK02Hji+ptIGcfRMTUE3q3fo3oByOQYuwPrpm3eweWA/V51UGbPFYJPDOLZG1orNqQU7SfWezi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKTIv+3n; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKTIv+3n"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549963b5551so8039664e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630180; x=1747234980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPQPH+/Eb6uvELz1Axgon35b6gEdtxND/4Qsd9Mokjg=;
        b=GKTIv+3nfkxThykY9Nz8Hz1TvumbgT/HLNsboBHozdQ+PdtouovN5k+WI1GzjcPQ22
         +kTDEoC2v+P7PF1DenKZDgFErohSM94Xf2JU/rBp0vmFycCek0GRYCv/uBvgRsaHHSSD
         wpc+4XGajejdKf/ZcAGgfi0q3cePhgOZy0CUFeGdhbpgTlFmRIugQD5iAEmox6mtdEFr
         0AUMRe2gsuNhLQTJen5n3vRr6d9wOqUdYIxUvSnb31QLs0ohNLfBTc29iJhZMAvI8JvM
         jVUmra00ZDDxMid+o4bSCOSLSpz0uFB8HirW8kD1O7BS2DNbx4XC08n8R4npNK+9OPLE
         xj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630180; x=1747234980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPQPH+/Eb6uvELz1Axgon35b6gEdtxND/4Qsd9Mokjg=;
        b=dqDjhGcdaGsGr7waWLKGa04ojBZ1cEfYZx52T1GRLOOXEzuHVofQ3wR0gPAWvxYvCT
         mpjUh1NaOLMSs4nq8d/p+nay/KQrsVE644sdY6UpZvnDOrJj0qNik35+Z0ScNRqSt1OB
         X2TXbkzysXbM8JD5whqIN69opgy8T3lPPVoOtfNWP55XHJNYES4s7yClZMopXMMEVxB1
         mombU0WFo1S9gC29VDE4tK3rP6Dx2wCXhM7g23ZL6fHxYRzP6XNUKCYGDUqhCCSohv0M
         D+xNWrNyipukiM4xENzmc5hY8HX+SgKKln0b00CdV12usFW7s3vjV9aR+agTIwEPyD/V
         nObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdz2As/p30JpJCt4bKtMVbuSmSXQB8XXECX4zb1i6lsiuyasHz1EEQQmr3QJqxLlOkB5dQR/7xY57GBCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvGJaGfiIEL0LmgqGvGQp11BZH8GOIY3zW3bWRN+orJViO8Tb
	I4TBcLlfpXCsFWkJDu7BgTbxps1F7CBlI4vjH/DRsVEO9YBI45M5
X-Gm-Gg: ASbGnctjmniAMGo1nBlN3dHYCtLaAWxiPHyzZmXjtZPB0XCEAX9T6kbavvdClHU0MuI
	WyykF4QVPRKHyUSP/V6jt6Okgr0InO6+E+zZ+C4CfKs0LIa3R9h8NRLZ8to94JAiuN2Lmv0Yt3W
	M04/G0IzpLn+sD/ge74H9nFiW0TbuZuQ7Evhq6uyFCC65O61oAWBjUoCdJVpXeJEufWfspJJlyX
	ZsvDDBsWLTZNbAgi4rRV7iUUu7DZK5AikrYhpEP8IY11Xhg5fdlQIAWjgkQMJsGXTght83joN6s
	8TfIkRrFuG135rhh8pcFbdR2pIvd0uGZSEmk
X-Google-Smtp-Source: AGHT+IHxBAef2IhqabpPHC/e/d7qXkNOZ7Q9azXSNuOOEutHsNe+TFsgoAl4GJBc7u1VHUQMCZ3stg==
X-Received: by 2002:a05:6512:398a:b0:54e:86f3:5e5d with SMTP id 2adb3069b0e04-54fb92936bcmr1402997e87.7.1746630179627;
        Wed, 07 May 2025 08:02:59 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c8c9csm2350928e87.92.2025.05.07.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:02:58 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH] MAINTAINERS: Add myself as vmalloc co-maintainer
Date: Wed,  7 May 2025 17:02:57 +0200
Message-Id: <20250507150257.61485-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have been working on the vmalloc code for several years,
contributing to improvements and fixes. Add myself as
co-maintainer ("M") alongside Andrew Morton.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f61314..0aa8db9d0fb52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25983,7 +25983,7 @@ F:	tools/testing/vsock/
 
 VMALLOC
 M:	Andrew Morton <akpm@linux-foundation.org>
-R:	Uladzislau Rezki <urezki@gmail.com>
+M:	Uladzislau Rezki <urezki@gmail.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
-- 
2.39.5

