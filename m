Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCA51A8405;
	Thu, 12 Jun 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736612; cv=pass; b=CMB/jl028r4tdAo+pjYTvDf0gy34fbgQ9TQWpcB1XpEtzyydvhGJnfCXQPA01thtiN4h1WIgf1XKeswfZJ/10b4cW1v4frCclbPuawRSswbbYJ8EvqbSs5yaCLSNtoUS2Thr+Tb+LzNr+z9faD7abjfk6cilelvQYtyZ+soZoDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736612; c=relaxed/simple;
	bh=9z9L2t/idxIPWqHtl6feJ5+98mUHvEmO1D71s0ZzRy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APt5njTGGXxrDnIXQ48NhGzNAuMtR0jbVKgFpN8gT2bk013tsthWPiMhxY5p7nsDo4wC3R0cf2hdc6arHlzA1h0OhlpSTBUgQtsuFI/PnlZOEt5zUpGxDhAJ7T001YG3uHOjrR0osd0tamQoMVpWPPA4X+uLhxBk07CmlxYeBy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=n8+WYuf9; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="n8+WYuf9"
ARC-Seal: i=1; a=rsa-sha256; t=1749736586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lvR1fq3NchjreiyUiIeLyfUSl3q2G2RoAlsQESjIc53+9OOmdW49NG0QOCklpaAxkpzOf+O3J5TOvuWFybfEplwcaG6SlWktPmVS4TBXLl1CE+CNBIWgpw+JPMzHAHvrgK3MAmVcgjWwsLQjgM1OiYYRK5Yzn18WQBKTwVWeYRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749736586; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xe+/CWthc6ot+OCxKsW3fGV6MDdG1CZZweZmpwlQwl8=; 
	b=UDb8x8KAEskyKoSz1q1Mjj674Y9Rt4VlIoYO9Btoo4sS28yUQqBfQK7bS5IbuU518aeieAFSnj+TDZqkC9cgxYZZSvCSmghmOHXVmgKQJMWTPv+DDBO/oEGe4QqVIqZePNHuSv8DtRWGH0koTxGY2nAaixJwK5J2UjvLaqR9j/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749736586;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Xe+/CWthc6ot+OCxKsW3fGV6MDdG1CZZweZmpwlQwl8=;
	b=n8+WYuf92DJ5Lm1peHwH0i8dXZkNIOPgt6STqoXZn6bE31CoXzRJ7aDTt1IPiUfh
	XEjSZx+S0IZMuy5sEy/SA0Ayo2YBiyF/OSXxBVCrX+L6rMKOiyXcJF0k+rFEmYjLIvn
	5gyhXvQ81zaLxlmvGB/DqrM1LDnuGFFfTwq9TvyjZn32JvK1bv1xeaoMuwh2dnchIPO
	tzuQGpMYbgc2ttKjYPZsz5dvWbyK1lvofXwv/tFR5IOhFwwxJv1lqD+FwFJDt27KfX0
	GYrwEKtAQvYBc4LsXL0BBDQZ4y5dpMAJYjJmW46HmjVRr/t43nrfjeHjWv9lVTvViGF
	1pKHyolYxQ==
Received: by mx.zohomail.com with SMTPS id 1749736583346329.0335267878131;
	Thu, 12 Jun 2025 06:56:23 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
Date: Thu, 12 Jun 2025 21:55:59 +0800
Message-ID: <20250612135559.2601139-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612135559.2601139-1-uwu@icenowy.me>
References: <20250612135559.2601139-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250612135559.2601139-2-uwu@icenowy.me>+zmo_0_

The current mt8173-elm-hana.dts file only contains compatible strings
for revision 3~6, makes boards with revision 0~2 to fail to match a
revision-specific DTS and may fall back to the rev7 one (which lacks
some gpio-keys).

As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
the base hana DTB file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
index fcf0cb76a87c3..84638a07587f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
@@ -11,5 +11,5 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,hana-rev6", "google,hana-rev5",
 		     "google,hana-rev4", "google,hana-rev3",
-		     "google,hana", "mediatek,mt8173";
+		     "google,hana-rev2", "google,hana", "mediatek,mt8173";
 };
-- 
2.49.0

