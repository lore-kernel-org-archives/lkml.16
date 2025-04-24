Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F035957
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745462493; cv=none; b=IHYJW9kO3JuBlaLG9iznmZh78bVnLmyjasSlELNT2zQR2EB5KMFe5gBoAt2BDNTT2atHYriM7foxi9oucP0/PBONQUJGhrMYT983WoY3i9FyFt29e+ZKCZLlGOtrulEt45de923CQTtNovOpVytvxwywAGPDvfpdOv13oCT8x5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745462493; c=relaxed/simple;
	bh=kYXLmezIiIazMJijPp1RAe+rBuUhRwghSKpWymQjMls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LaD/mvxdxo+ghwv4zLVHDom4cJkdRMkPeZ0r3/qEOo+Q6m8wceQ1/7woCoI3+9FGgYGXtcX5L+EBXCRYgb66OZhEx0/KFVrYJK6Oq4pPVnuBfj2/v7gWvtYGcTjwCPaBmUi/INATGpLi/sAB8GUG9OfLTCRc+jS0g3S2at0INQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xPA0aYhC; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xPA0aYhC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745462488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x1FjIZj/AyeeMGzGgXylzm0lB1LG5eNGhh9CQM3SJNQ=;
	b=xPA0aYhCG2jBBQM1vIuMchJEPF81vFcdZ6hwbksf+rac1O9zx6tyHaZMw6QMgR50AVnv9M
	8RbGryREMHfJOWjj2uDAcgs9YaUlYxQk8LAQRu3VSCrvMMT7MeUM3By1+GeHXO3ZHCMUX9
	Ni1Vb06VFOGO/c1IlQQ4mwihs0Nw7Mw=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev
Subject: [PATCH v3 0/3] LoongArch: Adjust the 'make install' operation
Date: Thu, 24 Apr 2025 10:40:31 +0800
Message-Id: <20250424024034.78436-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Changelog:
  v3:
  * Add a copy of the kernel config file.
  * Some minor adjustments.

  v2:
  * Adjust the patch sequence.
  * Adjust the title information.
  * Distinguish between vmlinux.efi and vmlinux.elf in install.sh
  * Correct minor mistakes.

Youling Tang (3):
  LoongArch: Add a default install.sh
  LoongArch: Using generic scripts/install.sh in `make install`
  LoongArch: Add some annotations in archhelp

 arch/loongarch/Makefile        | 11 ++++---
 arch/loongarch/boot/install.sh | 56 ++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100755 arch/loongarch/boot/install.sh

-- 
2.38.1

