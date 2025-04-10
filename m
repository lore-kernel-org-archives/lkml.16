Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F9276021
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294210; cv=none; b=Cnf0c9oI9qzBDlUkY0N3vu7D6IbEtcNmDXgKVv7bwbJ3WQZ3YqUlZj7OotBeCdXmqy9OWpOlkrGyKWzcCAoc/O8MfF7jGPtXqCjGrQRu5Yhdi119r+yrxGbUFXJ1AMjP0g42D8WLMtKGOsZ1UPi+48jxC4aCB1uHaRufdHUnu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294210; c=relaxed/simple;
	bh=JxDXgUvVByzcSDh1yzMt3rly8ag9FCjpvI77zmUL7qc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TTbyhMvr6aqg83yQIsCqsZ4nFOftCX/gVkYzxFA5jVO7MjGAx/CTcjBo6PCav1v3DzJTlSQmUHUYu8n0PdEi/MOSW6Z+CxjZNvyrAN65U2QG0U8bUaRhLXLHgAsiYirkjOj8e3LIhYUp9BSwsq14VKhnj7sJNP22+HQChfqC2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCiIz143; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCiIz143"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D816EC4CEE9;
	Thu, 10 Apr 2025 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294210;
	bh=JxDXgUvVByzcSDh1yzMt3rly8ag9FCjpvI77zmUL7qc=;
	h=From:To:Cc:Subject:Date:From;
	b=hCiIz1437O4bsv0F0DHht8/fz5JNRb0zeTznwO2ZtlAG8bF40KSHS/GFht9duumlP
	 axAzzUCMXoPFmsDdBEreH0dTME9F7x5aRSP/1sfC8o90mWxojCdKV42nW3G0cjeTxW
	 s4cPjiGGr6EWb3D9BGrUz8+sEBKtBfnHZ55SWirxaeZSLnpPgvyRs8YZ7wai5s/Ihi
	 dLIUI43ZjGIoX9olhyx63Dyhyfftey6eBNQ3lYDNCbaXgGihK/gc6otqlh85rGzAGH
	 4RmRxfLsNkoZsoCjXQEjbWLjSh59p4728k4JKKRgKlnMP0v2M8S+RlQ7Jwk/zGZCOJ
	 EMlXG576jdhZw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: adp5055: remove duplicate device table
Date: Thu, 10 Apr 2025 16:09:58 +0200
Message-Id: <20250410141006.866813-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When building with -Wunused-const-variable, gcc points out an
device table that is not referenced anywhere:

drivers/regulator/adp5055-regulator.c:346:34: error: unused variable 'adp5055_dt_ids' [-Werror,-Wunused-const-variable]
  346 | static const struct of_device_id adp5055_dt_ids[] = {
      |                                  ^~~~~~~~~~~~~~

The contents are the same as the second table in that file, so
just remove this copy.

Fixes: 147b2a96f24e ("regulator: adp5055: Add driver for adp5055")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/regulator/adp5055-regulator.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/regulator/adp5055-regulator.c b/drivers/regulator/adp5055-regulator.c
index ad8e42cb1f3f..59648499196f 100644
--- a/drivers/regulator/adp5055-regulator.c
+++ b/drivers/regulator/adp5055-regulator.c
@@ -343,12 +343,6 @@ static struct regulator_desc adp5055_regulators[] = {
 	ADP5055_REG("buck2", 2, 2),
 };
 
-static const struct of_device_id adp5055_dt_ids[] = {
-	{ .compatible = "adi,adp5055"},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, adp5055_dt_ids);
-
 static int adp5055_probe(struct i2c_client *client)
 {
 	struct regulator_init_data *init_data;
-- 
2.39.5

