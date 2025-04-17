Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D6D2571BD;
	Thu, 17 Apr 2025 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913080; cv=none; b=RbemdJqg1UfaZ0cvHWYryTQc/LAKKRmsldQkrh/qYXK3aEdYqyWw6FXRHEt/DmruhMbJ40WelARB6EdZTDvF11tXownnSlO76tyqpW6u4C3nlLomPWSrzPT0WrxN5KrvXIr7/S5/m7+Eurig0N9CPDz6hvcD+v4Qs72K7VzlKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913080; c=relaxed/simple;
	bh=l/B2NDHOCGeM+43tocuNN/tYWjEBeJ15OptW16MOMKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DyCTgpHlhAuC9d74Q/lFGhoIyVNqx/Qd6z8Lr9ge92IlDgABRirkfszdGCuame1P4+1Q4+ziLT6VZ5RmyObLu+xPtxjLmW30EKIf5AK+ld+j7ApQqs0mAlXQBOMGUTTq2cPlVNLcUsXYQYJ+VCyzP1izooA1IsVT7FHZX8icq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AF0742EF5;
	Thu, 17 Apr 2025 18:04:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1u5TbA-00GFNL-0c;
	Thu, 17 Apr 2025 20:04:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (tmp102): add vcc regulator support
Date: Thu, 17 Apr 2025 20:04:26 +0200
Message-Id: <20250417180426.3872314-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417180426.3872314-1-peter@korsgaard.com>
References: <20250417180426.3872314-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdelfeekveegudfhudehtedtjeekkeeggeehgfeghfevkedvtdfhfeetudfgiedtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: peter@korsgaard.com

Make it optional for backwards compatibility.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/hwmon/tmp102.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 8af44a33055f3..a02daa496c9c4 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/of.h>
 
 #define	DRIVER_NAME "tmp102"
@@ -204,6 +205,10 @@ static int tmp102_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	err = devm_regulator_get_enable_optional(dev, "vcc");
+	if (err < 0 && err != -ENODEV)
+		return dev_err_probe(dev, err, "Failed to enable regulator\n");
+
 	tmp102 = devm_kzalloc(dev, sizeof(*tmp102), GFP_KERNEL);
 	if (!tmp102)
 		return -ENOMEM;
-- 
2.39.5

