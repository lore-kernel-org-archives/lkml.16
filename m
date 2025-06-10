Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515817E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598635; cv=none; b=Gt+tBcyH223RdM3p2ZIsD2O7nJlA7+1NswXhCfdNcNzlyHWb9kJGDCBaRMp41+v39kKudZNPbnuQJCKCis0R5X4n3gA9GTRv3vHpsjzSMz1BeMtNTnnY26YPqmJduY0s/NqIpA8C3kOWpnW+aweO/gnvM85CggwqKJVgmcMNTW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598635; c=relaxed/simple;
	bh=73lc/rPP9eGUfkWT58IBLrpi8r/eruXKFdJ45xDIfH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BuiEc152ARdd5wTIvT6r96u9boP8PURG1eBwvSsS/lSv+iU3FJJ9Hth810Jo2zkoTj4m1A7KE45S9LVkj7fENsimCzN2vMPkPsMOCkXTRhCm6IEyP3S3vaE7+bmcOgMIr8sKgtWj5mS7fkXY10A2nJ8K/PtLCKO/ifFlnmphGiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sHhkKiLe; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sHhkKiLe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749598631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GTViHUqHHL7FVcOYR+13mg8Z5ebv/l3Vzj9gh5nlRwU=;
	b=sHhkKiLen38MxONS5oqPQ3AbQ7uX4vmybQ3V1Rj8coOvLZYGHzib3RlR2tuQnkkfrLKbRs
	vqksnMv6etx0AA9oH59aMfIhE9BeFOYHXmLP2X3x/Hf8X3mTjTFAB3oz04luoBZ/6VAOaW
	0yKvuEASBCjhtTXyeUQYVhLZAub0YL4=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Simon Horman <horms@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [net-next PATCH v6 10/10] of: property: Add device link support for PCS
Date: Tue, 10 Jun 2025 19:37:03 -0400
Message-Id: <20250610233704.3588448-1-sean.anderson@linux.dev>
In-Reply-To: <20250610233134.3588011-1-sean.anderson@linux.dev>
References: <20250610233134.3588011-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This adds device link support for PCS devices, providing
better probe ordering.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Saravana Kannan <saravanak@google.com>
---

(no changes since v2)

Changes in v2:
- Reorder pcs_handle to come before suffix props

 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..1aa28bfadb12 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1377,6 +1377,7 @@ DEFINE_SIMPLE_PROP(post_init_providers, "post-init-providers", NULL)
 DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller-cells")
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1528,6 +1529,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.35.1.1320.gc452695387.dirty

