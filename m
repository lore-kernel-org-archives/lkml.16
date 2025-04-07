Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78B2222D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049368; cv=none; b=mzezmDFU9f8mMioJdb/kBVddr0UHaQZ6TFHIlXs3iJYOCFf0cEUNyn9qQPvWETQiGg3MAw+7OY3wO2PH8ilhqtQYX04JzDblfnfhyVS/WI4fbNhK2S70lPAAACZI0kTYMb/qxGvl1pY6yNfPdFM7+Its75eZbZ5KDslPVtS4lr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049368; c=relaxed/simple;
	bh=xwD+hParWO1vz6uH2Pzv5Jj35e6Ns1OzYF8bQQL/WmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBq+09fvJl8WF/Du3OS7x8LZvJkktO5rDSezSVPc9rQ08t15jIMs+LatZB8NCjsLv1CPZ778kgEpyspNugP8p3BGNEq0R2MrwCKJBAKRj2F1YsmwGFqFf1fpuhZc7dL+S1hdUMoZkU1AYd2P3ueQR6mNNv6xVyPrfYmbAVg3pNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDpaTv9D; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDpaTv9D"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3031354f134so3489732a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049366; x=1744654166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z0y0TK+N2j7unfdHAGWrmjHTParwUExlSa0jHt4G78=;
        b=ZDpaTv9D1YlImNpWYlk5/LuT7KCeSXaYISuC1uWSHN2JOyBa0TPYCuELjoIn1RF16/
         4BGFKLcKO78Vi8uFQ5A6EzB25M1Aw+LBpdX4OqeEcHdGqKlInyUbH3Pw9qx5K6OFy5A5
         Wwt7rYvD86WJlrjnwmJf1rGg2atHdOYEg14dq5SRqsX5BDpV1FH01xPezFV78N4nsWn0
         56TV99lvs7DIjvxuzqrF/OQeOOhUAk0gBvY8Oj/ciA1sfjzkQML2sP/YL0+KrXoGlEqg
         bIp6/Nm1W8VEpiJOo7fRZgzADWBGjN3dGf6LNrELe2yaDoJa0ZoCKfdife+Xgky0yJNj
         PzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049366; x=1744654166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z0y0TK+N2j7unfdHAGWrmjHTParwUExlSa0jHt4G78=;
        b=knpOiJnfclYPXKAlakHup7wKMFGczDWFqZAxsOjCzfpooqtC3M8h8b9RqlWV1WtbJn
         OFpm+w2uXqlSykW06mMT2H+eDzuvTT28UMQ1L97XdsfJhrCIcYvY8mvKJ9UOIy8X7c64
         MpDk1zlnia12cietc25r/emCVopYcP4gWnnjl3lpfwdYAmAfVWaC8StdiDqdZhlNVlk3
         C2muzHo5Qv8KmkWdGR7YcBGY4NTu4ELikHvFq+a+ASrY/ogOgF4jY2A8Z7E7E8qNgURL
         Areug4PoOct/EYGTdM+Hy4ZiVrJ1S7Ri3WtUxlcO/YxaNsL/bzWDjlDTEBss7rSk8u8d
         tgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU09K27bo8VvWvN4TTV2hMBQCRf+1RQfOff+drOV/OKmkcEUJ7tT4Rl/MV6PbyxLldu6/aLJULuPl5eDnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkZAyItsBIJTWJPuFmJ9MxxP5GUmMiauWHh0T0jp74F9O/oopB
	DZ4h7m6hZg/Ieg10ep2HXmcKu3tZHkxP1q+rSiKZJ0/XOUe0JH2P
X-Gm-Gg: ASbGncvHu0mOrl+uyfeGSmI79234QSMGlrBhsUmc1kvvokpZV9j6kUBUskIGuXQDm74
	7fV5bG9imh1EBYNw1G62iQ3Z5fQ8wry/Mm+dc76DYtGl6rwN6yCurFNvPJJ7iHCdMDEWKYelwNS
	mGxxIqYveYcgIhIgIAzT+xe8iOumoIZxFRzl5V8bkOPnuy6NiDpZYXElRFE0OTJ0OLT526I78CP
	mhE9sWheAhDOUux3CQMWmLb/WWjaXsPqCjvfp3ZpYChYHWfbENaHhPv561e1XQueMB7pKr6qDtF
	ozhhY5fsN34RjzNklattBi6L0lrMfsEZZ7czeq2E8Vmk0mf67H/IlFqA3B5K8TqMd5d9SEjKf7W
	xNFAMwrCg0hTAEZOj/eyO2Rbxi327FcFrQQ==
X-Google-Smtp-Source: AGHT+IFgrdURIj5aGIW42rvqFSz+4B3fV+3dwcYfHSLwCG5BImXtPG/2PWupoaefl6dEzTqBihbAPA==
X-Received: by 2002:a17:90b:2d4c:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-306a615be9fmr15006956a91.19.1744049365882;
        Mon, 07 Apr 2025 11:09:25 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:25 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 08/12] riscv: add a data fence for CMODX in the kernel mode
Date: Tue,  8 Apr 2025 02:08:32 +0800
Message-Id: <20250407180838.42877-8-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V spec explicitly calls out that a local fence.i is not enough for
the code modification to be visble from a remote hart. In fact, it
states:

To make a store to instruction memory visible to all RISC-V harts, the
writing hart also has to execute a data FENCE before requesting that all
remote RISC-V harts execute a FENCE.I.

Although current riscv drivers for IPI use ordered MMIO when sending IPIs
in order to synchronize the action between previous csd writes, riscv
does not restrict itself to any particular flavor of IPI. Any driver or
firmware implementation that does not order data writes before the IPI
may pose a risk for code-modifying race.

Thus, add a fence here to order data writes before making the IPI.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
---
Changelog v4:
 - Explain more in commit msg and add Björn's R-b
---
 arch/riscv/mm/cacheflush.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b81672729887..b2e4b81763f8 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -24,7 +24,20 @@ void flush_icache_all(void)
 
 	if (num_online_cpus() < 2)
 		return;
-	else if (riscv_use_sbi_for_rfence())
+
+	/*
+	 * Make sure all previous writes to the D$ are ordered before making
+	 * the IPI. The RISC-V spec states that a hart must execute a data fence
+	 * before triggering a remote fence.i in order to make the modification
+	 * visable for remote harts.
+	 *
+	 * IPIs on RISC-V are triggered by MMIO writes to either CLINT or
+	 * S-IMSIC, so the fence ensures previous data writes "happen before"
+	 * the MMIO.
+	 */
+	RISCV_FENCE(w, o);
+
+	if (riscv_use_sbi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
-- 
2.39.3 (Apple Git-145)

