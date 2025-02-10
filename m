Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837722488F;
	Mon, 10 Feb 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193702; cv=none; b=osOu88eNcvnIQHmLCfXyzgSBFz/FtRnJgblwBPjL3zUOWOMdS2mQBs5OvzGj0iPYt3o3L7FRKZk8u/+SR6EBtdWmL/owLoGkI3RMOQZZqHyzUM5+YqPAXTD/comYYuHZDQ2lHMfHroNIqa/Fnq9BAGFslYFQS3m4miJ7fQ+xUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193702; c=relaxed/simple;
	bh=Je+QMGJLq2xw9f5Kh8A3wph6en5EVKCtdf0831QNN7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZK3qmVCk3ubkjLbtBukJxWPTEQLGbVXNsnPTs+TPXc4561e69ImzAuQ/bP1HQGdZkfVSDZQRTZsxpUJm0yvK1RIshrcvvFKYIS3LdVpQZxPDSKBrgybteijTT3nly9CzuH6Y2i/jUZgbD7Pnpsaizh73fNv8v+qHOkjgKVV8CBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve0T0xaV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve0T0xaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877A1C4CED1;
	Mon, 10 Feb 2025 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739193701;
	bh=Je+QMGJLq2xw9f5Kh8A3wph6en5EVKCtdf0831QNN7k=;
	h=From:To:Cc:Subject:Date:From;
	b=Ve0T0xaVjkMJMtyT5R/3YYcc1o0RISq06AFJBjAXbr6MAT/xpqhstxZqot+ySdEP/
	 OkD3c+1nkC2V/orTtmnLfJYvNxWkUM0yMgPfwlcMdIayr0DbUQFNFUaMCl6pNfpiab
	 qbITzZ8wNtBazWHpJ12RhIIdp4UJzsnUQG+wWYbUIg7cRziQ0BG5sdz2qHZmEO0Zn8
	 3zeiXNvBGkTQDFXRj/ENltlaSRnlmhrKVEO83OLpt3PUowXvme6IG8pEioZ5BB/b+q
	 MzaE+ich3oBarsh7WzEnstv9qfDqd4V7i24CtMHPiaiVJ42MI+0lHsF7t+ukftKGvU
	 AHgf1AWmquc6A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1thTjP-0000000021D-49Et;
	Mon, 10 Feb 2025 14:21:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] ASoC: codecs: wcd93xx-sdw: fix of_property_read_bool() warnings
Date: Mon, 10 Feb 2025 14:21:28 +0100
Message-ID: <20250210132128.7734-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using of_property_read_bool() for non-boolean properties has been
deprecated in favour of of_property_present() and since commit
c141ecc3cecd ("of: Warn when of_property_read_bool() is used on
non-boolean properties") this also generates a warning:

	OF: /soc@0/soundwire@3330000/wcd9380-tx@0,3: Read of boolean property 'qcom,tx-port-mapping' with a value.

Switch to using of_property_present() to look for "qcom,tx-port-mapping"
properties.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd937x-sdw.c | 2 +-
 sound/soc/codecs/wcd938x-sdw.c | 2 +-
 sound/soc/codecs/wcd939x-sdw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 0c33f7f3dc25..b3cef5411dda 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1026,7 +1026,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		return -ENOMEM;
 
 	/* Port map index starts at 0, however the data port for this codec start at index 1 */
-	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
+	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
 		wcd->is_tx = true;
 		ret = of_property_read_u32_array(dev->of_node, "qcom,tx-port-mapping",
 						 &pdev->m_port_map[1],
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 7da8a10bd0a9..4e2ae542cee3 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1229,7 +1229,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
-	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
+	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
 		wcd->is_tx = true;
 		ret = of_property_read_u32_array(dev->of_node, "qcom,tx-port-mapping",
 						 &pdev->m_port_map[1],
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index fca95777a75a..36868fad3e8b 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1429,7 +1429,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
-	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
+	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
 		wcd->is_tx = true;
 		ret = of_property_read_u32_array(dev->of_node,
 						 "qcom,tx-port-mapping",
-- 
2.45.3

