Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC544A29
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748272392; cv=none; b=JneLbQaPHV2kBQF09D0sBD0Xcew1ujyVKH4zHe2gjWUQB+ikGgxccB+tiq5ipyvMLehnehBesg6AoHqX++TB5ssNx3m+FeKMMN1/4fUMDfhZ1n9J/be3NiHrlMhc9Yvx5B8rzRl3syl0Gimz6M6IR/NlysSohYmTK/W7LXJVxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748272392; c=relaxed/simple;
	bh=b4wrMBQYS3A/9nXyYQFSh3Fe4G51NLFY9uFil1zt40o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TcTcOlV265PaEA7iNUhgjEQF+rngqTRBk+oPdMCoWeEIfvfVxFV6f1JP+8Fw+zQLQH6xSfefJVo9H6Byi5bDrnAllxXvfwtMH0pz/3RwHhunoqe6XGfElONAzrKL7MH6DItp0aFPgTSX8Mp7hfGfzJfpLT9zw4rRLF8ezSOcgVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IxJ2q87q; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IxJ2q87q"
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB37B43A4E;
	Mon, 26 May 2025 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748272388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IN1kLO1NlgqaLF4k72UNT04Q5kkGKIfH5T5wIqd4pFQ=;
	b=IxJ2q87qevoQJbwxoix5WZY0NXzBVAnEgKhuLHR2NTKhPIgZIRn8FNJGnk/eHfLxMbwscd
	1BF9/4ZX/kXhhKbENsAaKnG9MS+OAVqsYPOapDLOOWHkZRizb0IDxrHfoOSsF4T6fZSl/Y
	7cFPF1Uk9bXV3QQKHKtAn4spFcV2lJTJFpHTIXBMy8AjfcgY+g/F0d3VyXUwdZPg4Hg5iV
	4x3zMcHs9sB1xvYtTI5uSqLtMJLMwSrLRDpOuOeouzacp68nipm6ccFMfApavX1xzRUt9f
	l4QsCwf0O0mHOChatu6BalI0OILP49S0Sb6hFtBIcuZPdh3F9VKjnEqseFxGlw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 26 May 2025 17:13:04 +0200
Subject: [PATCH] regulator: core: repeat voltage setting request for
 stepped regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-regulator-stepping-v1-1-eb574069d70f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAP+ENGgC/32NQQ7CIBBFr9LMWgxDxagr72G6ADptJ6lAoBJN0
 7uLPYDL9/P/+ytkSkwZbs0KiQpnDr4CHhpwk/EjCe4rg5JKS61QJBpfs1lCEnmhGNmPAu3Qu/Z
 EWrZXqMOYaOD3Ln10lSfOtf/ZPwr+0r+6ggKFPV/Q9BKVk8PdhrDM7I8uPKHbtu0LO4GS+LYAA
 AA=
X-Change-ID: 20250521-regulator-stepping-1bfdc34e5039
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeekheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeekudeihffhfeeiffdvtdduhfegudehiedvgfeuveekgeekjeduvdeljeduteeinecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudefngdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepk
 hhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomh
X-GND-Sasl: romain.gantois@bootlin.com

The regulator_set_voltage() function may exhibit unexpected behavior if the
target regulator has a maximum voltage step constraint. With such a
constraint, the regulator core may clamp the requested voltage to a lesser
value, to ensure that the voltage delta stays under the specified limit.

This means that the resulting regulator voltage depends on the current
voltage, as well as the requested range, which invalidates the assumption
that a repeated request for a specific voltage range will amount to a noop.

Considering the case of a regulator with a maximum voltage step constraint
of 1V:

initial voltage: 2.5V

consumer requests 4V
expected result: 3.5V
resulting voltage: 3.5V

consumer requests 4V again
expected result: 4V
actual result: 3.5V

Correct this by repeating attempts to balance the regulator voltage until
the result converges.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-kernel@vger.kernel.org
---
 drivers/regulator/core.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7a248dc8d2e2ffd21e7daf729de9b33a5efc1937..3554aff290be1d532fe3f298927ede49e724fc6a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3797,6 +3797,16 @@ static int _regulator_do_set_suspend_voltage(struct regulator_dev *rdev,
 	return 0;
 }
 
+static int regulator_get_voltage_delta(struct regulator_dev *rdev, int uV)
+{
+	int current_uV = regulator_get_voltage_rdev(rdev);
+
+	if (current_uV < 0)
+		return current_uV;
+
+	return abs(current_uV - uV);
+}
+
 static int regulator_set_voltage_unlocked(struct regulator *regulator,
 					  int min_uV, int max_uV,
 					  suspend_state_t state)
@@ -3804,8 +3814,8 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	struct regulator_dev *rdev = regulator->rdev;
 	struct regulator_voltage *voltage = &regulator->voltage[state];
 	int ret = 0;
+	int current_uV, delta, new_delta;
 	int old_min_uV, old_max_uV;
-	int current_uV;
 
 	/* If we're setting the same range as last time the change
 	 * should be a noop (some cpufreq implementations use the same
@@ -3852,6 +3862,35 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		voltage->max_uV = old_max_uV;
 	}
 
+	if (rdev->constraints->max_uV_step) {
+		/* For regulators with a maximum voltage step, reaching the desired
+		 * voltage might take a few retries.
+		 */
+		ret = regulator_get_voltage_delta(rdev, min_uV);
+		if (ret < 0)
+			goto out;
+
+		delta = ret;
+
+		while (delta > 0) {
+			ret = regulator_balance_voltage(rdev, state);
+			if (ret < 0)
+				goto out;
+
+			ret = regulator_get_voltage_delta(rdev, min_uV);
+			if (ret < 0)
+				goto out;
+
+			new_delta = ret;
+
+			/* check that voltage is converging */
+			if (new_delta >= delta)
+				goto out;
+
+			delta = new_delta;
+		}
+	}
+
 out:
 	return ret;
 }

---
base-commit: 8ce126db9c2d3fa6848b78fdfffba74f86f4e28a
change-id: 20250521-regulator-stepping-1bfdc34e5039

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>

