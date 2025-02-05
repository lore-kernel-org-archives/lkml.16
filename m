Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357C15667B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764549; cv=none; b=bE/OhY70hx8LBWY9Qnu77IRBhE6cptabnlHY+Q5HzqiLckGs01BMydNNjMUN0ScTtg+rb6znk9I9Yl9fMWyI4iQKNe6PrhpYZXzt+QDWAwFCDu4SdgHTd6v56Ax51xXxDUTfvqY0wZ05ypkuDrt6xTPCmJm7FL0x8yjX/5O8r5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764549; c=relaxed/simple;
	bh=xcv9d+cJzKofufKde5hQDk3bnPoV0w+jbric7/Ip9RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQnD2OvyQTsUFREIOixBnNyLtry2hvlnLwmG0aU1v0trIbiua5CxD6/XldQXoslfQhXrWUNJM9FZuertteXgKSMZQIT/cUfof4YmHtX5WD4K9oF5Wegs5JmFIkWEjeAcNP+Kvuz0yXKkP5C2ZK7VibGAKNSz5Dh+fZ+ydhHpmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by baptiste.telenet-ops.be with cmsmtp
	id 9q942E00d3f221S01q94ff; Wed, 05 Feb 2025 15:09:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg5E-0000000Fvz4-1vHG;
	Wed, 05 Feb 2025 15:09:04 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg5Q-00000006VsX-26TE;
	Wed, 05 Feb 2025 15:09:04 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] riscv: Remove duplicate CLINT_TIMER selections
Date: Wed,  5 Feb 2025 15:09:03 +0100
Message-ID: <ce55529a42fa232cacd580e38866c60701f91095.1738764474.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
RISCV_M_MODE is enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
  - Add Reviewed-by, Acked-by.
---
 arch/riscv/Kconfig.socs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450ec99..3a2de20600bacb49 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -58,7 +58,6 @@ config ARCH_THEAD
 
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
-	select CLINT_TIMER if RISCV_M_MODE
 	select POWER_RESET
 	select POWER_RESET_SYSCON
 	select POWER_RESET_SYSCON_POWEROFF
@@ -78,7 +77,6 @@ config ARCH_CANAAN
 config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU && ARCH_CANAAN
-	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
-- 
2.43.0

