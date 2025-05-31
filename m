Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09C1239570
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748691557; cv=none; b=YmB2xSbsXdtfp1pw6PUMC/yLQM63Fvhgu5s2kJEU3zXlkvUZRbL3avmbO9y7MHpgB7O+kNDACrtAcAyOXZJ39pkAn0nKDHQclkDn2WYkf04q339vRhUhLbwqBs83FbH9W3jKLnCGUsXvAQo1jacnsLZtczAdycgw+/KKf3nJe/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748691557; c=relaxed/simple;
	bh=FThwoyjp+lIKrPd5bzRRSkMXiwi1LjBL90jgimirWd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RINANgt0X42B8tuUrn2WAEL2nGqiZ0lQ3xqqwG5etVzkHQ5yE6g+PMFKgubLJtenj8kKOcm0vzHbR1vK4k2rcXxcO0+QJ03/rej2oakzg3GbSI8Eq0Lc9D7BYYJ5+D9qyk0J9Zoq1qVE6JfowjDrlAPGG9Pdq/QO03agB8lanj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HL9lD6uo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HL9lD6uo"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C10A525C1E;
	Sat, 31 May 2025 13:39:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdtcKqBGVBb8; Sat, 31 May 2025 13:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1748691546; bh=FThwoyjp+lIKrPd5bzRRSkMXiwi1LjBL90jgimirWd8=;
	h=From:To:Cc:Subject:Date;
	b=HL9lD6uo72BQbIVpdfk9aqygljJNUq37nzFGQlzRKGG3MshIP9SaNNup4DsLt5p9h
	 B9PsAgeFWsDMmNsggg8mB+iqXSD/JnVm5SUL61hgjwpQLzA8+mOehWMNt4sjXpsm6O
	 bqvaMDB2slkCcxhCB23toOuysofKwdlQ0bJ4Y/07zQ1+VUVxmF/f4wHTOtU8BKE1hk
	 m85sG6t81pDZ1vY4JHX/N17FqvzkauOCjB0/3FDw04PC4lbDu7Ym/HoCqx92BtzX8+
	 EUrf1GDNmaWXKt8s+2Hxm+UKfnggtMbUvNpceLvAba2HWoxpHAb4FAzdRikwWSDYsW
	 mTUJsXrD0vNSg==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/2] Backlight control improvements for loongson_laptop
Date: Sat, 31 May 2025 11:38:49 +0000
Message-ID: <20250531113851.21426-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've observed strange screen brightness changes on TongFang L860-T2
3A5000 laptop after resumption. It's found that a brightness value that
doesn't match the hardware state before suspension is "restored" for the
EC, causing the strange behavior.

This series fixes the behavior by obtaining EC's brightness setting
instead of using a constant as current brightness on probe.

While digging through the code, I've found some unused,
power-control-related functions in the driver. They're cleaned up and
used to support power control of backlight in the second patch as well.

Yao Zi (2):
  platform/loongarch: laptop: Get brightness setting from EC on probe
  platform/loongarch: laptop: Support backlight power control

 drivers/platform/loongarch/loongson-laptop.c | 55 +++++++-------------
 1 file changed, 20 insertions(+), 35 deletions(-)

-- 
2.49.0

