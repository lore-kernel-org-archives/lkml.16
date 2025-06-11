Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD32BDC02
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653791; cv=none; b=AG9ej2f/aT5p1TmpfRkTr0u9u2WXrgV04fEbdju/CvW0X37Br22wekvVoHYAYG/OSK0x1r9LIcii2I1t1rNscniBIZ/K70zRp1ptHWTWqjl1OuINoRCkqTSn7U6bmq6TeF0FWvwzF7uz5ijcWdLD5g0geNoBXQNIJglkyPOnLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653791; c=relaxed/simple;
	bh=AQT8gj4xTBMw8so4kCxpdxtX6at/oNsMVTMEr/8Woqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ur0TCnLvNw0Kx8M7u/ro27DsX+wUF6qUEMkVb701qmkO5jEceZHhRN5nxsFB+AQVj+DRNeN48rU6fJ/WVcB5w1OexPBIhzIvyFyf51iiigpMQ/j+7rtLwv7PIy7IbGbGFRoC2JZI39V4Vt9vTe3mSD7OxBex+C7UA2iUBLuMoqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C628C33BDFF;
	Wed, 11 Jun 2025 14:56:25 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 11 Jun 2025 22:56:04 +0800
Subject: [PATCH] riscv: defconfig: run savedefconfig to reorder it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAAOZSWgC/x3MQQqAIBBA0avIrBtQo6yuEi1CZ2o2FgoShHdPW
 r7F/y9kSkIZFvVCoiJZrthgOgX+3ONBKKEZrLaDHo1BbTBJ9gUDsb8iy4GOZ82uD3bqA7TwTsT
 y/NN1q/UD2NZiTWQAAAA=
X-Change-ID: 20250611-01-riscv-defconfig-7f90f73d283d
To: Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Guodong Xu <guodong@riscstar.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=AQT8gj4xTBMw8so4kCxpdxtX6at/oNsMVTMEr/8Woqg=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoSZkWufTaZdRh6DX6w+W5fpSc/YuCt9t8gi33q
 JnaMfzti6OJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaEmZFl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277bWrD/9d/QMkMszVaP2n4l
 /Tek7n0hbNq7jnvIjdleHffHTxI/1uxI1MvK/FA7lqD8Riqoj+3F8XIuw8Wim2/HOP8uqb42FLI
 d6xpWrnJDwcfwdin2MkWm2Zw8zQTUGXule5fcAAesPefiBlyPPJxixxIV+/D3hQKb2nqjK/8U/S
 kMrKVybm4oSXxvv4qAeAwOTYjDSJK5aPLqbeeRNmIY+h2LToPnr91JxVt795TNNEwpLT/ZCnDEM
 9xtZIC0KbLd/NDwfiVSXuTQBKWi2JMA2ZIqdJBfxC4FfmvR7yitvyuO4t3MnXmwwzD4UzL9UOnt
 mQ1xo3XnOg7ff1Y7qYFxpib06+fqRH3CsxRsUT79uVPSk/13LrKko9iZ8vYzGUPV3UBmHlynV0n
 Kd3LfSxcYQpd+vroxoTnDt54lcDoe7mq9E1zqfCt2X7aDmTiDx9MGYuMUI4mOj/2yeXV/gsge7B
 rIsqDw5ZM8A8P+g6ZsExk5eEiZP2R7o48TiKSkNCGBPIUn/PtaAa7/uR/mJLjCaQlZ1HC1eyYyG
 iGUyKpQOGaNC6QnYVZoRo+Nw04mMay5MrnwGbGLy8FrEec2ojkbysOdBknr9wfBsY32nEalhKy0
 M4O4UU7DKoSoaEHuBH+3S9xZAjObvA76Evr+9wMuZK2YOQPbcM4PkZwmSB5BgPgHPePg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Changes to defconfig should be always updated via 'make
savedefconfig', run this command to make it aligned again.

This will ease the effort of reviewing changes of defconfig
in the future.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Update PDMA config bring in unnecessary changes[1], let's fix
it by run savedefconfig first.

This patch is based on top of tag 6.16-rc1.

Link: https://lore.kernel.org/all/20250611134859-GYA125008@gentoo/ [1]
---
 arch/riscv/configs/defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb4183ce871020fb2992a21a13bccbc87..37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -134,6 +134,7 @@ CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_THEAD=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
@@ -151,7 +152,6 @@ CONFIG_HW_RANDOM_JH7110=m
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
@@ -159,11 +159,11 @@ CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_PINCTRL_SOPHGO_SG2002=y
-CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
@@ -240,7 +240,6 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
-CONFIG_DWMAC_THEAD=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-01-riscv-defconfig-7f90f73d283d

Best regards,
-- 
Yixun Lan

