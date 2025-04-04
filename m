Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03381F099F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774944; cv=none; b=Cc/KLzDZf8NMKQBGVqY+zNTdf4tVS18eHubc7GcAo1/r7K0PIMMzfVAyiLSgb/lLhjdUbRPNDCpV0G9CU4yxV2VhTBQMzQR9ZojWYuvc5VMn20FmLRRcelWLUVKRJ08hUHib37sSl9vDwcb/6WZ3EgB47K15cuHavO3LSNCWOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774944; c=relaxed/simple;
	bh=Kx1OpLDuulU5vHnkD3e+tPyIzf8nbonalB79VzM2jQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WiKw7TYDI1pjIuBP7MgItXIso7ak6/KORWLPL6TA6dgzoFl6XgbwbafxPpTIKpbpN/UyMGpvENTTFRXJ09TWVVbttYDQJ2nroaUOoYe7J1pHNm0r73HjaiWfQtCEJmp6D2isIk80/uEQBc2/Lj9vsUsNKOKTMMn6dSM18lThaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8X4mXMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8X4mXMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2BFC4CEDD;
	Fri,  4 Apr 2025 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774943;
	bh=Kx1OpLDuulU5vHnkD3e+tPyIzf8nbonalB79VzM2jQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R8X4mXMSNc1Dauow/CPDn2TWiHdIKUTPE/PHHXI3QD3ay4q1n4hTFELkp5DmIXNbz
	 KJzgazu6K3g6eCM1H6/0WascGMXeGjK+ypLY+1H6ZbWXv0fQi/HWKdENiQRPJ7VZyg
	 +rIJ/x1GxOP8egb1gJK8BCM355TtpJEzQRcjzDokFLWD/lkMvvlqRMIsIGWsqUQDF/
	 d2MOqThWnxbK/vQRChQbm9YssEBWkddPd5877KZ+vi9lX707fsZpl8u4gFhb+LGPY4
	 +DqgtxST9Bkg80uIFNOCB6NnWpE+EVR/pTZzJaLaerMlfGWs3gkda+An5JO26VtlnM
	 upPfJYwTzIQpA==
From: Arnd Bergmann <arnd@kernel.org>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform: turris: use ffs() instead of __bf_shf()
Date: Fri,  4 Apr 2025 15:55:26 +0200
Message-Id: <20250404135531.2421755-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404135531.2421755-1-arnd@kernel.org>
References: <20250404135531.2421755-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

__bf_shf() on a 64-bit variable causes a link failure during
compile-testing:

drivers-platform-cznic-turris-omnia-mcu-gpio.c:(.text):undefined-reference-to-__ffsdi2

Open-code this using ffs()-1, which has the same result but avoids
the library call.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/cznic/turris-omnia-mcu-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 932383f7491a..c2df24ea8686 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -1104,7 +1104,7 @@ int omnia_mcu_request_irq(struct omnia_mcu *mcu, u32 spec,
 	if (!spec)
 		return -EINVAL;
 
-	irq_idx = omnia_int_to_gpio_idx[__bf_shf(spec)];
+	irq_idx = omnia_int_to_gpio_idx[ffs(spec) - 1];
 	irq = gpiod_to_irq(gpio_device_get_desc(mcu->gc.gpiodev, irq_idx));
 	if (irq < 0)
 		return irq;
-- 
2.39.5

