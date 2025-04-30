Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41757216396
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001650; cv=none; b=S5f+xfyc9i3QbKQe7hsRvbh9y/QKvQu1F1Bn0vJ39/xky8tP7WaBjtwHNdtiLTGf5QLvcwpr4GvQK9RWgwNLFbd+WrQgPW3l16Uhkm4TOmkI+I07XwLl7d9bQ2x+H5Y81/98jWGAGrjLDZwPZjQWd9DV+pw+BAvLnowxby65qyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001650; c=relaxed/simple;
	bh=xPP7d3J9Mbr2HWLZwvqRyujPuKr6mcqoJc9CxFzickE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BydmKjOMcgEo3neC0fPRY+7NrnRa3xe3AEbP7V/SFWM6v9vBFg4VRDmAvLfUbgsxSGR9FOekOI52Bb3op41u5VZHe9FEvYYybgIrYrFoGyIaPxAs8hwM0ryFCxN2QZjdkroCBgyF3Syv+q3JAC/x2VkUqA3BLtzA7jSJPUy1MEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGUnTNVx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGUnTNVx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ede096d73so46674635e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001647; x=1746606447; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRxUK2FUEvHutdWtSofNv9/gWau2hfAWBjlb4ZMxnvk=;
        b=yGUnTNVxneNswlEqap/AcAMeh4io1lZHSWnOlMOeHH+0k2r5aofIDLinlnNAWudJ8Y
         I006Tqebt6qMuZ7kXnU5POsNb9qDoyBHpmcGjfnRLVIkeCLC4vxFUL0EeTXmSpN0S5nw
         qxXKj3l3sjVLOEQLZ7qyQlrQ7Buyaax2M3KPkNHrEGDHcZr/u2Gv7m+c7ZxaOyu09dY2
         2zasulIkA79FNcCI5/hO7buR4Lrfns1eobdNPNenBZq/8WF5LpcCJr/y+FQk8idjJuEf
         yEB6M6tRTCij5iCM8sc3PeGx2Qa8CjO2BL20erjdv0d3kM2hnkIHP631E8FmHr+E5se+
         74MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001647; x=1746606447;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRxUK2FUEvHutdWtSofNv9/gWau2hfAWBjlb4ZMxnvk=;
        b=I98v+NsbrK2rU7HFMhSit329nZu/vY/gykfDef5Kzqa+qACfATaE15cpLa6obFf78n
         KhmkqH1v/rWnGHFfUOsS5ornO6auqbBL6e1TzPCEmJ6yMjGEa10FWi/cWlBvO6NtmXJG
         iOuL7/MnNy0PHcVCqV7omZIw2xKrqZ39JQgv/t0EJAnEP1WBZDNJoeSqjT4kuSl4G1tN
         9GapGvBaNzuMO+ZEoioL4hzAjM2vbUr3ND+McEd1ZFTN0bKHprALJX6lzBfP916wzQoK
         RhpNWaRKX1am4muWlG0Nu9DvhjyBF+LiPfY7qB/cGXm9JBkgCto2wDsDcHnJk9oKdFCu
         2GDw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Dm27utnxyPAXRx69wnWQcxUCsbNsPz20M9DMnzOPYpAPBBfod3QDIr+Ugc/d5ab8OYsFYXIs74ldgJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyylzo49bh52vhDqCVOp1w+9Azqwc8iiwD9g0wFAHoyb6/WkVNf
	DFgRiG7fjEnlYn5dQ15NVgnbE4G3tsBTk2JYqvMJh56LKJw7iHEBWpjeY7NMbnE=
X-Gm-Gg: ASbGncuPBIqdl+JoppEl8d0j0o8x75e8iGqoFMXVYPGE7Vbh3vITCU1gZTXmt6GchLB
	5dwdpYzlBhunIrNSMffCL/fg3RMbKHtrv1+worH+jXYGxbSUpULw5jz5YVLcvUcfGVkgYvqjMvP
	sy+BEOIMBlfttH81kkc5f1bFQe/RNpmcfp+Im2fMt/5xSzXAcx9Fi/jOvU8UElpBX7YLcFcWR7e
	0pGP2rv5NvUnAYWPmhR4/VYse5Jy0+ROYwle8ntc2Zf9SUgBpAWRHZ7vG4LmYZv4NTZS6etFsu4
	0TLlVjqBvk3EWzShZ5CL9PI8YgX0jl3CRnYojzjWNLqvGA==
X-Google-Smtp-Source: AGHT+IGLgSE82V30QGFI2YTNb5zjWgrYnQeumoN54mXutxmesQkpkc+itpXoS/eNr3nk+ofe2Yujeg==
X-Received: by 2002:a05:600c:348e:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-441b1f3060dmr18338955e9.7.1746001646622;
        Wed, 30 Apr 2025 01:27:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecedcsm16461545e9.15.2025.04.30.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:26 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shravan Chippa <Shravan.Chippa@microchip.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/3] media: i2c: Fix some uninitialized return values
Message-ID: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These were a couple uninitialized variable bugs detected by Smatch.

Dan Carpenter (3):
  media: i2c: imx334: uninitialized variable in imx334_update_exp_gain()
  media: i2c: ds90ub960: Fix uninitialized variable in
    ub960_serializer_temp_ramp()
  media: i2c: ds90ub960: Fix uninitialized variable in
    ub960_rxport_bc_ser_config()

 drivers/media/i2c/ds90ub960.c | 4 ++--
 drivers/media/i2c/imx334.c    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.47.2

