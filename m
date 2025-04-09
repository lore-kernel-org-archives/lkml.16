Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791BD215070;
	Wed,  9 Apr 2025 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181979; cv=none; b=mGZ4m0yHbv4VIwMAmSwRiGKUvqnQ4Qxuexa7QLCLjZJVmLqoIkRM+Z20pWBL8UoMqec6CDBynczak/Sh2qRQZcdkXfstd3sAg9piksJuk4pb8buBsqYWrtwkyARZ4y7eN+m+BKCyk6xFM7QKsycogcTXKbL4tuckUQFtdHBal/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181979; c=relaxed/simple;
	bh=mdMjqDgKLmfSj3Eltmr/eklydzSfhT7tfE+JI7T4puc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBXzJZpCs9s9M1oHzElNR40R2vrZCPG7VAPGHgJYAKEYSE+h14DttSsEA4JRptfkjQYZWZzUzxAplMPhruOSx6SputT7DBOxGbwcmD9cWWsljSCsyXlNqTl8tjBoZa/g/BdsGKIvsQVMBexdap0v8Mj0+w1wixk/0nyukR9AAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUa8IVVC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUa8IVVC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2241053582dso82190745ad.1;
        Tue, 08 Apr 2025 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181977; x=1744786777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=OUa8IVVC0roi0DA7lnx+m9Z9EhaUxp1SIEZwy63LejjfrtmFXC2IHWbhwo9QI1xrYu
         Px+/7qXLIqpxdMLBHM4AkpKOxyrt4VT50hVJTt6YOEcFd+d42MNf0RyB32H8nQTf2m1O
         WiVunCdl4mJZm6pXpSrGtMU5vBYNCOTzoUHoQUc6bHu+8SWoU9rOeIjpPkh3ta6YY5PW
         cO4NJt0vr+TIFYDV894Ee8ExWw3P14BoiBPHizDnR+KuH1IDV4JRV/cRzNz4IvZpchBL
         itvEooWXl4Xa93iA606Vy3Q99xCIl8yzeVV91L26svmrdCt5X3GwY7V58G+tC/UavhuZ
         h/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181977; x=1744786777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=tnqT9RNBw6RkLPJbRc/OMl006s0EcAvH20LmBLpcEkz9qivgD03WfW+NKw26wzdqlN
         C7E05ItYnDKHki/8O6EIRJPtJEZl6ub/dUgr5R7J6BfZ+TjiNVrNPaBt3HyZP36/SJuD
         bpnjqj5iF2W2M3LamAoxRTXrLCBKeszs8AFf/p7OqkrChy/pkII7d8Tge4JYsGuOl/Oa
         ZW4UCXwXpKf0Lau57EW91KBi8PMjtp2F/A+MCiwJTgkdFs7A0oRIxs3z1+HYn1OFk0vG
         dluHRP2Jvy99ujnC2CCeV3xGCsP003tk8waHvO0QtUKXayp7kNfckbAbVUp8aaldWSWA
         ArDA==
X-Forwarded-Encrypted: i=1; AJvYcCXux//WyYo6Apl9hDfch1mWpS+jxy2Sx9DL6coS1RHoCVRM4MO3+6XcvM8jE1qTMco7rVtgey2Bfpvlk3LzyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92ADpv4LmjEzgacTryoQ109LS4n+nwFrcVnJQItkVJ6gcnJIl
	1xjuA8VJ6mBwlxLwKf5vVUu8t2ukJeFCDZDnt8pv/jOGsC0Um0DMmVf0jL8s
X-Gm-Gg: ASbGncunO9KJu2wAYwPysJmyTersJde1oYzg4uoYW5ngHkR9ykb5RDYBO4aXFEkHcGL
	TqTJVV6qohihh0QKJ5DYoesi28+19OgP4BcW303e0bU85VKNHpw5q6Zc2liibAGvpjVEu/W8btO
	jILVZavaBCzI2CCvLr/52q4Tt4dknMRZ76z7p2zddctYN/wq8ciJSc8iTJibyzc1fudwp+6nOP8
	ITGCe3plzHtRW99EjAqOACl0uf7SEQBNlSWgP4acRXlFl8KQl71W+m1eSVTBfPXrAvnq/LQfv4B
	Yzewft3tbjZDbM6GId4E2gJWqUBpNK6Yp9TGlyY6CKaSBv1NThsvcGqEzr/Rd/PAsSAMeuS3NZT
	gYbF1iSyq08X/8D7HPg==
X-Google-Smtp-Source: AGHT+IF2Tbyqa8jlbF8mK3RKpXeeOmZUaQjjm5vh3ODXS1zPKWwm1EPLzxRklzhDHZPXhNC/FLbkog==
X-Received: by 2002:a17:902:db08:b0:220:be86:a421 with SMTP id d9443c01a7336-22ac3fe6feemr26628755ad.38.1744181977595;
        Tue, 08 Apr 2025 23:59:37 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:37 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v5 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:58:00 +0900
Message-ID: <20250409065802.136971-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409065802.136971-1-fujita.tomonori@gmail.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0

