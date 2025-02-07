Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249DB238D2A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940812; cv=none; b=YmJ/6jK5E5h0mwjEl7U+Y2VM02MX5wzpvncbAkadPzAb+lIJt/2dfbItIprSvbdgrllemzSqZUBVYqW9mDtQNgWVKRMDOq2OUTPvMbXtzHaBKN3n8Dc9JmMob5fJcUMxqzXc28LT6i++6GzPiyG6Na3NHizv05WGnIcf8LjFGAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940812; c=relaxed/simple;
	bh=+BED1zjhttU/x4Q+azgCmxlLeaM0If4jCDXrHqEmxTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zc2XhmDE1clDAQqIg4pLRehnE9tGkm8cXc/E0d4bw6u5wvTqr7/AyfZ/7zkQvjBHRsxDFaSM1rnmvA8ppjHxj6LpgfuBxFQ7/muoxVSLgGzXGc+uhWwHrKtzIODXu9N4MBINy9pQQIoKLzBmsSKyS0WuCSvC/N1tSbD/QKiYtao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyFlGfXu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyFlGfXu"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f648b5214so552055ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940810; x=1739545610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQMc8vD8km902bdCWkfekYhqGdyiSxRELEICgzxDFSE=;
        b=NyFlGfXu9FyjZGcS6Z3N9T8M3wwb4ngq4i6KnqVitHiybgS/2nrMiTRFSvBZlS2FMU
         NxBq2cIo4yXv+ioV9mChntN786XS5bHG90uhBMIMJOLmUH7BRkr4OOnp+JMk2gdF+uDq
         H3cxfq9KJ4Xf/7/xV2xXJcOpzmW4FFCZ9s7g5Wb2O/ETNY8zc4CkHA3atoJ6nNTAvbJY
         6VoRhwS4GhOxoCIxUjEL2l1n+ATicLdQfM6bOGH1MBqNy+GajUnzoLypppcisXfoJp/d
         OcZvnyik4on26L4MYouqzb++WlNIHGqSZ6TpS1lF3CPiIQAoCQgNqLC3I/TNkYt5YUmL
         ct3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940810; x=1739545610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQMc8vD8km902bdCWkfekYhqGdyiSxRELEICgzxDFSE=;
        b=cl7AApPMcvUiCOrxgJkdzxdOBdQWvWIbdJif/R196/U3b+BsBpoKTlE1MDePiCjuTX
         Ea3SW/oJ59WHST64FNmMGzjWeMZd/uhOkAKw4B0yk0xwOfWq8nLsZbL4cX0tEaWtPYn8
         sn4YJfIUAuy/ZYKyBcHFNiPcYJHwUHJlaKO/Fj6XcSKlLTLqIUoD+rwinhEqBqd6+LYG
         w7WUf22w033wph8/4d5Y8IjYpJnVn5Spf5Q0thLrdynLuU0IbpXgaex59ol9lmXt9V7h
         rLeS3fedTCPTMVQwQGnxa/UbOpeAVkq7qONJgDUCpV+L9YaNYXBA/5L+6hwlZcclggZQ
         jyVg==
X-Forwarded-Encrypted: i=1; AJvYcCUnbYmYAC8o2u6FDwJlTIiSLt1GlBJHQPuBzPcuHsGBL8kZUrF6YT4aNZlSU7gthh6Sf3Uzz3wVdNsiRDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsCBKPfkvpSWbfY7XVCyqjFhqWnBrJDlEHISeJv7TxR/MC4Nmm
	4wnZzEzjP9KHII+u/k/pXGIXATa5fnAcHyVGBVBiv4Cskf1Eezkp
X-Gm-Gg: ASbGncspoFN153djpyt6xM2VPItbBO9w6TsYyx5f7lSqpfvEKJX6ztzwOJw9PyqAS0D
	/54Jx6+EhpCVGzFcKTxKkkyCiMjIejqfBWlIZWKEjBNp6YZnEeAaHhiE/1UBvh3BIm20xc0PLfv
	AfRiGGBifjvsXCSuAxyOLiKkOcGUhdUeEEeFNyTHjCDUyQfFTXUbKhkXcRVcqhbN4BHbUR/L9Ch
	Ggv3uTjamL8xtImbkU1ZQUEgfGpjIAN60nUi8AGeeIxRvkJ/1oBMFvPS/S7+P4+ccaG0bCgk8J0
	6krmoydT9Gwfm463ni6/u77N8j+a
X-Google-Smtp-Source: AGHT+IGBDJlKN0DY1VF4om1iheLjSRpsYUIOfGKNZ/wqIcT4HB2axzTOeDZuaNC2EYDK96dQn4ymXA==
X-Received: by 2002:a17:902:e946:b0:21d:cdb7:876c with SMTP id d9443c01a7336-21f4e6a5403mr21483705ad.3.1738940810327;
        Fri, 07 Feb 2025 07:06:50 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:06:49 -0800 (PST)
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
Subject: [PATCH 5/5] staging: gpib: ines: remove unused variable
Date: Fri,  7 Feb 2025 12:04:13 -0300
Message-ID: <20250207150427.153982-11-gascoar@gmail.com>
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

Remove unused variable 'nec_priv' in function 'ines_line_status'.

This change removes the following warning:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 22a05a287bce..ba07dfb0697a 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -26,10 +26,8 @@ int ines_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bcm_bits;
 	struct ines_priv *ines_priv;
-	struct nec7210_priv *nec_priv;
 
 	ines_priv = board->private_data;
-	nec_priv = &ines_priv->nec7210_priv;
 
 	bcm_bits = ines_inb(ines_priv, BUS_CONTROL_MONITOR);
 
-- 
2.47.2

