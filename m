Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1922367B2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817254; cv=none; b=el1wNXX3pIwp1abcXl/jjLMenYQx205jyQ5+rOjtYmxQFHoVe3q7MIhLb/gcByV6j/qGVDVuxuMiDvdAbRDO30tMmjdrrkl4so5SX4xYCgUx60beB/DE8LN+FKnv+rkrDQNrYEXVVjFM+fMAt0ClT6aJcvC65VrzXkUvncsgjbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817254; c=relaxed/simple;
	bh=Vum0oqAC+JTXMo2IPeqOsM3O2/5b5k4lLi0I4ejYeUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DVrkY2qoMhJjt5ixCmCfa8EShwV1jHzUP01OLKwGLNCooPO/JDsFHTiUehE+EfADP4S10KO7Owtudk2o1N4FrUraianWUy15X849JwM+Lhiz8ueGfRvGvtIK/J2S4DXJlhgvs+Mh/IgmADngiAuVYOq5lL8Y7Aove7qeZXCMHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O0wWe6xu; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O0wWe6xu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D652243212;
	Wed, 21 May 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747817250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dbNkpN9tvCI3cQTDcf6zqNVW0pUx2ezrzHjvqif17ck=;
	b=O0wWe6xuQyx8V44slil22KruQ1AZuaM03OtCG0w9Nw+wUYXTyxAsdjqjEuVCJky/yoWXso
	3UGcfxY+HnAO6IM4zpx2inLesVRXZIUO7hR16fWM/1jyfNRpmUqCcJ1mAE+/YRkRp3VHd8
	rlssfx2ieLcLYravSiWw3Z4k/S/zATKkDeoyAJjg5KjnoIn714p6Egubolk3X6JcDycQRB
	/HiQHkPHzGzi/d1P7UpoEARjq8FzJ8SZtmo8KC8HsXKoR7QMvruTzjwy6bjDOWi7FDezSQ
	kFEVvWHr5C4/WHYp2qn5PORaKo0C6x0fU4N28XvNsWtLHzuRIwuwTYWGBgcrtA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 21 May 2025 10:47:24 +0200
Subject: [PATCH] regulator: core: do not ignore repeated requests on
 stepped regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-regulator-stepping-v1-1-b681ad012c0f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAByTLWgC/x3MQQqAIBBA0avErBtQy0VdJVpYTjYQJmNFEN09a
 fkW/z+QSZgy9NUDQhdn3mOBriuYVxcDIftiMMpYZY1GoXBu7tgF80EpcQyop8XPTUtWNR2UMAk
 tfP/TYXzfD049+pRkAAAA
X-Change-ID: 20250521-regulator-stepping-1bfdc34e5039
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieegucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefkeduiefhhfefieffvddtudfhgeduheeivdfgueevkeegkeejuddvleejudetieenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddufegnpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdpr
 hgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

Currently, the regulator_set_voltage() function will assume a noop if a
consumer requests the same voltage range twice in a row.

This can lead to unexpected behavior if the target regulator has a maximum
voltage step constraint. With such constraints, the regulator core may
clamp the requested voltage to a lesser value, to ensure that the voltage
delta stays under the specified limit.

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

Do not ignore repeated calls to regulator_set_voltage() if the regulator
has a voltage step constraint.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/regulator/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7a248dc8d2e2ffd21e7daf729de9b33a5efc1937..4196b1d79fd53bfdd2d8e780272f5037d5ddab0e 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3810,8 +3810,13 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	/* If we're setting the same range as last time the change
 	 * should be a noop (some cpufreq implementations use the same
 	 * voltage for multiple frequencies, for example).
+	 *
+	 * This isn't true for regulator devices with a "max_uV_step"
+	 * constraint, as they can progressively step their voltage with each
+	 * subsequent request.
 	 */
-	if (voltage->min_uV == min_uV && voltage->max_uV == max_uV)
+	if (voltage->min_uV == min_uV && voltage->max_uV == max_uV &&
+	    !rdev->constraints->max_uV_step)
 		goto out;
 
 	/* If we're trying to set a range that overlaps the current voltage,

---
base-commit: a02c7665c216471413ed5442637a34364221e91c
change-id: 20250521-regulator-stepping-1bfdc34e5039

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>

