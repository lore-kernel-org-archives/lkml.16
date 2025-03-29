Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C8F149DFF
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743287988; cv=none; b=bLCp0HDM/s4hyvnKIFnGjsJpvxzImeIqXqa12XiyjGKQ0KfwUqa5mIM2aJnxdLxR2Wvkk7pX4pC7O/YHjkkhiFjsLofQUVchIJHg2JeQy5h4Ui3+cuOENBWrAM6Go4o/+hHHdjq0DjhIkOCGd+lk2G69/nkbtIF/RKIy0HzIV2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743287988; c=relaxed/simple;
	bh=ioKr0LP+rLs5ac42/4CK1aYqDFR9VQ4fKkzClsR/UEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edBStQowuo4rIQzskGv4k5Il5/lSg8aoRYOvnX9A36K/TzL+oDHJJI1jA/GmT2iDbOPFQhBQSLi8kMypGPqc0Rxy6F5DTP+h2z6eRTbvF1nvtDbDWH/fwZu+9Zc5WXjXPxOUbMgkHc0XTyFwZAeugsqUrYt0A5hxiHE9VFNN02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhGab9Br; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhGab9Br"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499659e669so3361965e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743287983; x=1743892783; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=315PVjMEmnWrsYC7B6uxPFHpkt5dHo5yH8ssm3xZs9M=;
        b=YhGab9BrwAa2F7qJ+YVA3VsKDfR0nlqFD5BV3478nYtYVnsXyOOcsI0q2BmcF4Wxj4
         KRST2e42ffIjnAS+jA9eqK7SRClmU2k2Wh5LN3+1MLwTT7GXXagVNKSkDSppD90UbKe1
         TKHU/gqw6IfXwOurzvh5g/+welth7zMJnb/jiGbophQF/m6zWt4MYnaufSl82oTY7O8N
         WzvG96bwT0zVP+HZu7asUAwx83wY5YOear33NbnA+bu64AN4Hf8pQiLuA4+7d0qqVJ5F
         ma227aTDRqf9TV9VXS9c3Igs/n59rYeXm41ri5aergzj4oRrwUvfWVkfMNeREVwkXsso
         4thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743287983; x=1743892783;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=315PVjMEmnWrsYC7B6uxPFHpkt5dHo5yH8ssm3xZs9M=;
        b=dL0z4bxRWGt8Y6XxlgO0xblo4oMDCUWNTO5zXFxMEzyrDa4iWlufVFE/ph9G5Kf8Dq
         twVUGpVxFPFKQMPOI4k58iISzgggP9+9y9oypcwu/H8HHWAglOCq1Yxq7FjU/QxYq0Er
         7dzguI3Lzprz38SkkhFFGLGzRh16iFUmQ+4kYppOMUSlejjWrg4pXgGLu+Rysc2zUrQl
         KOi85n0AAhWLdBwCUViVXObKEENXGh4TXCluV40wulTrRzqpZNitTGPngla2WEuqp64d
         4K2qZ2rIc9n+vEdAdj9IwoyXokFJThgb30BbHpr2iBFgzw7it5dwKJgTSd6InkHURiWR
         juvw==
X-Gm-Message-State: AOJu0Yz9qTF/wjoI5s3U/z7ff1CVrHN498V512XF/NuwX3XLiG7UKJXk
	GQdl1uzhpo9O/o3ntMeCJvSsamBIjYT2VBbRYUJdOxUkkeFXz8JB
X-Gm-Gg: ASbGncsc6+tam8hmDCvacuugNwDveTismYiJUk2drWThwVM+LM9tDYKd3ItJVCymAYe
	ega+PQu7hC4IOTSGWxAZUnXp7ZaEi4wN9Y4KiBPJE9E655rEw75v5QE70aURsIyidbLRo0xqhC4
	41xQAqdcr/GLSgAN/Wj7ELlidwQdtuy216iMs+qYKEY3MNlJx4lUf2m5BNtvtXuwINr9k8Bzd31
	jxPBrlpmx0T+GXo6IrdUFz0LZCk5rEmvKUudSlKB1gvwWR097e2F2+8Dot6Q2OqEu8jYaLTNRAs
	nQucZ2kCkYWMZwfWUkWvQpfHlP4sKNbSN7f+bW1Bq438efWldkkmGbb9ow==
