Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA029ACD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898560; cv=pass; b=b9Dx9Ew+TTymIVjrouRZFMLQECE4BNnKokRj1X0qGLEViNYcq7OpUXac7+GuTwgzyuw83euVozAlPvfb6Ux0Ce6R02ascX/pDs21O+xSkTOgTX/dTtp7TNIl9xuESS1oOIu0Uu+6SRYi6Of81oMJjScUyWWZYd8LLaerraE1VYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898560; c=relaxed/simple;
	bh=4v/fYvtvrh7LwUOO2aT+NJgqFI1YoZRIb2P70sz0hvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L0juOnkaW7bqZezXKcHfcQeVwVFJ2eb7JY39j3YJnwtHyWIiQfzeMEHsjyT+H+PtGGfQqx0Qnl8HmxDSUoeHNxU0jI0w4lbvSZ0OU/VqWT6HJhHeghDBqkFFqsP6sQbTfo9NKnTZzRx0aMcvlbcokmPM0xjEs2H7XIxqgXq1LdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LeXiScxb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LeXiScxb"
ARC-Seal: i=1; a=rsa-sha256; t=1751898537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RC3DxRxRmZ3iIL08vvhDve/tPUJD4Hx68N+0o1lTBpKz598zGm/bLkyVQW3FC+nCWhl0x+HKVQDRLQ95isIuZ7RTI00Cm3qKdSqJR3UgPwyVNER+goXJL+J1JIGZm896zDoKEeK0pgDl17lH+JGIar3MYFACLAJqIAsyWMoBNTU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751898537; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tGZEF81c1hS/9Au4dc4XwLiGg9LAJ62Kn+70ovHwBgs=; 
	b=HDGfWWlErtvEmMg6sP/g26Z2yVhJAMYjNfGKmw5iT5LD8L6u93dXFN6lGY9e6noCNdRLoeLFl8KQ2KXlOAwJ71FgIaGY5V9wN7mCd4qbsTN6nDgk0RemXqMoaQiOl/Ly6bHRMAaOf39Kl7N/+nTh/7f9iXzs8+jUiizAhndJG1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751898537;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=tGZEF81c1hS/9Au4dc4XwLiGg9LAJ62Kn+70ovHwBgs=;
	b=LeXiScxbRlnVG3YYxOCm2vxpt5Oy4iA4P9XGT6Tw5+hVcT0AugVIpxPdX0wITOWC
	w3RmaByW3eKznC5eF3UY9XfKYtipJTd+v/qjYoGizdCSTnBT6o1kPZKUeJ1KbF+y+Yt
	h12Nrs5o3LrYoZZFOcX+nVipDIyfWhxRIcRU4CYo=
Received: by mx.zohomail.com with SMTPS id 1751898534893882.0472378471675;
	Mon, 7 Jul 2025 07:28:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Jul 2025 16:28:40 +0200
Subject: [PATCH] arm64: defconfig: enable XSPHY driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-mtk-defconfig-usb-phy-v1-1-4a5dd0d26402@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJfZa2gC/y2NQQqDMBBFrxJm3YGY2hq8SnGRmFGHkmiTWCzi3
 Rtql+/Bf3+HRJEpQSt2iPTmxHMoUF0E9JMJIyG7wqCkuslGNujzEx0N/RwGHnFNFpfpg9JZfde
 6VuZaQdkukQbeft1Hd3Kk11ry+ZRgTSLsZ+85tyLQlvF/UUN3HF+eC29xmAAAAA==
X-Change-ID: 20250707-mtk-defconfig-usb-phy-0db868842a31
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The mediatek XSPHY driver is required on mt8196 for working USB support.
Enable it in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865fe8edc54911213321d6f1278aae4..a3cd62f360a16bb9d63152ffc2e20d5df8158efa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1607,6 +1607,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_PCIE=m
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_XSPHY=m
 CONFIG_PHY_MTK_HDMI=m
 CONFIG_PHY_MTK_MIPI_DSI=m
 CONFIG_PHY_MTK_DP=m

---
base-commit: a89d580927679464582adf00ed40c8096fc434fb
change-id: 20250707-mtk-defconfig-usb-phy-0db868842a31

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

