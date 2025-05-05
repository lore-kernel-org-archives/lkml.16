Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB4938941B;
	Mon,  5 May 2025 23:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486754; cv=none; b=HBuu5m9C89H3I0m+DVYKwfkwxGJGDbymT+Fx1fG4CLOqWCuJEhH5FzQofF2vAOSrqTxg4IlA+s/Nj3zxk4EwoyybIBpkDqt6zmcf2C6ajhFn16c7+4jpacqNNH5/VJU3s+tLS7o8gPXye6hxtvggwPiGQfHuatUkuNPiWX+1o70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486754; c=relaxed/simple;
	bh=788CtGvCa95o+T3He2vlXoee2SK5ejxA/X5PkcOwfu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=biOxwn98S09vB/YTVyAOjGbIdVvngV4WdNM6pV0aTFrMXWi7E1fCjQfLVIodjdW5TcrvBIIlesnPrcGbXbwSfUcHl4eHvXRD9axdYctQwr6GseMMJqo6DyIa2A/m5EheNMYTq29zCRdQvu4lGPy/StpTwLiOJfZH0bIJQllqLLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNvrKQe0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNvrKQe0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7371C4CEF4;
	Mon,  5 May 2025 23:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486753;
	bh=788CtGvCa95o+T3He2vlXoee2SK5ejxA/X5PkcOwfu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qNvrKQe0MkWlvy4PC+l/tTXtrUfaufuoDpBuJ0/jCRVbD/qIjHgjFtAVLrw9QCCjh
	 TbkQI7xTAHbRQQpEz8RxddJfN8SMvJmyEsen4o9A8fcu+tkbF1ACqT7uQGd7OwjDY8
	 79RXMED3YT0UFn0fyCuKdiTthlkZESnM7KYUIQ6mT6wFu5zx9h8On6UIk3DIKe/Aa4
	 7JaYT47pF02bpjsFAbhNUcmMdD5+AhittgGVButbccMRsee3BN8cGnr+1pn2Ok2l9h
	 HOUTRRODehYIzUDmd3JlEyv5wmBsHwiKmBrFQKIBnzR0tNJF+c5F3CKEOX0U+HDy5D
	 NVurJzOqZOafg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrey Vatoropin <a.vatoropin@crpt.ru>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 185/212] hwmon: (xgene-hwmon) use appropriate type for the latency value
Date: Mon,  5 May 2025 19:05:57 -0400
Message-Id: <20250505230624.2692522-185-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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

