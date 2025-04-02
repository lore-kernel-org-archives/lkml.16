Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A589444;
	Wed,  2 Apr 2025 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584788; cv=none; b=NT9yvnzzHmo4fCBOT+RAMuChS4udgQNZHL4wZdjXY4P8G8xxq/H3pTgGNLQLGHUK705Ld0Tn/A/DHKsL6Kx3fsQasmjtpCCl2sQ2EzK1SMrgeFuhL4AkjvmVvh9Vm73IMZ+4+94wdf5n93CFZyltnAUdyvx6f4K0a/fgObjkDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584788; c=relaxed/simple;
	bh=MAaSZtG+Pj7zEYW7AwCKH08fcrPrYRFVdzT1WeOK+d0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u92BS/7NRRGouRDhJg+LPl4JjvxYT3AMJf8zAlsstwQFS0D3z9lLHYSxYF76TQKxRiYn5D1gOEcvsgHtC7qBeqg+uXCHJwqPc3pkRaAkXgmjQ5a+JB5glH3eDLTWlqP+pSYSU+hOuPiEYcwaARM5nIXD9HAmJKpsvFlZj8tUhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jbq5b83o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jbq5b83o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743584779;
	bh=MAaSZtG+Pj7zEYW7AwCKH08fcrPrYRFVdzT1WeOK+d0=;
	h=From:To:Cc:Subject:Date:From;
	b=jbq5b83osdkvhR8TvZ30q+MDMOdlWmA8KEPrSvu/EqjBgzryRgk9PcXSSYxvsv7dJ
	 yIINhtNFZgEmnwoMZZmeQf8iCS6wb9F7V7dT7JP+HxO6lsvz6w78+2BUF8Fk+ey8i3
	 iMrP4DCzbFWOmzSMIqbkaXmrhIBeObTq27ypGD9JqAwvXwxfy3Ip8DwR5wWKKWfo1+
	 tKKFnY/xQFYvLQXzTF8KCqkIpz6cwPew1bMqlqXhW0M70w3r2DvgZmzni6cTonTw64
	 CNRW09GM43/pqgYXz2//usrInupdj2HCdQ82DJOmGz0tgBgAbLZlDZRE30pU5VNRZX
	 ebYtFqB0/1wbg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D397617E014F;
	Wed,  2 Apr 2025 11:06:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] arm64: dts: mediatek: mt8195: Power domains fixes
Date: Wed,  2 Apr 2025 11:06:13 +0200
Message-ID: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes hardware access issues happening on the PCI-Express MAC
and on the video encoder and decoder IPs embedded in the MT8195 SoCs,
fixing system suspend functionality.

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: mt8195: Add subsys clks for PCIe power domains
  arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 54 ++++++++++++++----------
 1 file changed, 31 insertions(+), 23 deletions(-)

-- 
2.48.1