X-Google-Smtp-Source: AGHT+IEZDeIjLSVWEfVUd+UxJ9Se7fxmH0o1Qa/QcpXQFseFlWwYqoIzIlhzS4ge+K5wmBDl8qsLYQ==
X-Received: by 2002:a05:6512:3e2a:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-54b10dc9f55mr1444914e87.12.1743287982331;
        Sat, 29 Mar 2025 15:39:42 -0700 (PDT)
Received: from grain.localdomain ([5.18.255.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fce6sm718861e87.116.2025.03.29.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 15:39:41 -0700 (PDT)
Received: by grain.localdomain (Postfix, from userid 1000)
	id E24645A003F; Sun, 30 Mar 2025 01:39:40 +0300 (MSK)
Date: Sun, 30 Mar 2025 01:39:40 +0300
From: Cyrill Gorcunov <gorcunov@gmail.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] firmware: dmi: Respect buffer size in get_modalias
Message-ID: <Z-h2rOF2ulYAS3_j@grain>
References: <Z7eWSCCqp_HP3iSh@grain>
 <20250313194145.284d7815@endymion>
 <Z9NYLCdVfp2Nzet9@grain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9NYLCdVfp2Nzet9@grain>
User-Agent: Mutt/2.2.14 (2025-02-20)

When we collect data from DMI info the "dmi" prefix is copied unconditionally
which may result in buffer overflow in case of filling uevent environment.
Thus lets use strscpy() helper instead. Same time make all get_modalias()
callers to handler error.

CC: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
---
v2:
 - add comment about reserving space for suffix
 - check for error in callers

 drivers/firmware/dmi-id.c |   30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

Index: linux-tip.git/drivers/firmware/dmi-id.c
===================================================================
--- linux-tip.git.orig/drivers/firmware/dmi-id.c
+++ linux-tip.git/drivers/firmware/dmi-id.c
@@ -103,8 +103,15 @@ static ssize_t get_modalias(char *buffer
 	char *p;
 	const struct mafield *f;
 
-	strcpy(buffer, "dmi");
-	p = buffer + 3; left = buffer_size - 4;
+	l = strscpy(buffer, "dmi", buffer_size);
+	if (l < 0)
+		return -ENOMEM;
+	p = buffer + l;
+
+	/* Reserve place for suffix */
+	left = buffer_size - l - 1;
+	if (left < 0)
+		return -ENOMEM;
 
 	for (f = fields; f->prefix && left > 0; f++) {
 		const char *c;
@@ -125,20 +132,21 @@ static ssize_t get_modalias(char *buffer
 		left -= l;
 	}
 
-	p[0] = ':';
-	p[1] = 0;
+	*p++ = ':';
+	*p = 0;
 
-	return p - buffer + 1;
+	return p - buffer;
 }
 
 static ssize_t sys_dmi_modalias_show(struct device *dev,
 				     struct device_attribute *attr, char *page)
 {
-	ssize_t r;
-	r = get_modalias(page, PAGE_SIZE-1);
-	page[r] = '\n';
-	page[r+1] = 0;
-	return r+1;
+	ssize_t r = get_modalias(page, PAGE_SIZE-1);
+	if (r > 0) {
+		page[r++] = '\n';
+		page[r] = 0;
+	}
+	return r;
 }
 
 static struct device_attribute sys_dmi_modalias_attr =
@@ -163,7 +171,7 @@ static int dmi_dev_uevent(const struct d
 		return -ENOMEM;
 	len = get_modalias(&env->buf[env->buflen - 1],
 			   sizeof(env->buf) - env->buflen);
-	if (len >= (sizeof(env->buf) - env->buflen))
+	if (len < 0)
 		return -ENOMEM;
 	env->buflen += len;
 	return 0;
