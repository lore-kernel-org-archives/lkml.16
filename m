Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4B155A59
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751192162; cv=none; b=IZILDdFZaDKeabO7w73NjtlxLcEboe3fP1hfb4l0HtQiiuuB22+blbLEL9Ryus1kxQ6qY2qZdDrlvEFnzMF+yVX/PZyQJKr5YZcGW/HfWN5z4A8XDn16oD/b8738vZ+HqIcbY55jVWUEHREPL5H6aGvJZv4beJfz/EZxPkSt3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751192162; c=relaxed/simple;
	bh=TWWdJIJVhdJ9Zxwj+adDYc67V+AMx7SUDm3e5gQjOLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f72XpD/waN3HKHeawxrOL0PNQJbR64HMFLVVNbgJ5qM0GMsNeZm7RBU2EAOAMhXbHZAwQ65vJsYwwvnZGXhyDIYtGZxJL4bOSF2kIs8l7LLtpsovAHn3gWGb8Vq1+AJgzFhXFRPc0SAtvrXaUcusYoewvoHV3jqZMpYBNwFI7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU8s8bQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU8s8bQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941A3C4CEEB;
	Sun, 29 Jun 2025 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751192162;
	bh=TWWdJIJVhdJ9Zxwj+adDYc67V+AMx7SUDm3e5gQjOLo=;
	h=From:To:Cc:Subject:Date:From;
	b=UU8s8bQpmkH5TSEgfTvBQHIeAHRjfFICFSRG8ExCk+jhRVHv1L4A52o/YkXpHCkZe
	 H7TW97I9Es9VIPYqJXVtk7iQL+aIzIQH5HI0vXnwAb3cLkKeHVbSAqABBUyLxbHKvj
	 nolqgZRMyST53+9X6TP4D0db2j2n/0eEL8+xUFxA8GvI+0Ncfz0ZysIabNb7C3lw5z
	 kUWJauvImWSDK1VDCCArCA/cen4pQHfje6jwRLK2xeqA42woQJzHIseUhBfInxpFFU
	 4W09pTlyyQk+6+BAVCnA1N36WwiqpcmY0Mhf6oCW4MFwD1kcEO+y6ubE1zy3tTlky+
	 h87wqxNH0bRxA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: sy8824x: Fix ID table driver_data
Date: Sun, 29 Jun 2025 17:59:05 +0800
Message-ID: <20250629095905.898-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver_data of the i2c ID table is wrong, so it won't
work if any sy8824x user makes use of the ID table. Fortunately, there's
no such user in upstream source code, we can fix the issue by using
different ID table entry for sy8824c, sy8824e, sy20276 and sy20278.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/regulator/sy8824x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/sy8824x.c b/drivers/regulator/sy8824x.c
index c05b67e26ac8..5bec84db25f1 100644
--- a/drivers/regulator/sy8824x.c
+++ b/drivers/regulator/sy8824x.c
@@ -213,7 +213,10 @@ static const struct of_device_id sy8824_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
 
 static const struct i2c_device_id sy8824_id[] = {
-	{ "sy8824", (kernel_ulong_t)&sy8824c_cfg },
+	{ "sy8824c", (kernel_ulong_t)&sy8824c_cfg },
+	{ "sy8824e", (kernel_ulong_t)&sy8824e_cfg },
+	{ "sy20276", (kernel_ulong_t)&sy20276_cfg },
+	{ "sy20278", (kernel_ulong_t)&sy20278_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sy8824_id);
-- 
2.49.0

