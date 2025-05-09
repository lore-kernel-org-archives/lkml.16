Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7823958A;
	Fri,  9 May 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814446; cv=none; b=fj7yM1UYt/ElSFjJXgDz87+ZZtPGjyKE1yUUSELqDCg2asThvdNmdz3zpqfoR6UTOsH0k5bPJDnBUf/Pj1TAblYJn7184FLsB/QtE6YbLS7MxEt47SxTR4Xjp0rsCEWEbvNHa3Aa5UFIXwvBgfNKwG0sYwlVop/qj+VCWSxRbSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814446; c=relaxed/simple;
	bh=wOkhR/zjvIlNEvtsTp2WKg+AVT8+8Er4BolkshuW44U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WowJT9tLlJDz0pag34Ud3tfjb21DKLZ1t0l9lgy3iQ5XvzpIP+p4DhHigCx9CxjCKOweDt5rbbFARnwsKhyICfbj3Mwf/5IJ0RaYhhzlEuuS8U/lvTewVBtTLN71HJWvI+9OlYzBGn17xsgR+WeLCw7DLtBcJWAT2kspgo9vJWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zblk4H6K; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zblk4H6K"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30a8c9906e5so3116635a91.1;
        Fri, 09 May 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814444; x=1747419244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNRo9fm7iyINTImWyidU3KVyi4MQmQ7f0YzWwyxxaXc=;
        b=Zblk4H6KpS98H+gjFcrFQ20gq9LJPyvYMiP1Un99kyDn3Q4qkHZ5mamDTFVv5/wwEG
         ykjzJFZaKeRc79GQfR2QGkB4nbklZFsylCTr0asTOd/pHgyBmu7rmKoLDjn7mTk1ufKA
         NNzDErj5/6APmV7Wjfp8GvtfOGZ5ZoWbNgy95knCeCAVyFFCKZBBiFxDB9yW3MbnYUhF
         zQWSsNRgOAbdXA/YqvVJjajSFTTcFqtliiUhR+7LHKiun5S59sbwymFRUxIEK9ixMHTC
         BksqD7HZ5ltMADG8Xi0xeMD53L+TkZ/g3rKltcmsLoJ3o5mJKb9kJzfFAqc1xFRx5qvw
         H4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814444; x=1747419244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNRo9fm7iyINTImWyidU3KVyi4MQmQ7f0YzWwyxxaXc=;
        b=WxnSJbbiCxx7uPfzIlKObW4bRo2yJaFYFQoXdPWcE2sYCU8YQ4JFgymYjrDyJpI5e2
         j4bld8HsDE/Z9IAZ+wHGzZ6r7DYp3HyTviWMQWHWbPXPTVY0VDKd4t0yeSgCS5DGBRVa
         f0penXHfKZJOrrURunbLT30Bi1EEMhvq18+nNA5QxkL8uT0CprnruuHCZhPZSaICp/Kl
         cMjNIsqitDvnI9Tbbuc7tY4GtCOTd6bgKdPUOZDb2Y8GZe/rE2eN41jVeBtwKGDW5Kt6
         40xXnKkgU9/vPuyVtvCMNHbyn00QR3QMByRnl/nP0E7UAcn7TMkMTkpemgyzkKV/KZ27
         SHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz+4hP+XfqmH/z+rupHu2oyo583nmjzQwichvrM/ShNhVYgjOW9/9FSiAxFfhztyOaD8V8mVSP9Th2zWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05qqH+nK8BDRgvSZLAcC3m5Gv8EmI2H8G3H7sPTAWqaGn9mp4
	mmpVb6fMOU7WEU1crvxu8RB9jXofFyONr3c0gO4XssV7mGyPGWukVu8izwt0cgCDiA==
X-Gm-Gg: ASbGncseJ2Y9T9eZ2wiCQLrvcW2PmHTRShpb7dekafnyymCyLhHMDAea3APvVZMapXo
	sXXxLKRfNOsjbAJvrVTzACRgbS/KZZhLiEpqXOvYtgR5mr0qRFYlnPyjwVklpYkdY4jvKBCJM10
	laiPy812U1cNgBnzBM9rTxQ0QPZWjaVM2PZiWGu1787ErSz9OtgzoKTMpo5yK9327gU3XeWfCLR
	EIgG6P82l2KNA10QKRI3/gIf9NyNKFqyKwr/39TB80sNjDkEvK9nrilq0ddwoyN0cK4GyXznO0s
	B8EGnwBvk/Cgix/mQSebZ5/t1tFGmmW0G5pNq8ps9rStS8ZyFNE=
X-Google-Smtp-Source: AGHT+IG1IDbBo8zSWgCQ3XPdci2C5OPmRAXOekINXprX8tfkSAK2JEHQY3UrbKWp96pgR7JLi921FA==
X-Received: by 2002:a17:90b:4acb:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30c3cefe24amr8073503a91.12.1746814442868;
        Fri, 09 May 2025 11:14:02 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:02 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Date: Sat, 10 May 2025 02:13:27 +0800
Message-ID: <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo x8 EVB board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..ee244c9f75cc 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-x8evb
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

