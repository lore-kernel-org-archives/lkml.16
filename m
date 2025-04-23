Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03F4EAFA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397960; cv=none; b=IsH4ZxbsM86XBDYqbbp4ieQkIzobVYASfidRangIUWJOegvnbskJefaSQpyuH4IeIh8mQRmnPA5/4vJEc8CqTRxznIe1laKqU/40YCW71EoSzTWzPKljdWL3fymg5iP4cBghMVu/7pfQbRLRbmOmlyQ7AJUnNdptZxNxWz84BiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397960; c=relaxed/simple;
	bh=ggd634lHnb2gNywn40oGwS0ugGvo2FpcGUZ7FmiBMH4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LybK/T9KkYv+ewTpMG0sSQahcgH+J6ePnoRQfUXvN4uZcf11Jbs6AC/UfTI6Ozk/Ly6ROzscgQi2h49ZVKG2RhvfsobymzbuA7uCAgbdzjwRZW48TqVwaoQ/nV/zaBfIWk4aiT/CBTJOz6kY/dWGqezxy6T5R48PNbsZe0531Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=maDc/Kda; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="maDc/Kda"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=h/liMcuEUfy+HSngWwdJOc2MreTUFz3n+kzPTK+CxF8=; b=maDc/Kda9gV6qGWKCxvz+VWZay
	/r2u5lclRONvr5SmRJq6vSwcptCmQaVCQQ8iYsb6Wwzx18n0+nXUUWHvbjqqNM9OpD1RpRed/aWVb
	sOaURYt/TVb4JfSaI3YynUeVM6w215Ts12Kd/o+xuxOTE9mneOPvHPPe4QRCObbllNhL2IZnXbsP4
	YA5O+wHwvKUL0r3f9LHKXOEJoEQhS0izDtxr8QY0DK0BdHFxz7Hi/FTeHP28ZEBs56PMQFlB7xo4y
	6vKl/mmUAXMJARdm0hc03bz9MhcluRUwtG/n/ewctBypx8Gi9Axw2oDLsGcLpcywjwZ9mhHCFEURT
	2Q4L7LXg==;
Received: from 179-125-92-204-dinamico.pombonet.net.br ([179.125.92.204] helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u7Vjr-006pQt-Kh; Wed, 23 Apr 2025 10:45:51 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH v4 0/2] char: misc: improve test and dynamic allocation
Date: Wed, 23 Apr 2025 05:45:41 -0300
Message-Id: <20250423-misc-dynrange-v4-0-133b5ae4ca18@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWoCGgC/3WPQQ6CMBBFr0K6tlpaC8LKexgXpQw6iRRtodEY7
 u5YE6Mm7ubP5L3Mv7MAHiGwOrszDxEDDo7CepExezTuABxbykwKqYUSJe8xWN7enE/HVq9tJY0
 GlVeMmLOHDq/Jt9tTPmIYB39L+iif23+mKLngRQd5JZSEriy2eDAnNEs79OypiuoDzze/uCJc2
 0KL0jZWgvzC59drHi4TNRxf/7HGBOB073GsM2rrk3P1nvgJ3RSInh+Uo8cfJwEAAA==
X-Change-ID: 20250307-misc-dynrange-d54c92a5e319
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Dirk VanDerMerwe <dirk.vandermerwe@sophos.com>, 
 Vimal Agrawal <vimal.agrawal@sophos.com>, linux-kernel@vger.kernel.org, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
X-Mailer: b4 0.14.2

This includes a change that prevents dynamic allocation from using a minor
number that belongs to the historically static reserved range, which is
still used by some drivers.

It also improves the test, including a lot of corner cases, specially ones
that would fail before past fixes.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
Changes in v4:
- mark some tests as init-only, since they use init-only symbols
- Link to v3: https://lore.kernel.org/r/20250318-misc-dynrange-v3-0-5c6507cbc2e2@igalia.com

Changes in v3:
- remove code around DYNAMIC_MINORS and the backwards allocation
- try to open devices in tests by using init_mknod plus filp_open
- Link to v2: https://lore.kernel.org/r/20250307-misc-dynrange-v2-0-6fe19032ef76@igalia.com

---
Thadeu Lima de Souza Cascardo (2):
      char: misc: restrict the dynamic range to exclude reserved minors
      char: misc: add test cases

 drivers/char/misc.c             |  28 +-
 drivers/misc/misc_minor_kunit.c | 589 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 592 insertions(+), 25 deletions(-)
---
base-commit: 4d239f447f96bd2cb646f89431e9db186c1ccfd4
change-id: 20250307-misc-dynrange-d54c92a5e319

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

