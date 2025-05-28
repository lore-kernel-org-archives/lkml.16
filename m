Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386451B6D06
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448945; cv=none; b=RoslpByZxi0M25itpCAS7/qYFRea+duRgQZeTIy6F+bMYy/ApGZYfWNVdQKXEcPAQqaEe55XPt63+3OGLJgaHUg30EBEDnXPkslg8tWK5rcdHDmp1MMZrUrfdsQ9C8yQPMSkBuO5lcAFfzgsc021WO8kasYPQi5ZfnojpNj05LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448945; c=relaxed/simple;
	bh=7szsciP4s4R9wknqXBXBTZqN3lbaKfXPhicwDQ8Hmdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx+eQ+Rpr16FWfHePBZD6v/We6w9KcfWrxXrhTEu8rJMKPlcDnHWTp6eUUCL8cSCZHSfaqxebZ7CI9GC4Cgvns7ERejL4HINPqyhBQ2BsebXuJ2vsiS5vbtUlztr20U8Gu8BNlcRYdr6VAS0mI4TJ5d6jB7KchWwIvQ6F0s7s/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL3Skzeh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL3Skzeh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so432465e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748448941; x=1749053741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+C1RzNTr6MbSo58wcEFxOVAmKna9VJA+FNUjpMEd4H8=;
        b=gL3SkzehCRPTbEareMaVrIuuL6aN9um90oEuhc5yudHJfX8iUpFwRjTv6VAtRpVUEu
         ecAF5HVrSVpLSDuTcwdCGvtq+A3LrsFZWosbDZi4JZQaHdkErRKv9mq2KROHE5T7r47x
         K+JFF1SZaGOziosFC3+L0UHqqfItztS6aMDZeNddyNnIyuQBrF+nR/75OSlXJZwtTEzY
         dD5nuonu3a0OvG1FFjc1Hp654WRktMqyWlWOILhcM+AJBXOP9HoQuitiDqLX0LdIMtYV
         AXH3N04AZ5E+nRN1c8ZtvKmDrBTMlLTOa0cR2rxDHdbGDSUMGTR50BNX/gOuVuqJR2Ox
         mQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448941; x=1749053741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+C1RzNTr6MbSo58wcEFxOVAmKna9VJA+FNUjpMEd4H8=;
        b=V88Rn+6y39M0m5wiTN8LO5oOV/lN9GHkKIJy4lj8TIp799CC1TTVipeXahqokaaOD4
         IHseIa01yrYxA75pEWqkqGElxWZ3uf9rzC/hAHa9pG3BgXUY3vRnynqXuioNyITX+rLj
         qjIi41b4BFVNFM8cUMwHcKcDk7RCMA/2rHdAUilrq8WMmVpksfqjz1jvgxJEBD5KAMp5
         pBPFruoNC+yxUYh0j53ZBGr5sYunDHRvhK6xKFRvpTYxmcibHrDb3WjGHoWTC2HlbN/k
         yzHmpLux6fQovZT4IHSpqbJVK2PF3bgXaszgsGQEOuQPZdzadC7Ouv8JJwPNUGlBlYdg
         nfIg==
X-Forwarded-Encrypted: i=1; AJvYcCUDb3zpPCBQa898vlNL4I8WYxy/Nb1QzLXl1hKLDHYYftCGxs5NXV/xNfILgKMK97V3Yh3IUkUps/wq4EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQRBV+MkKuZFzpy4Lbn1xUV17/ot8on5VH2p7462za0naOARhI
	UN3YiKE5IpqMNOWXvNcpTVtyihz/+Ory3t1GWvepOL5kL0lfhH3GDK4xOceMqjPG0Uw=
X-Gm-Gg: ASbGnctI9+MIb78qM0NEfmdaRp83ogGhW+04hzHazg7r5yh4Weltq5lY/1n/87RWovF
	oRTl7033zECstFPrvG9cv7mLZ1aceATZL/v1IqwlXicCjxK+ZcZiPYPzkuopmGT4HLvMYgKptZ0
	LdBpGMSphs6pTMRTFp9bevPPeHNxjv0F91JfT2YSAfMOU1YZe3+HKKSa6e2kUDWXjHsC5YYZ5kN
	IM4STteYC5drstwzMp7dxj+yvFxBcu0wb+mkMLwGO4H0tqTmTdolMxNyBzqNM1+ge5Vhzrdmkxt
	kvz0bAgQJ/0bvqaL8BTwTqNYjY0H5a4+EBrhNWYogNw6SejpNkXg3V8=
X-Google-Smtp-Source: AGHT+IGY3B2n3dEpBIQTEIc4UcD13zJbfNxCVilIBzIvGrsLXjUktw06sdl/F0Rxa0Z5ypRV303Ptw==
X-Received: by 2002:a05:6000:2389:b0:3a4:d238:682c with SMTP id ffacd0b85a97d-3a4d2386cfbmr12567851f8f.53.1748448941430;
        Wed, 28 May 2025 09:15:41 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac8a74esm1859615f8f.45.2025.05.28.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:15:41 -0700 (PDT)
Date: Wed, 28 May 2025 19:15:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>, Fan Ni <fan.ni@samsung.com>,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] cxl: fix return value in
 cxlctl_validate_set_features()
Message-ID: <aDc2qGgYVzXMSUpz@stanley.mountain>
References: <aDbFPSCujpJLY1if@stanley.mountain>
 <aDcqO5hlGrRXzIPT@aschofie-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDcqO5hlGrRXzIPT@aschofie-mobl2.lan>

On Wed, May 28, 2025 at 08:22:35AM -0700, Alison Schofield wrote:
> On Wed, May 28, 2025 at 11:11:41AM +0300, Dan Carpenter wrote:
> > The cxlctl_validate_set_features() function is type bool.  It's supposed
> > to return true for valid requests and false for invalid.  However, this
> > error path returns ERR_PTR(-EINVAL) which is true when it was intended to
> > return false.
> 
> Shiju - Can you trace this one through and add the impact statement?
> Wondering if this is going to fail gracefully, or badly, further 
> down this path?
> 

Sorry, I would normally analyse this a bit more myself, but it's only in
linux-next so I assumed no one was using it yet.  It ends up being fine.

cxlctl_set_feature() has a check for:

	if (rpc_in->op_size <= sizeof(feat_in->hdr))

at the start and sizeof(feat_in->hdr) is larger than sizeof(uuid_t).

regards,
dan carpenter

