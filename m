Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14D26B764
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864947; cv=none; b=htvjZxI3YEDqgUI5ZAy/9ZCoWBprSrvjrtFnBaoRso5vp2Zia0o+fFbSu3mSTvkEVC4Z7VGvSexEJDW7eSbqU8Mdybuo5PFuFxzXvWftZg2P/0ZoptQi8ngweBvdCIw1kEq7+YE1WvqTULpSsnx7oOciSh/keqXGdyC0tN9FYD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864947; c=relaxed/simple;
	bh=tPS5HgtBH/a3YI75SOngGR5gSYBTs9/8ZTRA5upNPuY=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=Jq5DBkIa14OZkmJdgq1DRQUL/ijvIFna2PelIv2MoaEI19LY1yyJhCoocR0QTE6RLrd6NNxrES0jqIuMa/Mjx5+WkYBBW3qw5NDEm0O+3zVHU0xVJLddBgGWrJU+ZuyPtji2vu3VUznjDqilePAOfnUnZiTID7TUUp5nOHfob9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUDvy8oy; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUDvy8oy"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73a01a7bee7so580174a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864945; x=1751469745; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7RcZ8tD+YY3u8+1Exwd57sweAEXV5GRa7q2EAtC8fU=;
        b=TUDvy8oy4Vj5NJRISQLoZWYsTrI3pumAE1AJMWveuBRE6Pv8Rpx8NgiOPuIU83m9uT
         T6n347s7Qmxy/g1Os0fniC++k1I/45Vknz5IaZ1FEHZXTa3Fe82zO1bsqQXw4up8Di7i
         riTVHnWin+uXLvn0Mko9IhXEOfWePSUAXOhdgJlSTt/GYY5vOYEZFDRIE5e6nJXuHedn
         FW6dwVXMYmrJgDXH0T37EzF6aq/juAcO2iaUBkqWX5ULS+DlIg7KrfGQnwivrfbB+XHs
         Gzm9wdoIRT/DItpGJZZBVobuwJs7ifEst/1pPN12knKWmYcj7C9t3Y2s7BWSh1zcKQrw
         iHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864945; x=1751469745;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RcZ8tD+YY3u8+1Exwd57sweAEXV5GRa7q2EAtC8fU=;
        b=YJPsFSX/a5dP1EbCojPM69wLXlrxdEmpzEGkop9CIsZj4V0D3Ixj5eKVtAB46e3ADp
         2OCHAPuINs8e2NUxFglzflVrYT8SpuX4W012BBjwIUgndINKoqHOFviBmSKUGpbuqMCB
         cYe+KPm+5NxE7a2HrO/NBTm5RLPr0KBX7kHeoSm3Y+AsSQkyldYIPKehJiVDqskAelrf
         XFI+7KYNcoSALkmh60/M6D8+sVlP4AFvCzou5j+vdNC8LqB7IjoO05cvl5SocImxQkmu
         5icpC1CW/IYrrXtbM0f39oCeCXdmbC1eQLbcruHzDGWcd2kPdebf/ChgynzwPwwZdFd7
         OwFw==
X-Forwarded-Encrypted: i=1; AJvYcCVfxTNJjT6lOKEg9dgwCc0zT6YLpjo1ZC3M2NLM4UyisCgNB1roB7/LiRatUdXOThlUUCrvz0ri/m13KJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKnPeWE2TqopPlnnaEfYQAOBnTymOKQ/uvWDZoWN8lKCryU+f
	qzLrQoenbblHDydvjD9XhocmP31lSk5tR8l6ZJ+c4L2lhEvCG/x+/qTQijrItX55ucw=
X-Gm-Gg: ASbGncurQ5PKibsD2MfJBy4E6a4r11aTuLT1P2wwXBwQMg0Cu3Ay2WTf5GGkKxOANWy
	Uy2V12g0DQPMc346M0uaAKZwS89QFHNDgqHbVXjgcfgJFd+6uJUAZRpltAcWJazJed6KD4Zrh/Y
	TcVYB12AtX+DhfAKDdda24ho7544AieoLYt4d1GB2pHhG6QqlpGVVobU9B4ik1wPYdoBXqYOlX4
	JhuRu/xUuOrEI7uV+sA8443LMaw6EQKbazo2zD3/3b+C621oIhea4cDhtmIKm/CTmAO032JavQd
	65y8Pz5D7syCfLmIVvhlIod2ccMoQ439gtCqKHQ5RuU0iYZlQkVeTHhOijdgIrOnmZL2VA==
X-Google-Smtp-Source: AGHT+IHb85FqTS0ycz4BbaaNVMY143Zje2j6HGa+QScgiEjK4EjT7d3k0hQ6xgLXGqqJ3LGIaVnNTA==
X-Received: by 2002:a05:6830:8088:b0:72b:7cc8:422 with SMTP id 46e09a7af769-73adc7eb8eemr1794371a34.20.1750864945168;
        Wed, 25 Jun 2025 08:22:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90c921a7sm2240183a34.34.2025.06.25.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:24 -0700 (PDT)
Message-ID: <685c1430.050a0220.18b0ef.da83@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:23 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Daisuke Matsuda <dskmtsd@gmail.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] RDMA/rxe: Fix a couple IS_ERR() vs NULL bugs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The lookup_mr() function returns NULL on error.  It never returns error
pointers.

Fixes: 9284bc34c773 ("RDMA/rxe: Enable asynchronous prefetch for ODP MRs")
Fixes: 3576b0df1588 ("RDMA/rxe: Implement synchronous prefetch for ODP MRs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/sw/rxe/rxe_odp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_odp.c b/drivers/infiniband/sw/rxe/rxe_odp.c
index 01a59d3f8ed4..f58e3ec6252f 100644
--- a/drivers/infiniband/sw/rxe/rxe_odp.c
+++ b/drivers/infiniband/sw/rxe/rxe_odp.c
@@ -470,10 +470,10 @@ static int rxe_ib_prefetch_sg_list(struct ib_pd *ibpd,
 		mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
 			       sg_list[i].lkey, RXE_LOOKUP_LOCAL);
 
-		if (IS_ERR(mr)) {
+		if (!mr) {
 			rxe_dbg_pd(pd, "mr with lkey %x not found\n",
 				   sg_list[i].lkey);
-			return PTR_ERR(mr);
+			return -EINVAL;
 		}
 
 		if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
@@ -535,8 +535,10 @@ static int rxe_ib_advise_mr_prefetch(struct ib_pd *ibpd,
 		/* Takes a reference, which will be released in the queued work */
 		mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
 			       sg_list[i].lkey, RXE_LOOKUP_LOCAL);
-		if (IS_ERR(mr))
+		if (!mr) {
+			mr = ERR_PTR(-EINVAL);
 			goto err;
+		}
 
 		work->frags[i].io_virt = sg_list[i].addr;
 		work->frags[i].length = sg_list[i].length;
-- 
2.47.2

