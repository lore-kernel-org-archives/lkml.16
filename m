Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA3241139
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836135; cv=none; b=ndkSh3tOnqIw5Dw4ijGneKWByatmeO8fa+2H7IaqkzMW+vTrNpbxM6SFceVS/7TbQl+W48NwAKrmlhCNigxYCTi30QcQ3SMtZE00LZzMjprK3XSxawu0pbIzPwSPkZBvcsc5fYC8igiBtlwRIVFd6M/0ea/GhsG73JyDdvdcMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836135; c=relaxed/simple;
	bh=QaMlya95zkc4MjQsjQDNT36UA9lQmCeo4nFFSkNr0Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtIEeROpt44fS93iEzN/PQMauixqdwaBY24TQ2ou1C6Lt9soQKT8XlQFJ7n7MyVxLveg5U4Rrfq5rrvEoLygTLc9Y3aaMfj4LJyI9d6iLOhidE7Cg86N/yYKYG5aXXihCAQkzD+QGkV7OhJdAIG6sj9uEClvfEsHU6xr1sGhRXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Y/ArH2mA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Y/ArH2mA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3085f827538so40539a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836133; x=1745440933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=Y/ArH2mAcO/P+h8tIIGJBuuvOwzHNdEDExzBbuWWuT0YuUyg57viWTnwNdDv9sE+u/
         M6MYy/5ChaE/oBJSfRyGqN9VZZWPVuffqKUCnsr91rPfVXckMykAkVsM68aak+a5Ihtq
         jD1MdAr1Zyb89+vyE93jv8ZxS9ann9/Vndn6lX3nEWFxMK2CaHiAwxShAHOJYaLLKKTf
         +ofVE9URsO7AfOtML+v/LQbFC4bESBDCTvTIFAvM/+0Bccmmrdh9+JvfA2u+NYNm2yYD
         7y4EgeHWREYA4mp0xZLpw75E5SulfmJ56ztaVWC9zu6lg27TWig3wFS129XBDx33QVK+
         c9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836133; x=1745440933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=UozOmhGDZwT2EOL5k9dBPRJQH1D8nhMELw8nxu4Edjhr2HVq2b5qAQWZe7WGPuVn7Y
         0NnS8ZJiMGOb7KKRXJKLdLwyxYFAqZlrLDuG+2C1GNuAooIvgAq2lLcAV3DF3k1DJfWK
         q3b8YOOAY063KMp59XNGTXCdRWFXtPHx3sBlHmC1rfho1ZP5ZCMsif5gHtNj6FSWj2+x
         Fgo4qzwjLAmnd7SQocU20t9HUMjUCe3smQFa2SO8C8Ed59ZvtUDfO/j4Q9Dr2pZeZFgq
         A1qeAVExFVq3/WJxWDtzgvI6SvI2FA51TzoXwN0eMututbCK4EpeYdIeXOKR+l+7KuuU
         mrBA==
X-Forwarded-Encrypted: i=1; AJvYcCWV3ZnjNYj/gQSFUexi1up9a59m00PAbmc3ZMildyH9Fk0ymenIBrakSvfYU3fWq6Bhh137VoFiLGXh7bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzhe3Q4YKexW+W3NIFRIrrvinnOQs1n3GXkJcYu5kcS3TbzF/
	R3t3eCvThBqKQoh+4gsmSMLt+CPe0JTwIYpliHeFf+FPkQfZu6oDirKTtGWgxg==
X-Gm-Gg: ASbGncvM+C3lzqj6Md2KbgexNkQIcBb3T/sjXRllJlpKj0zFTv6Ou3eDuk/PLATX0vZ
	Gp3tcFk5+BR63seuuTi0nbv9Kw8d5JIjSL8pZbBKbuubbCC/YW1AAXyXnmqd1jPaPyLwXaJMCer
	KNMWCdrcTerI1Oc44vrQZUG8sswAbzuBaYShkZAwRGmzhFa2YwmW9pZOqQweQXaMZQz6Ec7CA5W
	k4KN6D+gsnLaRg+s3DPjj2R5jYvXyLjchZDIYaOcEYOIZw8ZVFVDK5QmkHsV526t1+4GN9Z25i8
	cpU7bbfr+gADayJ+tlV6k6vcYg7V1Xs+b9QDk+5yKHuo8bjzRtm7AZTW0dIzuB4JTxQc18uNB8H
	QHPG0nnWp1W8Yuygs
X-Google-Smtp-Source: AGHT+IEjTfZ/5+JWlyAL1MHSwYwfgw7tSppO+oNmQAkpsLIDlm3RVaShuEtrcoqhprEETHkbtgEhzQ==
X-Received: by 2002:a17:90b:570f:b0:2ff:6f88:b04a with SMTP id 98e67ed59e1d1-30863f2e213mr5180030a91.15.1744836133347;
        Wed, 16 Apr 2025 13:42:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5e92sm18911465ad.118.2025.04.16.13.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 05/18] staging: gpib: cec: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:51 +0000
Message-ID: <20250416204204.8009-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 03d5b6c4fd8c..1b02222881b9 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -188,7 +188,7 @@ static void cec_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t cec_pci_interface = {
+static struct gpib_interface cec_pci_interface = {
 	.name = "cec_pci",
 	.attach = cec_pci_attach,
 	.detach = cec_pci_detach,
-- 
2.43.0

