Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com [220.197.31.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058922750F9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422507; cv=none; b=XDTANxa+CA0SBS4LL4hU24xNQHTrfk8p4D3TJJobSCPvQr97I3aQSWRUMNT7MxPc/tB1GnCtN9nxO3abxAiVnle+H/RbDMm7B4Das0PIFarcBMGIafP5uQQ3rU8P7P4QS5Mg+ke02RqNMRMmJGS+GgMakMAoJyGEpPoutqUwGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422507; c=relaxed/simple;
	bh=DzqbbUNKUcXJFkF6VPHwioabnK2NZAslUMivfzk5AFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h17QQO0ApApQ0hfcGSqMVUg4ncFgR/71xu0cM/93/pew/avWKVKXI6Pi4NlsJr/w2zE7pdmAwHgwkwivmGBDdfjqxIcwSeGizSoDK/mBW8GjKZfq9dn1864g3zedJzt81H5hSyEokDNJJ3zupqlSrleuikpUW7cPAhBR3ndMShA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=e8d1bcyY; arc=none smtp.client-ip=220.197.31.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="e8d1bcyY"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a642;
	Wed, 28 May 2025 16:55:01 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 7/9] arm64: defconfig: Enable BST SoC
Date: Wed, 28 May 2025 16:54:59 +0800
Message-Id: <20250528085459.481424-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSk8aVhkfQkpOS0kdTB9IGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ01VSk
	tLVUtZBg++
X-HM-Tid: 0a97161a225c09cckunmb0655d34397ebd
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjY6Dhw6MzErIkhNLg0COSI9
	HjlPCi1VSlVKTE9DT0lJTktJT0NJVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUpMTE83Bg++
DKIM-Signature:a=rsa-sha256;
	b=e8d1bcyYgMfcqFBcfcKCbu8/3vbHRzSzf5RSyZnxz4MgvfCDqEOywydTOFxg7XSH1np/n+zEKwn5LiDGvWelykoXnCLRydhcf9ZmjKq+6huVrXyasFGjDwJSma/6mgnS+RF1TxdtUzQNbb6Ux12ypC/ks3b7epluQ9nt91e4brE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=FvQqVbQ2+SqL/kfE6tpmwT7tqLXppZmdY3mZKZt7Fhk=;
	h=date:mime-version:subject:message-id:from;

Enable BST C1200 SoC support at ARM64 defconfig

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..9f072028fb72 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,8 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_BST=y
+CONFIG_ARCH_BSTC1200=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
-- 
2.25.1

