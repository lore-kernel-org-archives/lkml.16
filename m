Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247EF1993BD
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751192170; cv=none; b=q1/YP6xsF2GYSd2SzTVVbGJ6nVYYgMvsnFkSR+mouaxD5Pqt4zEHUKBiipp0wMf9iXIQZS0WzSkXRYFjcFc9N1KXEq8Ai8EDDKEwOYPOGf4vs7HFDznP3et8CdYJSDgL+n+0ebz5lr2zul+JRREMPUDvEjYUZzHv4PX628i/sB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751192170; c=relaxed/simple;
	bh=3fafi4a19ItX8CnRROFiF3mtBLiZvO9IFZ9erfPYvpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Id4OSj+ZQzrmYLjwuxpDYoRUAZQNJ9gZWwPdB3j1rkEjEgKfDQO5pJp6aZXPxCP4cguf+DQ4ABLhvedeBPDQD1QnC9cN3ixRfF5V3PGyCEQkWy8LYiPUcflTiyUt06+Wfa0rJvOfSCbO6qxyqI7BUHMp05Gl3TuGnvXtrGpnxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxSyL+cD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxSyL+cD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3672CC4CEEB;
	Sun, 29 Jun 2025 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751192170;
	bh=3fafi4a19ItX8CnRROFiF3mtBLiZvO9IFZ9erfPYvpg=;
	h=From:To:Cc:Subject:Date:From;
	b=WxSyL+cDrCz/QPfXHVi3Xhj7lnl5x8Ms6Ug1wkSdcAoFf1YlhhcHQCKS0wBasNsIn
	 Q52DdA5TSwFG2Fx8kRorZ67nfjhqooLUrgYg2pDDtzPGCSPNFNrcNj24wvp0WzAAQf
	 sg1Ad4X6ewrD4ijwvLgC3nVQRRdEAWoPxilkhRtJVedOcsUgBjT/vEAhrUeuKfFf5q
	 y28Ps/uxBJUkvNoaWnKb/URt5EJ7EEBpaDeMJEzv4t6UcPBisU3K176t7FHzWK9bHm
	 vkF6hwF5FK44NcKsiH/JEL6L2b7vaLrGdy1QfRePK03RydqloZcuu//f2eov3XZTKL
	 SQm1p+5sLmudQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: mp886x: Fix ID table driver_data
Date: Sun, 29 Jun 2025 17:59:18 +0800
Message-ID: <20250629095918.912-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver_data of the i2c ID table is wrong, so it won't
work if any mp886x user makes use of the ID table. Fortunately, there's
no such user in upstream source code, we can fix the issue by using
different ID table entry for mp8867 and mp8869.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/regulator/mp886x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index 48dcee5287f3..9ad16b04c913 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -348,7 +348,8 @@ static const struct of_device_id mp886x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mp886x_dt_ids);
 
 static const struct i2c_device_id mp886x_id[] = {
-	{ "mp886x", (kernel_ulong_t)&mp8869_ci },
+	{ "mp8867", (kernel_ulong_t)&mp8867_ci },
+	{ "mp8869", (kernel_ulong_t)&mp8869_ci },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mp886x_id);
-- 
2.49.0

