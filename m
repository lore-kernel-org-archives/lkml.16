Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3C1D6DB5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919772; cv=none; b=OI7YD6F0P7kk7yJATTE2R4cqv6eemsgkxf/EenROGlw0zOO3wOc2XFosvJwZhilsMBEpzOakOC8UHHhFJC2/tTVKhETw0dHg6kfIBd/Na/nQLDTCgm6X/RiXpncA0i6liy7+WNfMb+7TVfhf4eX/yxsdFMZkJ0Ro73GwPJIo268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919772; c=relaxed/simple;
	bh=fLjMsIh/HJUQjg/hVkNg/XMCQsi3SepuuV9mpQx0YkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRwSitPaRhwge1ePz3DyJw7thMAFkCW4JJpl5Nr5UP6AOZXA0IiNFA0Jnh6y8XsiG0t3vfeT8ni+nja7lk3n1Fe800xl1MuvmIwB5ZOuOON32RyJ6G3fPKJJWHdGRnKRexW7AhkckenWq5d/e4bw08IX+8ElcrclFrjMK+id7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwkS8JkA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwkS8JkA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dcab4b0e1so334261f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919767; x=1739524567; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4lQXrAzi2rTihX6fV/JOGU2Qmj1GaTD2TDSWqFqUgQ=;
        b=KwkS8JkAYngepUKakIgxlAw9ZJDEEqP0rlkd94WuzpQNTkw4VkenSSprCzNdsEWVPj
         aln7f+bzBCPhfPrimocpSmnfSJPnwaVchfLWyD1SA5DS5ZhmhDJtB9t/kzVAf5KYfGhp
         O0H8pvEAArWziNdwDT0loinNyRDacGGDxxXZs5ZUYxi+RESy4i3VCzLqA7MH9B8K7vKP
         qml3rAWBIo6M9k77Ub3M5QSKkc+RRPXwRMHk33lPjH+fZtphJ2/P0P918/7LaIcxqa2v
         UP0A78vXE+1YLWQ6hykfSALWIPcT+2dWNv/bx16e3VRyzQ/wocnSrVAiOheJmpSTGw0b
         Y4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919767; x=1739524567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4lQXrAzi2rTihX6fV/JOGU2Qmj1GaTD2TDSWqFqUgQ=;
        b=DDXSDs5oBaWl7gX5ih8ZjnhejY4PzF1Lu9eATPEBC7xayFrJK01eREJUywPtqRM2l+
         qyTJCoqWNjxndjewpIJ+6AA/2HzMf9zPo14LlGhEiOWHdLh5GLYR8Y1c16HSvPPKGosp
         pG1J//dQ8drBBiQGDz+NBaYO39JgvNKSrQVtcWM+T32NvyNDWi/i8YIewvbfJKsCwWmS
         tVJqteHY0jf3IuosCSzH0czmaUmm0cAhSFmrRt+f/O9xGoqAOD1HQhYpvgYmohqJYpaf
         b6JbhQ11ZZ00Yu5ex90mFSdjK78SWROMzsXo5IcY7F8KsAZD79sM91OE8Z+bCGka35q6
         S/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/veYgF8xvSjH0no0OA/gT1ahGazF43q3ruO81c/n2MvPDD+xBV5uRzVDdgzNn88YTQZpW/SJ62ILH158=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcSM9cHLlFYt8VlLvMAe12+Xi9r9MGgfScKHtuLdUyHb5PGoF
	27jY3d/EY/epYp2S6YuBCKyomjp05eFaFoS2GwJjaxjLTUgfrxP7OXAsGnjhHLU=
X-Gm-Gg: ASbGncu4dMcpVZGUVXIyZbvq9tLtMCnvbIO7h+uBQZUzDQfxseXvPWn14icBjpdnd5U
	nBDB5vw5b1aaut6bhyWjrM1+iCAEE4D4c0nVwbJiULfT5T0OoA70lhlv48SiBdrH8q9gl4S+SlI
	fjA8vCi+YFPb7e9pvOmxsJGx5FR75yPjWu9bfYVNy6PSdRqDTYkJf1K2o3peYqB+egJzA+3bVSR
	oLahshZJpdbF5LGJAf9hj/R8ayXPsIoSQze01z6jlIi74nujZrYGGFG+pV3xU/QYvihsScBspXP
	8yeoZB2rrKTpvWolOBtk
X-Google-Smtp-Source: AGHT+IHqtqD6HtRJQqxarv4GMNZzNGdDdWvX5SgVvhPcMKn3XQ/iYaRb3DhRIJRCpWinxpVTMd6nJg==
X-Received: by 2002:a05:6000:1448:b0:38d:c739:276e with SMTP id ffacd0b85a97d-38dc90ee4f9mr1602513f8f.26.1738919767387;
        Fri, 07 Feb 2025 01:16:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd1b9b3sm3974521f8f.13.2025.02.07.01.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:16:06 -0800 (PST)
Date: Fri, 7 Feb 2025 12:16:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: Long Li <longli@microsoft.com>, Ajay Sharma <sharmaajay@microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Shiraz Saleem <shirazsaleem@microsoft.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] RDMA/mana_ib: Fix error code in probe()
Message-ID: <2bbe900e-18b3-46b5-a08c-42eb71886da6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if dma_pool_create() fails.  Don't return success.

Fixes: df91c470d9e5 ("RDMA/mana_ib: create/destroy AH")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/hw/mana/device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mana/device.c b/drivers/infiniband/hw/mana/device.c
index 0a7553f819ba..a17e7a6b0545 100644
--- a/drivers/infiniband/hw/mana/device.c
+++ b/drivers/infiniband/hw/mana/device.c
@@ -144,8 +144,10 @@ static int mana_ib_probe(struct auxiliary_device *adev,
 
 	dev->av_pool = dma_pool_create("mana_ib_av", mdev->gdma_context->dev,
 				       MANA_AV_BUFFER_SIZE, MANA_AV_BUFFER_SIZE, 0);
-	if (!dev->av_pool)
+	if (!dev->av_pool) {
+		ret = -ENOMEM;
 		goto destroy_rnic;
+	}
 
 	ret = ib_register_device(&dev->ib_dev, "mana_%d",
 				 mdev->gdma_context->dev);
-- 
2.47.2

