Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9585288537;
	Mon,  5 May 2025 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486310; cv=none; b=FTfeRgC0dZVPtGpDx+aJdI1y7fr/KYQVhZ6v4p1JZ62l1cZPjhEQF5XT1oqLE/QTVnrjQdjkRggq4lk1eomxuno/eRvqNv0H3mNeCm8L+ocZgl0QHNzqeUWY7PZ4wogjtcsSMd1P5BOTvTZ6kVUqPYiuudvSXO3VqGe4djeADYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486310; c=relaxed/simple;
	bh=788CtGvCa95o+T3He2vlXoee2SK5ejxA/X5PkcOwfu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lSGDvE2/4ZL30wjH5AaYnS9rDMC8/w5F76MlJ6BEk/8HYaspYOwlBr2p2JWtK83NzHkE4Z+1xoVBwjRHj2NGhwH/CxUPrKxbEwEkLqU3bgkQyrG0fu+h2Q6du5tOEFbNumnEC5fqsEajpa73CuQ29t5z82dRSdqYkZB6IRZe+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0WS3/ys; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0WS3/ys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C830CC4CEEF;
	Mon,  5 May 2025 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486309;
	bh=788CtGvCa95o+T3He2vlXoee2SK5ejxA/X5PkcOwfu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C0WS3/ysbKodO3R1sc4uMxjFHcQV9h8knO9Z0Tav3/tib9bU24pV71FLspJSVaiFl
	 LgExayfYZeUlT1ESmEU1c7C4shRsB4lHF2tpZK4FJ01j5naZJm4RdtlYWpTrbzP1oI
	 C+d4lZqacpfVLjhyWjvKFk+rBzXBRfp/Hly+HSF1RNJV3LGW/hD06qtEHQFX0hrI9R
	 FMYFU6yychd2Eojy1ri1IID7LHEkpfAuNRxLA8y/2FwI7hzAUz972Jkd62E4Zn39Li
	 XOLHKdKyqKzu2PufTKC9FP+ScXmAsXQNYD1GQIfRDOO6CV+Rd9UA0ff8umMaKxpRIz
	 ERHyobJpUaMng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrey Vatoropin <a.vatoropin@crpt.ru>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 252/294] hwmon: (xgene-hwmon) use appropriate type for the latency value
Date: Mon,  5 May 2025 18:55:52 -0400
Message-Id: <20250505225634.2688578-252-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

[ Upstream commit 8df0f002827e18632dcd986f7546c1abf1953a6f ]

The expression PCC_NUM_RETRIES * pcc_chan->latency is currently being
evaluated using 32-bit arithmetic.

Since a value of type 'u64' is used to store the eventual result,
and this result is later sent to the function usecs_to_jiffies with
input parameter unsigned int, the current data type is too wide to
store the value of ctx->usecs_lat.

Change the data type of "usecs_lat" to a more suitable (narrower) type.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
Link: https://lore.kernel.org/r/20250204095400.95013-1-a.vatoropin@crpt.ru
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/xgene-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 207084d55044a..6768dbf390390 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -111,7 +111,7 @@ struct xgene_hwmon_dev {
 
 	phys_addr_t		comm_base_addr;
 	void			*pcc_comm_addr;
-	u64			usecs_lat;
+	unsigned int		usecs_lat;
 };
 
 /*
-- 
2.39.5

