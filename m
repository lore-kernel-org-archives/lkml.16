Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA5522FF53
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879799; cv=none; b=HXvSfIQfvSvgCU5uiNkQ1PfUzGzQ2fpLIVwKuhum/hQBTp9yMLgIP9kmpzDz/3T7CVNgZCXmQBwWFPuo+LZzTA5tpBRvJwVjlwYlBrnTq/V5HLShUSLJsfhZxUE45+jIZ3RplhiKFcS5BCLOCELO6ABJr2zAfuRL7X8VsjL5Ar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879799; c=relaxed/simple;
	bh=8NIjAIHYFxKWCF2W6XrSUEq4ekHKKAbksZGYa7TkqbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CRhFYlGgVHmBbUsQCBM24JkMpCQLgYlTMGcRD9dh/ThURrzXXqSVYDIrL/hDRCPh85dMQfq0PsQ+RVv5nmEdV35Yvw4+YMJ/Ons4LpdAfFoCZ5kFXpYNdxsFMzXg+SKAIpVeEGWDOJW9HHKG3pSjpHYcHM1t2vlK5CnhsH84BzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZB5w+QQ5; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZB5w+QQ5"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fa2685c5c0so573949eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738879796; x=1739484596; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Pl4tUFCa3d0d2o/tbPal9aLBUD8h4VeJHXvBJClyXk=;
        b=ZB5w+QQ5l3p3VEqJPQUwA/DvBfFYPKVur0mD1+jMRBejYNKOzsRMhWSLqpUwbiOQsN
         ouApreK1T0I7n62KZkgLj9kcI+/ipRC6W9REVsve7vQkXM4mCnAebQWelxAvp94IDUi/
         gDWVKNqd2gCNOLHztfxVjUn4MES0iU8qf5OH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879796; x=1739484596;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Pl4tUFCa3d0d2o/tbPal9aLBUD8h4VeJHXvBJClyXk=;
        b=j244OxpI9rJghCT4ROaaz5YyEEhfP5+969wg3+1slitRPy9KtW79IHSV6frTfEIVrx
         8S+1e+VDEX6S6s2Nu2KtntcBxEzRljxdyZnOMPkpQo3qHBCaHp3L2vX7+X+kH275PK88
         2yISTjA63JGuSH6QeGOIjaL23NdU9Xc6x6gp52YmlFB7X8Cl9cJB49fmg5Hw/83+pBvD
         T2N/COVz4WeSCGQRIVFl1iRjcBZq0hq/If59euE4ciTz9JS9Ln/P0JlTMDeJnRuIgLso
         FgGXVvAtg0jL4M/2JnbAZOYEyOVJUlaTnnE+ncxIXC5qFExHrQnzufs7vEXh22EEo9SE
         lJtA==
X-Forwarded-Encrypted: i=1; AJvYcCVNTb2jY8iPuhhnsYoq1dBQqJoJg1D+xIoKT2WYqayTaI/G2ObNQp+1mhW8X911/W+KvGpf3TJkZax5GpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOo1ycZ8MyzoiRW7lvnjMvPFJ9POHCob26oSQBWNUt43H7GNYu
	LQuvdlQn4E9SIKv9h1pmV7g82/LOAQFXKBIA3tL/q62LcHUhdzt/J84zQYiUFWBnwp1r+t1k0Qa
	yV4vM
X-Gm-Gg: ASbGncu4GY07DqzKF1D67ZOQK7U3aCSyADapLW7UXrVZHMAyJBg/gBqQ59VW7p9thze
	jNEz+atmX+aTosXI7zdsmWZhNLra5Rqz3dMD/L7v+5/p2byx7DwXjS7TLshVBI4Tqnnmc7pMWNO
	z1UPeCPIP/B3v87ar6XJzty+qUz05Y3OpRjvtu+rfRyZGUekQ3g/Uj4SDpjCenI/6WsgqLa5UyS
	uaOUKW2URmmkXeM6+5HUBcwy9AgaOpy3n1zXb9/24n+HZpqGL5H/gMeclLzXXTwL7lKF3oeCstk
	XYwAdPb6oycGSNA07k2IzbGdBYsERbZHpClIbJB/ue2tYUF5jDw=
X-Google-Smtp-Source: AGHT+IGlUzW1l3o5ytaJqT4i8iUSbyIPWL/1ehx8OrH22X5CWc59YzYvc6ftg2KkIleqzAjSWYmUCA==
X-Received: by 2002:a05:6820:f09:b0:5fa:1ee7:1325 with SMTP id 006d021491bc7-5fc5e746384mr872671eaf.7.1738879796045;
        Thu, 06 Feb 2025 14:09:56 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544cf88esm454109eaf.15.2025.02.06.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:09:55 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH RFC 1/3] mmc: add request_start() and request_done() mmc ops
Date: Thu,  6 Feb 2025 17:09:38 -0500
Message-Id: <20250206220940.10553-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250206220940.10553-1-kamal.dasu@broadcom.com>
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Kamal Dasu <kdasu@broadcom.com>

These ops enable host vendor driver to take action on request
start and request done both in case of sdhci and cqe requests.

Signed-off-by: Kamal Dasu <kdasu@broadcom.com>
---
 drivers/mmc/core/core.c  | 14 +++++++++++++-
 include/linux/mmc/host.h |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 5241528f8b90..a835ebc6282c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -206,8 +206,11 @@ void mmc_request_done(struct mmc_host *host, struct mmc_request *mrq)
 	 * Request starter must handle retries - see
 	 * mmc_wait_for_req_done().
 	 */
-	if (mrq->done)
+	if (mrq->done) {
 		mrq->done(mrq);
+		if (host->ops->request_done)
+			host->ops->request_done(host, mrq);
+	}
 }
 
 EXPORT_SYMBOL(mmc_request_done);
@@ -340,6 +343,9 @@ int mmc_start_request(struct mmc_host *host, struct mmc_request *mrq)
 
 	init_completion(&mrq->cmd_completion);
 
+	if (host->ops->request_start)
+		host->ops->request_start(host, mrq);
+
 	mmc_retune_hold(host);
 
 	if (mmc_card_removed(host->card))
@@ -437,6 +443,9 @@ int mmc_cqe_start_req(struct mmc_host *host, struct mmc_request *mrq)
 {
 	int err;
 
+	if (host->ops->request_start)
+		host->ops->request_start(host, mrq);
+
 	/*
 	 * CQE cannot process re-tuning commands. Caller must hold retuning
 	 * while CQE is in use.  Re-tuning can happen here only when CQE has no
@@ -512,6 +521,9 @@ void mmc_cqe_request_done(struct mmc_host *host, struct mmc_request *mrq)
 	}
 
 	mrq->done(mrq);
+
+	if (host->ops->request_done)
+		host->ops->request_done(host, mrq);
 }
 EXPORT_SYMBOL(mmc_cqe_request_done);
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..739b14117c26 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -171,6 +171,10 @@ struct mmc_host_ops {
 			    int err);
 	void	(*pre_req)(struct mmc_host *host, struct mmc_request *req);
 	void	(*request)(struct mmc_host *host, struct mmc_request *req);
+	void	(*request_start)(struct mmc_host *host,
+				 struct mmc_request *req);
+	void	(*request_done)(struct mmc_host *host,
+				 struct mmc_request *req);
 	/* Submit one request to host in atomic context. */
 	int	(*request_atomic)(struct mmc_host *host,
 				  struct mmc_request *req);
-- 
2.17.1

