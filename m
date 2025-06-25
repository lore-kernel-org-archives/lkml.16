Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2671FF1C8;
	Wed, 25 Jun 2025 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835150; cv=none; b=qvTT/lTeuLg1qi81vN16Fh0vQkkkyWM4ETOK442uDS2VFY8n6w6zE+lEcVILuN7D8YSPAwx9Zf16TQqNhFCzSJADpS/yCA+emN224TN1r+x9hBv9RjrT/F/Rg6Xe87Jdlb6ft4FzvNjNNTlRGMOWuBvJlEOuIXjsij8w5MuuQrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835150; c=relaxed/simple;
	bh=AIx9KgGY4+P85oNCOJVwREtiXdk9pNQmRPz0GTokeXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ep7kW7qYpVngX8LHv6KzOgUYBrT8SzxJnlwoVTkT9ciriXcxgbvjPTAa7UwOjOjdxh+esi5sntGl4L/ytg6dHNUEqFGbOPSgsWP4sSroX9P4CuBGe0UCokXUR9jEbgYzL7jQCjE2kz14AK7leo87gb7YjNvNDdGJIIBwJLgU2pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=G4tgqzcO; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="G4tgqzcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VP
	ZrqWa7/07CY5diTNNl5DfBiV7kIBBHm24n3oMQpiI=; b=G4tgqzcO6EI46wfhcK
	X0so4VJH4E7Vll1OEXZwlQzW/PMtukVfkDH14jGEwCg8UCSYm//I8SzxZWg/1q1i
	cq1Z49sXLg0I8/cMGTYuDLeTfb7bRQ5rt1tE/51xOuLtejTARWtK2L9RM+JjYhDF
	cspdCZjI/rrNdcX7uap2l6QoM=
Received: from mps-HP-EliteBook-840-G3.monolithicpower.com (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXbU9Un1toEmaCAQ--.23207S2;
	Wed, 25 Jun 2025 15:03:51 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Jonathan.Cameron@huawei.com,
	michal.simek@amd.com,
	naresh.solanki@9elements.com,
	festevam@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	grantpeltier93@gmail.com,
	laurent.pinchart@ideasonboard.com,
	cedricjustine.encarnacion@analog.com,
	nuno.sa@analog.com,
	ninad@linux.ibm.com,
	jbrunet@baylibre.com,
	kimseer.paller@analog.com,
	xzeol@yahoo.com,
	leo.yang.sy0@gmail.com,
	Mariel.Tinaco@analog.com,
	johnerasmusmari.geronimo@analog.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 1/4] dt-bindings: hwmon: Add MPS mp2869 series
Date: Wed, 25 Jun 2025 15:03:35 +0800
Message-Id: <20250625070338.965168-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625065956.964759-1-wenswang@yeah.net>
References: <20250625065956.964759-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgDXbU9Un1toEmaCAQ--.23207S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr48Aw47AryDZw13WF4kJFb_yoW8GrWrpF
	WkCF4xtF4FgF17Ca12gF1kGF45WrZrAw4kJayqyr17Krya9rZ7Ww4a93s5Xan8Crs3ZFWU
	JrnFy34F9Fyjv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2pBhUUUUU=
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiBAZ3pGhbdveNoQAAsP

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2869 series controller

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..493e7232f09f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -285,10 +285,18 @@ properties:
           - mps,mp2856
             # Monolithic Power Systems Inc. multi-phase controller mp2857
           - mps,mp2857
+            # Monolithic Power Systems Inc. multi-phase controller mp2869
+          - mps,mp2869
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
+            # Monolithic Power Systems Inc. multi-phase controller mp29608
+          - mps,mp29608
+            # Monolithic Power Systems Inc. multi-phase controller mp29612
+          - mps,mp29612
+            # Monolithic Power Systems Inc. multi-phase controller mp29816
+          - mps,mp29816
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
-- 
2.25.1

