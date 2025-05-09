Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6723F41D;
	Fri,  9 May 2025 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814454; cv=none; b=qK6cUbwTHI8rnYOdwqt87fIEC/I5R7Mzf04g5kUAd92lcoLqG1+4/gyNDpWX+ycdsLvxS5dIDBKzZRhmzJHjwOgQKDXV750zBZ6Xpaxg4u+4xBNIskMJZ2CHtoQ1r0k91THHAIGktGQsUSiHaSVwL/Xp/gWCWxYW/emAyL3ANzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814454; c=relaxed/simple;
	bh=PIM3vKbypW+AeUpWeN+6R2pr/Ih8OShFct+42urf9eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGgGWwKCT3WsJBZUPUgIgLVIahUQy9HMv6r0meC++OPbk1AHWpjdOxZmTYDsgAbm/9eM3bkTX2oCK2SoFXVDkkD9UttwUfpyS1tp6fRwZ8bN8cGhctvIVmifIP+UGIkvNFovLShAuz0OLpfywXyjc3ijO+AQJ3Zay2hcC2Do9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWMwfUao; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWMwfUao"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso2947215a91.0;
        Fri, 09 May 2025 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814452; x=1747419252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=;
        b=HWMwfUaoDUFmJyDy+q+d8tnMMbkH/lE0EF1ai0kUIaDc1acjS8YZ8Xz2K35pTUaJ6Y
         upwFDEh04Rztl3fDAb80g7pMEQTaga5TM4WDeWJQAcS3wIBomandikb46XNaW/Zy0nFR
         zRZ+HkCTzElebE7d8dDMm3TZPyn84pvwhpHUMRP1tLuA0w1SXtLKrYcwoEzDlLj/ZfkX
         EddI8BYXN4PL2xq/a9gKwluTJzlXJWumFM86cDMwHR7VlYHgotA6zz7sB3Qfvg8oIJUu
         F3Qrs793ddEktngWxDOyI1iwSTbUWKhk4k6v+ZgHW/NMKFAbe3QLDrYwpN1DfahNwVUG
         59GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814452; x=1747419252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=;
        b=A8fX+AmRDWHmjTNdqVwIVC7UZpbqj+ZdxccH1Ib2QEKnJGB4T6n93pf8Iquek5Bcyt
         IgS40j8p1MA/pAf8tRUL5cpvw6MyiTRTlHjrBZ/l4YXRCcweO/1Rj5bWNZBw7qeK0Oro
         tSCwi+sljxqvb15yPU2Hc5qc7fj5qFjoj2mTyNRq1iO87FA1vRQwBm7XYoGMjR+YoxvN
         yCEAqjTT28qRzK65/4hWtf4n2GrDGBUyW1d+cuY8rlmFBoZ90Z5w61miXjL6KHkPQ6dy
         5WBYuaR5MX5DD16CqSzWIsGgYjVn/43xXJf0y8atfhb/dkpEGtWk+KXgBHdTkG6K76rk
         UJTg==
X-Forwarded-Encrypted: i=1; AJvYcCU02k7nyD0TkcsMpWB20PhRgCWvf7Hn1MfhDGWnAVRrMRtbc1yeWZJHpbnzCzz78lyohSO16Xc6V9nh08c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ocxkCE2vUAQ4fPg5k50jdAkcRmE68AD/ojAzBgzDLVsgQHF6
	gyiX1lg80xbh17KFEpY9rFe1qKYHe5ueIS9jNQ2OtjTonSMUzlda8ruu68inOHjbVA==
X-Gm-Gg: ASbGncvbUOw5t6L2zuiNueoj64twBm7eG14mYDyVgXi55cNjLb0Z4TRYyoET15ImPjy
	73TK0ewzr/xDzCkoGpG7VQ65XP777eHtN0TjwOhBbCAq79vgiTTyVCEEawrMl0KCG0zRAWuzYWA
	uZcBkV3hOkkxqOeLWBnr9Etvr6Dk326BXvdESyUFo+XunPCmIuVlcJAAspjXsjDVJUgUpfFR49o
	WMR34/dTWe+dBCLOTz8A7/bjjmkLPbOMjWxbQbfNFmIZTHuYZbM+ZfKwl5prh+mUMYAA1XpM7KN
	SsOH+dObkD/adT8vDmPBryggNicj4kVoV2pamWfCLZytov+vyQY=
X-Google-Smtp-Source: AGHT+IHa2KjYQjIdgaOluaX4vIX9MeA+TzhVP7ZXcPWMW4rnYDKm6roeCXeZYEdWNrVM1+kd8Ns2Hg==
X-Received: by 2002:a17:90a:d2c5:b0:30c:523e:89e7 with SMTP id 98e67ed59e1d1-30c523e8d29mr2996226a91.16.1746814451476;
        Fri, 09 May 2025 11:14:11 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:11 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Date: Sat, 10 May 2025 02:13:29 +0800
Message-ID: <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
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

Add DT binding documentation for the Sophgo x4 EVB board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index ee244c9f75cc..0f93f4cbfc6c 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - milkv,pioneer
               - sophgo,sg2042-x8evb
+              - sophgo,sg2042-x4evb
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

