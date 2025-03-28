Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823A1C174E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157869; cv=none; b=gDow3KrOdFOsYb0bGzPjfq29o44pA+vc9Dz+dshieZTmyNw7f8KJ8CCvQl2kQYUPPzyRB9v9G1lwDzaXaj7nrtFLg1rCdiXKAOAkFRyNE6iLBGi6N3jjs8onrX2H1zMxGomM9nE2byoQcWS6YWlk2NUPctg6RYOlCGjCittbV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157869; c=relaxed/simple;
	bh=Nwi509a7aKxD5sxsqOfv7hOf3oKj7aeVJP/rWlWPe58=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=L511E6MFxMLkpXeHcRuM/LqaWI7NV/SgnzdHdyfu9DL7OuzE0b8csR60uy2CFlJ+m9Elmfyudg8KGNnLOpSy2BZOMMXRym/bLOHZuBfWPmOEFXu0yN0NNUi9ebbil1HHIUhaZQck4J3ngLweCaDkRV4EjDNPdEytDMpPiCMQmYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cHuNm4Wa; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cHuNm4Wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743157864; bh=L7sWk6+gH+xPv6hWsk9jKOmxnq0d/4WfddQq/XyS6Q8=;
	h=From:To:Cc:Subject:Date;
	b=cHuNm4WamZTjOVV+ijpTWE21T5T7ayhzKXodMcTrQe9cb4lx4D5OiPOefaomlQC5B
	 Gr7WSQzPCk6ru8IRK/v4wXkuYAx0Ety+Wl0XYLTIdu/zVJkkE6059bRTKUGolr5LwS
	 P6IPsv0s6r8FvT1wVJcEUssdGnt0d2+UxiNvpWX8=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 5B3A0E05; Fri, 28 Mar 2025 18:22:51 +0800
X-QQ-mid: xmsmtpt1743157371t8duj5cn0
Message-ID: <tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfErfRwW9hZVLIiJuKDL01gKsSwVU/PZeKssow3wgAzRtr8JwJr5
	 Ht0XTqPtE7Tw6GINhJVrQbbPeB1G170OSsOc4HBAazDzIhVGrxctkEeWDkKVeWyIWL0T2+bCOHpj
	 249NYCosn5gL2cldATlCIvhMmQI4MPTZXdjmszVoQgzNoQPvm2DGviV/khO2ILV+vAKHIc78GB2G
	 YkxkYKrs+BTcVJh0EDEro5a//98AqC75Gl5CoamrhVwR5FcGmAsqUt5l57HB+N8xjAsNfy6lKPBT
	 UCFrsAG9Sr84apQHPxcgUKmkmRDDc+2z1RbwU6q2jUEVUNCwBVwRkippHef80XerjJ0BCUEB9bWS
	 T073hm3F8gX0EYfsEUJPRSix89o4uKADgFPhg12FUBnrkHHjNtVmKhdlx5lba/pTnaGZ6vwPi3B0
	 3+EbzXGtd+B6+9PdShwuuuJgt7UgxHg/2yV8wsd8rBeMnoO4r64AE5AWa6UMAuXDNBsuN5815KAf
	 Ft8VNOM/ddE1Xw8Vd3VKgrll7N9sJAGT+lI9mt6ekIDhnapuk9BeLWcCQ5JLQmJNIRYbfPlOBsAi
	 Au3pzNwnDTGbrS1ZclqtLCDlMhXxotXDYjRfaCAHZ1yOrIh3NBodB/i/HIttM/b1Iug3fqcU31RS
	 Q4rBkcfdRpJhdO5gthuBut5PnsqklqHkT6swzNFeIrnoJxedsfzeWeaNX/K7P7VdXgjRDcomgcgO
	 TU1mWjVwqmhytCOs1YKOyKx/Pakh5kgDyGR2kU5SkITHVl31ebT3Nm7xxF6ZMpcfCE6im8s+CbG4
	 hW7DKWZmL/XN6kSeblcPpyBUWWorjFR6zy4BMjJH8haT+0lfwtDLOfgm+qIvPdnWO0rldozWVcCt
	 l451QTx6n0mAHffENAqfNBySVcr9nSlAmNKA8pL4tgOkIRJuZx/3cn1hOyIhefANjowkmyzLS53p
	 HTleWgek/6x+ZFNXSUgOHJ1v7xr8x5naVWtLAYT240emlQbrLnBkisQKufN3Jkx4++Vtvs7ozfJH
	 a2DhGJoCFOkRnduCMt
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM64: Add back and fix support for CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:22:34 +0000
X-OQ-MSGID: <20250328102234.53211-1-Yeking@Red54.com>
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

After commit e6384c398459 ("efi/libstub: Parse builtin command line
after bootloader provided one"), the behavior of EFI has been consistent
with FDT.

So add back and fix support for CMDLINE_EXTEND.

Fixes: cae118b6acc3 ("arm64: Drop support for CMDLINE_EXTEND")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/arm64/Kconfig                    | 6 ++++++
 arch/arm64/kernel/pi/idreg-override.c | 8 +++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..736280eb0251 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2427,6 +2427,12 @@ config CMDLINE_FROM_BOOTLOADER
 	  the boot loader doesn't provide any, the default kernel command
 	  string provided in CMDLINE will be used.
 
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the boot loader.
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index c6b185b885f7..cff403477ff5 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -382,11 +382,13 @@ static __init void parse_cmdline(const void *fdt, int chosen)
 	static char const cmdline[] __initconst = CONFIG_CMDLINE;
 	const u8 *prop = get_bootargs_cmdline(fdt, chosen);
 
-	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !prop)
-		__parse_cmdline(cmdline, true);
-
 	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && prop)
 		__parse_cmdline(prop, true);
+
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
+	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
+	    !prop)
+		__parse_cmdline(cmdline, true);
 }
 
 void __init init_feature_override(u64 boot_status, const void *fdt,
-- 
2.43.0

