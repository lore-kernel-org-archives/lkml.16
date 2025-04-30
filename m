Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014520E338;
	Wed, 30 Apr 2025 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017530; cv=none; b=nN5fiLrWYFg1lmzjtuwSt0Bk1bNxLrHlLGvg1uaHRqySBm2csRicT4POYsOg9H8BM7UQGDMC3sPav9C+Cips13+KeOJ9TFpkYU8fV4O+vgZL7FC5YeElJuNIfMPVvRl3c+lyfTg0orIWAVkLyHDK/CuyMKXWhxSPb3iXmHdiOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017530; c=relaxed/simple;
	bh=HEvTwRzxmeE2NAfpgz9SSxXMD/XmjgIztjzYO9Oa8xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7NmmKNZrh79FXCvF69C9sKe+31UFD96tflUVkqU15gr3ZE14hSf2lUNIPgPQ4XJ6b/ETSkOqC9s5UMY4mFP3MRbCbqrOhp9AJB/CvkbkX278Balo3COMjNheLpr0nfSs6pfzu/Gvj/zZ6uYvcb911/9LPmDk3hu+AyYNKdMKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pl0vRy2h; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pl0vRy2h"
Received: by mail.gandi.net (Postfix) with ESMTPA id 21148438A7;
	Wed, 30 Apr 2025 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PksiWeDnJhw5poQ866xXWaCAoSzsYk7jz7dyOJiWxTo=;
	b=Pl0vRy2hzfhpjCruTH94XFBt4AN8DIMQbsvBnNsyiEbSSXOklYtNCpt3kQ2/78i2VIeBDm
	aOjaeq+0eu4DNyE2MFi+aKT6flJCBvvRkDTWcJY/fAVZhDMOQZEQqgDrRtFFY9e0PQi5gc
	+xtn66L8FQc2lCRgumLQmUfGbTEguF2SDDoS7InnU62qXigs80Q4+3EHC5m5V4LqgaH6bC
	LnkTy4B0YQ2ID0xODKaUF86WzcvTk/ityrdIMfcnccPCAj4YfZlLN77sTA1d3u8CgEnRfe
	3UQBSpbkMy+8kmDZyUGvC//mLGgipdRqoGZqGq9w/uMptcDhvBe6m0+rixn94w==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Andrew Davis <afd@ti.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org,
	devicetree-compiler@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
Date: Wed, 30 Apr 2025 14:51:45 +0200
Message-ID: <20250430125154.195498-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430125154.195498-1-herve.codina@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfefhhfefveduvedutdetfedvvedufeetieetfeejtefgteeigefgkeejgfegtddunecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepr
 hhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

An export-symbols node allows to export symbols for symbols resolution
performed when applying a device tree overlay.

When a device tree overlay is applied on a node having an export-symbols
node, symbols listed in the export-symbols node are used to resolve
undefined symbols referenced from the overlay.

This allows:
  - Referencing symbols from an device tree overlay without the need to
    know the full base board. Only the connector definition is needed.

  - Using the exact same overlay on several connectors available on a given
    board.

For instance, the following description is supported with the
export-symbols node:
 - Base device tree board A:
    ...
    foo_connector: connector1 {
        export-symbols {
           connector = <&foo_connector>;
        };
    };

    bar_connector: connector2 {
        export-symbols {
           connector = <&bar_connector>;
        };
    };
    ...

 - Base device tree board B:
    ...
    front_connector: addon-connector {
        export-symbols {
           connector = <&front_connector>;
        };
    };
    ...

 - Overlay describing an addon board the can be connected on connectors:
    ...
    node {
        ...
        connector = <&connector>;
        ...
    };
    ...

Thanks to the export-symbols node, the overlay can be applied on
connector1 or connector2 available on board A but also on
addon-connector available on board B.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 .../devicetree/bindings/export-symbols.yaml   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/export-symbols.yaml

diff --git a/Documentation/devicetree/bindings/export-symbols.yaml b/Documentation/devicetree/bindings/export-symbols.yaml
new file mode 100644
index 000000000000..0e404eff8937
--- /dev/null
+++ b/Documentation/devicetree/bindings/export-symbols.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/export-symbols.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Export symbols
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  An export-symbols node allows to export symbols for symbols resolution
+  performed when applying a device tree overlay.
+
+  When a device tree overlay is applied on a node having an export-symbols
+  node, symbols listed in the export-symbols node are used to resolve undefined
+  symbols referenced from the overlay.
+
+properties:
+  $nodename:
+    const: export-symbols
+
+patternProperties:
+  "^[a-zA-Z_]?[a-zA-Z0-9_]*$":
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A symbol exported in the form <symbol_name>=<phandle>.
+
+additionalProperties: false
+
+examples:
+  - |
+    /*
+     * Allows 'connector' symbol used in a device-tree overlay to be resolved to
+     * connector0 when the device-tree overlay is applied on connector0 node.
+     */
+    connector0: connector0 {
+      export-symbols {
+        connector = <&connector0>;
+      };
+    };
+...
-- 
2.49.0

