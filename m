Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4E01FC107
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039690; cv=none; b=thHGfdXGZp2ESFpruW0JTiEG+xwdAJM3zdWplGSZ4fgl8cW7M0ZpOelr2NSCDLwK2eWfGe8fuXxGoiR8/9rPY7rEbxphx1HhOk6Pli4/iKu6GvBsA3uvTjYgpCKG9hmnFOVcfHNg0KDAZxX7mIWsMrhIngVQvZJagD+TM9pgyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039690; c=relaxed/simple;
	bh=AeCDJp54wAGtMg9CHmvKgr9djrzK4GgL9KpmTxPCRpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pswHz/BKiDvS4prCZQKoDnF0dEE8oO1XaNWRIIDCQOHWwv02tEgOXIy4n1fNIiaZl8i0tSebspJrMe0v9Ku+H5zUyluqQm4po/95spfXobKBXZ+mtTrsqKGDzJ62MU4PT6C+n1h4BUwvLL49JP/3bP2jgtMTMRFSghljYvI9yZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ip7+SdGj; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ip7+SdGj"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so35430171fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039686; x=1744644486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0o6na0F8TAk6lCusT5NLJ6CNUgxmH5Vy2ajrZSzJE8=;
        b=ip7+SdGjNUtgxOKuleuXElFbE+taTNOp21mE4yMEU060uNwuijy+AaNAIgkpy5Xe1b
         BMWxoMO7/2KNMJoH92cbcDgPL+ydUOPzVhpS/06/At+OS13M4SJF5d7nhKoEcDyC5hUi
         5NanepfdNLqTl4Q61rQwBk3tnjreCcerW+it/02yO8n4jjZGcdrXpwzTxyYZum723/JJ
         FcoYbC51fXiVoSPfEJANbdIGK5a8t5q+l2R7ximUipadjB+CL+RCz/R4OqYMC1ErfNrx
         kSU+eCd/j3VK8Z0DRfneu+J10UO7CXHJlJF3iOCObzF3e/LtcgZuQ9TVct9L2uWuB39S
         kdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039686; x=1744644486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0o6na0F8TAk6lCusT5NLJ6CNUgxmH5Vy2ajrZSzJE8=;
        b=i7p2HKWAqr+Ovm0Wys1RxhnQKUJqHD43ZQUcNLx8ARjjekx1UPN1533rJ9vZS5Qk+a
         P9Ot9H/rRNu/6eWvGyXkR9YazL3hi/yJPvHtzaL8aQsrk3/U6iMoRyMjBKP4vJl9geV4
         OHkNZa87mPUS867LQNYHyIMrbDcE6cVnce5u1adV8nCJJkvIalThDWk+caXlweJrg+PZ
         /Xz3nP0LAwkgrkRKqeXPzUyO3v97KjEseKd60bCUB3b17ITTfa8icgw+nF/YmxKYFAqW
         kssZ39OPAy8ew99RcVncuEJhcfM1Ii1gEurz0+pGOlxVjj5QG2WmZvVXvgIjvFDJTyHR
         VhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/arkpwIvW9UwXbuzsu/YwfRL2qX6PRRnsW8ws0UImjDMoC1hkIc2AEPAXmyFKJSgjkU1RBIMecgbesgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfdvMRHo3KpPrn7hZsdABRI2groXVgzXmcQue3MpNUPhyYgRw
	gL8y+QAjqeotH9YinaoJ6StsjNFvtvJjaRAmgs0U6MKv2+tm2dnA07nShOp7cSQ=
X-Gm-Gg: ASbGncvP1lJsfIKHeoIvVtSqUq3PM2nJYOW9R8rCLI+7iZBzpoGR8SY2xDCQrMoEEp1
	CST98kuddkgA/hNv7ypZAyb+Zjrzzz1tAzUX61ylgaWloFKT8rsfrdGTl3Tch+IPzjyZOgYIdPB
	hBGOUbgkHcVuweuMto13T77wtVjRx47fIOkRaLU3Ci9J9jDYAdRcvhdMtCgeGPrB7EIM8qGLSfJ
	1Q9xagDLm7YG0DpjzjMeYEFFTbxPLNueG0XhHOTnpfoYbH+4fvZKUoyP7BkK0vAlKDu0fNA1T08
	/mFhOzjnkES7SIjb+4sfXyZs7CQjpLH7oCK7ypz3WZMEt4e+CTRbMS6cix84Ys8JIfqGFxepzVP
	48HVgS2a4t9V8zdRc6qc=
X-Google-Smtp-Source: AGHT+IGP9ssOV6pn79yVfRWiq3KAcys7QHTQQoul8wvyG5t+BivqElpyAW6czWaQuzr79w8RI0P1Cg==
X-Received: by 2002:a05:651c:211c:b0:308:f860:7c1 with SMTP id 38308e7fff4ca-30f0c03c545mr42993461fa.30.1744039686432;
        Mon, 07 Apr 2025 08:28:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avri Altman <avri.altman@sandisk.com>
Subject: [PATCH v2 1/5] mmc: core: Convert mmc_can_poweroff_notify() into a bool
Date: Mon,  7 Apr 2025 17:27:51 +0200
Message-ID: <20250407152759.25160-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407152759.25160-1-ulf.hansson@linaro.org>
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's really a true/false value that matters, let's make it clear by
returning a bool instead.

Reviewed-by: Avri Altman <avri.altman@sandisk.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 1522fd2b517d..3424bc9e20c5 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2007,7 +2007,7 @@ static int mmc_sleep(struct mmc_host *host)
 	return err;
 }
 
-static int mmc_can_poweroff_notify(const struct mmc_card *card)
+static bool mmc_can_poweroff_notify(const struct mmc_card *card)
 {
 	return card &&
 		mmc_card_mmc(card) &&
-- 
2.43.0

