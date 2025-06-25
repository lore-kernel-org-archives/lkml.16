Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A042DA76E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876862; cv=none; b=fjY0ePZeg9nfHXtitC4nlcFH8MMgfxgq7HBDgtn1cDIY4uVLB/6pHyJsfg1y5FTMdu2YCJEbD4nljNQxd10SK/WXvQu9CH99bLU8blvkozm5CAKTWZML0xi6kvdAgP4DAG09PC7bYWf3PcLXZeAEQoiUZPN7Q17040kP8RbfM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876862; c=relaxed/simple;
	bh=N1GrLsO5rn46Kd+qcM63O/s4L2k9YjjCFe0dE2dULaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRBxbbCsrikg4oNNZN3NaNt2y9K5qxmbXBy4F2lsz1kxQiicuPgCuc90ccSf6SsLGuXDHtqHqqIhRZNRQlC9RBEvGZofnewlTVSDAfl3T1TWut1Pu1MBGkt49qpflRC6+CJXSq7gg1HMVGoECjdZhC9AT5twv1ghbbXtQ2IdWec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+vlhtDq; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+vlhtDq"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-606440d92eeso104377eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750876859; x=1751481659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb/xkqJYQLzIZ67OSg3QEbtD8orcI+NoBMOMxQAdNnU=;
        b=h+vlhtDqwBMBdZ3GGagXoA12jRQPy5RmdQZ9h/wCF5TPLzd+CB3ucvNtVQhE1fzsx2
         psTfFcQolc1oYKpqof5UfBznbCvjDfDH1l/0YzMeDr6x0JiJhmF9tTxApa0Eprl5C8XC
         74l7BIpdjxsf5ro1TGlZWq+8VXgrcVQqusnDX+jbwry3+MUGhtL+NPOxj9JONmpodWrZ
         b7CBxNTZZDlD4hpTvOQSMRYwAsbrjJVYrQebp+bdVICAN555le4ZlZQRJbk9ULGkABX4
         /yxZeCm/BQkCxAKIdYrmAKv4i4xQMllQIJxeuvuMyAjhy1hmyXUOAF6vQF2CKzfv/Eq+
         hkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750876859; x=1751481659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb/xkqJYQLzIZ67OSg3QEbtD8orcI+NoBMOMxQAdNnU=;
        b=xFsx3Yz/4xVaeOzKN9tyjMOvExhn2PBcL6ksqEXXsOr7De+vD15uTg298GqkyYiMoD
         qjQEPK6GSIeKuh5AkxMIXmNK+mb33ZOLCpty9Lf6bVieojytuS+js6y3Ukxwx7t2nu+V
         siCqhbZV/9j5wDNJBBtuSuh1Rqq3XeZIFjcv0a2P4zsXbSvdqGXXsuU4U+XeFOyA3Pgv
         AKNKL2/Kn+cC+2LeKaBoVinFHK5RxpXlNw0eXZJaRfoQtmrWw/tmtlpaaKERSkAyjYCn
         J4TpvOZgjKTYS7mAo8uaTWcyXyAE1yOyHEP4qfYPDj/T6esEDU21/MiqZnUYEqc9Zyxv
         g7vw==
X-Forwarded-Encrypted: i=1; AJvYcCW/XIpoQLtHd/3BdbjwTfb2ejwd4xN7nWLh5pCts5oShSSDyCfXw/pZXPCg0P+hD/2NG8cN1/L/PEQ/ePs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvR6jOnluSFFWkp2veyRzNt9MYBhxl9ICOcdksRImcx2YYtO+p
	BdCg0jpsMcSHf7JwbgXFB58Y4jPeXXDkLZmiO4AaVLngnRwoCLM6BnWxgQl5lqQF5Q0=
X-Gm-Gg: ASbGncui8rfvlTvYYRj1HoM1qATPkM2m4sJnj89z2+3Xu7zFJBcyvm6UeGSv2lpE8h5
	pO91LvZ0Br23Jhsl25NicKF3nzrmp2B206y7gnPncS3hS5QJxe1hiU8FMgQK6Sozom2McNFVayg
	f56yhLqhdD6kTrLY8NCDhMyF32QrEIngMDZVFjuoDJrAgKGlgPLH9Dve2T0NQItLkYrUkUayAhO
	01sAEOUVyZORCC219P8+F3HAszbj/KLdc9JO8FLxM0Etk9eff32FhSKm1OZuVz/mKaScypbHVu7
	Vyl1h61EOH7B7reWP4/W4o1dIkd8CGADVbAmh4+ON0a2fGpW05t2my9D7iGBT/1cj93sPRuITmB
	PHA==
X-Google-Smtp-Source: AGHT+IG+FodkH8YjDqJZ084eAzz89kwRqhC0U0FmJInHRKqb6H43Svn4QKtYMZJI20MCcSldmzryog==
X-Received: by 2002:a05:6871:e488:b0:296:a67c:d239 with SMTP id 586e51a60fabf-2efb21af511mr3039710fac.12.1750876859338;
        Wed, 25 Jun 2025 11:40:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee66559db2sm2665582fac.11.2025.06.25.11.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:40:58 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:40:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Zaid Alali <zaidal@os.amperecomputing.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Borislav Petkov <bp@alien8.de>, "Weiny, Ira" <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2 next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <be2b886f-4de7-46b5-9cc6-cc5299b1af02@suswa.mountain>
References: <c71e7ba6-f127-4f49-acbf-20063dd26553@sabinyo.mountain>
 <ks34mfmv2vhwojpxlzv7tyordcjdo6zclcflplvs2wsl6gkbn5@3v5kguelmita>
 <757b5117-a865-4d31-b566-248048f87b29@suswa.mountain>
 <SJ1PR11MB6083603821632C25DA5D8EEBFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083603821632C25DA5D8EEBFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Wed, Jun 25, 2025 at 06:22:57PM +0000, Luck, Tony wrote:
> > > +	if (count > sizeof(einj_buf))
> 
> Why not:
> 	/* Leave the last character for the NUL terminator */
> 	if (count > sizeof(einj_buf) - 1)
> 		return -EINVAL;
> 
> here. Then skip the min(...) addition below.

Yeah.  You're right.  That's a better fix.

regards,
dan carpenter

