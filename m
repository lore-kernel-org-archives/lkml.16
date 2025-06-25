Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2422BCF6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867136; cv=none; b=eKwyURfFtBYTsMzscZ4C4rERYhCJXas2StlRGvMmxKsKLswM6pRdwPiYV+D9dZz0g7tp81GHhbrRRck6S+7RRVVdtZj10IAYr0tqbREEMhJDtho7+lWk4kDJpFSYp1j3SJJHuFEwwWepLuNbUQfoAEne1kuwxusU2L/WR0PEXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867136; c=relaxed/simple;
	bh=5ivSU5P1ybOP4JXEyPg2b4KE7hth8e9XxndTgLMPwek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAnQS2CGpKl7HkWEOTcXfQPqrOq2bjkHVyCuzdCVwKocbWDjsxFfR2mZkSe8VrnrfZKLqaYM6N7e/DucTL3aces/So2JpwqGLKM0drq/UV0z4iQzzJAylJ9SDPi7LEAfrCCbndE+YVbice2c9s/G7hWIFMnZO6xRZhMuNZXMdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h4easKFl; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4easKFl"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2efbbf5a754so63694fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750867133; x=1751471933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S50u2pGmO0FJNNUATSBkFdTyq4cP6tNm57kv4SYiUhA=;
        b=h4easKFl3gNSZbbw3TX8q89MHFIeYi+sajm30MVRaNq97IZnerBVflGYVim3nf7WwJ
         cf1tLbBxnM2mLfr1+EIybCkcwnGnP+ulxM347jWEBm0fOvBRkp+b8KDbulOMAqpG5oD0
         dQjvOSmf6UBugRsp44Yp1Q6F5/Kl+A6e1P0Il+MCO2ejYdHIACS8PA0/rN9N86pVfQk8
         R8BKM2D0Xt6oM03CRkWdE0n7BAZd8hFUpV37LPyqaB0MB2rHH1nairxKN5xPq3LZT2F8
         bn6KO2pOyfBsSreyKWcbLFpId65ebd1ZizyvAtoyrL7id9YKrqfngvjgIsBeKGhjzLFm
         yoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867133; x=1751471933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S50u2pGmO0FJNNUATSBkFdTyq4cP6tNm57kv4SYiUhA=;
        b=sOHvVeAgawPGO/TjF4YS0hfbLKkzQM1BjVgUP/USkG8QHX/gUk9zAdexq7KTkgwjnA
         Jc06NGPf6ZlCJoc8d8DTlo6FOAwBfgDpRSTTiDm9lBh57drMYCc6jBgaVMhHZgT50cVx
         ZEHDb00vE/lcSkIwzOcrPCKkMfdfGoG1xk81aJMTY1fF2f1LmS9XZnU+bO3VMAi0VEkt
         xk1Lk3VTOExZQX29i4HCi1/w4F8GIlxvd/Ggyd+UdDD7+onuOugq0qAzSy2RoTC/Hoh+
         r4o0ilrBQwuZ6hze7T+ajGnAmRK7lpQnmGigaCC+Nxpr7gklKmXTVbaFje/TUXdJd1tf
         yC2g==
X-Forwarded-Encrypted: i=1; AJvYcCVZYOS2bSz/xhRzIX4lZibbSaUcoS6E7YoxmvbdM1aLQ+Q/mDJ3bok2nsI7yLhZXIPT+UTElzEtYwX/3dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEG9vKn6fFoEJgcJhON3LpF6r7Hqw+AQ2oLnPHpbQsp91dQncw
	0bV35u0KsXjdvZJUirWelxpBz/cjHtw6bcJ0W3KZ9JTFV+e8IAvlSveNEv62TnKbInc=
X-Gm-Gg: ASbGnctaF1cgE1mNmF5IZlXgpfaoWi+4OxffnE+2AtvBy+TqepYHoISoIPalD6zQgp7
	jL1iWTOB5jyMGxUapOwzB3Kpd2lSr1w11D9SR2M5XlZOVoN6j6/MuroyLQXYIZ5nJVI9i1rST0l
	0Cedix+FEYUtJcYSsaAuo8I6J8sCo8rHtXkigYEKEoo2zHoHuNhhOy8hVMLUgx3nQwgJg3G43vl
	ROH2TKWxbbXK348LeqsJiponVTVPQdRr49OVrGJ7upwlXlERCG0w4DI+UN0ZdL2z+dHjYy+5ov5
	QjqGzqi/No2TRT/BDt/fZczaH2XdyVr6GXiH5Fm+kMedgRIOWun7Ich5P7uR7tASXtw=
X-Google-Smtp-Source: AGHT+IFJT824h/fVUdrtP8VolwifhwFVWo0IkVtlZ5cdp9VZgCFy3WBGpkfdsvju1vACYv0c0xsXRg==
X-Received: by 2002:a05:6870:8a0c:b0:2cc:3523:9cd5 with SMTP id 586e51a60fabf-2efb22133d1mr2422068fac.17.1750867133090;
        Wed, 25 Jun 2025 08:58:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee8a8ea97dsm2626851fac.29.2025.06.25.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:58:51 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:58:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <738b8abd-5825-48cf-9c5c-697ae057ab79@suswa.mountain>
References: <4d800ffb-fb1a-464d-adcc-2802187cfa9a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d800ffb-fb1a-464d-adcc-2802187cfa9a@sabinyo.mountain>

On Wed, Jun 25, 2025 at 10:23:26AM -0500, Dan Carpenter wrote:
> The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
> for that.  Also leave the last character as a NUL terminator to ensure
> the string is properly terminated.
> 
> Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/acpi/apei/einj-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
> index d6d7e36e3647..e77c0d4b4ee5 100644
> --- a/drivers/acpi/apei/einj-core.c
> +++ b/drivers/acpi/apei/einj-core.c
> @@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
>  	int rc;
>  	u64 val;
>  
> +	if (count > sizeof(einj_buf))
> +		return -EINVAL;
> +
>  	memset(einj_buf, 0, sizeof(einj_buf));
> -	if (copy_from_user(einj_buf, buf, count))
> +	if (copy_from_user(einj_buf, buf, min(count, sizeof((einj_buf) - 1))))

Nope.  I put the parentheses in the wrong place...  Let me resend.

regards,
dan carpenter
