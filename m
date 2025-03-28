Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAB1A5BAE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157105; cv=none; b=h5DToauK5qrFJQFCw2qp6hvoJGKRMGKxHd5bM5eKcL9bVvucVTtdJdXKDOucTEwxu8UwUsI6QwYmDBwsDRXPJJ9poNFGUKucd0bthp68+CoTrgkhFBCAMMUTpQ2UHNO5lsCiozEuM8LBWUaT3f6+IxMLbPfFozg6qUoOpb/JiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157105; c=relaxed/simple;
	bh=jooCdF1JwrrJXjQWuLslEA3Jk/cX46lBROBHZgF7M5c=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=sd/kmyXA9kcvgtTxQJLXHohUBSFGXiUguC1Hqe1n7vHc4lB7gYfW0CQ9daGEzcWKsM8eYoChFruTzHlebw8Ehl2fJ+5dwUIh6MvaEH7wnqrUBCRy8J3jIDu9ACEnKVqEwdhvCpDM1tPJyaQ5eOX/3iFhHNBPG2rxJLT3Y7dfYAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mZwK/Ben; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mZwK/Ben"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743156795; bh=rR35e+hZRNuo1YA29CMJi0+EW7SiAaMAanzrs8CeOf0=;
	h=From:To:Cc:Subject:Date;
	b=mZwK/Ben4aUMZA3Y38igh+BiHwNZ/0D3FAXSXe1APkzcnSDjjkvrCSe4LLBwGWSDE
	 voA3/rcL9qzv+NMPtNeHNtNkWOhDKa+K8oqWcKOV41sLxaD5rVqutAHLv16yaVMgtn
	 dtdn8Fat1JhEamjoHF+Mhzj9PNm23FA4HspgncAI=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 34309049; Fri, 28 Mar 2025 18:13:03 +0800
X-QQ-mid: xmsmtpt1743156783t48ghc6wv
Message-ID: <tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GMfqh5izIbfJ5xGhYBVKfPatPPzVgDN5d2bv3dImBuc1q+2YO7j
	 7pMh5QtcK85H3+FQhze+IottobVBgvsqfrz7AWxJ2raOAP1c1QIPDPSzfqu7ObBgmCbkZ4Zdffrl
	 qqHBvEcBClnSX//AUsoQ6xzwpduPA5xQWTLbxxu1+XosFeQYan9RwBjRf/QiH4pF7TRwb+mFhMAg
	 14fRj/Sc3q4p/xCLin4p+ZIV0fqSmSMBO8rjh3NpQtC7noXBG6f9XvPwGkHr+rC4/APB9Bgccqsj
	 CVLw4eOcCFcAIs4Tn4A/VkrqfUL4dJLh5nOm3/nKO8pC4xEqEL2H/0cA/nFtwf2X8RBHMGvJ5J3i
	 210hgHYPW/7U8rJpgfgZZmHQPMSEHhE9rcQp2uCScBkrDqbgsqCTnMj9BdSqVKiOFLwUCzCFeVSX
	 AgfFMJJt3CGaU70f0TpEWgA+2rqZ3fxZqk2L8DR5l3r/ymhNooC58DiO6Ku75FhIPuIlw5EGcsFS
	 1yAWqlf1N/0HN0rN9dDTe7pCJqaqwHaj1nCYlsW+jXv2SWzRhgIgcifbSsP1UXWYkXrcYWwtzUI8
	 yIMOkakU+Tz9mnqgFUOpgaj2xQ45ZZiaIqVKPJdOhmKJVmi/f7hFmf4Em6+elCrQNbjusJ+4T4jD
	 C50d5ZN2qMDVh9KpCJNYK1efrVQtpfiTslFtHNe8wFkp7X58zOVp11XD/FDZExT732GlOmyNFIGj
	 /9ZnA2nPvy4Sf+jMv9VylQdnGuRQyuxq32BzyTOEXI+sawsD4nxf6//5yVv9RZIh8KWHSFr88Sdc
	 woTqAt16dQfHvLQWONFUx7bD4yDsJor+IcOiYGW1STsM/NheeEXYPQ/BxHXQK0P2LliiwgJ5ACMP
	 XKmChphvUhtXdsrQOlHjKQI+1uGQJDqhqFGkgnfvX9JbZDO0l50lev0GCZ5iHASEcpjBRzf6Fohr
	 gpbWfHQfMiiUFVqlHhC9nSsy+7qCTOsb8Rfb7pgrZcUOePBj6nFUVKAFEV6Ia0wJygNfjLcbq83B
	 r0viZ7CBoGBSpTEfSo
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: loongarch@lists.linux.dev
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:12:03 +0000
X-OQ-MSGID: <20250328101203.52765-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

It is the built-in command line appended to the bootloader command line,
not the bootloader command line appended to the built-in command line.

Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/loongarch/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 7477d5f8d876..067c0b994648 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -388,8 +388,8 @@ config CMDLINE_BOOTLOADER
 config CMDLINE_EXTEND
 	bool "Use built-in to extend bootloader kernel arguments"
 	help
-	  The command-line arguments provided during boot will be
-	  appended to the built-in command line. This is useful in
+	  The built-in command line will be appended to the command-
+	  line arguments provided during boot. This is useful in
 	  cases where the provided arguments are insufficient and
 	  you don't want to or cannot modify them.
 
-- 
2.43.0

