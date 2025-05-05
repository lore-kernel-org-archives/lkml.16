Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5109332EC6;
	Mon,  5 May 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484560; cv=none; b=fPuEOOlDpWkfVbyG5NGZDQL6D7KyOXSBFCTgnt2FMGmBJtapOQ3YvatFuFcGYFVaDNtINZipNSA/v7EBBpcyUySJEYmT+FWeNl3exVVLFYdYELGDceNnLtYf40UPHviE9gV0ZWMI14AYxiKdV59JHe6MIzApYXmHYXp5g73Ys5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484560; c=relaxed/simple;
	bh=n2sn6h1TIFA2MF1hIh6EYPr4r6u3C4onzApncSe94hA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gE0FAOOK4+rQDCJCt+9Klfr7Xnwm2QA8d4Oksb276yf1ixosJsaOwiMW8PS7hmeyc1KuU+E02Hg89fJsN+N+EZvgBMOQhtO1bsTwlxOptKqbz9PST/0AW4hfp6Yrf9MPptebCp+QzBfOdGBw/hr5J6SKy+FClUc7EJttlUg/7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXmUX77g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXmUX77g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62ABC4CEEE;
	Mon,  5 May 2025 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484560;
	bh=n2sn6h1TIFA2MF1hIh6EYPr4r6u3C4onzApncSe94hA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CXmUX77ge1JXQAKNiMU5F9vOTvS11EsElo1rEo4XCSV47ipapVOyOvogNyWuy2VLe
	 vaF0Mh8HXSAAss6tDyQ34v9tttV5nfk9Zr0ZhgK2lQARFeXIsoj5TE3PANp6y0YhEa
	 LSl/PyOW+ZXQEJKAWwsSyKp2gOj7Rt5xTCBNOOlPygiF2KJbwEH/FA8iS8iC9SB1vr
	 ioQTRFH2FCjzQZUkxyMT0qxOV4bwJDPgU8hAr4mYBsLBVJnAUx0r5EYXDqFLuKkyEd
	 UW3Dv4CwUy33fJsx9cZADQ3nGi/mHekb2+dX9byV+lmabuUgd4YVOsf/0hF/YD+1Pt
	 teui139LHKhvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrey Vatoropin <a.vatoropin@crpt.ru>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 537/642] hwmon: (xgene-hwmon) use appropriate type for the latency value
Date: Mon,  5 May 2025 18:12:33 -0400
Message-Id: <20250505221419.2672473-537-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index 7087197383c96..2cdbd5f107a2c 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -105,7 +105,7 @@ struct xgene_hwmon_dev {
 
 	phys_addr_t		comm_base_addr;
 	void			*pcc_comm_addr;
-	u64			usecs_lat;
+	unsigned int		usecs_lat;
 };
 
 /*
-- 
2.39.5

