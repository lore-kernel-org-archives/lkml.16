Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076DC1B4244
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157034; cv=none; b=ZN9qn1t7MhyqwOBKjFEn5EfXQXg2RmIv9KxTdRwvRqJVWGnCCYBseS1mCm+vpwAqI9YVF751VMrnOllyks20OEKRiCHjQ496c2qAFEgSzHcZo3arXbYU49plw96rVn898reLFrjw5+hZ5Al3CyUts/qKZRzwykAQteYwf7yJibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157034; c=relaxed/simple;
	bh=/nTyGsw4q573LCJMSMMWDT7IN4jtDKE+TP4OkdCpowY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=rIRZv2rZs/2pOHVTmwuMnLQjjWgdeYDNAzkh62V0WCulypo4JXjFtAtTeJjX4vM2O5/6MXdgx189+k1WWS4pNXDOYmqARp9B6cS8UU8HQK9dBzkoT4J9slUcZyNA18yi3jd4UNpFe/WOI7uE0wAk12hoimzOM6KXTXXPxzdGjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZTSjQSEF; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZTSjQSEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743157029; bh=1e85Oa/sKsFTWBH/G9IQp83iHWcRwVIXznp66WaiQHI=;
	h=From:To:Cc:Subject:Date;
	b=ZTSjQSEFQI7xgk349EX8qXBOpFewOq20k1kNe6upPdJC6hx/cClmO9In8XQpBtxsY
	 R0EGxyuIK32MUxPK4oAZsH/z+ck1FZYQiafa1PcPZ2h9gaqRmG5pWMb+Gp3IbbxCmV
	 zoDAFZWQFuxOH44ut0ZD70FlfhQDlJME3QWwr5fE=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 43905E82; Fri, 28 Mar 2025 18:16:57 +0800
X-QQ-mid: xmsmtpt1743157017t6i1oblj0
Message-ID: <tencent_6E57A00F6D56CF8475CF9FD13370FBC1CF06@qq.com>
X-QQ-XMAILINFO: Mrv6PNPZjcp6a2X0MvRwg1ZdbbuJgf7r968we+8kTrJcUDS3bpUY/6QdTk7OdW
	 llpTNLlpX4AQQ8NMl4BoXn3FjU5+Gs1puUS/q/bV1hCptUeUyyQjB+nge/IK46uoV5mBmL41fbXc
	 LeMttqDfgCNGWh/1935cKf36ydkGt478WSHAd0pz2ugg/eg3DDeArgzLy2L4zV3zH2jB9X6dIlMT
	 TBEyghcpzk3vl79pAyUvrno/9mENwE3i7dooLE8tNJnUvJm+OGPfNLtIxToaBQxtKsTf81bQ673K
	 zWE9P7snSw9EQK0jHmse+o7ml/sG+1xg5gq7Lt8AlcXBBM9Hy35Uuv1NvbZDBq4iZiKDMOEW6yhl
	 C7naxRSzu7idxwKuUDN0sZxE+rR/kA6u1ZZswAdnX78gH7GCNB63DgmpLnIcBK3ltB+zv5EYqFSR
	 FWkfBQlZaAIXLdxOxBgjI9ge/jOfvI27tXUrv1PlZWRfpliOmVZDVkFyno0I2qiemp9jdcL/7L3n
	 pwulnESigBKDhweSf3/sgwOljFSw9bVz8DJQLKFNNGftxGhGahADS6PLKVp4A8sBBkzxQxQZswgt
	 6errAhGvZ/0g3UseiVq0LR3uf2XGs5LaW5YS2XR/8hL+6gGqJnaYMUFiK/JHQ587bn4lXb7AWxEh
	 0auhViMaV+qH50JyBPyK8im6MNNKmCvbR/leGeuvaDvTRpk8OmwUUaRrvVmYHHmDTIjZeBFtqtPA
	 1hy71RAWFKtwnXYB4rqE4itUxOs8XAu31b6PVw77UctW/Gh8G5KSP1pwJemmlwGCJm1ZWJuWHE85
	 HZ+ifX3oVxJO+cF/IOnQFjXwznnV/FemlSlWoqw3Yz58hYiedON1i5/tlM7fiWpdAwkxEShm/LrH
	 qD24Rv4TY5qlDDC6vNLHYe1TwZ/8/QO//gZaVVpKuRn4uxlHD+KEVfBk1kLeD2irKWthDvP9wP7x
	 4E8YXgYS9G0/TwovYZaLyjbQeyPO8BuEkVb6Bnbty9cX+WMPXtVXPF1HblQoB4
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: linuxppc-dev@lists.ozlabs.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PowerPC: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:16:48 +0000
X-OQ-MSGID: <20250328101648.52932-1-Yeking@Red54.com>
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

It is the default command line appended to the bootloader command line,
not the bootloader command line appended to the default command line.

Fixes: d79fbb3a32f0 ("powerpc: Support CMDLINE_EXTEND")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/powerpc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a..bc56b9deb4ab 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1006,8 +1006,8 @@ config CMDLINE_FROM_BOOTLOADER
 config CMDLINE_EXTEND
 	bool "Extend bootloader kernel arguments"
 	help
-	  The command-line arguments provided by the boot loader will be
-	  appended to the default kernel command string.
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the boot loader.
 
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
-- 
2.43.0

