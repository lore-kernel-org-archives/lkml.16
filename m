Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F321E098
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997705; cv=none; b=IddjFQhxLdMY4qA0TAJQjBSrNWy8AXiJBozaW3x7dOwCJbQFHapyD+Gxqg7Vl28b3qghovv+4t6ey9K6qjjmdHB1s9xOAwbR5QfBe/8dlLAfUHkVv/ddwZup6SSQzp9+eUGWpDUhzITBcvW4PsoFd67CLXmrq/TpJU8/BN9AMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997705; c=relaxed/simple;
	bh=4iQseaUFTpcev9Eu6hppJkJqT6uexmzYNKQtB62Erp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU8G3skcn+J/TOLE6pbHlgRoxO/Ggt0dnFmfAFpRGow24WU0PknUD+43CMhDhXm8JqI5vRyQqJQcu26wlCyPyhaeHnvOvQXdIaIoZ3mBgk+5gJJKJLa3B58XThQIY8zGLKNY8Ic9247cLFfTtSiwylhX5s1H7+5O4tyKzGkwfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmTiJoo5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmTiJoo5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1213551f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997702; x=1745602502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnBmFXSxRbz0DmRCSR8jCc12+Aku4V6y/rAuR5Mgcos=;
        b=KmTiJoo5uaGIiMd04IgnutH6RVTihO/VR1ROrIfV7RR6/V+j21tVyPe6ve3qc+17PX
         4GzE7i6p3J4eg5ElBjalFhTcnv8jDJeQhOb1oXIaH4m9gMNXD9hBpzmIB0CtPBsJzWd+
         fY92VfIPFkyUJBmFCi411pDcFXq7JtM4MgexIYzSwPCD2vwe3zHgFvY1fnXixHtD2Ovg
         apQ1wX3hrzMlhjJBgk6h5jjAIEPia0Blw8O9xqmXQ1YUQk/6unKeHpILlfx1/6bwP5nK
         ln0VAFy9/UUrDUJ2BF2W8Hh07/g0lFQ2rJM5/j0ZLtFxogYS/71soMrdygMrov+qyKh1
         HXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997702; x=1745602502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnBmFXSxRbz0DmRCSR8jCc12+Aku4V6y/rAuR5Mgcos=;
        b=MKbr42X1obVzHbfNLswM5roHnh/dP5rbO0hNKJJQXbTtR8Mf3Tj7BzPDczBFUSAImk
         H64R4Sg9GXZ2ZRi55468MIeJ2SzDgMBNqQ7deTQWgC0LCofEpmC0NxQuFZqqfdt32uc4
         T4Nrbgi+V087lTZJPmKmCkvXBpaWloEAZYXybSNre/IHuBH7tzGhwMtUKNyhlbbxsMP1
         pwXZPht0liLhin/tuhq34D8u4PfWeu5sz7YPDqkdKgC2BWGkIpnw0ZZrsMIXkL/bbgyF
         TYjjWovIpIvcmG2cGqTosNkltGDPOpJtkHvqDHCc760PKnEPEVmaus8IkM7PP1Nx+B24
         AUTg==
X-Forwarded-Encrypted: i=1; AJvYcCV2I643fLh8G6I3UblIBIbW/hYsvm3E3en5MxCU/royeNcDtsZkVlyPBpZUmyH0XOv+MskQDJznluJn/Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsev8nXhDggoziM58gCFSFJObSQFdPCJC3dL8GHPDHzo+do8pQ
	7H0gI3iFT2FLN15MFMH3MLw2oPi72hKN7CtBDdAf9R1UB5KczkRV
X-Gm-Gg: ASbGncst4pHaD9DR2hply0K2SDgAetEpQfCj2WVTfCT+pp/cOCXIKmIyZlPyPs/lSyt
	EeZBm3fzIuQY6vdf2RIe08ZoK30JwOB9eILNUjznf30SitLzoDBAd6dFc3yxUn65NZQwvDzZU9c
	9vdEQZaLdPSxkFnLGexP+qyvy71+36fpGWkN4mC7NMPaeElQYS6NVXb7bjsDuRZkWRRUigP8gGK
	cqy3FC7F6exKtiFQX9XYgFWZsr9EewsJ8R3x8G3/DyOF6Ig61ZABPS7mlYnG+QLi9DZJxe7+bE/
	xu/91vzbGIDrY9/rJ4WUlsLdXmKTIMo9ulDG8+6bzZJLCGQuUOB/vRS9N/vVqWg2JwaIpgvoqXv
	m
X-Google-Smtp-Source: AGHT+IGARWePzoNyOWwMYXMMy4aIxfc8BB0KzJuF4hy3VaEJfNzI0IEJ/V9IylH7RJ+z9tUcrQEI8g==
X-Received: by 2002:a05:6000:2503:b0:39c:30d8:a80 with SMTP id ffacd0b85a97d-39efba3c88dmr2523714f8f.19.1744997702450;
        Fri, 18 Apr 2025 10:35:02 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:01 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 6/8] staging: gpib: Change error code for no listener
Date: Fri, 18 Apr 2025 19:34:32 +0200
Message-ID: <20250418173434.2892-7-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When doing a write a test is made to see whether there are any
listeners. The code was returning ENODEV which is incorrect.
The user library translates ENOTCONN to a user level no listener
error code.

Change the error code to ENOTCONN.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 1d650cb57cd2..86b98eb1ce69 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -516,7 +516,7 @@ static int bb_write(struct gpib_board *board, u8 *buffer, size_t length,
 		   gpiod_get_value(NRFD), gpiod_get_value(NDAC));
 
 	if (gpiod_get_value(NRFD) && gpiod_get_value(NDAC)) { /* check for listener */
-		retval = -ENODEV;
+		retval = -ENOTCONN;
 		goto write_end;
 	}
 
-- 
2.49.0

