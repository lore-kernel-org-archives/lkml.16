Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A82857F0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200697; cv=none; b=hyAMe9yM3P6kj0MyRPQC18RT8wRRZ1NvUwzfeBu99kWwzFmf9NeHmNQ3J+eevGIEqYJOWqR4d4Y8ILwjRxrSzgOSXUGDAWtczzRdpMzwqoqUO/f6rHeGypIJb8sazOG/bZPOv1Ftt3KjGL02b2hSBCQUAC5NXJC1i2CXvDIiVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200697; c=relaxed/simple;
	bh=CfGvj7ncrPabLetrwNG8k5H0Ppg5o++CXB29qT1hAiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kdc7gEKr3Wu4dFhRPrhgbkLxBl9L3XT9tb6CXdnQDLExszagwtCv/xVeGuIgqcvtmKneVqbkdI+1wlRsHHtEI42yTacQfCfYOxLnU/6kCJkugPEo73PuIe5D+2gjD7skw8Y7L7qW+uuDI05a/hrzGXYIPt+5h2o8cSArSAQI/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6zJ9Djs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6zJ9Djs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso17869195e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200694; x=1749805494; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u22QGRwwJcexG344pLAuyEqJQtDbVkBJOvRPUpkYyrs=;
        b=X6zJ9DjsF5qprN7O0M0TfvQOs54j8gyvmlXk/7OcFqnIPBI01jJKfiC4e8olzgZBJ9
         8CnmAv5efzcoJbQWvlht/gGiRl87WVonpbNq8s0Bs/1IbrStza1jfLhyOXVYgFoV0o9m
         pqZY1hygRvmllFBPGz3snbK3ZmLkraNdr2KZTjU+xYu0RNLE/R69exeKNCdP33qfUHz8
         oL3BCnXNdioKtd0/eIE/1jbDj7x7zL3y/obJ2Rf0+BhECKGb4Dam8YI5nMrxAGlB8gsj
         rT0het3qF0XIoUGiqvxQOP1iAwiRW1pZbpn7IhtDtd+Ik2kD71L6kheF6RWYbAe0AvF8
         WDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200694; x=1749805494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u22QGRwwJcexG344pLAuyEqJQtDbVkBJOvRPUpkYyrs=;
        b=db7lharwyJPVM9mwYgu18veaoKzpDfuJ7n8IWnPLSBrDZf3VaX9+Xxbv/6xjVTDxxq
         3B2aEdpVZjJuMgCz9JWqo0k/0ciCMgnDCtaGQ9GX70atyv+cxJh8meLHZQ9O1gaxbNe1
         Zf96W5d8THugOkFBQEjEvlE2wgHb8qui654WGfNrOyleva7YYIH5ANeMIc/7QXUG5wXA
         uK0Kq241LyvhkW1KF9q3F7isbwnuAQhAL6GgL0Oql8czdMw/05Tg679dg2Ik09nP55Ug
         kCJhLYrrlsEeiDqR0Mb5/C0IhMYnGSSQEBTiALBvj3bHm3oAT2KaoEpgNgNRbqT6b+F1
         1zYA==
X-Forwarded-Encrypted: i=1; AJvYcCXlz+QFOiUmjcB3uZtREDMm6ZbquZyFM8uNSnO0M6Sin1WaqfAbivfnW/5y6avygXHYLqJHH3MaV++hPrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcsc6Rk8jQO6OV73XILNSAneXiZXenBkTtw58QbIdtlZmOy11U
	Fa/4Pd9PKDamnqpjDOHjlGdi99y20Bh05Xnfknf5Fv/u7gyUIl6vlCGmgW0VO3Nz8ns=
X-Gm-Gg: ASbGnctp4ElxT0BqHngIg5HMdgPHhjTVt5WHEm9s4Nam/qd4aEOKc0eZjEaCcNnQ+VR
	5oi5PE7BURuYZQYQicRkJ6CvcBYaQwjv2Yzji6KZMPV/gyiQnqk3jW/hNbUojM9h/BYSkV5Z9dh
	5al9txoG9F6GccTu6RQUHWodNfH9tNWQdktkTh1a/g+l5FBJqmzhciFUcxVzFWcIiNeLXvajDvg
	yQbNRtcus7kp2eGB9syaJKLnvvGiuumire6Icv3BSme5d0/iSQiDq/HqX/Y5aFFNDXP40drTKsr
	BW8VB0LAlqog3qMdhRagPNcPcpVXJeJyO6Hu2qLyPGfE/XzmG0KQ8T3G
X-Google-Smtp-Source: AGHT+IGH8f3CnE94XpqqdfYVCG9k/7hxNJbSdjv+c/qZQ3TVj4IPHFuU+kXHjf6bXNo01qdvKdGN4w==
X-Received: by 2002:a05:600c:871a:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-4520135f5cemr25871865e9.11.1749200693818;
        Fri, 06 Jun 2025 02:04:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45203e6e424sm17461325e9.0.2025.06.06.02.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:53 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frederic Weisbecker <frederic@kernel.org>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <aEKvMfJ63V7i-6xU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __mock_request_alloc() implements the smoketest->request_alloc()
function pointer.  It's called from __igt_breadcrumbs_smoketest().
It's supposed to return error pointers, and returning NULL will lead to
a NULL pointer dereference.

Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 88870844b5bd..e349244a5fba 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -290,7 +290,12 @@ struct smoketest {
 static struct i915_request *
 __mock_request_alloc(struct intel_context *ce)
 {
-	return mock_request(ce, 0);
+	struct i915_request *rq;
+
+	rq = mock_request(ce, 0);
+	if (!rq)
+		return ERR_PTR(-ENOMEM);
+	return rq;
 }
 
 static struct i915_request *
-- 
2.47.2

