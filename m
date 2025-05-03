Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614627E7E5;
	Sat,  3 May 2025 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303960; cv=none; b=ngRdfyy7/no9BAcrGRzabUZg4KoXTTXLKSv5/GDahFGuvheCP3aAI8v6KeUX3Ygm/TSnjTgTW32G8lAi9ORq+TL08HVPluS2PQud8R6rHuN7VHFmfthIq3h0lSQ1jW09bVFZRY9gW+6cuyjWJjkbI52wE69ywpTp7f2jjXY5nvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303960; c=relaxed/simple;
	bh=0IscdQ4MYWENAu616ddkz5ATNozJIGg3ilus27XZ6aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idHZYFl9xYdqjdsJxop/RJm0yBWX31Dj1NEAXhGXi5hdBEYZKSdFjF8fpfFW886PJhijlCpHxUVkbYwEW9LiY3g+YY5AyJ/iqLBe1bptKeSckfbYf1XeFJZRCJjs7zFRU0qgYGBIrJwAHAedTyiU3POYIN+Nsx6EbvMQnYdV77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Okhsv0Pq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Okhsv0Pq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=55rdvZGXpLc0PvWcYDr6+AWR3J6006+iF/1mc6xK2sA=; b=Okhsv0Pq+pX/ySFZzbgwx0eVIc
	iPU3DvZWWj3chx7l+QqrUc8+CbNwKj71pkKxZp6eyNEZ/eCkUKNP9tgtUZT+CkMZ87MJZonP60+/a
	XIwhzsxIoqSeSDgZWqvgi+Z9SblkXlcjYvBYuNk474xs+4Jkd7ImyTxD1LBn9/hdBAHTWU9ddC39m
	enRqOjZjP862g3Lx+f6BcKAV4EVrmzIAD4AeazVDVfLVyjD9FxGn4HeCrUn5cROyFH75Hg+w1G69L
	jfnvbYNexpZTwO5OQPIV7WJZ/EMmfLonVsD0XTlBfFJf1K1BorJSnkZ4IHRLwfWawYN95NbuN6hBe
	AiwTmKaQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQo-0001s2-EX; Sat, 03 May 2025 22:25:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
Date: Sat,  3 May 2025 22:25:29 +0200
Message-ID: <20250503202532.992033-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Contrary to how it is implemented right now, the usb480m clock is a
controllable mux that can switch between the 24MHz oscillator and the
clock output of the usb2phy.

Add the needed clock-id to allow setting this mux from DT.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3036-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index 99cc617e1e54..5cbc0e2b08ff 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -47,6 +47,7 @@
 #define SCLK_MACREF		152
 #define SCLK_MACPLL		153
 #define SCLK_SFC		160
+#define SCLK_USB480M		161
 
 /* aclk gates */
 #define ACLK_DMAC2		194
-- 
2.47.2

