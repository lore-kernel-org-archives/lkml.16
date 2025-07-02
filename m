Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71118EAB;
	Wed,  2 Jul 2025 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440496; cv=none; b=YmMVmFm9KfWJWc/xpKjqX8vwpdOU5cWegKtA2xOEySf7NhQSQmvm00HD1uNvSzVAjVOglF4fCDZeow9BfDG/c+rcvZHBye2fJP7ZZLkXwn+aSpBZiw8z3nQdootWzgGFm72mf+VF78SU1ZACzFFy3Pu0cnRQ7y8T5C9UQK8xAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440496; c=relaxed/simple;
	bh=XfOqIy9kXvRmU5qbRDm2DiQztVqtweFVKxPLlJ6FTT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fxak9AoZrbpCH3zdV7/HZ8tZnxcIrZ+ua36rmNCsrPsVoqqPRvFA7+V94NEm1wsKWQJEETSD+raDOj0MF7yPgZ2K1ShtiaMZtL817q7njhxKWcUay+cU4MbmMhYhVXMuVPVfETH37qp5dzGNjGB0SrhqQtdQQOXM/lbTjBoy3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=cN6Wf9OK; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="cN6Wf9OK"
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=cN6Wf9OK;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id 3F9133250;
	Wed,  2 Jul 2025 09:05:28 +0200 (CEST)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id bOL6uMTxE_LZ; Wed,  2 Jul 2025 09:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1751439926; bh=XfOqIy9kXvRmU5qbRDm2DiQztVqtweFVKxPLlJ6FTT4=;
	h=From:To:Cc:Subject:Date:From;
	b=cN6Wf9OKQf7E6guJ7LpumcG2n9qtzpMS3+rlqMyEX74RvYJmlKKCyeXEO1Gdt92hI
	 XE7CDLKwXaKFquVGEn1RucZYsUUYqiPZAT19onwNadQuJSVaB6iKAysLAjfspiXzGc
	 kskM1lyDc+JajNzda1MagUYZGG+Gip+SmuOsBm60khv3Kd9Imxyb5n0bEWGVwJ4xMQ
	 8r4TBQWK/xImwynCbBVcnOv3l8jzyjBQzELT3eMGfPPi0ecOtFE0JE7nwGlhdv8V7Z
	 mRU85oucsGFVpQ6mgE4+HcnWem6JrmWmFVqeJNlE99GQsGTkz7ry6w1I3X0OyfhkJo
	 tfzztZK2O8gpQ==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id 9213F255A;
	Wed,  2 Jul 2025 09:05:26 +0200 (CEST)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id B3B6240348A; Wed,  2 Jul 2025 09:04:29 +0200 (CEST)
From: Anton Khirnov <anton@khirnov.net>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: map more keys on ExpertBook B9
Date: Wed,  2 Jul 2025 09:02:31 +0200
Message-Id: <20250702070231.2872-1-anton@khirnov.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* there is a dedicated "noise cancel" key in top row, between mic mute
  and PrintScreen; it sends 0xCA when pressed by itself (mapped to F14),
  0xCB with Fn (mapped to F15)
* Fn+f sends 0x9D; it is not documented in the manual, but some web
  search results mention "asus intelligent performance"; mapped to PROG2
* Fn+space sends 0x5B; it is not documented or mentioned anywhere I
  could find; mapped to PROG3

Signed-off-by: Anton Khirnov <anton@khirnov.net>
---
 drivers/platform/x86/asus-nb-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3f8b2a324efd..42d7b435ba63 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -573,6 +573,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x55, { KEY_CALC } },
 	{ KE_IGNORE, 0x57, },  /* Battery mode */
 	{ KE_IGNORE, 0x58, },  /* AC mode */
+	{ KE_KEY, 0x5B, { KEY_PROG3 } }, /* Fn+space */
 	{ KE_KEY, 0x5C, { KEY_F15 } },  /* Power Gear key */
 	{ KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
 	{ KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
@@ -609,6 +610,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
 	{ KE_KEY, 0x95, { KEY_MEDIA } },
 	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
+	{ KE_KEY, 0X9D, { KEY_PROG2 } }, /* Fn+f */
 	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
 	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
 	{ KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
@@ -623,6 +625,8 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_IGNORE, 0xC0, }, /* External display connect/disconnect notification */
 	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
 	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
+	{ KE_KEY, 0xCA, { KEY_F14 } }, /* Noise cancelling on Expertbook B9 */
+	{ KE_KEY, 0xCB, { KEY_F15 } }, /* Fn+noise-cancel */
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_IGNORE, 0xCF, },	/* AC mode */
 	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
-- 
2.39.5

