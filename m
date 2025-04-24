Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535219D892
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745462521; cv=none; b=i1xsL6ErFSNlE2VSyNjVYXO0U1q6rKspBL1Xo0NnRFPEEN+7eetzI0Hnv96YNHCKi8tHC3ErDqbhhCo44CNq7QDML2zs+nikkTyw/5MHyjhpJudrFPEw3pEhGNoaTTBIY+sseu++TrlbHLo0x6gPFnhhVm1MbpApGyxVdQg6USI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745462521; c=relaxed/simple;
	bh=MrzV+3X/xEyXN4HuhlmnoAsayUGQLlKoEXj6MMJMdgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pus90Kgc3QUDswgWbQce6O0gxfi9BxLbkMlFyo9ucmXUPT5FExx++Deb4EbKFQPZbQHBPq+fvpnezg9TrKX9UtfeHAtt0o3djcn0DiA2+h/ruSL++QVdFgI0cmiuj7ThDSzBxoPPWrGXaiq1WYrloTGJx8Iip2hhFu1E4QNfguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oEFWZsTX; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oEFWZsTX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745462516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvnStUlONu9e+qIIWIBP2lqUAozvyqkrzzFTXoYeR3w=;
	b=oEFWZsTXdu6hAwtkjWZOrcUbRjLi3sL+/mVike0iX/8oxHiSKcRvaeybBzyLRlYF58LZK9
	ws998n/Y/Ao9j6XP4Vs0JwJXUxbIv+34CqkkL4EVsVFLa8fVfR5USgU1GIrbyL8//wmEUi
	X/aNR4S5mgJFAESDrMx/zXeC/9yvtc8=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v3 3/3] LoongArch: Add some annotations in archhelp
Date: Thu, 24 Apr 2025 10:40:34 +0800
Message-Id: <20250424024034.78436-4-youling.tang@linux.dev>
In-Reply-To: <20250424024034.78436-1-youling.tang@linux.dev>
References: <20250424024034.78436-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

- Add annotations to the kernel image.
- Modify the annotations of make insatll.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 64bdb52ddf7c..b0703a4e02a2 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -184,6 +184,11 @@ install:
 	$(call cmd,install)
 
 define archhelp
-	echo '  install              - install kernel into $(INSTALL_PATH)'
+	echo '  vmlinux.elf    - Uncompressed ELF kernel image (arch/loongarch/boot/vmlinux.elf)'
+	echo '  vmlinux.efi    - Uncompressed EFI kernel image (arch/loongarch/boot/vmlinux.efi)'
+	echo '  vmlinuz.efi    - GZIP/ZSTD-compressed EFI kernel image (arch/loongarch/boot/vmlinuz.efi)'
+	echo '                   Default when CONFIG_EFI_ZBOOT=y'
+	echo '  install        - Install kernel using (your) ~/bin/$(INSTALLKERNEL) or'
+	echo '                   (distribution) /sbin/$(INSTALLKERNEL) or install.sh to $$(INSTALL_PATH)'
 	echo
 endef
-- 
2.38.1

