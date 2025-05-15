Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05B286D5C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299204; cv=none; b=KmgJakdWBivpJoYMN7vuvnMqz+h75Tou4XQ9+7bP5f7MH4DvBJ/jBk0AKHk0Y0YXc0EsJEmBXFDY50SIo4E9oXIPAa/ZQO9gBzTztdrBqaMLv5dqNDQxS2l7UTeyqhq1+MYBRQftOJyuM2Y78d0EkD5zeTWJWOOcr4T3L9UOjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299204; c=relaxed/simple;
	bh=lIfNCPP66O5sWacTogM/feH6CoiW9xHNdDEGcTAOa1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+r4HJta0kq8K0ayF1jBzE0yq4zm0FF9BUdQ+yQgUMn1wHaCd4f+DopX0u5fBHOypPiqKLaxLuAB7zFmW8OzgZCh4DSoG48bQIl6LVZXdOEmbflMnQHsXZfQhvVnCfpF9Im+ZM9eVLUTjljyb6kn3NVgC/yARkFGV5oftj7lpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=JIbYk9p2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="JIbYk9p2"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b24f986674fso642518a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747299201; x=1747904001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=JIbYk9p23k25N0ts46ZfByaxfR0wUe8eftbnQ8WcAraUkc5xwLHLFqGjjEukAywz6N
         xSR1QlxoxfR27yuHr2SMsufGmo4iLnqENPkJKf0yWc6eUI7Ip51A+C8pXOwOTTsMWTcA
         2m21uEEzRYwdxC0NsLOM2H6iSYtdMdDzNxlQI2FLcuBTS9IyA/b2O+4ZzbywUS0ZM+Go
         M1ln70M26ZUX26+5VM+EUUV4+kf13mIc9ImYLFzoIxZSZuYL8fXnC0Fnomg92SCdwsy3
         wIfQATH+vKhLNKmwIZ4b5TPob6Rp6xCh/kSfn2VeVPMTyC70Eyl7YnXo+D0KjFRIaBor
         /I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299201; x=1747904001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=CVjlZ0B2QNgb1EZNl/XnJpj+8t8ta+wxhiA0LKATOCqpWkuNVYXkBbQLm7O3I928l6
         Vh/B6MyX8/dR0XUdFqjHgr9Aavz6a0UjdbJRe3l2Krur7+H9lPVnzddQcjpJNhDCgGkf
         Qsr04fWctyjwIBy81yuZ79kq1yTwDimpiYWXgG3n4GU7H1Bk0RS/uI6nL2Hr3Cmblg5u
         b8bghCSZqDSzgjyHH9BUez7rYDpwmfzw1RbRyvWArGfaiAM9DwPksfS/A6nNdOYFvv5T
         6PJDeEMtCCbZ47UEc2m2WmR79LcKZskJS+thDy1ahNK8ppPrWY6lVyaTclXwAnBI9ooP
         jMyg==
X-Forwarded-Encrypted: i=1; AJvYcCXcoVmHaXkryE7CHx8z8uWbtSULm6Iotwej9y+Beobyh0Yx52CjZzdxwE+U5rFl5I2ReSMMN7d3EJInguc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIFTvtG/AURyWyKOhha3UQOlacL2RAcAUO+/3xMwUaKs6g890f
	/rCL+2ZEUfHXuv7OoouF0giuhWs7ZBc8dF58qDS+gi8mIpSL0quAB5MaFQljxI0=
X-Gm-Gg: ASbGncvO/yx/6iX4PFYwDjk1mj9o4BAEiR1nJYNVjMgoqkX2lOO35AK5gWJb8nCcxag
	Y7MMWvJNgkJ3WoBUnetjqNm85brEPP+ItQ99DyUYaYGSYGpKonLgI9yW2P+SYHrNYfLW64POB5I
	DbTJTBoxJbyOg5rRbuHJPV4gcDKiic4272/4oGIZdg/nNABgRmDKnHx7Y8obcy2ffgTVk3O8eXl
	CHCUzzu78tQxZYTNQKe8caxDxEaLfNONdpUhESr3pHhPwbeophM4J2++FhwKQK3dUuBebH1LZ8+
	tVQ1S9GIMqwI1fEtdxlHeL8w04ad1pJlxg4z1KM/5LwW1Co+6uN+evsbWDnUfYEy96DUrF1bupJ
	jWZdeLwUrfv5q9hntGs7tWpJpcTKAXuZs
X-Google-Smtp-Source: AGHT+IENsPZ/AMQVPFzwdzV24c1hYE73gMI1F84hexuGBFYoNLNqWR0VXSlco8GETzsjYyrN3LMd4Q==
X-Received: by 2002:a17:903:1252:b0:21f:2e:4e4e with SMTP id d9443c01a7336-231b3970b19mr36155395ad.5.1747299200653;
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742f3csm111237665ad.99.2025.05.15.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:45:40 +0800
Message-Id: <20250515084540.1558914-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515083706.1554823-1-chiang.brian@inventec.com>
References: <20250515083706.1554823-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 15/05/2025 08:37 GMT, Chiang Brian wrote:
> 
> On 14/03/2025 07:11, Chiang Brian wrote:
> > 
> > On 14/03/2025 04:28, Chiang Brian wrote:
> > > Add undocumented tps53685 into compatible in dt-bindings
> > > 
> > > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > index fadbd3c041c8..c98d69facb48 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > @@ -380,6 +380,8 @@ properties:
> > >            - ti,tps53676
> > >              # TI Dual channel DCAP+ multiphase controller TPS53679
> > >            - ti,tps53679
> > > +            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
> > > +          - ti,tps53685
> >
> > There is no user of such compatible, so how can it be undocumented?
> 
> The following link is the patch which I would like to add support tps53685,
> and I think it is the user of the compatible:
> https://lore.kernel.org/lkml/20250314033040.3190642-1-chiang.brian@inventec.com/

Sorry for the wrong post, and please ignore it.
Thank you.

Best Regards,
Brian Chiang
