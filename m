Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26DC19F42D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111275; cv=none; b=pz3hNtUglPT8+ogbtefa80nTAmVt0RS6z+XrB0ti2H3AA4ja4VItZr5x3F2VP64M4Mcc/MoW/HrZghB3jUtl0XQAJw52AZ42LggopSb3JWYGlFW10p9xR0/2KEWQt5JYAWeJgfapdj0cdZ1KbcGoYx1FcLQt63b05DyYLcaz80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111275; c=relaxed/simple;
	bh=SFLO0xOMn8PJY80uuJvTi/bHhgq8BmwsE8+5yzDsMRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nQPqeU3vF5ZvoAeX8/4UK8m7lKXRW9XJquMmmQl8WqnRjjhg+DFP65BW3JdijkMSGUP7f62NY/TlNnO2jl7PGAkwTRy/U3xkt2iuFPxUTMvwI1TnPFq2EWjx9e3S9Acd6AD7hscaOFBd8Dazg0AeEktiNUd0/Jm8zcfG1P59hSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UadQiczH; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UadQiczH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k02eg2nEnGNOVqzzGntSYPh+yjp3owIb+q67azvL4JA=;
	b=UadQiczHIeD6B2nrEfEl0KTczlznS2BpAm4IByPdlh/tvG58UEa+mIg6NA1S7Lc701VBxv
	9aJRLszvcLyWiPz79MIql9Ggn/GzVrMhLou+zA/KGa5dIWESVTQRgAf7/1nO73SGVYPyHv
	AnUXRehC7n8USBTzD/K95i0cHdiLV48=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
Date: Mon, 16 Jun 2025 18:00:46 -0400
Message-Id: <20250616220054.3968946-2-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: David Lechner <dlechner@baylibre.com>

Add a spi-buses property to the spi-peripheral-props binding to allow
specifying the SPI bus or buses that a peripheral is connected to in
cases where the SPI controller has more than one physical SPI bus.

Signed-off-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 8fc17e16efb2..cfdb55071a08 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -89,6 +89,16 @@ properties:
     description:
       Delay, in microseconds, after a write transfer.
 
+  spi-buses:
+    description:
+      Array of bus numbers that describes which SPI buses of the controller are
+      connected to the peripheral. This only applies to peripherals connected
+      to specialized SPI controllers that have multiple SPI buses on a single
+      controller.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    default: [0]
+
   stacked-memories:
     description: Several SPI memories can be wired in stacked mode.
       This basically means that either a device features several chip
-- 
2.35.1.1320.gc452695387.dirty

