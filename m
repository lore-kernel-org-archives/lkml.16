Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38B227EAF;
	Thu, 24 Apr 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487707; cv=none; b=HRl36dq7jvNLVukyl3COwfXb5hqd7DrVKX9U7fZRziu3/Na+f6O07hKS0ZVVsIYoP2SPsP49rcTurpe8gy9aCT2I4M5eZFmdJ/6h3a0T/MUnM07qVw/8aUf1TWpBrLiGg2Om6W7dqRiXfnt0f1mQUIhSvyXvKpsCzy7C/AYlJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487707; c=relaxed/simple;
	bh=ez3lQ50wt4PHNJjw/2DzRy5zUu0J1UdIhacJCZQJdao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2lK+jfZcxPr/b2wZIpKzyuW2ZgsycneE355LfSZwrf2mJE7Ea2wtYZIrctomwTuRRkosjk+4u9mkQWv5AnA/GdKZyM5WjOp2PEmPj+Df4FIymdCY+ukyxJ53ZNnpNpHyTkBX1E2qOfkWW5y1f80thCk2IVzg9BIJFL6/IGS+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E45B434300E;
	Thu, 24 Apr 2025 09:41:40 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 17:40:51 +0800
Subject: [PATCH v9 3/3] riscv: dts: spacemit: add gpio LED for system
 heartbeat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-03-k1-gpio-v9-3-eaece8cc5a86@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ez3lQ50wt4PHNJjw/2DzRy5zUu0J1UdIhacJCZQJdao=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgdAmBX5357/jEVqEwzJuLUt67VkPKqKTHAhQ
 CiTV72qE62JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHQF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QNWD/9wVcVpOMoU7NxOVY
 a/h4ApmeXNliJn4y9hpoPpa72RRi4ZQRB02C4zwDmbDoTD/Saz6NSijXK55SH6679EgSU/BAtLF
 VSexGbO5vXwmMzf0L7WN2fieNJRb3nlj1NbvSuMZ0tjEr8hbByDmEaKmlmd5WDyOHp8+U+Ea8Ah
 t1iqOgmDYmsB0X5kfi2OY100VjPO4CYCiz6y3tU+cVKkGI1kQVihgXFRuAJhD1z2mPfMgd4Y5Mu
 dgF02JChElvKAtQs1zBAPxTzMnzz3O1NkZdTGjqNtXb5GcwbI9SnXf38J4vjswKv4d1HTVN83Ec
 2gl/A7BvQpMZAo3+81fFN+jQFNCdabnfvG/TI+/QTvd6JtER3Kd2Igvc1hPMMH2J91paTS1yV1S
 /sgbd+EZkZBu7bU1rThnXxm8aHKHOIWXBXpCznSbWPwQYn6COQbX6i9ugTYLdlTM/m5EPsHBxLg
 VH0BBjUzq3I6ETnaCurjz1huKn08uwiyjsH+K9uWF+Wlmsp+7pijKOPLxEDD5pN2pfyKItlNr5U
 V442cSP+2jPpzwGCYN/775NAf+CTQseA7Zj6cb0JelG6e/WUEzodVy3qJcbDmZBiLN0P9MrWaup
 b1rUx/bd5NFP+tZyp7BRseGb0WdJxd4zRhfTdlP0CI71WlDYQ3x4sNcCjPmMOpx2CCZg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Leverage GPIO to support system LED to indicate activity of CPUs.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 1d617b40a2d51ee464b57234d248798aeb218643..816ef1bc358ec490aff184d5915d680dbd9f00cb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -17,6 +17,17 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
 };
 
 &uart0 {

-- 
2.49.0

