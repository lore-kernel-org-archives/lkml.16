Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5862EB5B4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951090; cv=pass; b=u8q4w6uL1Wj5OD++oYZv5ShG5jxhKetXu1TvhcEiN43aUoiFeq8Ww64ZGewxLa8n3bUVeIW74veyYDYo6ycUl4HljiD7hvvfmcliYfVui1sNLD81G1QyIwPS8S57b1kEP04H4P3stC0POvW/m4hJG0l5F6NlO4tIPSmvtwh0xHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951090; c=relaxed/simple;
	bh=X7Q+9YMrBKMmMa3dSOm/Sr602ckt24Mw/XdVfKpVW+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kajURjr/MOQGSEkoPjaf0BmHJ8IKTbkb7ZgqlJbtFM9I6OaP/LRF5Yw3HJPAkjhTWrgy58V2NcTyQ9wYQtd3D3U6DlRl0BgI8Jq64PoXvp3zCjpN59MNUkcrIS6bgCIm0y5TvbLvIwN9ggOGo4xtXnNcostSSoGKHfaJv6c3Q88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=ZYdfM9BP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ZYdfM9BP"
ARC-Seal: i=1; a=rsa-sha256; t=1750951060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KdSQNg44XY0aDBvJpvwXJ7hZnCNtm34c2MB+E5W50MAJcF15A5lW5tN0yLKUY4dmZ2hd7FBA8Wpq4zxs6C2QhOiv2UdiD2NMWACJVvae0vAdODDYmWZBRFNK/3vUso0LJLfoj5mQ38H3yK21dGM99BnFPKR0merCQtCf8Ln6vzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750951060; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Mp0Gioriq+Cm97moLnLwRbcOGGhJvQyXKdRIuZwi4PY=; 
	b=E/O9TBewgZI2hhCliPHlup/Fk9aG+rWNhf4zGhfN1J4arLvGktzO1syiexEMAqfqti5smuv9j7zgN56ZDiqe6EDMZ3SeTTbhjaeMClSuY4B6zPJZMN55IVQ2iz5jJewf7AR5HlJyvwTqV73cjXVrUSQtl0PWhqcksyDl9kzfewY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750951060;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=Mp0Gioriq+Cm97moLnLwRbcOGGhJvQyXKdRIuZwi4PY=;
	b=ZYdfM9BPepva/BjM/XIknPqiog0Qholkn1PB6/NVAawm0j21pgk8/tUelTxG5GHP
	bHzBMPgrE/wVmBuBJMHy1Q2xWwNs4GVKCW7Z31rgzmlWmpUk0nV+RgPUkVsGxhGV9vb
	welB1E4xpdwqNvOD8sa0NtTdM+0T1P9h8L97Rh7g=
Received: by mx.zohomail.com with SMTPS id 1750951058759577.5834453049853;
	Thu, 26 Jun 2025 08:17:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 26 Jun 2025 17:16:49 +0200
Subject: [PATCH] arm64: defconfig: enable further Rockchip platform drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250626-rk3588-defconfig-v1-1-39a19a41c181@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGBkXWgC/zXMQQqDMBCF4auEWXdAY6PiVYoLm0zsUEzaSSyCe
 PeGSpf/g/ftkEiYEgxqB6EPJ46hRH1RYB9TmAnZlQZdaVO1ukV5Nqbv0ZG3MXiesasNNZ13xlw
 tlNtLyPP2I2/j2ULvtcj5HOE+JUIbl4XzoAJtGf86jMfxBfiKZT2TAAAA
X-Change-ID: 20250626-rk3588-defconfig-715e37fd554c
To: Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RK3588 SoC, and its sibling, the RK3588S, are supported by mainline
Linux. However, some of its SoC drivers are currently not enabled in the
arm64 defconfig.

Enable rockchip-dfi, rockchip-rga, and the Rockchip specific extensions
to Hantro as modules.

These drivers are also used on other Rockchip SoCs that mainline
supports, notably RK3566/RK3568, as well as RK3399.

Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e071f8f45607dbfd8e00b915b27999949ee0fc88..8b5ecb20ed6450faa0da14a6fdb4cb227a1f735f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1789,3 +1789,6 @@ CONFIG_CORESIGHT_STM=m
 CONFIG_CORESIGHT_CPU_DEBUG=m
 CONFIG_CORESIGHT_CTI=m
 CONFIG_MEMTEST=y
+CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=m
+CONFIG_VIDEO_ROCKCHIP_RGA=m
+CONFIG_VIDEO_HANTRO_ROCKCHIP=m

---
base-commit: 7e5ee158886bb7c244a34623de6a410b62023d60
change-id: 20250626-rk3588-defconfig-715e37fd554c

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

