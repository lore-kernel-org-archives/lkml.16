Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE737231A4D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.124.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579892; cv=none; b=oNcdobkSGxJk8dFJNWExre/spHjK1k3QCzUJmo/Ss06yHqu/txgJT202UqP0ppDWnkYZ59U7u4VVnxSjhtjb7qiP2/ch+d8ZAkX1doqsj0dSDcJH2jSNG2mQzzqjw1KscNFc4YldSIativtS6IS8oJKuokdb0Tjb5589Ltb9CsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579892; c=relaxed/simple;
	bh=q3joKWG8cD/wnp5eHdybyAYlMFfRlxEGpfL+hS22K6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYotdJbTrtAA0iGqD3O01D9W5zYg3yRgjqNiPkGL+cpJfFIpEHUheC1oZRJpJm7x20wZXoE0aPH+FdNrdX0rHZIHGa6oE+0WTIDdaFWLlX6yP7qkvgjD9185W4Itt1EmRuGUyWCFHigrGVspUmmPwxu8GGhycTvHzdWFN5TJxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NTMll+tp; arc=none smtp.client-ip=114.132.124.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NTMll+tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1743579783;
	bh=IdRmZ2JBex4jUMOaecKtPJHj559XDfi8d/7kI9nzLXE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NTMll+tpcwyLZdU10Ew5UEXtQneoMxVjPHgE4HA+Od3B1WCziO3hhfrTNL9gsrsta
	 HALDNqp0CYYOcKWzVwcoSDnrO4rbg78/e98sqgwD/d7sBd/exubnxW3xY++EMG780h
	 bUumJynnowbRmVrosHX8jBY9poCJv2UkjxoajTtw=
X-QQ-mid: bizesmtpip3t1743579772tmnkz9o
X-QQ-Originating-IP: VXfI5PZC7A5F6pu2hcWgPmH22j/MPc1MoA5fwl1MiuU=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 02 Apr 2025 15:42:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18110157691820490132
EX-QQ-RecipientCnt: 14
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com,
	palmerdabbelt@google.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Date: Wed,  2 Apr 2025 15:42:47 +0800
Message-ID: <330B3BAFC6FDB763+20250402074247.64483-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NiCl4APqUksb+8HYj8boGusd5DTPUqgW3qoll054UBU0TkRQh0V0q3ne
	EQoc9ymysg322gFqmqWQ5lx6WmEAD9rZc7+j3RL20acHO01ZbeS0BubpCCf/UO7JOMKUWa9
	z6ZOzPOveOkrvyeRuj2krj3TzTyiBR8hx8HsZv3JealRu8WG+Nw8yDSX58/wU6WPqNm5U+G
	F5IY45AP71n5UrUEtl5QpDBe/YD9oB0ddp6eNgoKeok+KhbYs+vBKIRMnNTSGlAxGt4u/8L
	bSt7NIFkA4oBvqoFfdGowNlGzEYyh4K5eVbK7O83kCi04v96pavjSw5bfJlnCjA35FiJjtv
	UQjgsDp7PNfSk5igm73r5azOnmvGJT/coW4ZP/VaPJAyJZqkvaGRjyV5VzomZfG4LCuvAfD
	Axxm62C6owno1SxCIUyfFtAp1+iDTwXQ0QnH296RBGJunjh7innihXi65IrbwMUdv3Uzcio
	D/jHLSg9afS/FeZOGKvVGuyrRcTSH2+KcBYwQvB9H4UrYg1Km4ugiyE9J5UMG/iZ0LMltT9
	29o/s80Tet2lxIMaxijDMwEK2zKHpefyYi/DcQMDclTw+NbWHHfv5kNerFaMO65D4RySa+g
	n07/z0gtsntYnxvMDgWDUQJ66rW9r4JWerxh0/eaMc3RrgTb7nW5LDN8akNDeVtoaUgCbjs
	oqkIo4yag9gYJU3/z/Dyad7TQfl9h4qKKAC6fs+RKmRgyTe2HBEJKgX1Nd0fGLBxpgIjwt2
	SOUjTgQJZgcYgjVFH2Q02q+16lHXVf/8T2jYjtTAxI9GizM11ZcCzIT1fw9bOwqbBEE8vac
	+MQ2YF5Ar3kFwt9Df2zreHmpAaWojb0Du8mzAAM2ZIw3wTZDqjai09Vr5XGNyx6ibrbBIcZ
	Q8VximK+XfSHaH+gQqxOuJsePL4xGQHHnS5q+U0cY33pRjqgLRiY7rdKRD5UommlOjWcvun
	17ArpFcNulC7fRas1Cn+G/+mA2BrYHCvQcwvC6Wk+3r/ikqaqeySpcv/kKAVPN+fSJfpqg9
	tjirjWAg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
symbol using inline assembly.

There's a potential issue where the compiler might inline
arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
symbol multiple times, leading to fail to link vmlinux.o.

This isn't merely a potential compilation problem. The intent here
is to determine the global symbol address of kgdb_compiled_break,
and if this function is inlined multiple times, it would logically
be a grave error.

Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Add the missing __ASSEMBLY__ check and substitute
".option rvc/norvc" with ".option push/pop".
---
 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 8 ++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 46677daf708b..d9f6a8fc387f 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -19,16 +19,9 @@
 
 #ifndef	__ASSEMBLY__
 
+extern void arch_kgdb_breakpoint(void);
 extern unsigned long kgdb_compiled_break;
 
-static inline void arch_kgdb_breakpoint(void)
-{
-	asm(".global kgdb_compiled_break\n"
-	    ".option norvc\n"
-	    "kgdb_compiled_break: ebreak\n"
-	    ".option rvc\n");
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #define DBG_REG_ZERO "zero"
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 2e0266ae6bd7..5873d3970360 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+noinline void arch_kgdb_breakpoint(void)
+{
+	asm(".global kgdb_compiled_break\n"
+	    ".option push\n"
+	    "kgdb_compiled_break: ebreak\n"
+	    ".option pop\n");
+}
+
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 				char *remcom_out_buffer)
 {
-- 
2.49.0

