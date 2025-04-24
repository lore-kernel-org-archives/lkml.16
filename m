Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493122170B;
	Thu, 24 Apr 2025 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487697; cv=none; b=PbiM8gYMpT3pKTDGqj/VecDJ3X861duFRKM+JMyIcR7MReP3gcAXkf4i/4DmmBIQySIdCK+x30wd/FJ+evlqkgBdQMKOFbAq1HiySK3qhovLrlQ5omxA8Zy15QLdZM4jIpRoceSttvLuCB3arSVQONKKf3M87SWuAqJJMndeU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487697; c=relaxed/simple;
	bh=KkY5WlJ4z8HcmbXSsfi0mS73OzuDsI8TBtLL7HqJfoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXaWOpaSYMk4pE1k3wVTrcPMA8yl8RwWUKC5kiGh5oY0iyY/i4vBaxLcQZph6PNUfwyJ/Gl4qUKwPXHZxsm0aPIGwn4NhYOHI8E2TuQP5ggWBN9h4qgNDOfGqc3tzGcr2Q0XFnLjizbyy7dREQrZQJ+cWEktnXYXqNOEW1MiINU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 79ABE340BEA;
	Thu, 24 Apr 2025 09:41:29 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 17:40:49 +0800
Subject: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support for
 K1 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KkY5WlJ4z8HcmbXSsfi0mS73OzuDsI8TBtLL7HqJfoc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgc5jnsk1zmpU0pul+l9kHKpeFFACs0CNnTBp
 h9UJsUCq5GJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHOV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QyoEACE8VmsVGRTeefDvb
 FhSZ734jG898yX1+/8BQl3+/fLZf2PK8e6L3Cz1kO7ijGMtVwjjjWNJcqnlTRLKTSd59Z49Q2QE
 5HGexZUZqXFyuHaPmFDUQZ1Xg/t8YfdUWYLrYQRHlZ1niaCdl3YHMWlHSjn/sU1lcx+9HZ20/yJ
 Opk2cINGqWc8A5se0V5nwGwfFmEC+k8S8xiOxPKRmAUM+nml+yEePzWVNCdQ2tGZK2WXsqQ34W0
 Fv6KaKtOrHf2jiTsmaPExb0ESzLcGgaxStjQubDMgeq40daVBDpFHQK7cdMFXVkFWPXyVe1UbhP
 /r5x9aaPF9IzJwrE1n5/Rsl3xgJrBEZhKzT88f2UdSHvGkILc7zjSQkY1b+dhg+EKqE0LLAJYK/
 coKI9OuKqpq5T3ITMAhDxNzlR4+SwZJq8wjubapZQ9643ocskkOT0MOwu+gGv9LwY5ByJUucPae
 H/R/SYMWUkeJk5tX+fIoaYvJK3emnfcH5QH4f7aKF2eW47NtRc87p5IrgHUysFeejxsSTktVwLK
 M6z8ksg1lgWBkWDOq0EtTfTFuYGckQcWeWwTBvnfXUIPA56C0K995COmsNGE89DMQk8wvz14XEZ
 KeMTHKJqZpxU+ZbXICPf/DFWdjJsj70FXwHxs0ny9VJ4rvSXZSpfNaDmEkKL6z0+C+uw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Enable GPIO support, in order to activate follow-up GPIO LED,
and ethernet reset pin.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e175e0e4c27136c31761127ce6e1602..b8899d59dd345c50d877829c05d0330f2986895c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -169,6 +169,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
+CONFIG_GPIO_SPACEMIT_K1=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y

-- 
2.49.0

