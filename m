Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35086340
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750824805; cv=none; b=HrtQBMrnyHhGQmDBsDqKT5VpEtuVL0tLZZ7/NTmMbrj1xHuR1+2qdLxWG8Iszz1SzdxHPurH9nuV0KRrXcpK1cpbs09XgkX4KztOtw4/du7WjJ1PgbNjMljGnaqPZGYM4brIQZYlF5jwQpqRb8u4V+rilBZA2Jq6gJWLBYsELEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750824805; c=relaxed/simple;
	bh=3eNKYcFx0biWX0OrjYJXS+zbzWglVPJ46yF/zK7xxyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nh2agpqTKDaezMEtGjo0HsAY0nTnb4Z33wsxnZpyClV/sa9BTHLpUNZvx3jFNNm6TwvagnoclNlvRD1X21B+zCEu59dWLwtFhribhHHMVnXcJAPpLI0+b8/g3Hqy8ERl13YvTgZ0bkqHU1Mk8DNzprJp8r+oYr/CGneITYiuWwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ExjhzcJ6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ExjhzcJ6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313cde344d4so6626327a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750824804; x=1751429604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=;
        b=ExjhzcJ6C3LiZNmGVhkfiH4jF5bEAaU21/SBXlJil+n+YEFt8ZL5AkdybT23TZs6f9
         0Vdyg6dVgAN1avz+Q8P4eXHALcs2xFOGSoKry9TMgJTynBIaRe/r6/+VdMCFlco7LUum
         rIigrSq5m6xta8cQlzC9UhHILEEgXg78QmH3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750824804; x=1751429604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=;
        b=H/WZJAlJ3B+VF/sp6Zqbj7vBzLEZxE5pJNrcCDU3RrLypgls84fQvZmL1C55hs9SSV
         XQq1HYVlks/mIKnS+skmM3FS9/cBqfIJj5D4xYJoxN8X+wDpwvJXIRNgzW+WNcsDzfsz
         jIf95wqJ9xkZ4MvSFm6TkcjNA/I81X4TgqObaeGMFf0GYCs+053tzKiA2FRKGmzz65U0
         1FvGINAyz4P2JWceCuifZ3RGtn0q1ZZWLqBFC2xoTc0ARg12r+p8iqxqeRvnQnilULyh
         mRPA4qaXBKMz3TT93+6dKdaMp778LwrjN4vYCTb9/+JrbLRBvvamrxvRt9jcSbu/Ng0s
         0IVg==
X-Forwarded-Encrypted: i=1; AJvYcCXxWHFl1PTYE15PXN5fExQL/hVR2dWYMcAE9QtGdgM1VHqKJ0GnKQ44DaYhW0sFZbakfnNxxRz73XP8Izo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSl68pHqAWbulAR4Br6uc4RJWWoHAVgXJq5i6O9MLfpCJ2Vdzv
	eO9QrL2gf/zoj+UHxG52x/BRWcDw6DR+a+S0WeWB9hgEXI9EhwFdPOX7hCsuX8nY8g==
X-Gm-Gg: ASbGncumWJlBUq/7Gx1C9iMcLT4KQxJnM9/q9UVhrMtnjVh92wtlvUaS4aCCd7JSPVZ
	B8vYbKK36fu2O/qPDcE4h5wUchbexv6dqIiuHSpGFG4tfF+eFWEJ9exEPKspRJjfG40BEgfot6P
	x4cvj2z+wR1feF8bWht3GeQtgNfFpL7tw7zKDqPMb69i7EqkD12hDshOla+nHpQxSz3Jk6EiAGm
	WJzNDL0jUZvBFJrCTTe/5cubA3fWD3+pKEA/GWXnOVDE5bWhYBuszqKKZDt/xveZrxxhHubD7ww
	bKDXS6lp6rJsvSd7s5gX4pWV/Tl3Ep5e0KPjORdgxW5WEDY4WlUM7N2xTI8guvI99A==
X-Google-Smtp-Source: AGHT+IGmeaFsOWs9kDGHeETKynTI3T+Va+KM8Ww/Xgly6I5TstSSVul+Q1Qen0PDyH+2QEgJTekrzw==
X-Received: by 2002:a17:90b:1645:b0:313:db0b:75e3 with SMTP id 98e67ed59e1d1-315f26d57f5mr2178094a91.35.1750824803734;
        Tue, 24 Jun 2025 21:13:23 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54420f4sm560279a91.49.2025.06.24.21.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 21:13:23 -0700 (PDT)
Date: Wed, 25 Jun 2025 13:13:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-ID: <cifhvofebjuanprzcs2duv6r22r5reibzm7nub4xfya3h3rmwe@ujpf5wadwh3c>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
 <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>

On (25/06/25 12:56), Sergey Senozhatsky wrote:
> On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
> [..]
> > @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
> >  	WARN_ON(!host->hsq_en && host->mrq);
> >  	host->mrq = mrq;
> >  
> > -	if (mrq->data)
> > +	if (mrq->data) {
> >  		msdc_prepare_data(host, mrq->data);
> > +		if (!msdc_data_prepared(mrq->data)) {
> > +			/*
> > +			 * Failed to prepare DMA area, fail fast before
> > +			 * starting any commands.
> > +			 */
> > +			mrq->cmd->error = -ENOSPC;
> > +			mmc_request_done(mmc_from_priv(host), mrq);
> 
> Do we end up having a stale/dangling host->mrq pointer here?

Something like this maybe?

---

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b12cfb9a5e5f..46bb770ace41 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1498,6 +1498,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 			 */
 			mrq->cmd->error = -ENOSPC;
 			mmc_request_done(mmc_from_priv(host), mrq);
+			host->mrq = NULL;
 			return;
 		}
 	}
