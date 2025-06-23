Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B24C25E477;
	Mon, 23 Jun 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680112; cv=none; b=O7OU3i4XHD+erZ9vOr4IiJlidiClOtFNsfM+6KYt9onuj79H1YwngV4x2kriuZ1sEIzd9gtMBMOoHZAB08y0tVhBayA6wdQWMBHKOaFUNrhBHhp0nqCf3kqEwItog2GzF8HKCX53a/aGupo3Hv4Voauv/Y+2ZCw6q4JHpbNt9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680112; c=relaxed/simple;
	bh=YIGrVZxLhyBBB2bhjM5wCiH2IvtXz0uJ3k9n6G/Zu2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I6QHGMYCYct6Sn9Qd7TKyCBADQuxPjPngWoxYbIB0OcJnhEa6kcf7+HsFmSt1tlPOoMacokcE6ZaJMObWD6R1Ah/x9i0cGbvqPCVxK8tqyTHnSRoCbKUJ71ihDAxhgvOB9XUWKiXQyLEsH8yL5GWLwv+/F+kPdOZnGsFCdR63PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=orNKuMby; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="orNKuMby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680109;
	bh=YIGrVZxLhyBBB2bhjM5wCiH2IvtXz0uJ3k9n6G/Zu2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=orNKuMbywOTu4Ixkiys9qdBo5vnLhEA+GFbvOTmErNFIZ2sgUJbo9A3Vh72W+geLY
	 5DpUmXHfBkHsd8xC6KXFbaOMaI47V+Nf5T0NEGycg9WO+PFkn9nB9WWY6t7MygLsPf
	 F6gwMZKOr8LeYG5mTAnGsnDLLsk95dyHxPBlvAD2mjQAR2Z3JDSOYa9Ht6TxLSi6ol
	 iXc00Dspb3Lw0Epi3AFBAaD9JlppFe70Adkuzd2iO9W7IuW6Q+QhnhLxJn8qFp0nT+
	 dBmHw4r02aQIOStDUy2ngV1smbzUt37CQoxMCrNkVXLsTfhjs6EAdIhCq858s1elMA
	 kzPDNIx0wZnNg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B254217E090E;
	Mon, 23 Jun 2025 14:01:48 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/4] regulator: dvfsrc: Add support for MT8196 and MT6893
Date: Mon, 23 Jun 2025 14:01:40 +0200
Message-ID: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the DVFSRC regulators found on the MediaTek
MT8196 Chromebook SoC and the (unrelated) MT6893 Dimensity 1200.

AngeloGioacchino Del Regno (4):
  dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
  regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
  dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
  regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC

 .../mediatek,mt6873-dvfsrc-regulator.yaml     |  2 +
 drivers/regulator/mtk-dvfsrc-regulator.c      | 38 +++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.49.0

