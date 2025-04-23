Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393E26F47F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396278; cv=none; b=C0577VPqs630Vjq5ahQCeFeu4klaixB/kMwb3AXYt+jb2scK8B5/BQQOCOqoUnMdQtqFkAOlgLzWc+5JJOsYj5JJUYp8mJJ7WedzMG74+JiUhsHmNrt6TpbXwfomUucWoGKCubuzMy0EH/hEBFj/yokonFJXR0sR8hDnSLOtYJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396278; c=relaxed/simple;
	bh=oj5Razb0evj7qw4mlQSndhKoTaML66NQzQjFs2IHgj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEIzZcphdKfIEAKNlobfP/9lTe8RbcLoZ634bSc2B4T/0lKsKGU1TqLh7RSuXsL08sl5kM7l3Opap0p06Im8nf3i7Pna5tUHXOMm9fDAuXbRCIgw3wLqNOa4ADJW8BPml/BMXzUywUF7YvQPwA19rrNyobxXoP+UsvDsoPycZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbNcV99f; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbNcV99f"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5075087f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396275; x=1746001075; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJlsow9pFCETuSY99miJym+mwybzmiktgCsSrbNRcQE=;
        b=nbNcV99f3Ge2+RvsUzIS+KXozOhDCyHgqrm4E0UY94qA3WuYLz2Q/f0v1sd2+FuMYe
         Px3UQxcVCOyl2VNRaXMyjMgZ72CDecXBDkzmAJRsdrcbFGJEKy9AAxh/U8pVbfxT3LL7
         e2MS8TuChfC8UTgMVl/cjGsYX6VXv8AkzhxtrqzWT0zyoEEskVITY4QAylOVC/LzQ+K2
         0SX2ukAr6f/vmdcYGCRv37h8UD4FyZ+G2IWQH4bcdMliRJKANS2vdcQ+z8MOxPFbJUsl
         /KiKzOR4W2Gdrl8+lNWMQBweHNdtCoEetjWyzoO4XSZuypi9M+Ap68L6uN+k02n7vCgw
         eAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396275; x=1746001075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJlsow9pFCETuSY99miJym+mwybzmiktgCsSrbNRcQE=;
        b=WH0jU62LSYCYkbuzfUYc0ujEXv7aB44CFHs/2QK2/Ckr8ztK6Czp2mvGIcX0fagM7A
         HBTwl03AGrQZGG9ZfegBiaFn0V18X02z36N9xiidnZwtRKM0MQTRyyz3jkHwvpbwknas
         yltdSglUoS/rgCOKTmYribF75ghjR6UX9nquEOaDNPKPQsfW9I+je/14FLSCFJQhsY9D
         2j6WOQrWrdGfii71k94gHY05xdhkJM8ah8r4Fs6BHvwXtGwqYT00PZm3ej4IrRWsxD1U
         u9kSErvyltwss2NVxedcuh791Hu1ommGDcaemSX3l5rU7/NLad7ogLh5KymD4Vd4btJf
         +MDg==
X-Forwarded-Encrypted: i=1; AJvYcCU/6zSq4N25PZvt6+VbVsz9JCRI2iGjH0le9k6NYvhIDsLHp3Z3RhcaPLeoZwb7ETnc6Y51Qd6TBx7KQ98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJZlbtNQRP9ASJgu30cOIjJ2lE1kyV1g1RbVa8Thu+EjYpZJOA
	kS96Cem7KqcEs82q25iDL/ne4UEXM8B1OYxOjHXjv7/eHooDXb7NV2iU7IhGvv8=
X-Gm-Gg: ASbGncvvbS+VAEJYFaU1tI0XpoAnHTACtdGIxQ+cXqTqWn1Yiw62QXcq+2wbolTXz0w
	WqDQHlOHhOSIAEYOvXZf0kqxpSXVhLDpzSGDZmwwFXtaEq6s3jHvj3+azOf6q1R/Cl1KnQQgR6h
	8jzZS0kRD4KJDzxkmEASh+mPMIoG9jmDoFokBzpg4pEklq+Cmg1F00N3hvGo3G4oAz6ysuDJ558
	89L8mB6e4njrfAFgxzCR9HKhpCpbgtVX50o1PPiBMPwq5DUA+TNmohW2lmgua+TLDzZbmJ1fvob
	YoGMeesSyyWsTZuypGfI+pAIZpC+TtYppYa7DcimuKv/Yw==
X-Google-Smtp-Source: AGHT+IGFDsGRWEWEl41iqXxk8aBjeIQESD7eXixSYt8kxgOh7t6MkCbRrpyXFS7pLyu3bxpPdPkSyg==
X-Received: by 2002:a5d:584e:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39efbaf5562mr15384290f8f.51.1745396275079;
        Wed, 23 Apr 2025 01:17:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa433170sm17690531f8f.25.2025.04.23.01.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:17:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:17:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] driver core: auxiliary bus: Fix IS_ERR() vs NULL check
 in __devm_auxiliary_device_create()
Message-ID: <aAiiLzqVulfGDPsl@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The auxiliary_device_create() function returns NULL.  It doesn't return
error pointers.  Update the checking to match.

Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/base/auxiliary.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index 810b6105a75d..61b876d90b7f 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -491,8 +491,8 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
 	int ret;
 
 	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
-	if (IS_ERR(auxdev))
-		return auxdev;
+	if (!auxdev)
+		return ERR_PTR(-ENOMEM);
 
 	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
 				       auxdev);
-- 
2.47.2

