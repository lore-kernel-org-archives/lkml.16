Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64677231A47
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752423; cv=none; b=jBeDn0uRART4Zjb1GpLRESWYqo/7mXiax+temchgO5gkwS8NU7L80DX1HtW3WIGChZAqVkGH3ksveBTiaX1er8iVw6+9VMDtM9ctHpdrfWptu4NSt9ncGz+vduL9enkeW7ccAYryY+BAoFWp44bM2KH701aiRMwmmX71EUI+VoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752423; c=relaxed/simple;
	bh=KcS9816fJheDiWtFqqkQ+ZORgTSYWJtxFsnHscgU5/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R0YA3XS9wt7pNjvV1wGwKwM/wBUmuKcbCQBs/A+wOe4Z8KQYyqVzMiC5+05oSyt7lomD3S9HyLIKclgV/GCo280LSuHN3TKPLqbr8aQilgzL+eT92yF49tO6LmMYe8S3wjAm42B/vefXySroepae26qLKwQQm5Yyxgs8lfEXeoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QAVwSgI9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E9wd33dL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QAVwSgI9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E9wd33dL"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Em2KYYUu8s44zqSIbzIXarV+zjk25kc0U4I2CCdKN9M=;
	b=QAVwSgI9nNrzCQ/IFnBw74uyg+CGO91MJwH2l6lQw2Ci6Cpxi38MxG0t2uq+izFpmHrCdu
	JpnpCzEO77kxX/WDzugpa/KKhSAAZHBMBtJtcXpNA0TF1mBOhujnH2ABvQfCGExuVciWte
	cYnJHZr9+3uPhhuR00zt+OMyYzTkZVcxl6e4nFYoB1KsDtIQ7e8kVrJJlHG+7Vh4i9qeSJ
	aU/zRKtcrmFthwe06OBzJDntVPtkgcFOv9Jwl0estAMgDXEbBVnEd64N1LUXarOkoHK8l1
	SaB57vlFedyiVtQz46LHcZS6V7GMsC1wbqGf0mfAuPHjoYyu3utL8kwyswOS0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Em2KYYUu8s44zqSIbzIXarV+zjk25kc0U4I2CCdKN9M=;
	b=E9wd33dLqCwOeuNfX40tuD+ZYrUFro9AKLqDROZi/28qtYMvwtwhPC9yI377uw0oUmMn53
	U+VtboQZCqG75qCQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jon Mason <jdmason@kudzu.us>
Subject: [PATCH v2 20/45] ntb: ntb_pingpong: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:08 +0100
Message-Id: <2b179e16ab830611fdcb09a33a5a531c9800679b.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jon Mason <jdmason@kudzu.us>
---
 drivers/ntb/test/ntb_pingpong.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ntb/test/ntb_pingpong.c b/drivers/ntb/test/ntb_pingpon=
g.c
index 8aeca7914050..1c1c74f4ff2d 100644
--- a/drivers/ntb/test/ntb_pingpong.c
+++ b/drivers/ntb/test/ntb_pingpong.c
@@ -284,8 +284,7 @@ static struct pp_ctx *pp_create_data(struct ntb_dev *nt=
b)
 	pp->ntb =3D ntb;
 	atomic_set(&pp->count, 0);
 	spin_lock_init(&pp->lock);
-	hrtimer_init(&pp->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	pp->timer.function =3D pp_timer_func;
+	hrtimer_setup(&pp->timer, pp_timer_func, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
=20
 	return pp;
 }
--=20
2.39.5

