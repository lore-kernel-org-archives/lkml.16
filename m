Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9B26A1DE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954488; cv=none; b=TPbosAlGCi9OS1XgtSgR5gcGhw9WwodKqxNNVOt7tmePEWE7nW09Guw4KgfxV//bAaFx3mc5XYFe/viU8saVJE0hbR0du8a1povaZEnbYZB7VLPEqgdFl9cBdKxsh7NHR5thFvo1qbM+cfLnmk4SZXiQNGJCmHk5wM/KegAGuKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954488; c=relaxed/simple;
	bh=6AgqMNboe7B8nPvHCdPBbiCcZOlfMl0j+JQ0fzt3kCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XEipsF9i2Iqds46cA2epbmyDRoRky1d12g1AMtsdh/YM2w7k+iaareWneBo+Darrd54cN7fTPdxXI/laoHcLES9vYjz8JUvvhEff7+RpX9ZfEgDvfHpTsYwjf1s5h6dzVGboOvZ26FJBInA24oa2pIONb4nk00ArRLslL0AY3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=M6579sxP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="M6579sxP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1335734b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954486; x=1745559286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=M6579sxPU+NsgvFAaOf4J2OAcwSRleaf2ayPQCBbBmMlo/8PLUkoJbiVrGRjKlzMNz
         xMuNpRoGzE8HsDAeQnvF7Yd9+p65RYOT19mcEWIP2Ocu5CMqzxnAgkutMzVFnyCayNOY
         yjFzmWucInILlH+LCNtsPK5ckBv3hd36A9wFuYzVZL1Mr0sGINu5CNmUGg5JzeLk8x3g
         O4cErdt/t28bXHIWiu11ZfkAOHZSVmmJgLBqwMT3Tv5B90ZepTmyuHNAAO+Zzju8Cfoq
         E1HBG4JakyvVAKDVfkgInQB0d8s4tufhXnaAYIhH8u76o8GA8qNaqhX14YfGchAXoSki
         CpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954486; x=1745559286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=sb5kh1EsYFArPzFPR6xO1nV0jR0Iby+TXTRoE+IbWtEiqgoDPjI+zwBo+t6h5EWaZw
         YGZU9QYq3zu4X/Gt90pKGlp7lFIhfTKFqVq50NVpj2LwqZj4inJs2htej2Cwn3ZWoQYB
         mRqFb2P5kyhKOTNoR9nyt4TLsFu5FDadNeXtv4wPBJmGHUrW283HW0M4a6g1GPGxBbaq
         GNWpxT1xLatponEQ+wB/BkgeYAhbpfb0ejVuc0yW4Q/fshPnZetiuDlP32UlPm6d8KEd
         F8SHg/Y3HDVC+BVAhgvbAJP3LrWPOLyi0vL4oAS0nQ/LyYgYMi1ZX3NeMwE4CgaFT+I0
         Nd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7QyD20+ruvB+GWHmbFBcC+sRJ7Vb2KZ0uw7l4p9hZa+OYmC5HiQKfdInPtY9QJu1xGrgcTxdfNvhouiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeB7BOYXJOIkEMkxvKRiFMMW4eMrJUuJWzO8FMLKgFa17FqaOK
	9jIWHGxCPzBYogt5mYyvsWdRZS6X53wzwZKqpHyrkr3r9CVdbe1DRfvlfu5Y/HQ=
X-Gm-Gg: ASbGnctLCugxoPYUyyDF1B2E/N6/JUywJLB1q5zdCROCnRrh7cMFLMmplfeBuwByeJH
	yI3bK4MBBf2x5IUMkp5dtSZPnwnteR9DJcWwPDWSfg6Q1aXWUV84q3/nrbJzrLQfslxYTPMTJY7
	b/TRbEhlER6BoElJes4HPc/YG6hHLPxBH+engbkTDgeRrsIdWpzLRHPHyJEKm7WZQ+UkWjEBl0i
	mygDRN6j4CUzBFWkVOcEvk4Ky1uhfrw7fh1IsNEnnUDGPE/JQ+xo+hdzi1ZWvpZLd//sDcmuCjO
	b512XXA04x4kxK0nOQPIo9+UyzRDilu9j9yKNxtsKloudW+k6PszUNmXwcDJ4ecLunUsXLW1/97
	q6HgTSjT4/2Q=
X-Google-Smtp-Source: AGHT+IE94GrG6NgY94ivBPu/h8Nj3d+BVoWj25z9GYvOP7uZPO9BGG//BTMuP3HCRMD4vlqRI/woGQ==
X-Received: by 2002:a05:6a00:4acc:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73dc156f96bmr1971764b3a.16.1744954485769;
        Thu, 17 Apr 2025 22:34:45 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:45 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:39 +0800
Message-Id: <20250418053239.4351-13-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hwprobe for SiFive "xsfvfwmaccqqq" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index b772d4631284..9f3278a4b298 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -3,3 +3,4 @@
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ		(1 << 3)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 2b9505079a9f..1f77f6309763 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -17,5 +17,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
 		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
 	});
 }
-- 
2.39.5 (Apple Git-154)

