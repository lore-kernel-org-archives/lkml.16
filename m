Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E78020DD4E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000233; cv=none; b=oEdQk+7X0YScfrCywzCkJWgxaf8yytt9YIxqB5rUCbBi0MGX6914QuqC2RfqA9eJgKgg3FIKSAQawbDsnHo9uHMDsfvMOvxElZ0T4IPskg5JKcyNmLBEAxRhzT+KfdsZJHdIX9yFrC13liVTdIwBzrPetocMsIC8LKgcwXJwMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000233; c=relaxed/simple;
	bh=yDswBP+Kr+vPdFZzARL0WBNze344sfihA/wkyU8QgCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yi7zuFUDyKHJM60n1tqVBXUtqqq4ti54dEr8lGDgRhmEg1U9NqKPbmP424ptCOC8ZpDA32mH0pfDZHYA2FPBQvTmd/LmG9SNERkA8b/Ysg2eOAQJ4Jn/E7uk3e5kByVkTgStougeYraXhzUUtCNK71/5EGZjMRnUENQG3DubSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIbr+7CD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIbr+7CD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so43120495e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000230; x=1746605030; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAFg7e7QoI/NIhOM4U0ox4at7LqC43f8tqWtCVElvxY=;
        b=lIbr+7CD3u5jFcrGbeQKmRxB1i+YkwIr34DFjuy5NoQtInCiMf1X8xjGyPZlhJdijG
         cmCQ2cF/y6yRo/efKL/DVSQWCfE4Infp1YW0tE7oHF6pWY+1IkabQck9SLtm0igyxfga
         vl0HVXidin0ydFsITHQLSdLTstVlbhoaXBFdIoRtgBC8QXmrP38iFNFTXa5uYWEsCN36
         Y9Bx1xiCFeQSNMT7KbvhiJIp7X8d/Ap/SlfR6R/mm/8OvKfi90ZKM0qC1/iI7AkSZl3d
         DZK/NZFIIRUk8NGOe7ekHbdzokaFXNx1moDShEd3Ffi4QlyVtHijhQToqrvTiaOxCDxh
         g39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000230; x=1746605030;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAFg7e7QoI/NIhOM4U0ox4at7LqC43f8tqWtCVElvxY=;
        b=Fpm6em5zB3aVz7jKUPb5IeY0083ZvV+0dnISzUBY6hUzNEh7lqnSRkSeF7dC+ZKOG9
         6QMqaOVmrA6RcdGvE6y1K3wN/xiThRNb9+gxyazVt5GV5Du8qDBHPK7NUVD2+Y8X0cX5
         TPPq+CwOuxNeTucFgOKJDLEzEubKebG3O31nuNik5TTd4+dO/a1kHVyWrjklODxuD7tf
         zuJcwu/ftL7ce9MIfX3qzQVg1n+OZ5gTaiLuf6gHvp3OxwA8vsVlxFZ2QwIvCu5SRZeB
         Z8molIuOei5xOPxxg4i8sM3EUF2IAJ3YFl8nzt5sH7KOL0gruMF3BSE9gcBFemJTBExu
         CFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEWcw/AFN/P/gBUOViZ9UVvhtp8D7WQzAbszsCZvvnwsO+sDSh65ZAUba3Js21JTlWbqqtuZJlfUBtSSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxkygDa36OGZ5vrRvQJOyYA2jnThhF0Z731iaIdUxwZJY2Agf
	qOOop1rjKJdrmRQV74kueN1CqIbCFqRISMN+ynpVbpM/V2WySbpfye78d4Ww99Q=
X-Gm-Gg: ASbGnct0E3R+mnU3RGbJ6gbd90IC4ZtECAjJM99segnieduImeXtlNX3iG00BUdqLMY
	ApZdukYjnB8xBZRXIAhj9PdBY0SnMWSb2M5yrBqq3O7wMoEGAJ9oLX3RaoVg70peBKoJNQuH45w
	gpOe8mYFiAQUgc37l0m5WmrjApowskqUkaTD8zSCnlKivPlq2V+zXi0/wEeuNcSx+ZiWRY6Ar6k
	N2TEj3F8wHovlgDOrVNVN1fWIrOsdu4EIP0wfVEEGMN2BKBYDD40JLZRPo9KeHJ9dPq7BHxJ2rn
	Okkfh817JTyXjXLVnFZtcgtqZo1Ef7mReItFC4UydO2MMA==
X-Google-Smtp-Source: AGHT+IFi58B/opSrTiSCQEZcXK3JMBecxGa6PyaQe84wc8+j1ywljyVjJeAqD6J4qh7EoSFT1wKxSA==
X-Received: by 2002:a05:600c:4ec6:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-441b2635482mr12037525e9.6.1746000229687;
        Wed, 30 Apr 2025 01:03:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2af2922sm15458155e9.17.2025.04.30.01.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:03:49 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:03:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in probe()
Message-ID: <aBHZYgPPPYY-J8Vd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function returns NULL on failure, not error pointers.
Also printing an error message for kmalloc() failures is against kernel
style so just return -ENOMEM without printing a message.  (Kmalloc
already prints a message).

Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tiny/st7571-i2c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
index dc410ec41baf..eec846892962 100644
--- a/drivers/gpu/drm/tiny/st7571-i2c.c
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -908,16 +908,14 @@ static int st7571_probe(struct i2c_client *client)
 	st7571->hwbuf = devm_kzalloc(&client->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
-	if (IS_ERR(st7571->hwbuf))
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->hwbuf),
-				     "Failed to allocate intermediate buffer\n");
+	if (!st7571->hwbuf)
+		return -ENOMEM;
 
 	st7571->row = devm_kzalloc(&client->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
-	if (IS_ERR(st7571->row))
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->row),
-				     "Failed to allocate row buffer\n");
+	if (!st7571->row)
+		return -ENOMEM;
 
 	ret = st7571_mode_config_init(st7571);
 	if (ret)
-- 
2.47.2

