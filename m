Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D180417A2FF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745462518; cv=none; b=ZlgfJtPMZ0c/eq9jyyX/scAN+VvzZPXp/BJr6KdqqBLSdpPEBdJhIYwgddFNDEJYTrWzXLHD1SixLf4hVZFhNq6n7yKz/gB/dGtt0GISOkCkV9XpHOeQ/wDqBchIC5WJY296QzmolSfXlK4aT68E93jjM9K+AW7vbhrlSDMoEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745462518; c=relaxed/simple;
	bh=Xl4h+hVtw1I6vKh8hCpsYqYhASw+cFAg3f8/x3QBH6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pdW7RzzQzrhH9Lt1Y9eR4UCCcKDAM2AoE+kb8EH0Bmap0UdrdP0VXfF33UMbhh89LUDjc/ILUTtAGZhK4+y7nVObiH/WEDP9vdnfIi8fH6w8n4T0OaScHnEzG9YJ4OAOKQU3Qx5yJBb1M+OVSv4XxC2nsECGwv89/NHnfOjrStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LKy/8p8+; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LKy/8p8+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745462514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVhZs0sKvUNmD2Q8oEdmWaRhwVuK0e7TNhgqQ3TKg3Q=;
	b=LKy/8p8+swSPXlBNycPoXHObfNopx8M5x+btec5URv3U5Cc85SZBB+ubbL8GaGXSHq7gSJ
	L6kNXabEvqKb7YlGEorR1k2Z21BOqg7FnMkludSz/x6m2uVMgWoB7pZYozq1bcsPCiWfI5
	i742fY6KbN1T2SCv2jt1Q3VwFKZCgZc=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v3 2/3] LoongArch: Using generic scripts/install.sh in `make install`
Date: Thu, 24 Apr 2025 10:40:33 +0800
Message-Id: <20250424024034.78436-3-youling.tang@linux.dev>
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

Use the generic script/install.sh to perform the make install operation.
This will automatically generate the initrd file and modify the grub.cfg
without manual intervention (The previous kernel image, config file and
System.map will also be generated), similar to other architectures.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 0304eabbe606..64bdb52ddf7c 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -181,9 +181,7 @@ vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(bootvars-y) $(boot)/$@
 
 install:
-	$(Q)install -D -m 755 $(KBUILD_IMAGE) $(INSTALL_PATH)/$(image-name-y)-$(KERNELRELEASE)
-	$(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELEASE)
-	$(Q)install -D -m 644 System.map $(INSTALL_PATH)/System.map-$(KERNELRELEASE)
+	$(call cmd,install)
 
 define archhelp
 	echo '  install              - install kernel into $(INSTALL_PATH)'
-- 
2.38.1

