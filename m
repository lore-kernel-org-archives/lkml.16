Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D501DED56
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356797; cv=none; b=KvZ6iSCArWN+XZGdOnmU+fImRkT2jN7xzfyje6RqlgXHuR3ojzOQZHdMmsRWPSOZFAdkB2TmEQjSi55PKQf9/4T5Sw7QTqD/CRfxn+Y3buCjjm9dPLvziVEy+mj028w5G+Hrs0TS7GnshQo1K8xUzvLdhDSyx6H5W2yIf3JToBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356797; c=relaxed/simple;
	bh=bHb82dxKvXY99yhd12bvdA4Cbjxpy5OQY1OQSqYsmbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeGKWWLA2uLwgErxzOqc59dkvrCD4mEu1OTSOL8N+4JEgX1UCJV0FRgHPtEeEcHIOiaGs8AKEQg0h4z+3UUBmjVYFTOG3UaXK/43JU4y5EbqZyvOiF1KVTofQbb8wMOV76QUzf/S10XYQGtN/TKyaoXgoyz4HksuqAaCy2o/F/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=eQ1EvzvN; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="eQ1EvzvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744356790;
	bh=eckRTImqAOQJJRiuiUg+ZtvTkIaatRAZLaXWFpf7/hk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=eQ1EvzvNqVTF35myns3THQaBKZZdi5C9Xivv2w5z9/yROympPaapef8PBJnvAiOzs
	 aERR+ks4MjV80E9U8d/bgMZufuVixKttbyw9mjCQp3vl+JkmceDyQey3kcsEOpbAmb
	 gtb8277jwf/t0CsOGLIT+warMdTmECGKnbn9XlO4=
X-QQ-mid: bizesmtpip4t1744356748t39ebdd
X-QQ-Originating-IP: oavQRg0TIfZfWb6lYfVFwI5gOXtxCy1KV5qtGHWoJCw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 15:32:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13556097003863952081
EX-QQ-RecipientCnt: 15
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chenhuacai@kernel.org,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	niecheng1@uniontech.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	vincent.chen@sifive.com,
	zhanjun@uniontech.com,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v4 1/2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Date: Fri, 11 Apr 2025 15:32:21 +0800
Message-ID: <F22359AFB6FF9FD8+20250411073222.56820-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
References: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NOtamqveCwOInE52679j67uMCIMlzRQ8xWRO6H/DBPX11L6tJfVdUmSh
	nuvnD4eA2qJbKCQUjwGEISuFn+Z9LUaVyICbKumx97dGUkVile6YmtKyGyoGPQG35tXkwEb
	gPIXSVcbOnx7HTKa69zElbC5c++CSXEIP+FyvsCdgoY+HfbFF4CmR+R9a1JmKdWNx43KCEI
	Fv1MiElQ45L82OzOAtbxzXpHyfdCy5mYnLe+lHRTd7kg0SN1fYAnjFQavFExVzp+5E+eR4P
	9NiEfL1iKVU5xKrJ2hnHmueYh6axJ8mPrOXf1QLUHkLPZusinG1cj9s0tuRyq1eOzcg13KT
	gHe64J7a6L0VWBhKy9+h2NdPNjDlVWq+5rH7VwmgeN2Tc9MeOcM/OvfZSiIECjKvyvH3uV4
	G7VEeD9TL6a9F/YIsg/jbaUbLnTtBELLPUtBpw4RuubC5RUQIjqubgd7Kzdxl6uf2uv6vzJ
	yrg2LX24OcMt678b/C7yIuSDDqlRqXf3d0/hvrlv+5Y6FdQUiQocySLGnq0D9cjfHSIxYXs
	P4AtvQjyzfi4P10ODc5NLcAQPWc0pRwaxkUY32s36kQlF3UbmCerO28tw/cD6CJAYtLiLP5
	gRP0juAlpioAg/yEGbBtn7F7XJU0fqjxJRZllrlgH93/51FRRUmWV/rtYVV7FLTXZrZutdE
	H5jIHIEBHhYckyWyHZnezEoxKbeLGbCNnZJAUW/cNtxqho8QjaRhjreXUB5z6QqAknAebTX
	PG1KFlMxr96zajcWaAOvWcGwwvTihr9QB0rdArTpHVA0ujLRNMP2PMMYMWcyRcSh8AC9Ein
	5qxp+XHV6XnGEojl29mL2Lpz/aobRhr37xIzri2OjokTPTW9RralqTQzs7ZxaBzfPk5unUf
	Cry58qqp3g+r0IWZSDbTIyIviFAVMYW4MK9ElMCueSK3FE/uVW4x1USPVJHPAvLjSR7KEhv
	P0lJVO0jzUV/Fd9c0EzBtgrfz8ypMhZG7VewQsAxCzyQ12dfEejg+7R/jqOhqbYImmQr75V
	6WluZTa3+2mVCCh8E/
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
symbol using inline assembly.

There's a potential issue where the compiler might inline
arch_kgdb_breakpoint(), which would then define the kgdb_compiled_break
symbol multiple times, leading to fail to link vmlinux.o.

This isn't merely a potential compilation problem. The intent here
is to determine the global symbol address of kgdb_compiled_break,
and if this function is inlined multiple times, it would logically
be a grave error.

Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
Link: https://lore.kernel.org/all/5b0adf9b-2b22-43fe-ab74-68df94115b9a@ghiti.fr/
Link: https://lore.kernel.org/all/23693e7f-4fff-40f3-a437-e06d827278a5@ghiti.fr/
Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2:
    1. Add the missing __ASSEMBLY__ check and substitute
".option rvc/norvc" with ".option push/pop".
  v2->v3:
    1. Remove "extern".
    2. Restore the inadvertently deleted .option norvc to prevent
a change in semantics.
  v3->v4:
    1. Replace kgdb_breakinst into kgdb_compiled_break.
    2. Split the origin patch into 2.
---
 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 8 ++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 46677daf708b..cc11c4544cff 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -19,16 +19,9 @@
 
 #ifndef	__ASSEMBLY__
 
+void arch_kgdb_breakpoint(void);
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
index 2e0266ae6bd7..5d1ce8dacaf5 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+noinline void arch_kgdb_breakpoint(void)
+{
+	asm(".global kgdb_compiled_break\n"
+	    ".option norvc\n"
+	    "kgdb_compiled_break: ebreak\n"
+	    ".option rvc\n");
+}
+
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 				char *remcom_out_buffer)
 {
-- 
2.49.0

