Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2466288510
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864922; cv=none; b=RMzjaDkiC5TjYs81/4qTRlS1hGKFZxoPxKwFVB7+49bH5YiKqzPZ+BDTwEJaV41y0zagyy51UZcS8PCQOQATiQFXAYqo+MEgX0FED7O3lcMK1Dso2XxydE0qfGgHhhk8uqhsmGIOnIy9AfAH2aCPap3OfoL+t+izYX94u+G4BWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864922; c=relaxed/simple;
	bh=FsgbM/deKE5Nup1GimM/CJFPtZWBQLrcuUGL1PVwo50=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=cnI1nTbdOm1WTztoIr0gB35HyktX7poKcyv12gso1hvYKSor9PhFoR3PXqpN3F4oNAWiy629H/BVFIc3vF8RbsJ6nKYl6fmSNe64n/l4XrN1q1fqYGgRN3v2qKb3fBrnmEzWzTtUl8oHn8VU4svDivpi1glL4n3WfTHuH7f9a1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvWb9N2M; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvWb9N2M"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea08399ec8so27937fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864920; x=1751469720; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Og1GMQOpzfwXI+0cF3jnX9BInwec7Spgn25VRzS7t+E=;
        b=YvWb9N2MzLVbth02VojolWfIo28lbrtiMxmB3feP7xc+eh3/ULOzU4Iyqg+G2ecLHz
         6bU8Je9Ng1Hbdel3GjCJX6eoOU/UiWOZMKxgfTEbbMJx+4cU6aTqE9Haj+q1k4LNluxu
         1UIAyy1PlIuR3wYOD7yt6yCHcYoHahagM0e6pYeRnHiS+Zy3idaeb3XzUqYb++kt4QFt
         qvnte7xDhYoXlGJGQTPeeN4cl7wxyuYC6SA2gUqhH9/HAGkSL3laParOVWZHaoK6DSN3
         EqOkuru5qOtLqcB8gWYaHlbCtzbZzvvq70Aalwdfcgsmg4l2KC2lyvtPsXQG570Lk6G6
         whGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864920; x=1751469720;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Og1GMQOpzfwXI+0cF3jnX9BInwec7Spgn25VRzS7t+E=;
        b=oCc5tYcMaXY4GvN7ldCPKLuyTr11kqpbzKe/5yn7slgISOEw0jMORDORjIBIg5cmKz
         HD9wE7PEK+fpr5I/44oSCnAt02PrLWGJTqQgWFM9G9EjVhX6SPU4dLJ3QqB78Y7Lq2HO
         7lc4yefaYyFONfOpn6bXybyorPZguKvXpkhm2W0v4FT/xGZ9ihUmohLhq/0jmObBlqtb
         JUCwq2o2Er0eWR+wO6ve4xP35dYkcb1397G5S3zr2k4OlBk2KgEsc2HaVMl8kwxUXS4B
         N31nQPbASmyRQPVT8iMxPT/v9QY1qOfLKD51omH3sE2VAai8a0XczImPRZuKle+mySeR
         gMYg==
X-Forwarded-Encrypted: i=1; AJvYcCXb9NMqWubqAyxW0gJUVp3pKoOknr+16T7yGVe4/LqH/lTJ8cbnluMBw8GEbNEu9SDVI1hC6jx4cKKuCME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Mfs6U2ps/TO3e56bE6Kh3CA9HmDKlCGdSsBZ5JCpv2bP2Jf1
	CCZ7d8ZSrPxWc50d0cn46mw2auJuvpsGGkJ5168wxDOgInl7ynfzyLVAUojRSh6cwPg=
X-Gm-Gg: ASbGncs2ViCiD6dC5E92UV5mDy4IgUsR9Y77mycieTCh0ppQWO5EunUQEPpJtIluh0b
	7FyIw7GNNftQM4m/XebjylsqX9SZs9WfX+co4uK60bgbguAeOdRrDLWf3M4x+pAuOr173PpwKXt
	oIGaNLiJfHMQmvQKgkLpS3hYVNgLhGxU84bARBfN8LEaKgH7xRSrhTKKRSENdPE0yvWQww3g+Gk
	vUHdzWXd1b2avAqZfwPSdI935K8xR5XgREBQ7GnsQ7iJ7YcbGFxghlqy8ZeHPOlkD4VKplzqw8/
	Dw1NbGfnJxCejIyqJerMBVgjUT3Da51NU6o8eBhazZsHkz1FpvrQNTWpy5vUVU0lwqpWrg==
