Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBCC1C862E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102534; cv=none; b=CeyLgSM3bcjkVXqbGqZ8xKi7qTwYMKN33w8wzv6+hd6fpMB8xvBJ0gkXS2WgR78tCN+Gqa8rR01Dm3HVp0NUJhHt9s2uqH80EY43ifDkGXmu9obNE8FVPzS624iH9DHKG4KfFkh1p5JVLo/kJ4B+MSBoAKujXqRrIXM/QsE1r7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102534; c=relaxed/simple;
	bh=ioeIikdVNsjZwbe54sIZrips7vq25Iqvahj3ht89His=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKjzNMU6SDvggemk3NSuAM6R7UPoNE6mFwbBXNZIjFufSybkQ6HAJi5VLfqmQgDncGiPlxY08OMEeOJ8oIwt07CeeRCS7YmQIoOYGBwHvvjcx8/LQgy04EC9FphCifX9Reqy1cFpcJcpDEIDVV3EBuWlQHhJUfDxhaJr9AC0gxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=O9DIo/F4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="O9DIo/F4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6B96426012;
	Thu,  5 Jun 2025 07:48:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghSKkJ2gbIWl; Thu,  5 Jun 2025 07:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749102527; bh=ioeIikdVNsjZwbe54sIZrips7vq25Iqvahj3ht89His=;
	h=From:To:Cc:Subject:Date;
	b=O9DIo/F4cwKDNXUl/A7auardTOia3VtgJUzXGM9mQ6Wn0tIxCcdX2ukrwrSV7h6O/
	 ZyX7nSfsK1/9eZX3QH4lO0hOhStJ+SAeWqyIWa6pFJnotYZBZgSRZtC1T933pb4+kk
	 mb6wekyO7yMPpibJ0nHcZFlIVNbixIMssPg0Ar4CAR8VcGMH87u7Ihh4F096oNTuvv
	 DZkrfcwLtIyfbnajZR2HZZdyYNVPzJN3QQiJ9rTiswQQg3Poj2wndDsOI8G4r3tv2n
	 W4cAg39n6/qOgKdi2ljbA5jU46sw6oPZvswbspw8IIavT9id9c+TOIDe95FQjaNhPn
	 amde2fiDzyoug==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/2] Backlight control improvements for loongson_laptop
Date: Thu,  5 Jun 2025 05:48:26 +0000
Message-ID: <20250605054828.15093-1-ziyao@disroot.org>
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

Changed from v1:
- Reword commit message of PATCH 1
- PATCH 2
  - Always issue a power-on command on probe to ensure the backlight has
    been powered, matching our expectation
  - Cache backlight state in the driver to reduce interaction with EC
- Link to v1: https://lore.kernel.org/loongarch/20250531113851.21426-1-ziyao@disroot.org/

Yao Zi (2):
  platform/loongarch: laptop: Get brightness setting from EC on probe
  platform/loongarch: laptop: Support backlight power control

 drivers/platform/loongarch/loongson-laptop.c | 78 ++++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

-- 
2.49.0

