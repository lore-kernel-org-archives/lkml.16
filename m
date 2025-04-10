Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772415E97;
	Thu, 10 Apr 2025 02:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253413; cv=none; b=DMvs7pF0EW6E0MtYyHPOGW0WTt5EAA85kkDa+CiXB6RgfaBI0oApuAlVSNJH9NFbu+5WfK+Q7/+d9cW/UfEeW0qktB7GiEjYYHgKRWEVoK0bOn31p5To2Wp7o23Vbe+1rv2Vzzv7W3n5njJRytLGyU0jEksjin/niPxwMv1jLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253413; c=relaxed/simple;
	bh=iq21jYsJeA2Z6RjzDdU7XczZ/ym3oARr48MSedSPnBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jiaRDiPEjprFzWADwwx1vdp7aRfQxsb8Y0A8CYpjsS18zPerOx5YPpwImNQTn2DpTMtxjRDPD+3/6uqmmIpwdR+NKVSeVVvfimmKCRnDqVIxHqCczHyXG3TvRQWSHEz9hKvG/4mLzsrsdSCqRgYjsCAhLOa719sr2FpNSoavohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.cIcBc.J_1744253396 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Apr 2025 10:49:59 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	yesanishhere@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com
Subject: [PATCH V1] ASoC: codecs: Add of_match_table for aw888081 driver
Date: Thu, 10 Apr 2025 10:49:53 +0800
Message-ID: <20250410024953.26565-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weidong Wang <wangweidong.a@awinic.com>

Add of_match_table for aw88081 driver to make matching
between dts and driver more flexible

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88081.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index ad16ab6812cd..3dd8428f08cc 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -1295,9 +1295,19 @@ static int aw88081_i2c_probe(struct i2c_client *i2c)
 			aw88081_dai, ARRAY_SIZE(aw88081_dai));
 }
 
+#if defined(CONFIG_OF)
+static const struct of_device_id aw88081_of_match[] = {
+	{ .compatible = "awinic,aw88081" },
+	{ .compatible = "awinic,aw88083" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw88081_of_match);
+#endif
+
 static struct i2c_driver aw88081_i2c_driver = {
 	.driver = {
 		.name = AW88081_I2C_NAME,
+		.of_match_table = of_match_ptr(aw88081_of_match),
 	},
 	.probe = aw88081_i2c_probe,
 	.id_table = aw88081_i2c_id,

base-commit: 3b07108ada81a8ebcebf1fe61367b4e436c895bd
-- 
2.47.0