X-Google-Smtp-Source: AGHT+IHjveoem5cNH6WAD1vk3qjNmqKvozrExi59Gv6OL5AFVt4hopks6BzgykjOruT+XmUJ/QJh/Q==
X-Received: by 2002:a05:6870:b6aa:b0:2b3:55b3:e38 with SMTP id 586e51a60fabf-2efce2d2daamr69472fac.21.1750864919683;
        Wed, 25 Jun 2025 08:21:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ef93691e24sm951547fac.19.2025.06.25.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:21:59 -0700 (PDT)
Message-ID: <685c1417.050a0220.696f5.5c05@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:21:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frederic Weisbecker <frederic@kernel.org>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/i915/selftests: Change mock_request() to return error
 pointers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There was an error pointer vs NULL bug in __igt_breadcrumbs_smoketest().
The __mock_request_alloc() function implements the
smoketest->request_alloc() function pointer.  It was supposed to return
error pointers, but it propogates the NULL return from mock_request()
so in the event of a failure, it would lead to a NULL pointer
dereference.

To fix this, change the mock_request() function to return error pointers
and update all the callers to expect that.

Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
V2: In v1 I just updated __mock_request_alloc() to return an error pointer
    but in v2, I changed mock_request() to update an error pointer and
    updated all the callers.  It's a more extensive change, but hopefully
    cleaner.

 drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++++++++----------
 drivers/gpu/drm/i915/selftests/mock_request.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 88870844b5bd..2fb7a9e7efec 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -73,8 +73,8 @@ static int igt_add_request(void *arg)
 	/* Basic preliminary test to create a request and let it loose! */
 
 	request = mock_request(rcs0(i915)->kernel_context, HZ / 10);
-	if (!request)
-		return -ENOMEM;
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	i915_request_add(request);
 
@@ -91,8 +91,8 @@ static int igt_wait_request(void *arg)
 	/* Submit a request, then wait upon it */
 
 	request = mock_request(rcs0(i915)->kernel_context, T);
-	if (!request)
-		return -ENOMEM;
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	i915_request_get(request);
 
@@ -160,8 +160,8 @@ static int igt_fence_wait(void *arg)
 	/* Submit a request, treat it as a fence and wait upon it */
 
 	request = mock_request(rcs0(i915)->kernel_context, T);
-	if (!request)
-		return -ENOMEM;
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	if (dma_fence_wait_timeout(&request->fence, false, T) != -ETIME) {
 		pr_err("fence wait success before submit (expected timeout)!\n");
@@ -219,8 +219,8 @@ static int igt_request_rewind(void *arg)
 	GEM_BUG_ON(IS_ERR(ce));
 	request = mock_request(ce, 2 * HZ);
 	intel_context_put(ce);
-	if (!request) {
-		err = -ENOMEM;
+	if (IS_ERR(request)) {
+		err = PTR_ERR(request);
 		goto err_context_0;
 	}
 
@@ -237,8 +237,8 @@ static int igt_request_rewind(void *arg)
 	GEM_BUG_ON(IS_ERR(ce));
 	vip = mock_request(ce, 0);
 	intel_context_put(ce);
-	if (!vip) {
-		err = -ENOMEM;
+	if (IS_ERR(vip)) {
+		err = PTR_ERR(vip);
 		goto err_context_1;
 	}
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_request.c b/drivers/gpu/drm/i915/selftests/mock_request.c
index 09f747228dff..1b0cf073e964 100644
--- a/drivers/gpu/drm/i915/selftests/mock_request.c
+++ b/drivers/gpu/drm/i915/selftests/mock_request.c
@@ -35,7 +35,7 @@ mock_request(struct intel_context *ce, unsigned long delay)
 	/* NB the i915->requests slab cache is enlarged to fit mock_request */
 	request = intel_context_create_request(ce);
 	if (IS_ERR(request))
-		return NULL;
+		return request;
 
 	request->mock.delay = delay;
 	return request;
-- 
2.47.2

