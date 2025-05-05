Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76B27467C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481414; cv=none; b=PM2gYrWfjf33i6GwIh1SVL2JI/QyNC1/m96j4NvySKxwpdN4ZXc7ox95UvPXDb0LC7ovKMSnTIAHaKRDkY5N7pCptTXKUujtMYsTsFb0HKUX9Dg0KHJ9nX/Kr+eStbFiCCJ/J7n7NNcXKyN99bMT5R7OGfta6FtEaRbjhVn2jmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481414; c=relaxed/simple;
	bh=782/j8VuVXPsDo9FtOq8U2gJO3T8w54PlKGmD2Su4/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2Q1vNFGYiEvtRPAACK3wWll5GDboA88OJJgDbu2QU3rYvSCOlWUBoNvNyFhYe5lKiJrEkNmaHBPJ97bzxOFuNvCOMsf7EJJJZPklpHAoCtBvE4w1vHXe8/kE5Ml+bUG/r6Njc3272DowjH9tSbGj5UW4qkg1a7xdaZHlmAZGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmuE32nt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmuE32nt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fafcdac19aso2587952a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746481411; x=1747086211; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ol3IEZ7LSZOHC59KsmPrp2w+pYdKCYy/J7ZrkCYyWZ0=;
        b=WmuE32ntRm2MVVrlypI3qEB5dfBztKH9+tp5q9UAJJuKj2UTzXG5F9vw887QxrEgfC
         KVML9xprc1yLDdhKAG4FyGZlJqS6sf/5ls5XGrGntPX3rNNn3sEYlCX+UvBgqIl4gFzV
         JzClhbg19dgrmLD9+kqNuubjOg6Vtybf9VLmi23OfAnQ2HP9M1RXB7si3/jv8UOgLa8N
         WAELj9U2c6KZMvyziVhBfMN4U/NGIAJtVp/JM6cOOT4E9+nRwn3kbZhw/t/8gv25EiU0
         0Lz+SS0kc694XIQxfLgADPW0ZZgTKtztNUp7tUdc/tHxu/GoppfVg6fCVrdq2vXRsSfA
         iwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481411; x=1747086211;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol3IEZ7LSZOHC59KsmPrp2w+pYdKCYy/J7ZrkCYyWZ0=;
        b=k54JnvapIS1CpwkzdFHXVHA2kXhUY1NE8n+/HMyHJHgr3yBc8KXmvSBrTHwOfnAABE
         4P5IC1JJNmEsl6ZDbFgLJ9TUI1NEpLzgZ1yeF0dHMaRcj5OLJn5ZSdw1mR6t2ou5QV84
         EsOGQJ+iWOt/eAR9rmy7tNfAQbO2ikAM4EvUx+cNFWWBizLobugXDyKz+W2RMKVoCgtf
         ccosT1nl/zERxeJOd8WxbWxAkYyjQhkm1KhUnmLAwPu/4SUxfNprlgdm+/L1X8fz9ply
         cLGWpstZ6iX0DOfoCUd6UxeVDpKG3sEOwEoMErphuC0CCqyim/DTvtwFC0zBPFQy0rYa
         Lreg==
X-Forwarded-Encrypted: i=1; AJvYcCVR25LCzgGNLMn52wpPa5iUjyYCkOSwoGnJhq07rDPWhZ0YCe8I2cXgeBsYEyYB0Sv+d9tDYuC7Zlh+nMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSLupoG63iMNvEDa3vN+8pgmTob1ESzCSIfCuvM+tqc5cQRLS
	CW0jAjQAFUqLN5pq/m92jrAZaSlgUd2DcN8cxZ9IfGwKLRt92JFx
X-Gm-Gg: ASbGncsctYR7L5SGKCEbaMKPqpIIq6KXGLo/ecITZvsPi4X0ZbifAfV/rY4bAejYpjQ
	epTevihDwDBVbvZ/FOdK6vSJJGLEKKZshc4zi0IauOtfG7AhDbgm0mUWSldx8YbXtfh5U/4F2tx
	Q6LQ53zJRn5xMq9NusOsjlc5O9pZ2s3Ikb/6H1RtQwmY1Zfw7uVgDaaAY31eQVMNvpySfanVm2z
	/ofR9h+dVGWWTHpsw4aoQB4NyO9KNzBIobar/85v5g3J9hGYzDFixEcid2tVndgMCs3Fckq1V7f
	jckE+eZRh7bkaox2ji6INuFqjFBZ
X-Google-Smtp-Source: AGHT+IFi6x6jPMd+mKWdAZPRETHxceakoOg+kCexoD4oLsDM+OULK+rkoK5R8rpP9nOBiXytUV8NUw==
X-Received: by 2002:a05:6402:5246:b0:5fb:206f:7847 with SMTP id 4fb4d7f45d1cf-5fb70c56b36mr489327a12.26.1746481410856;
        Mon, 05 May 2025 14:43:30 -0700 (PDT)
Received: from pc ([165.51.9.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77bf1e14sm5964777a12.73.2025.05.05.14.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:43:29 -0700 (PDT)
Date: Mon, 5 May 2025 22:43:26 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drivers: memory: bt1-l2-ctl: replace scnprintf() with
 sysfs_emit()
Message-ID: <aBkw_p9GkH2fm2UJ@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formating the value to be
returned to user space. So replace scnprintf() with sysfs_emit().

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/memory/bt1-l2-ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/bt1-l2-ctl.c b/drivers/memory/bt1-l2-ctl.c
index 78bd71b203f2..0fd96abc172a 100644
--- a/drivers/memory/bt1-l2-ctl.c
+++ b/drivers/memory/bt1-l2-ctl.c
@@ -222,7 +222,7 @@ static ssize_t l2_ctl_latency_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", data);
+	return sysfs_emit(buf, "%u\n", data);
 }
 
 static ssize_t l2_ctl_latency_store(struct device *dev,
-- 
2.43.0

