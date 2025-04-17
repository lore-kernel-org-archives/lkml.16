Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A41DE3A8;
	Thu, 17 Apr 2025 18:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913075; cv=none; b=q8xyWJ+5usjqZrY79L9kucaxiwCEH7DaT07C546KEf7uitYpa7NDpKeYbdGvZOdQUnvgEuj1g2Ae2C2wgDA2lK3PsZT4NiEBJ21EQA39TrynYZkA/704KC1Yjkdy7oPoB1DAvV71ukDvHuGzp2S2Ei0xPnroQpgDb6Fmwl/Xz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913075; c=relaxed/simple;
	bh=k+ofFeWwMijvwPMKv1ntTjaG2LbAroxgMS8DJQPA+5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j9a2K7v2maWShd9xT5gYf47Iy8Og55/y87fV2YdNXqsRVy+aCIOjf0yD7xweUHPiuDzPBrXrbMOYI072XGf67ExoICAHRXcztL1zqtSiGUy25G+utYQkUF5dDmOrZCAPpBD7P0Rg23rFVG8oCmCzkL6EP4n0ryG0ffSPHCabCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 915ED43B56;
	Thu, 17 Apr 2025 18:04:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1u5Tb9-00GFN7-2b;
	Thu, 17 Apr 2025 20:04:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: ti,tmp102: document optional V+ supply property
Date: Thu, 17 Apr 2025 20:04:25 +0200
Message-Id: <20250417180426.3872314-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepveeiveethfelteelueelvdffieevgfdvtdeivdetuefgffdtvdeuffevheegffdunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhguvghlvhgrrhgvsehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: peter@korsgaard.com

TMP102 is powered by its V+ supply, document it. The property is called
"vcc-supply" since the plus sign (+) is not a valid property character.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
index 7e5b62a0215dd..4c89448eba0dc 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -23,6 +23,9 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
+  vcc-supply:
+    description: Power supply for tmp102
+
 required:
   - compatible
   - reg
@@ -42,6 +45,7 @@ examples:
             reg = <0x48>;
             interrupt-parent = <&gpio7>;
             interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+            vcc-supply = <&supply>;
             #thermal-sensor-cells = <1>;
         };
     };
-- 
2.39.5

