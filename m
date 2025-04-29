Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171E2C033E;
	Tue, 29 Apr 2025 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970762; cv=none; b=CGuKqKcZDLgRj48bvk5+g42YOI1kTqlnohsHcwD52HhrI8dt9aHkRno9YgKuK8RSSYFvc6qJvy9q64KTXt6hbBCD6l1ZkIyNGM67S1zlLKJ5I5Z/jHWCs1A1kiF51rogD4+4Nrz8sq138LWRV7GN2rWNRWoKmIeFz+QCCvwkw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970762; c=relaxed/simple;
	bh=Owc37Zx6v1qjTmDYmVWBoUDC8Yizylw/CHfTZXgaH74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m0/an8s/Q/2jRhe4APjsELw4dVenPH4XSJddJXsSpgqhIs/wGT75g89+DvTp6/pFUx0KMHMVnbyNvRjNZ6X8HEb8reGjlJhrM9jrEH7Obg5F3fkec8TcQCzeG/JE3QvselFogf0iADlv5vBvzXo5a9rKhhqlJuyJWm3JJuKy1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LC1FD5np; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LC1FD5np"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BCEC4CEE3;
	Tue, 29 Apr 2025 23:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970762;
	bh=Owc37Zx6v1qjTmDYmVWBoUDC8Yizylw/CHfTZXgaH74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LC1FD5npl8RzexVvLNBg33Wk6ei0A3Nyjn+9+vRlDd+0ApFExC5oKX1qzLAvcfcix
	 NmOuhD+4huEBKGbuuy1P4jagTyHXiIuEr20IKeKiOQkdJXVJlwi7tWpSCfs4KBMLV0
	 QidPvuYb/7Q+ed/x9feVyXoVLsWgYuCYBTCrUtn2dHYNshcI+GzljA3s0STbUnE+jO
	 ODlKBCkzJ2+jgRh6SozCQv38K4PXV8gd5bTI5s1GuGFPlnCTYpDQuHLT9xgXG37jTd
	 QeKvbm4XoaETm9gpdK66SVZ+c01yF/NSfqF7CJ7dYTU6mpEzTxsciXa71+XV0OMS0Z
	 kiDNHMwUhqdHA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 03/21] nvmem: rockchip-otp: add rk3576 variant data
Date: Tue, 29 Apr 2025 19:52:15 -0400
Message-Id: <20250429235233.537828-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235233.537828-1-sashal@kernel.org>
References: <20250429235233.537828-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.88
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko@sntech.de>

[ Upstream commit 50d75a13a9ce880a5ef07a4ccc63ba561cc2e69a ]

The variant works very similar to the rk3588, just with a different
read-offset and size.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20250411112251.68002-5-srinivas.kandagatla@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvmem/rockchip-otp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index a0252ac867bf7..c6684ab14e742 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -273,6 +273,14 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const struct rockchip_data rk3576_data = {
+	.size = 0x100,
+	.read_offset = 0x700,
+	.clks = px30_otp_clocks,
+	.num_clks = ARRAY_SIZE(px30_otp_clocks),
+	.reg_read = rk3588_otp_read,
+};
+
 static const char * const rk3588_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "arb",
 };
@@ -294,6 +302,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-otp",
+		.data = &rk3576_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-otp",
 		.data = &rk3588_data,
-- 
2.39.5

