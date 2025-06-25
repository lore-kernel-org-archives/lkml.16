Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975812D540B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875568; cv=none; b=SMQ5iklokCiTr/wG+rA56LzkFd6OFKtD+FyN0TYbivsoL1VaVYwp8Fz0d3YP8My23Raz1aK+zyOof/myG/8i4hmA/udHMvhyOTpotLtqT7bYrpEutqWyGjEuZsD58V/rSfBTTYmRy5XgXKVdF+97ZtZnkTrPBeTfGwQQ0IEaE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875568; c=relaxed/simple;
	bh=Jfj5qnXFugsOMh6HpU5RjfMH6+e8axtkDbqBf4lvN0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXRYucrShUnqcLaw0KouLiSh9DKXHAccI0/DeEezxZPU8nFTy/a7ro0Z56AfJTShncB/ZZ0GweiuOhyxhvOj55MlnMSZqp2jtE2d6CLiahDzNXjiFI63XlESK+sG7II5RCtyA2BJ2E6ehi71nSNwlO7ZlP48JBqhHPCwg87HBi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIBUPjQ9; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIBUPjQ9"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4067b7d7e52so55788b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750875565; x=1751480365; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Dm5388ZZrY1U4+efN8p/OTMRUgs76Nb9FuLZ9jSeOs=;
        b=gIBUPjQ96a+Lg9983NJrNYvY2HJ1SedKuihBTsBolYzOwcq2A9pgJ8PNSNt4QEb3YA
         qBXHsJAXFKWdLSaflPUayl9dbT5IIC//HQqS3WLhWgJLPqT1477PSgpMTFpfqUY4SLBd
         wmnHP4cIf6cnftPnhXnVSKZD2vd0y7wwq3iRoQJs6Ctdbhr3bi5EI185KfYupuUMUjBo
         Lo/AeDzdu8WOgxl53zsxSujFt+WomBWmUUR83ZIpvIm0wpfokOvIzNkUab8MFd+RMa0G
         sLmyfIkwsX0eeqsDFIM1JsHLD5ON2Cex/rfttEz88oTRsUbK8qAgmI0Qna+l9N8EQify
         SqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875565; x=1751480365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dm5388ZZrY1U4+efN8p/OTMRUgs76Nb9FuLZ9jSeOs=;
        b=Ymi7pxsY1YLZ1d2/pkcwoEQXIEwVO5jthvgV8k0QKLNWzN1QHtxFtWw7HmSNlo912M
         HWY/oyzD1wvhWs8Jgy3gPqgmkTb1CkYS3n8ltWqRMMccTvKX/j7x9IdXEl0WaETAIBFQ
         EA/7OG0BrlCTge+3Y2OGhVOpS49ebuG+CB0bw6qJqK7n6oXpLdS15OBuTsFrWiC86qvW
         NiOLBbyqGE8q1GQAL+MFxHLYSzbE4U68MevmUh1mWtt55mWWvznWPB0HpGoexrRUzakk
         YR1Kd6ozREHkFVGVToElSZ6YuJ7enfLw+28Sl4yMfgFBQX9Jr1YHoqmkHIam1nrtYYk8
         m3lA==
X-Forwarded-Encrypted: i=1; AJvYcCWa0GyvcLJFYtvDObqbSi33IX72SlfQ5upBcdFGadXW6F+OsBk+7nWVV/V+v0tmwvoNioFLF95NDOb3f4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzutJ5SZvdA5IGsGJ1FCb5PZ15driUcho/WsPkWWgHceqwsVau3
	dzpgy0fuSwyLDVpH6xLXgdkmE10GUe/RXWCK3G5IUQmjl+abZt5zOlL23A5O8/dPHlc=
X-Gm-Gg: ASbGncsHttv6xNZOy/rCo7Hc0Pk08wtu/kkApiZ70jnJHQyVxp0M9DJH1cyU5zWZWSL
	7QHadoovG6UrerHarxRD7kwjf1pL6RYILsXa5ZDyW9Ag0Fyi6bpD30dSmRO7Py6leb+xQUILYla
	UDZjIpzvAyQJY2YnrlR3d/GPnoU5nD+DFh8KpIJ0l6KyM3GJM08lOstEwb4w8pv1ER8p3xJyyZa
	Dd/wNMIPVzkbkTTuq1L3DTm/Tpw3uqfHqc9JG6MGst7nakitlyM0A5Ye+S5q7WTRmDoVQmvWPI2
	304PLukdX0Gznb9YiVSvw7WtBDLc+yS4fvNmIfh0EJ5aoEBN7XSoTU5Dshu3LZ9d1ac=
X-Google-Smtp-Source: AGHT+IGyEXNA75F1Qnqm4F8gyjHFHlyO/fw4ijh8dQyLEguVkILpGruCyf60HTw4fIUAOctXuX74UQ==
X-Received: by 2002:a05:6808:8204:b0:406:6a21:527f with SMTP id 5614622812f47-40b05c75308mr3205199b6e.35.1750875565621;
        Wed, 25 Jun 2025 11:19:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2280631b6e.42.2025.06.25.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:19:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:19:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Zaid Alali <zaidal@os.amperecomputing.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <757b5117-a865-4d31-b566-248048f87b29@suswa.mountain>
References: <c71e7ba6-f127-4f49-acbf-20063dd26553@sabinyo.mountain>
 <ks34mfmv2vhwojpxlzv7tyordcjdo6zclcflplvs2wsl6gkbn5@3v5kguelmita>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ks34mfmv2vhwojpxlzv7tyordcjdo6zclcflplvs2wsl6gkbn5@3v5kguelmita>

On Wed, Jun 25, 2025 at 08:04:14PM +0200, Uwe Kleine-König wrote:
> Hello Dan,
> 
> On Wed, Jun 25, 2025 at 11:34:38AM -0500, Dan Carpenter wrote:
> > The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
> > for that.  Also leave the last character as a NUL terminator to ensure
> > the string is properly terminated.
> > 
> > Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: I messed up the sizeof() calculation in the copy_from_user() and I put
> >     the parentheses in the wrong place in v1.
> > 
> >  drivers/acpi/apei/einj-core.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
> > index d6d7e36e3647..2206cbbdccfa 100644
> > --- a/drivers/acpi/apei/einj-core.c
> > +++ b/drivers/acpi/apei/einj-core.c
> > @@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
> >  	int rc;
> >  	u64 val;
> >  
> > +	if (count > sizeof(einj_buf))
> > +		return -EINVAL;
> > +
> >  	memset(einj_buf, 0, sizeof(einj_buf));
> > -	if (copy_from_user(einj_buf, buf, count))
> 
> I would add a comment here to explain the -1. It's in the commit log,
> but that doesn't help a future reader.
> 

Sure.  I can add a comment.

	/* Leave the last character for the NUL terminator */

> > +	if (copy_from_user(einj_buf, buf, min(count, sizeof(einj_buf) - 1)))
> >  		return -EFAULT;
> >  
> >  	if (strncmp(einj_buf, "V2_", 3) == 0) {
> 
> Further down there is:
> 
> 	return count;
> 
> Is that still correct given that you read less now?

Yep.  If we don't return count userspace will try again, right?

regards,
dan carpenter


