Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A9D21C163
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049344; cv=none; b=bz1jS+YiKFWb/t2G9Lefs0E3YRCF51nnAR6/8+NVJmjYbzM5kMV7Lu8gBwHlA+oDH15/odCd5QmEGmTsn4D0j/nuHpBO+4Oruyrr1fSQ+PZ7Hba3j1p6Ox8qXbwGcq3E9nY46734vck7c/mhL9QIxB5GcS9A1kFz5sBLL8r+9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049344; c=relaxed/simple;
	bh=XYVKznni0xjYkuCQ0P42PYaANfD8lkdtGJTfYeFYREo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rPTIv1TfeRSy/0LQ04NyAKrp+ZAwBBPj3q/QpNTL93FNqZ5uDhMAMrSmLaYKAdW5eeFoKpbSYBYy+hCJMEelq6hZaqjfeYD6gqizk8AlLT/NWBj74PQ7GgHSPQQDVD3S4W7mWXNrH931CUdMy472NXxBT1EFehGevWupN8+Y5oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E67uszBF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E67uszBF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so54977695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049342; x=1744654142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUF0nsnlw7RZ2EpqP50Kib/oVdoqhGZKkeMwJl9c7jk=;
        b=E67uszBFYowimhp6wLdZelUtu4inSCQjhYb+49n2ZRMgvLb8CaEjbDSRCkWTpqR2wt
         IVn6gqmgtJg5d/kkvat8owZ2AGS99JG5Bf+MXjoIg3mD9s9Q9a7eFSfsK5C3kRcXyGqL
         mmpyqqr8EsYQl7SblJOXnfY8Lc7FYh6D1hLNouEjSCVnBMV3cfmRBVLFdfAtCLzum1mb
         058zmZjAvyuMxHnyqf0FFl/eRj7jAQSH1tW0EG38h20zbzIKwZGPscYYJMUV3YRKjwvp
         /K1rO1OcM2V35CSiZ6+eMs7P39/zNSRckgMkno9W27Bx2Fveb1q0hrqYaJ5o7L6X10r8
         zapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049342; x=1744654142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUF0nsnlw7RZ2EpqP50Kib/oVdoqhGZKkeMwJl9c7jk=;
        b=UtMTNx/WFThlWTdg+zVrge3yV4G/YotUmjocOrgEptIyduNwQ7CrTNCo7zJdza7hTh
         632q/PyY6EKcEwWcTDW3m6fq7x8v5VXWNrsyfNOE8FfMZQuJUOaMUv8IckUpfOSp15yo
         ljmuUPBRuzlUlKAxSw32YjsYmhXlzFlQb/1TxkNBJ62tg0vU7nYcQv3hBClT6Mamas/G
         tKzRX7ekFUEjNtKbk0l1U9+pMOraUCo6jPwbNi/dWD2syFNWafxCHgA/L2YJk59B8FDe
         brL8vvS0febydtcem+s+vYxCuzzqfBxEDdthdjUPkxkSVpt/IViEB3McowV2aDLpF9UW
         WrmA==
X-Forwarded-Encrypted: i=1; AJvYcCXF4HeiWhMAM2oW46wUfzPYw0dLHSdqPShKu/pfJaSawB1DT5H1nJTVdQfiMOBzRwp7jube6gOc4o1uC7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7eQNXqmqy2stMtsBs2bG+eItifyfqp+8poQ9wmoVhofHRsYIl
	o6ZN5HXzhayr4jF3qzslg31OncJkezC+hP294E8Oso0O9z3q/Gve
X-Gm-Gg: ASbGnctarNjP2dGWawwFMa/FWowj4IsbSUGqh5wq1p++EQH5+Y2zd+N9JvN5t1NevFH
	Ll6LpQNqG1Gq2xpPgSYAImdqgT1gmxNRAVGAyW6VT50+/tGKrWE55qNt2ucM/E1B4gPF9pBXlk9
	EpbIpYOicOPs0kAC78gM/8OxtCiAgs0VgZFBJGjdTp9pSl2da32q5X2oF5j0zvcivIKOsrd80aH
	X9oTKCTb0duqrGGsJ6QjljO/cjg1VJAbXvOHRQjxoUy6ciyDZr1xOrN8OokYAH+SnFtsmg/cFSV
	+nkPZz4Zpv7WWDXLmNkZc1uhGhTnX09a5btdHk/bCwO42bFzY+vEf4H8lluklOo46Y515cqy9DD
	vDGXOpJXTj3xAdbCzR9H+4/Vg54TXt6o4v96Dbrt3fbwY
X-Google-Smtp-Source: AGHT+IGoRDgmxduZEMyRWH4rWtb7Cl9qxilgGQO3cjliR6W+8rbaesJEGRduh+4SldUK1SWSm3N/ow==
X-Received: by 2002:a17:903:19e8:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22a8a058646mr194838985ad.21.1744049341737;
        Mon, 07 Apr 2025 11:09:01 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:01 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
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
Subject: [PATCH v4 03/12] riscv: ftrace: align patchable functions to 4 Byte boundary
Date: Tue,  8 Apr 2025 02:08:27 +0800
Message-Id: <20250407180838.42877-3-andybnac@gmail.com>
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

From: Andy Chiu <andy.chiu@sifive.com>

We are changing ftrace code patching in order to remove dependency from
stop_machine() and enable kernel preemption. This requires us to align
functions entry at a 4-B align address.

However, -falign-functions on older versions of GCC alone was not strong
enoungh to align all functions. In fact, cold functions are not aligned
after turning on optimizations. We consider this is a bug in GCC and
turn off guess-branch-probility as a workaround to align all functions.

GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345

The option -fmin-function-alignment is able to align all functions
properly on newer versions of gcc. So, we add a cc-option to test if
the toolchain supports it.

Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..7dbed10843d2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -150,6 +150,7 @@ config RISCV
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
+	select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_GRAPH_FUNC
@@ -236,6 +237,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
 config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
+	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
 
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)
-- 
2.39.3 (Apple Git-145)

