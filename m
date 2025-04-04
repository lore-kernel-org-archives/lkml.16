Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F71A5B8E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796399; cv=none; b=fPaAmPe/4xB6xvNNtYBP9dqQsKFjxeL1E7eYInxa10Z9dYruslqGyyz5dwuClEU/eoF77xIWZlsxEnKojLOSGfkv7Bh1b4cIeR22iTQrDW0hMjPr2KbkN9AqCNUsXcKt5I5AkttoTtpGaV172tN1r+K/QWw0pInhKWau/fsGQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796399; c=relaxed/simple;
	bh=dBBa1o7eH67G4MV4jyizlfxUVGGZZ6ge+FKvW5APsak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oPYu7LIMX5A0YY6RbHDT47PaJvRV0riEVgs/RpQHSefNVrd5a7Oz9mxzs3hb3ogMwh17MA6Zn8z4I4+RcL3AgvJnLpZnoRj1M5a3ypFFobIlEbIxKo5v32CMww/HD6v49sCYb4QPDWG+YSK/eS+xg7G7ngFPTOZQWuwe12zCFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I2O8XO5m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I2O8XO5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743796395;
	bh=dBBa1o7eH67G4MV4jyizlfxUVGGZZ6ge+FKvW5APsak=;
	h=From:Date:Subject:To:Cc:From;
	b=I2O8XO5m2Z6qJy7xkjqT1xmeKZb/ge+K8MUWTuSKo4sIwpvMxNl1N1Ldwb8HhcvFF
	 kokWn28/+aGQnV86vfSoTrtDjXI4u5oEB4trJ10/R3udEMGtF8p2LJCEcEUbH1KBf8
	 u99RRsI5JYvqSPkBYlcWST22KOhV7YSdW4oCf8FODvEQUpXQgXAl0THS5vw0FnDvqd
	 /wMniK7nHw1b7wvHW0NwzReWxQkdR+DWZl1yW94jTnLvQndAbZv1Fm6Fhj065FoNTW
	 zYK0gOH+xgwntEG9ygRtJ7TrIEaFzYX63C3G0ccszrZdvpiVpdP9bxggZQI61CYx5b
	 AsOJ9n/1z9LNQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D98617E0FC3;
	Fri,  4 Apr 2025 21:53:14 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 04 Apr 2025 15:52:07 -0400
Subject: [PATCH] MAINTAINERS: Add SCM for MediaTek
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250404-maintainers-mtk-scm-v1-1-95d1f0c3f60b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGY48GcC/x2MQQqAIBAAvxJ7bsHMMPpKdBDbagkt3Igg/HvSY
 Q5zmHlBKDEJDNULiW4WPmKRpq7Aby6uhDwXB610p4wyGBzHq0BJMFw7ig/oOkNaq9ZSb6GUZ6K
 Fn/86Tjl/MUnktGUAAAA=
X-Change-ID: 20250404-maintainers-mtk-scm-a54e22037e87
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Add SCM entry for "ARM/Mediatek SoC support" section.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 78467ad7a8feffda3a6909dc5f8d9bf0b0dee3e6..8375b95348906d3efa953d00bc224174ab56c910 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2739,6 +2739,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
 C:	irc://irc.libera.chat/linux-mediatek
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git
 F:	arch/arm/boot/dts/mediatek/
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/

---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250404-maintainers-mtk-scm-a54e22037e87

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

