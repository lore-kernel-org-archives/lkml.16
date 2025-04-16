Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E3F9D9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807756; cv=none; b=mW8szhV4iSlLi1OMmZFcWBQh77sL8P1oirx62NyLqVl2B76yp9sxEswkSaceaVb6wSqbOJc2g3PdyxjY0yXkoG05HvD3MnXNEX0fj5aSgoLtyr2odVripqC3h2o4z4vyGpGv6ms0HdsGcMQG514XvRu3egMhCRHOEMruL7XIqHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807756; c=relaxed/simple;
	bh=Oie0CA567N2TU0fwBupMchn1K0iHfp5AaY2vGOjyCIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMgOaPRlMoGsDzcGtZ52EUml0pDtNeZhBSTLjD4JBzq1lhfhFFbJLbkwGUhjGF/AFdGzD4me4IxL5zFOphswvwW9DPWEzeAvyRcr3OEAdQ5AFw9kxl9AxUWwbNV455YUVkAi5wUql1EcainfQOGO74gDCngVuzLkk5ZwLzHlDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGg1I6RK; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGg1I6RK"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b34a71a1so7780694b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744807754; x=1745412554; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldt9IrsiOSqhio1MCd7bKSNWymFtZHgXwO+I+eYx310=;
        b=mGg1I6RKWh95mjEDLe7JE0QErZo7+cWU8NrsQ66mfpAgpcpA+Z9RSoQ9A1NUlYMoG7
         nxd4JrpKhJRBThXzvu2hB+Df1uLPFT/dR6B/qz20LFhMQQwTwp9F0yHGKtuvqxFghODq
         4AxNmP/ozAcjvS8UUM4cac08X30eak4Udd30sYZpFgQtsfE2YYG5OTAFLxoekQWpO/Kp
         Slx1qZZajR4VCS2KomjuLQpCcbfhxs2x+mCmEHuCXB2i5kwxlCJntDWGGhjxQW13OFP2
         4QuoRcF9+adzXEN1+8TVOKHTmWnNFM9tKWmikIlkmawyOBVdmCudiYlyt9+vycO6Gjgl
         vICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744807754; x=1745412554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldt9IrsiOSqhio1MCd7bKSNWymFtZHgXwO+I+eYx310=;
        b=Ca+yGlVEjCmryfKV9BlPIivsltAyCUm+OI2bXJ098C4sUcvBvv2B5e/zQvqAuKMVwV
         CySlUBB09sKh5VEA8AD07J9AGPBr7so/1aFas0WlnbRpX9VwlH9MW3w91LQtdzuARH/Z
         fsxkEDThOaSCVuzL9Zqvj0nnTiMebrHMsOTHlx/R7vNVMY+KVk7/IaCVxXWMm307r4fP
         +qETmizU68jOFCA3BOPT90/MEmZne5YyqrvILhH/qHd9HLBpKfcKXCm22BZUISIjeODp
         JciiYEMtiGNoPDrMziusw3pFB+zClDzdm/k5eOt4GF5ifjmiaSejQD+WqFkWcuo9OiQU
         wjTg==
X-Forwarded-Encrypted: i=1; AJvYcCVA88d5UGW/wZ4Xo+MvlIeEF79p0K7WaeHuMLS5zHU28mJUN2vReJtROF/98BYFwrdnr1R9nNFr1SBYr2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoC3JUgJ7WuNkWzLOdkkrug3ExD1heEM7ikypQJllWOZ5w11vE
	9vNza3s98oVW8r5dm6qJ97f208NSCyI25kOrVSsPM+8wfmJ7MOfE
X-Gm-Gg: ASbGncubPEsaHDDMw7B1fmdhmeSWcNRVa6WmOlX6OPUbZEwJgOPzE1fuU0HJE9Mocs/
	LUnvYnDc/M6agGmXk5Qa0Sbx9GIMw1Ew19otdmbqxiSsEaX5jVWdRWqiQ6NnGXdB1NPmF3vhrqX
	8QrY063tFwXOQhmS4PKpCO+6vp4bYA94tae5L4eg4XFgGbynwmJHNHOP7VQz8sBCYPS+a1OP0cn
	6lHka6rdrHfTjfGN9Q74exYkzaQDV5SkzjAZzD5M78ACwwZffu57SU6b0kuIZWSJjhy4U6kPgi+
	bbQeO8G3dD7U6zON+Hpn0g4Y/TQYnycoIL/x2DYytTtSLalFQw==
X-Google-Smtp-Source: AGHT+IG/CPfVYEph2M7p99ubwZU+kSDnukahDwg624Hd0IVR4aChNY4Tva8+Qvi4aQGmrLXTd0OYrg==
X-Received: by 2002:a05:6a00:2384:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-73c267f55e2mr2454611b3a.21.1744807754007;
        Wed, 16 Apr 2025 05:49:14 -0700 (PDT)
Received: from brak3rDesk ([115.96.217.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220aa4b2sm1161674a12.5.2025.04.16.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:49:13 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:19:11 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: braker.noob.kernel@gmail.com
Subject: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c :
 fixes checks on the file
Message-ID: <Z_-nR5Vt2A5kvbro@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It has recommended to
Prefer kzalloc(sizeof(*board->private_data)...)
over kzalloc(sizeof(struct agilent_82350b_priv)...)

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..956e21886eb6 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
 
 static int agilent_82350b_allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	return 0;
-- 
2.43.0

