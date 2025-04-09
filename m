Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17182AE84
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218930; cv=none; b=pVv7gDmNha85EhiCMp48u0cK6SZy6hKaJavdWecjnuEuLGQwWJDUWSNusSeqesbcLahj2zwNxBLJ4KcSd221Uqy5oKRLbYb9emMr52zJi10H8TEmlYkgh1Tv5FCwolhaIdJLH+GtFWube+Qz5DQjfn6+s4bWiKoOCSHAbJn++l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218930; c=relaxed/simple;
	bh=vfrrW/672WNCNR+2bdSwLDgR+vMSUyQADM6MvGB4/WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQQ5vaf1sMHTn4bSHbtPwHAxO6gQY1fRC0Rbi4jS36FSPsRepg8FUuBIJZl8yt5G3Ya0Ua0MzYDyBP7RwBa9aQ0uUoSNFpd+3Y8BrsVCBaNc30QGE83dB89nh+B3oPhDY6/6zytC95mCKByUYPk47DurbVM1FY8thQvrV4NyxWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=DS/9tOqo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DS/9tOqo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22a976f3131so45733745ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744218928; x=1744823728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MM8Y2cXQLfHNhNOO/T9H9RRsOLEM6CjCISm6q61gnfg=;
        b=DS/9tOqo/e37N3p4XsedPavYss35TOfFzPLqMOkSOZIIpe059CaYZRjxIabRd0yBv0
         1GULWOPDN09wD2s1zWPd4lXI30YgTyfDPWLXDWVOPRjEeXiRn42BNBZVT/vEovdKmj/V
         6P1iwgQ/fVnASw/6njmgiv/ceX3Yv0YJDEa8/dWEzMAbnspkg5sAMolsYcey1v/+N6lH
         tDpyOe+BlSx3CwdpXi6kIxfB8Hb8vBcBAuOsDEyZqhEIbszNhpom/pmR4RJb7KUTEhW6
         HFqgDCEKipikDAfqFXvnmIGjIW1BjsjMHFX96eq8J5cN7UrfeABoRCs+Clzg4Q8I0/a4
         pYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218928; x=1744823728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM8Y2cXQLfHNhNOO/T9H9RRsOLEM6CjCISm6q61gnfg=;
        b=ggFSH1YKTe44ZXp28JsexpDREmaZWrDefPcHFzwfvzQpSt9K5HIakHETwTvStsNcH+
         Ix9Z9/9a60RkBb357QVI2kGjzE/Kzby7lpnemWjoGU+WFKgosm/A9jGyTl6QCIz7sW7+
         LmPBVq3zEJ2u6iXJdAJw63B0EyeKSmTVSjntjxM54PxNT4mY4e+Hug0Gd+3FoDoMPlSs
         uO3/HyNT43eCm3oS6q2prm8InVSnw/2KgqlQIhgdRfR6sDL9O3Xu7ewn12ADbNKEj1x7
         m/cWXm6z9vbQmF7C3rqcEmBuGz99epZ20AU2tyvlr4nOSmhA2nURejUtZJZ6+06czTkT
         o6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWesEoWkXEwBtW3EGl4DpgTO4kFsCZgfZuKT43lRw2uKMHgG6L3Xg7LMk1CerbgkFEEB66pI7nnFhj+eJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRGfpfzoUkZKNp/C9r0OrB+G/D0iLG1VQ1MAAEpNCF5W5C8fr
	GJ6bGD0Ri7KeNq/TCJ1mSf7klOT4f/YaCMW3Gd0Nq993ql8AezX/2Nwgm1jfuxk=
X-Gm-Gg: ASbGncs65btw3OaKDlismzNmWBvql5zmj1l4UBZWQTO3NUEXgA7lm0MH2NDFX+zZmcM
	zhsjGUTlNQcyW/7V/xtoCpT/IdyZ+ufQq/X6AfdikLQxbbUGw23Yym2AbjCOOcQgJxjxmgTNIC7
	kAIldzBaiMmu6meP4ANd6USqeUpObhGWlP5fiXeioppks58cdbvLbUowS4/QCjH+T57UABsWKli
	ZRfFOwfCAve9Vzv3kD9/pYzqja3SRNYyxAQ1EehVCAWRx0FaSh2z/LvMDNM1uH4aGNzbpe288Sq
	mWnjU7HaHxgXfcnuVq+yxe6UKJZJWRWTQQBe6mi/IbdhCC1dhO20eskwAfp72MM=
X-Google-Smtp-Source: AGHT+IHV0zeKc/AImZMQV/83LcegWu1jRy/FWQ0Bc25Yi+Ag9JbG0SIUnhTRLnIhtS/lOnbgdqTIfg==
X-Received: by 2002:a17:903:1ce:b0:220:e392:c73 with SMTP id d9443c01a7336-22ac29bf75emr42739105ad.22.1744218928202;
        Wed, 09 Apr 2025 10:15:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm1721650a91.47.2025.04.09.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:15:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Amma Lee <lixiaoyun@binary-semi.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
Date: Wed,  9 Apr 2025 10:14:49 -0700
Message-ID: <20250409171526.862481-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code allows rel[j] to access one element past the end of the
relocation section. Simplify to num_relocations which is equivalent to
the existing size expression.

Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 47d0ebeec93c..060f576cc988 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -859,7 +859,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				}
 
 				j++;
-				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
+				if (j == num_relocations)
 					j = 0;
 
 			} while (j_idx != j);
-- 
2.47.0

