Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F61C5D46
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614588; cv=none; b=KIVqFKSorH3XKJPD5Se+X9kFOpYYTrscWy5UXdYbQY29pXHxsza7cvNXk6CB/tAunBR4kYfgA+0DOEwdIHq5FV7CTFux7wnA4ajDRBuT27SXfq6Ub5+ZLavjmOd7mzMvZPifIKqltvhdqO/M0DP5olPsm2J0uwLnF9OLexVf7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614588; c=relaxed/simple;
	bh=LgFEdNrQuYJc9nk8hGKt1HTO+/SskVbhW41uW9jTgCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edvbeZNTxZTGtTTsCAm4VvgD6i4eP00VQ1r3M1xKAxB32lrWbLdiLt0Z/0Gp5T/CcbWmhwiJYYO54zii5fyfKqtdtUQ56eWtAlzVS1NUK9bdwiTMql5eIQmW3aOTDWa+MKoXNri5uJlFCpljP5eiBJSuDCxBkmhrykE0/+MjJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sylid5+G; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sylid5+G"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a8cfa713fso1513880a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746614586; x=1747219386; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86uLetninWAhL43YNpZUPrWnF7wJg6W9C9rPdIemG6E=;
        b=Sylid5+GA+9OKRhfcYu15tWedWxn4AphGrVX9OJ0xT2ud2c8ugsVq/yJRJvk1Lla4N
         +MaMpLcreRFPfKyf9GYAboHH/1Vrs0dDlfnRmvQuU7aecldxJM0LzNy0b/s092PoUktK
         hI9Xk9e+VAPtjvt06LpVPCo6DH0IQLq82ZejU4pyNpOzfegCm0r58rNiBSaexB9B4NDX
         IwC8QATEzOBTB02kuvIojtvD7crMpeIMFrxZbGNJLzQ3IH4gqLMiKgUHXHRJyqFwz3g1
         yMzDDb5NOAsI+MkUkkILZ594OK3XktS2/QE6LYrVWHQOHzqUwrg8geQLj6pbR3/IWYob
         Jd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746614586; x=1747219386;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86uLetninWAhL43YNpZUPrWnF7wJg6W9C9rPdIemG6E=;
        b=MNo9zeg8uJpseNeOOU+uncjXuDItzLCxYXHu/bq5qQfYPjSUn2c2E8vlP6lolopOiK
         f4T+XuflC/Hxdy96cNSvMcK38bqyTdqIqZMWzZAnNxiQrvf6w12DtM5bGeXiQWiU3I1Y
         qd2kYXzU+NdktgA6NiGrYXjpM9HB4ZNTvv/+HHo0+P+1JCyDOOLp02HMKaXQ2K0EmmFQ
         dz3sq8zw3oXdTJjTCs9n6TgZ5OuXzdBbkvaZVZ0Rrqtu5rmw5TOoeQ3rEuygEAVHNQXT
         gaouAuLGOAsNvaN+DWznB1GKxZeCieXEiFDZBHbIgxXW+hgEqpl40fLM54Okj/WKWQaQ
         MHPw==
X-Forwarded-Encrypted: i=1; AJvYcCVANrWC6c6SxzVnD5tijFWwfb692yIKJgBl56FYCVRL8ErEwC194x0nN26fg3a8F5UlVbRDFEinpHlZlLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4IbI9UMLPONhG9Na/ZLWWnP0fqQpx9F2B0l5r0eaxV5O6h+b3
	SG+mdwfw7xAKA2DPW66N+sM3irY05sl6ysUOse6CPqrthv2qfTx40We4gg==
X-Gm-Gg: ASbGncuyXLW5aTPUSpxpZ+dT1+4rUCuBjjgXjSsLZEXFpKLPWWiGUsCiA45oxDi/WfM
	7KpwJJq663cDeIcWVkw5neyI5JisQp9Icu9HqksAe0xc269rPnS5hl6IFv9pCYTMZ0lOTIrcY/+
	4jXfAs5JJlDDFjJoGZ1lWv3a/hJpgiDE+UprZcW89U/Xs4vHFe99/5bLsROjm+s9zTQmqpwTj8c
	8X5O3s5TYjd7fOyxT7N0ceXj3gIP85Su6NWnCdLyGD6yZ/0CeT0n8oVJ8bHqHk0qf+9RIMNZvuB
	oBc2Ori4dZhQ9x4/D3aCJJb/ZOX6N8JrY+84gOV20s7YP3hUvg==
X-Google-Smtp-Source: AGHT+IHJ+9ShVGm4mc0/1bIkX4+Bj6LZl9I6ctnXsYcXsar1zyvDwIzO+nQHqlCcWQYiwjyTkQ1rfQ==
X-Received: by 2002:a17:90b:4acd:b0:308:5273:4df8 with SMTP id 98e67ed59e1d1-30aac183be0mr4708612a91.10.1746614585981;
        Wed, 07 May 2025 03:43:05 -0700 (PDT)
Received: from brak3rDesk ([115.96.77.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1800952a91.22.2025.05.07.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 03:43:05 -0700 (PDT)
Date: Wed, 7 May 2025 16:12:57 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] staging : gpib : agilent_82350b : agilent_82350b.c
 re-checked the sizeof structure, also checkpatch.pl has shown wrong error,
 hence now applied the right option and commited the changes, this will be
 PATCH V2. earlier have applied void pointer only so it will take only 8
 bytes, and not the whole structure size.
Message-ID: <aBs5MeEdCCwiGE0B@brak3rDesk>
Reply-To: lkp@intel.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index b326058a10c0..94bbb3b6576d 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
 
 static int agilent_82350b_allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	return 0;
-- 
2.43.0

