Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544821EF388
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001664; cv=none; b=DVy4MxN0H9ZyIoOEbfwGkg6qxTdsQOU7/EfGzjnUFWAI3vvI3L/9NMj6Q4vgDfy33b6DN5Yvz1i7tw200q8jkcK8jQmrprJ0fCBoj1wKHmZF9+HGK+O19trPoayJf9WUHnOxZiawn7GNayqFhR+VZQpFnOQNVV7nHQUkCHV/lyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001664; c=relaxed/simple;
	bh=qVsS2hUBtqENy+Oubx9DpGdc3RA0lMtgQ25CAEpQvtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHpav/M1/PaZPwfK5P+wnmcNzmOCSvr8tGkvoZZ/STiet58mN1KqRDxJmno2FRJw6bHpPHjvzwHdfC6HPNfz2WJoNpJNxCWHQPlO6bRc8IHPp4neQFNA2FX1txx1vnKMsL7msC8CztLk2QemS4deQ/XNnY1ZJpvwxd/dqFb/fd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Alh41VcA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Alh41VcA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so65059355e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001660; x=1746606460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mGsDZPklQSrBkLSeSMFUQEvM6CvjwvWAOT3FCKj6DE=;
        b=Alh41VcAHba6JSo3mD2BqMWSh+WzP0a8CfA/RbQ8zniwxJJUDVF4lTqHuTwM1Q/+Su
         iGTQu8YQfVE6M9CvoGy7VZ85OneF6wNgNccuw3Kzh+f8AH8Xs/ucSLwYmPbDJ6yfDzIY
         5Ee12Bf11b8SbMKmHpOVz8u0v66qjNl3donX0gDQiyeyeHJFLC84PfdkJ6vKdlUEYW/R
         EHFIJXQlQy2kkD5JgGdajP3w0BQTqTnj0zUHWe2Sh4/wp6ut4cDRmIx1arYJBTW6fHAe
         6fmeoUF0FVfLnPD0hbhScziPB5SYET3bk+xj+PrgATvTbEBCgSm/uWAK08jgysu4e3l5
         DSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001660; x=1746606460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mGsDZPklQSrBkLSeSMFUQEvM6CvjwvWAOT3FCKj6DE=;
        b=ozy3CE2MMDbPNU/4Nxo1SRmurEu/HaPgdlJjOKjHA9cH15GpiXGklk7oiCHFR4pmnY
         tHqig7TUGYUXt3VNrjmtsNmvCbovJp4AGAdjcno2RAkRu6PxPKHEjJhIO/akli1Z6Vrw
         58mov4A++ejKjzwQdRRzibxpQSl9XZBKZSdibdRsh2Y5BuhRr7+fdN6scz0yo0BYE+2/
         W+1ZfZ8KideQD1DO5ixjXNgTWH9qHfFa094WlMT93TijHqCnw9nWW4eHgyJ0Af4d7iuQ
         Klgq9ROnGAWqrkL1pme4AHIiF4TnTDy0JmSi6wmHkLUqWIwM5VvSF7egniL03whi7fWj
         Sa+A==
X-Forwarded-Encrypted: i=1; AJvYcCUDXNYtXWqRldUG6InMuu3osqO4gR9C5Xwd9WxfYrg3tcqFZP+hxqLL/+Vs3Ao9cBndA4aBTfbGCCntJyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAssH6rFR//LOuvlihAVIrXndrMHsJPa+HblxDA0mDs8CGbeSc
	cMfUMBuBNZB2mu5VoOfCI8mBxM/CmjEBp2y2D+ydqH6JV73NQTkJGoIWMIhY7NI=
X-Gm-Gg: ASbGncvhB3hNX3earUf68ZeezCR2OjEggfGklVqyQCLs6U2RVGehWM1LuO8nnO7B3rk
	Nf8qgbBDrFF3MMbomDHRrrMRpDOYj7zSUwwds0JKs5inGde2yd7jLeNRpyhpRYPLwCXNoQhEqRr
	ZMp3rBivW6CV5a4PDl32OzmN9v6/t6hgjUj8Z6Xxa5/a7BZZp059YnhqlaeaLQhWYj0fPkbrLrQ
	x+AnIWCll99jucr4RI3CpuRzE7efpxajtC76rXpAJWeyyQiqjjBDQ9YQlZtke4QGObF0bOz40e8
	+1LKB4zFPR/CWVxUHjsy1uC8CLfMuiuR+xOWJJPtZf2hlw==
X-Google-Smtp-Source: AGHT+IFirixO8zK1n2Aomk9+LOvvs0gmdVuJyEBLIkX5VxmbuCqSlheIcRnqq6WdgItyXk/d3bhvEQ==
X-Received: by 2002:a05:600c:3acb:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-441b268dfcamr12676025e9.23.1746001660599;
        Wed, 30 Apr 2025 01:27:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441ae3f5949sm33946145e9.1.2025.04.30.01.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:40 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_serializer_temp_ramp()
Message-ID: <e01f2784c6f8e4bc14458f9f4246ac0a8888468c.1746001540.git.dan.carpenter@linaro.org>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746001540.git.dan.carpenter@linaro.org>

The "ret" variable is not initialized on the success path.

Fixes: a05744749600 ("media: i2c: ds90ub9xx: Set serializer temperature ramp")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 8075bffbac2b..cf104461b9a7 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2058,7 +2058,7 @@ static int ub960_serializer_temp_ramp(struct ub960_rxport *rxport)
 	u8 temp_dynamic_cfg;
 	u8 nport = rxport->nport;
 	u8 ser_temp_code;
-	int ret;
+	int ret = 0;
 
 	/* Configure temp ramp only on UB953 */
 	if (!fwnode_device_is_compatible(rxport->ser.fwnode, "ti,ds90ub953-q1"))
-- 
2.47.2

