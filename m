Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2126B09A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864990; cv=none; b=gPrK0wdnS/NmlxtoYNtaZXnaqMUpOKoxcPLpxEVBPGI/V3lEqrOGY+q0sU/Tw7Tvm+l3hSuwNfvNz8ZWt4WUCI7EM2Xmcd+YjdbYRXUew61q03UAiPEDv2ZClOruRd83KljbvVV8BD43w9Ykra7mn5OcEIy6IhOawE/hvQnBDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864990; c=relaxed/simple;
	bh=a47eZHNrHhm8bIT1UsXDpMZVMqM2M/J1nRMDkPp4vj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrK9s8hb0L9QaVnK1fbz1hmWlHXaaLeeX4ik/6yLQSjkAliqI+mO1MWaJdBlERZ2weuDh0b+f/Kmj7NwqBMqAokRDGUU5pJ5m2qkMKwDQ1lFX4dnTfNVxhn8BnRqphO9LS8Omt2dZAH8Ghc450YPxoa3R6XZyCrX85CS94cJplU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8QL6c5y; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8QL6c5y"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-735a6faec9eso4525880a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864987; x=1751469787; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gzYs3m3F/c7eB4Inj/8U0D6uQl5hfC5e5tB1ISacj4=;
        b=z8QL6c5ymUm2QCKobA5U/ljErhFTSOq2eZzBh7i+MQiI35m4HkFZxK4AWQucZjO9xd
         kR4L+X7pK/99kttJZmvX5z+TMjdrmjgW+N+IpmvCMoB0RwoThpNXlSy3qgZofflkFU5T
         Md7rud0cTXfyuwJ4DHL7mQoja27T2ZiNnwK17MmjWZhUZw7cQIEBOKIqDv2MQsxexsDt
         IsOwNXA2BQps4aJZ59nMUueEieg8aX6vHdlkHTmTt7hWsseze19FEj5IDIfSQ3A85NO7
         klPVKO5+26wo1Tp0WmlUDFtg6kQN8F8icZFn72slk1V0+MsoCj3Ana6IQJwibcNSijVW
         i6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864987; x=1751469787;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gzYs3m3F/c7eB4Inj/8U0D6uQl5hfC5e5tB1ISacj4=;
        b=Z9NMCN7+L0GsO48issBxmWbpqRccWkjKdvgzJxHwhlULWvDNIs39UED0e7MsabDsPj
         XKj/8u3Swunt8DNnLEqUoulHTFGcPnIp1byMgl5FH1SBn7/kujVv0FYZY9df6XathgKo
         h2Nscpj9ymRQUH0BYsfrgiBIKtewEkjczMNJR/cA8nI8n11WTVP+gTelDvMN+LjbdbkT
         028EmYKMN+W8D1Xhl02npJ48DcS/GMABTvY3CR4/JQ31++YNtSeHiXgJDj5Q84+oP5eC
         d1ROzhf7huF7OJyTHcTqTnxmOFsPayz8YkUxCBGfp0PPEYnmUr/ErcCf+knYrnNHSP6N
         KWOw==
X-Forwarded-Encrypted: i=1; AJvYcCV0q9hhmKjFEsqVvCMETraxsTiE+NtuMOV6ZYB02O2IebxEFK0Ykqid5SWkduOprms5ojR6bNbHyr6ShSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rQjA4nP6bv0Iwg/klDoNNSk8AlcfRIyd1ztQmT24MsFKX+m9
	ud9xc5sIix3nJXwrbXMp04etWKt9FZ3vNTYDSY2ypwu+PaQuaZqSzMQr8frB/RLBsVc=
X-Gm-Gg: ASbGncsjAwnra3ejnQVYo8sagPsFrHqPdOzlAw/uiir36XR+P/UozqUqGWmgZqVmrEa
	uXrcQiKnRLyAsEXTzU69d7yatrGc+kQVEjCRSfuo8eTsWUxsjL8XrpoHBv9md0FmtXztKuW6wD1
	b1/leTQnyw3msf8P2flXBVfQLQ8Ntj1yDpLWS4pndAY7mi2B90CTo95nyh+598iTuSkNvbgypz1
	HEprOyu92ET12HnrAPgkof/14wC1BzSS3XIQvpUi7mU4z7ogQ1qbGmLbHexVFkavNtDmvi0dbvm
	c8GJkhczKtDorYhgTM9YJdEXZ3bXJSkyZZWw2Ihy65NtPcQrGqI1UhYoW0p8AOdtu/ICMg==
X-Google-Smtp-Source: AGHT+IEd8+YjM8LYQGmqEAU6rFmznZBC4Qrv0XQ+XpbkPlvJZEhO0r+n9pOweQCLkeKUxTgosdHpgA==
X-Received: by 2002:a05:6830:3e8d:b0:734:faee:58a2 with SMTP id 46e09a7af769-73adc5e9b79mr1827733a34.12.1750864987275;
        Wed, 25 Jun 2025 08:23:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90c92335sm2258295a34.36.2025.06.25.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:06 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sai Krishna <saikrishnag@marvell.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] octeontx2-af: Fix error code in rvu_mbox_init()
Message-ID: <ee7944ae-7d7d-480d-af33-b77f2aa15500@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error code was intended to be -EINVAL here, but it was accidentally
changed to returning success.  Set the error code.

Fixes: e53ee4acb220 ("octeontx2-af: CN20k basic mbox operations and structures")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
index 7e538ee8a59f..c6bb3aaa8e0d 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
@@ -2458,9 +2458,9 @@ static int rvu_mbox_init(struct rvu *rvu, struct mbox_wq_info *mw,
 			 void (mbox_handler)(struct work_struct *),
 			 void (mbox_up_handler)(struct work_struct *))
 {
-	int err = -EINVAL, i, dir, dir_up;
 	void __iomem **mbox_regions;
 	struct ng_rvu *ng_rvu_mbox;
+	int err, i, dir, dir_up;
 	void __iomem *reg_base;
 	struct rvu_work *mwork;
 	unsigned long *pf_bmap;
@@ -2526,6 +2526,7 @@ static int rvu_mbox_init(struct rvu *rvu, struct mbox_wq_info *mw,
 			goto free_regions;
 		break;
 	default:
+		err = -EINVAL;
 		goto free_regions;
 	}
 
-- 
2.47.2

