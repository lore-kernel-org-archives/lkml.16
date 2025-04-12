Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F61A3169
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452923; cv=none; b=YjVg2ieRX4f+ZXA7N+/i9yvukwBvKJ+ZSe3wolA1QCDEG6hHHj5bzZPm0Y7dg97jwPgAXZyGgg1uoVpYyEsOzxud8o9JQwdT2vQRKAQTaLpwnBi4HsHAXUyhBgThnVIsGjUhOX5ibEQedkypVRKGEzaHpMD7S4VSh0agv/oI7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452923; c=relaxed/simple;
	bh=BqrtC68kvn5BE9H9YCrsaplk6/VrQpydGI+G/P4WsdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jS6wjICzgWysSqPIW8tVx86KA9pGH0WYjGjRvhPfHFCanVR1BD11i4O0GRJH4L7aO7WdKuZnBcLpUWjGpCqEE5dMtkcTFBM6fP4o3eQn8+QU8SGqgXjZZsJxLRZfGcDXrfMLcVZGCVGgFACkXw1gfC09Q3QDinLiikt4wSxI9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6oVR4nr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6oVR4nr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso3423509f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452920; x=1745057720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ugvrJgRiDNNRNpdggE4rPF10UbTBT1GSj6+8Qk5pqs=;
        b=M6oVR4nrpZoopLaQwHt/Av3GjrjcjVktwPDxUHnOYO7BKFCI8FVVkrcldC3/A4FfWU
         ydZC0tdu1GgYkaoS1PBw9vqjsRlnsCCqyJx0aiXv0cqHhXl90F3ram1HzNUZTR10soRY
         2U9jVprQKxwscF0oNCSY1r8Hd/Oc4HhUWrV4RV5AaRgjc+yGrWUExQg25KWfgqLyVief
         hGLx+juwZ/mpsWfhKWMK00ltmOMVPJZSsUbn+fd6VcJbN8xCbb//L7rEoAw9ee38DU6w
         j3ErZUIDOz+qJbKBykP44hOUhKqp77KvwNPOzrlniNEepcSooP7UST75ppHDkRu6CINL
         jbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452920; x=1745057720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ugvrJgRiDNNRNpdggE4rPF10UbTBT1GSj6+8Qk5pqs=;
        b=v7BZjkuN6Do67tkcNfHGHaCnIls/UhcACPS+ori3QY1KVC2kLM3tAdLARO15Vq6hps
         3HgDc+G5kRjexSuIchjD2tvKpDOo0+RCQn3bln89+hPAKDRk+qrR1IuMNowAiU88acDR
         cg4CPUvYhRqVaQniOZC+mr1n6Ox487dCeZgMOfb67A1a6BOjjo26pEMZfWJ+QufbUBHM
         aaI3Jp60y+HdvVx2DrbYmc4VVFCbvsgpMGluLkyKCKNHr9Qx2tRz++zSbKT/POOk6wLe
         lNxsYeTlFBI0BR0fTmvPpyFV0nbTuc9560VhA72S2JLLoMv1Vz3tG+wbsy41z800yxa5
         tuBg==
X-Forwarded-Encrypted: i=1; AJvYcCVudr4YMjzSaVpY8lZGGyFRm3Dbr99xnwy2gOsO1xvxHyQKUE9S2/isF0zmXne6YI6fhiob3wch8MOwrbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9+QFCCSo9hB6/k17fxd6kipLZYVc/rb+dzZAxwwQAbGubXwGO
	Zqi/ASbxJvSA5g5f0p7K5y0cb11DytPEd3+CwtaJAGim+t0kvInwAzDUwxnBJdM=
X-Gm-Gg: ASbGncuD3Gy+3TJnA8P4mwFaq6Inv/SaNWKbN3DuJ3OOlGqv/ltQNyGz5DEb4JZzRst
	+IEliTCQ4etrpzcFOf+2P2PrE1jKSU6pisNnnSgm5qQN08LQJZxw7bkl+VVz5/n1db75rh/U8V5
	0LIDMgP4JGPvatbuxicz6QynEIohD2scC9Iz43qx3hMOrRKsz8wQLSKCgubLvv0Xqf4A0/mLH/0
	gK8prtQza5iOKnG82GFfYf+gGeY6rX+3RdSMmwCh/zS3Tmhcx8ONbVokgNKUzQSr8YeNdgmganj
	kHbvzsQF0wtIRC8jqee6zwDVUqq31+MxEVkfubVWIeI1Ug==
X-Google-Smtp-Source: AGHT+IHrvgEuNDUHTE28uOmHTesN0mZlwCY5vOjmN/vbu7hehpaq9Iwk/+wcOFz2JAtbh1IuF1BaFw==
X-Received: by 2002:a05:6000:1887:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39eaaec7a7bmr4206852f8f.52.1744452919627;
        Sat, 12 Apr 2025 03:15:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96bf97sm4590106f8f.25.2025.04.12.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:19 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] gpio: aggregator: Return an error if there are no GPIOs
 in gpio_aggregator_parse()
Message-ID: <9dcd5fda7a3819e896d9eee4156e7c46c9a64595.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

The error handling in gpio_aggregator_parse() was re-written.  It now
returns success if there are no GPIOs.  Restore the previous behavior
and return -EINVAL instead.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e1b2efc0df99..62bb50af7cda 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1128,6 +1128,7 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
+		error = -EINVAL;
 		goto err;
 	}
 
-- 
2.47.2

