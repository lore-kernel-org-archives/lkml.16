Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C31294A12
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056008; cv=none; b=G5LjNUMsDeZb0gjnU+uWvXtwaE2u42OU1z3GwsbCGZX24OJoM6N400mzAIH89wbP8JU2Ts+mVTIdY2Z9pS6QsbAl3qD67iqlTYha/7ak/aqTOrL+dwjFtqaonyz4ZXi/UMNdkQPJ29aMTnWLvywC3jFU1a0hIR8mE9PKH5dxcUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056008; c=relaxed/simple;
	bh=jinzHh8xi+fx37r1ofVleQRYSR+JY3hlDNStqMHq3y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AWj2GWxsRej7wycMHbVrPFQVKV7PXOYs+GZFsK7DNpJHQ3ERQeMaM9wue2KWvyyY/PCnwQfPe8CEgIOq0sbfWataOfhkVpnvb63blO7IbTsZeXbYG4/3ooRH9XJ1LsifOpPMdtCfFhfOjJ0AyOSs2VYbD+AOlfKjsuavW2GyiP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UtUT6dK7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UtUT6dK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747056000;
	bh=jinzHh8xi+fx37r1ofVleQRYSR+JY3hlDNStqMHq3y0=;
	h=From:To:Cc:Subject:Date:From;
	b=UtUT6dK7tpGM5fxIaF2b2VAh4HRClxDxliuyRP53xmN8NiE226GZ2W3nCfu/6gs2Y
	 +LMne1OwXzCPQFsNBumVKhjjVoIizCfKNaN9occhd8q4AoZjKEY+RUwK/sXIHo2kOp
	 8wVKDzg5cxUU6kIrPSYdJcc6izlQVvoTWw8bvOF1K3Ozj21omW98R/84yWpHku1+v/
	 b0TegTLeYu2Z+tcb0XoqK1pV3XYzIah69PLX+NJQk5kf7wPCRSqJvFKH/3F+rMoTIt
	 H0a4Vkiuf2d9a8CP+C79h+75tqVQnAciZ2j5UfX0lQ67iWxqx49qI0ELJhWomXr6vK
	 L/6A7tI0HAQYQ==
Received: from debian.. (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C58D17E0FBA;
	Mon, 12 May 2025 15:19:54 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	krzk@kernel.org,
	daniels@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	arnd@kernel.org,
	ck.hu@mediatek.com,
	laura.nao@collabora.com,
	matthias.bgg@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	lumag@kernel.org,
	ville.syrjala@linux.intel.com,
	jani.nikula@intel.com,
	arnd@arndb.de,
	geert+renesas@glider.be,
	wenst@chromium.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
Date: Mon, 12 May 2025 18:49:24 +0530
Message-ID: <20250512131933.1247830-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
stopped selecting the MediaTek PHY drivers, requiring them to be
explicitly enabled in defconfig.

Enable the following PHY drivers for MediaTek platforms:
CONFIG_PHY_MTK_HDMI=m for HDMI display
CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
CONFIG_PHY_MTK_DP=m for DP display

Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Include board details in the commit message.  
  - Sort newly added PHY configs in defconfig.

v3:
  - Use defconfig/savedefconfig to get the correct configs ordering.
  - Removed PHY_MTK_XSPHY since it is not required for probing display driver.
  - Add the commit details which deselected the MediaTek PHY drivers and
    added a Fixes tag.
  - Enabled CONFIG_PHY_MTK_DP, which was previously deselected.

v4:
  - Reword commit message.

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..fa973f6328df 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1587,6 +1587,9 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_HDMI=m
+CONFIG_PHY_MTK_MIPI_DSI=m
+CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2

