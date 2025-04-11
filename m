Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA3221FD1;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375375; cv=none; b=n8BwpUqTbkcaiO8BjVSxluRR9AW+DXdR7m4WwRK+CV0WYxTzBUhmpdLaOknsopOEYv71KC+TErRZurIHqCQiIg2zkh73idVtPxjPhhYSq+12i/j2FQ1v6PBGWQXS2lYxa83mWL0TTuPeobpNEcOKxdyLaOzjJo8mXJje5MNdByc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375375; c=relaxed/simple;
	bh=DZyRArmWU8s8cpsbvvv3MxtnXSt/PgZtZ7PMgCXwnnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwIyuciZQKWzUN2yrhSBLaEPoD3kropfkSewRO27tistkuLqkv1USvel07csvjWIGzdyQ2Q8PPPG+ReiKtDubv6EJ0Nn7BsHgl+CEkUyEqGplwJG3KkI8DoL5ChZD+tqSRB2+uacU33OtJeKVJolsdhjrQY6rI9WbsGnqOY9mxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DF+E9mfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DF+E9mfN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7E3AC4CEEF;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=DZyRArmWU8s8cpsbvvv3MxtnXSt/PgZtZ7PMgCXwnnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DF+E9mfN64zBObj5MIL8G8llGD6eCZiuGsakKeXWPoX5ZCsGUI8I4sIpMmrTqba5V
	 +T7kxvC9Owf0SI5Tyx71gN5koDlwfSHhNl1tYcTm46KV5a5oEdEa3Q5k60yVJaKXoJ
	 7HohLLroq5UgS96/xDvIr/iwQ6b8tR8GuTP46AQeA8RCX2wPv7NnjmydtcJvPFV04n
	 jmnGkHb6iZynzHy9Nwn12HBfgACWyrkzNd2cvy9DHUrJUdT+wZiGjfETic66f1Dw5h
	 4nj3ySWd66BiMBHNt+tcIF0xmNI8yzNIQhdPtapKmVudSma4afSkE55TyRTAKRnd0W
	 HlzvC1jmcm4Bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B4BC36010;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:45 +0800
Subject: [PATCH 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-clk-measure-v1-3-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=821;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=vEn+4e30XPbCJq1TpYY2Gt5BR+VfUFjl4ByVSq+jgb8=;
 b=Oi6fBD/SLZ5wm+N47Lj9tWHoLvpG6hcGTSC+/O/DS5EAZFV/VDgiG8QXP93r0VNg8mw5C1E/8
 6PHFe3CaZS2D77cIlDjyYEjhplrY/n/WGrrxx3xq2e2X4jOFI7znOsD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

S4 adds support for clk-measure.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 275afe7fe374..39d4637c2d08 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -23,6 +23,7 @@ properties:
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
+      - amlogic,s4-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0


