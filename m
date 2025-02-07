Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3B238D52
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940789; cv=none; b=ZvUhTiArDOmriqK+DEGiaEFXqGDDIbh8NqAgBFXlg8iMEwkSZlxIn8UzHB+/CAEPQZ+wOhlXk4UgIn3b0llz+Wz129XgS6ZqmWS0QUjJniqh0CpBgANvJFmHw+GES8sTTPTwyDohwo70ApslR6EHEe8U/ip+8I596ygIvN3oDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940789; c=relaxed/simple;
	bh=XIKFweN/ns236gfX53f8NOSSTvLU+IWqbzdLwbrFbtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkbMgEsD/wYPe/oAZAhVogfRX2r5gGLFevjhNPsMAOtNdeORPpVjDZ7qwk6vAaXNV4b/9Q/w1lZ6cfMbG98/n0QpjFdA928kF5E9rycIRyiK8szJPn850c0sX3lJfueF0iXRk+CfLAATXB0/F781yI1AZYa16wxWuaT+wBrK2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2tdjs/f; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2tdjs/f"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2162b5d2e1fso4947565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940787; x=1739545587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGUerVEaP/r2Ie4H65h0uviVJMnH7XTNKQyzuEKRMpk=;
        b=Z2tdjs/fL3AajR+VyPpsWAOx7MzA5/6VRY2RvfJqYHf2308IFlKCtU9UMWYfurBLsp
         iL+XL7mB2oH7OEM7y5yEaH8DEhEb8gsF3ISMEZKhO/ek1Ootg6NT4up/+02iZqlGTsQD
         hdl3A/PR4FNvjSjYoviXlBjvM8GhL12KWsDerxJY2YXbrGqlFAoWm7mKksi5+fgZwNeO
         Xvs5cn3l2stz/SVL//n6TAIGB91QP3CRFxdbcyMx0hZPaZubqbfMDX7xDSh6Syxhq5i7
         a4h4n57uXU8Nu+6e0nA6ImV4CDUUoagEKy7Cv6d9uzU/gKFj+ht3U15xyUqFm969iMyn
         C60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940787; x=1739545587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGUerVEaP/r2Ie4H65h0uviVJMnH7XTNKQyzuEKRMpk=;
        b=rx8Yu6WQW50H7/vXNp/CqGK9sBRnlnhZAWVlVjFQBHOaoSTWPhL00L0RE2q3zGrZ+J
         KH3454l0j/nC9oTozxXhe5OMMsbShcJVVBn6W8CWUKurZxOtuC6k4yCzt3I+0zWgAzN1
         jBgXZHmT+gW33HexUCDXYPyGG76cx++AkdSa45HhMjPX8seWveJhhPza/leT9TnaNYb6
         QBSQOuTgTg2COXvgJdihis0lxEbXsdEOOkmlECG5LBI1GflNeS/k5sfYrb3f0T9UZ9Fw
         yLEggYXJT/LEO+zkf7BybraRzpFp8vclD27mFfJTsTcUqM6sruzLJmv9z9GBfxxaXLQ6
         2sPw==
X-Forwarded-Encrypted: i=1; AJvYcCXIe54d4SDZ3DeuoIFA6lsQ08l7WWjcZ7V3K3GiicQ8Ugael47rnJnGVXm7Gbtw1zN9zdtWDh8WFpiyoFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUNu0n7SlpA+vEuqee+gRt9zXB0LdPlgm9WPWb24wfznC9s6P
	WzMXzqJZ8VWQ+/vh1cehGSyfY3h4bYVFXZzMOxq7AjuvDxobD853
X-Gm-Gg: ASbGncvcRtNwXHOhNhZwBxdvUjRqJD/FS9ZrfsqtVdavUdBCzuIWNe4CqDdhdGnV70p
	0yOB3g76i1Xfwti3xGc53tb6K4CDsX5UGAsEOwRPUOPHCDDrlfbbirkaXbEa04L5ah67IVOLZUI
	tRYlAG5RAuAgnXALul8cB5bTyZ12I2amPEACFLwWKYlojRv9QjNPcbokBprQohvHm2tvqxm9G4F
	YGuKW4Y2vUjUwkpfsxemTYpUj8rGyR4BW6WbKohmoQsZThTaKN5kVsGM189Iydc0YDWml4kgvu5
	D88BMbXxD0eYK6jkOGg1RkCAXPBQ
X-Google-Smtp-Source: AGHT+IHbNSBKv+mLmDyiUW4lTeqU7DilrX86GKMa83qWVrkrrBALGDq4fEdt4ayb2TD1dnayi5lyug==
X-Received: by 2002:a17:903:40d0:b0:215:b18d:ec with SMTP id d9443c01a7336-21f4e776697mr20473805ad.13.1738940787425;
        Fri, 07 Feb 2025 07:06:27 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:06:26 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 4/5] staging: gpib: tnt4882: remove unused variable
Date: Fri,  7 Feb 2025 12:04:11 -0300
Message-ID: <20250207150427.153982-9-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'retval' in function 'tnt4882_update_status'

This change removes the following warning:

warning: variable ‘retval’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2e1c3cbebaca..a681bf559b46 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -704,12 +704,10 @@ static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clea
 {
 	unsigned long flags;
 	u8 line_status;
-	unsigned int retval;
 	struct tnt4882_priv *priv = board->private_data;
 
 	spin_lock_irqsave(&board->spinlock, flags);
 	board->status &= ~clear_mask;
-	retval = nec7210_update_status_nolock(board, &priv->nec7210_priv);
 	/* set / clear SRQ state since it is not cleared by interrupt */
 	line_status = tnt_readb(priv, BSR);
 	if (line_status & BCSR_SRQ_BIT)
-- 
2.47.2

