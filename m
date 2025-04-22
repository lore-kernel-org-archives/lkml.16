Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D9F1F12F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318686; cv=none; b=o6lhELdMXoulOf9F+/Xa61qMKWM4zJYG1oA1iYh+Rs/GSnyZX2N5LgOYkzjBa5TP4HVnF94LW1w7DU2nWxjtsKprLOh81bavhrmCsd9HTt9hTSMejlU1BmFVoWcoL3x+l1Luw8gqIg8PDXqANBPgFunC/4GJ4KLhr5aDmcY/aRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318686; c=relaxed/simple;
	bh=jaIK3y9skttjOZKNe7Pdvk/sD+BmWmSRwYZmKO1UDRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drwLUnSMDcWsAhBDfb695URkoMlqeAJVdgshbNFMqaTiCjbpbUYIgWz0pk52DNp6MoxktC8ByzbipeIknVzpkt0sJavJZVW+AQhGXcm8VXvW9yV0ufjm+09J6FhdSFlvLB4AGlU2IlykzzgKyBIvy3XMmjV4PJ8l/l+Fu5iFync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arkE2kQy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arkE2kQy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso41157645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745318683; x=1745923483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2ZlSb8C4TopIE9lOnaluqGxSWa7ZTy/niRKFxlJXsg=;
        b=arkE2kQyThHt6WlohJEBhCB+n9V6jgMfdVhAL0onHrxt8jDojvTT72F8LICuqzKnxy
         PrAmNgkUH4RjEQyPcgntght4KJJKzxOGBQTgY6bCDcVSnZndZ0O5kwEpAgY1ufMAcvwi
         iVqFim2NvgAICptpF1nU+WJDPIWHyHPTjK5dQzSeLrZotitKcSc2xsKZtMgmKJp6wMqo
         BtxUZIROgAA+TQAz7q4Tfd7wiRjsTMxhqd6Dfomp/bP3z6Pb8ULex1Es3XfpgzeW8ETi
         pncbEMQFyjRNyjik7akh3J7p2G41smDEAZvIA7JimPSQfSr5cP4O7KcG6xhWulVriLH6
         vyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318683; x=1745923483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2ZlSb8C4TopIE9lOnaluqGxSWa7ZTy/niRKFxlJXsg=;
        b=iO783GvrjOjNuXy/GegzIP8hcVeP3t3dUawxyQnMMsZ5Y45moqwfT/smEvBhaVGmD7
         4uXnZ+WpBYFjaPKoG6f7CE8IGko7q5SPTxEQne8unyqu8/WSIjMW+YWgSWBgjUTfmrmy
         lmZ6imNhy+9miahUWtp7hpnIBdCfbmVeRzF1jHVhPD80TkBMdgDTbteDdqM4PzEcB8Xv
         wKSuAtRgqklXut67PeESx5zuSGTbhrUNbrlrvH4WnWrhjbaSJgsK3qsXtN/l7bHUrvwf
         kTr0cTeknNjgydXaXANRZhWk7UKLhjQDoopR7LqH78fikEqYkSAqT170JIPY7fZ2Fc4t
         H27Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk3EFx7gJKTF/D2YYiLYGR9yJt/4b3L09WuYE5uUf+DHPdtDbKtXFOw+28KznnzuUZc2bf5+jycyDVOtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxzmAi+L+G8m2gwUI1AQbgenvFIvpZ8jX65IwTmIl+1VfnGmz/
	ExodLoPPplVx3S4Jzds1l+Bzmpl0eMyK4LzUfHB/48ag28lNOyOOh+gXXRed0aA=
X-Gm-Gg: ASbGncueCzZis1EMx7yVgYw750eb1W7UUBMXLK0sDApCwr66okETukok6FDj6o0fbaj
	seQLr6ajMkcW8OhF9T+0rne8aiA+HKbPXGTNzl0JHBAqsL/cdZzYwONOakWQX7PhOBMHq61cynK
	MmkDQrRsYW5SJBbxcReUVR9i4KjJ8KlRQ7dOc1pR414mHY5GA6lS/ZavuKEbs8TVhSJUaKTTAe5
	2ZDNGq2ZYkvmpsC1xHdv94dpNj8yQ0+u9KxB0V8Q74vZroMUpstmWcFDngN/KW5YfuEXV23KC/M
	xkJhxAeUl358qvmrBtrqcOnAJlOGfSqvgGFq7tvKAodCiRw2N3PXrYAg
X-Google-Smtp-Source: AGHT+IGmQB87kk25ssevPLdZ7b8PjzlRTbK4qnCrbpA2fIVwAWfGo22Ft+WhXErpVr6BVQJ+4nZjZg==
X-Received: by 2002:a05:600c:5395:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-4406ab96f63mr141741765e9.12.1745318683311;
        Tue, 22 Apr 2025 03:44:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5d712esm166577665e9.36.2025.04.22.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:44:42 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:44:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: sj@kernel.org, akpm@linux-foundation.org, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs-schemes: using kmalloc_array() and
 size_add()
Message-ID: <adbc06d8-1a6c-4279-9596-d743505d64dd@stanley.mountain>
References: <20250421062423.740605-1-suhui@nfschina.com>
 <2713f419-760b-4ccc-aeed-de9c4c899506@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2713f419-760b-4ccc-aeed-de9c4c899506@stanley.mountain>

On Tue, Apr 22, 2025 at 01:38:05PM +0300, Dan Carpenter wrote:
> On Mon, Apr 21, 2025 at 02:24:24PM +0800, Su Hui wrote:
> > It's safer to using kmalloc_array() and size_add() because it can
> > prevent possible overflow problem.
> > 
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >  mm/damon/sysfs-schemes.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
> > index 23b562df0839..79220aba436f 100644
> > --- a/mm/damon/sysfs-schemes.c
> > +++ b/mm/damon/sysfs-schemes.c
> > @@ -465,7 +465,8 @@ static ssize_t memcg_path_store(struct kobject *kobj,
> >  {
> >  	struct damon_sysfs_scheme_filter *filter = container_of(kobj,
> >  			struct damon_sysfs_scheme_filter, kobj);
> > -	char *path = kmalloc(sizeof(*path) * (count + 1), GFP_KERNEL);
> > +	char *path = kmalloc_array(size_add(count, 1), sizeof(*path),
> > +				   GFP_KERNEL);
> 
> Count is clamped in rw_verify_area().
> 
> Smatch does a kind of ugly hack to handle rw_verify_area() which is that
> it says neither the count nor the pos can be more than 1G.  And obviously
> files which are larger than 2GB exist but pretending they don't silences
> all these integer overflow warnings.
> 

Actually rw_verify_area() ensures that "pos + count" can't overflow.  But
here we are multiplying.  Fortunately, we are multiplying by 1 so that's
safe and also count can't be larger than PAGE_SIZE here which is safe as
well.

regards,
dan carpenter

