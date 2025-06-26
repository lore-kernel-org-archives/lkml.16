Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8441552FA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967297; cv=none; b=myoFWAsWAzz2rbtYE1e/UP7O6utJ3c2hQkjTEJgAXCUvXzyNfq8kxDSQ0ZwB9uyZwzesM8axuIk1D6ycBDE9MHdf5VAfm4SXtSDz5xnemhfiLRgbwbVRchrp22mxF9TfYnGpUnFeUtSfZyuHPyE11cBgNf4QiAKmCzYomLSjKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967297; c=relaxed/simple;
	bh=23BP8b5tGpuQBzAkycWie604k3cXGeyTDeQHKVzqB8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEIRU3RYltXnRLHlJoHhHTE8lbavaBO3uoR69nGok6J2ZW/qpXim5sPzSy/xEDzrNeEmES39LbfNLDI8BYCJbkbvzsA+A2LNjhqdAYC8kNyBO8RXxJTOjk17O0PgRsDW7FOrBWjiJcbAWvvMqSLv5gIXWeenNutg9KMH4Hro4aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSXAvR5r; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSXAvR5r"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2efdd5c22dfso499448fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750967295; x=1751572095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEoJVyuljlGp3xPTpAgnwiJGOKNLLEr7nGdVkY/IvZU=;
        b=sSXAvR5rwl2X5JGjfyIi8X/eM1w9UIyXeUrVRR1ZBkj6/tsqAFrpD/heE1jZGgG3L/
         okok0jRAwS71EdIUNl1NKDMcIv9XsH120ZgNZUPAoG5lr6JwFnVCKRGvLW6sSW6N67I4
         romCT4799WkKUdzvZaqTmzf1rVIGdzSfaew7kgCN1l5UpP9YxwmNhd/6/IBIU4SpCir5
         irWaxC5RF6AtO4FnGM+YJVGWsLFhZQ/X3Ujqh0VVBi3jg5bpNkwWVXIh5EWwZowGUeCl
         b/OzayWn14XDDeF9r/aWy9Bfnf3u9NZjMhbg3548TUSus7O8G5sviNKZK3/eJStH6+bw
         hyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750967295; x=1751572095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEoJVyuljlGp3xPTpAgnwiJGOKNLLEr7nGdVkY/IvZU=;
        b=hbzWkxOKdD1QnY4BTAqQbWtSFWW3L6/tisNKVoIlEKkCMBi4kOJyMedrkHAAQj6lFL
         JRbgpRZNhNBRYzxV/3myL37W2FR192gCg2TMFaJKGGfR01dbhuceOJBTe10D/NGmew2Q
         SU2eN1hHOHgfAMXA/FJYNPja5BcNtiHO9T9O2VCQmsGfP6PXK4Z1l5FcaNc89NHL/tSu
         /G82DQWMVfJpO2gmN+RH3sERcBm8DanWcdSYtQY4AxpDC5/G879wL+y5CFBewBpk4w+/
         v5PU5D4ep3GHxw/h28ImPSdpUFZDe7Lco9Kt97daCZYjY9gZGiGhkNZXDo8M3AOuc2KX
         Bt3A==
X-Forwarded-Encrypted: i=1; AJvYcCV5gpMF4fNGCbWazr+JRyuCtVPgeECQM+jNpObq3c3VS78/wOL3qwbmc/lBUMIU9ipQdAlIexpWa/mXhIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZE0s7dQHYn1JM6xNufRpf2QM9EoILKFiUVG0sTAcTxUEvSIDF
	pBQpvGs93Jbj7+q1wwtb38GgeTE3LF9Kg8rI7bYWYqClgezSDVChWh93XdY4F7BTS6w=
X-Gm-Gg: ASbGncuKF/OeHHI/z/GSbqV83YkuoANxSuva9Qv/9vP0q5G1+3j6iSycvyIVi0vPZM5
	J6QI7tDPJdnVhzdJkG+/uqWistLP3fl963FImgyDsRzHf72dnqR8LrC2ftu7XGS+Tom+5d4Wb+o
	CC5U2/UuspbBb5iUreEJs4yQWyxnLb/p13aFWT/LOsHGULb3gOKdtPoVsGByge2mpSPdqRw4sSV
	DjgvsbOVp3YT3pPkD4zDZcQ6h2MbKNjkFu31BwhapeMXbnHL1Sv3spPGbBPQNdAuzn11WmxOwV6
	qplEP5wYLK7/EVhk8+JsdvOKbE8b2ARJYnmXH3CCfCOinKko9XK5INjSVNKXwI2oGwV4Qg==
X-Google-Smtp-Source: AGHT+IEnNpH+fA2FaExMXdqmQHiMaFUEVchLMsWsoDgpD4qZht7Hb1j3IRi8L1uvBA45hKMs5bxgDg==
X-Received: by 2002:a05:6871:78a:b0:2cc:3523:9cd5 with SMTP id 586e51a60fabf-2efed52d228mr218104fac.17.1750967294850;
        Thu, 26 Jun 2025 12:48:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2146:7e21:238a:e0ed])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50b0cf0sm495757fac.29.2025.06.26.12.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:48:13 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:48:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, jean-baptiste.maneyrol@tdk.com,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH v5 2/3] iio: imu: inv_icm42600: add WoM support
Message-ID: <dcf86acc-567e-48e3-ad15-fd9522b46180@sabinyo.mountain>
References: <20250623-losd-3-inv-icm42600-add-wom-support-v5-0-4b3b33e028fe@tdk.com>
 <20250623-losd-3-inv-icm42600-add-wom-support-v5-2-4b3b33e028fe@tdk.com>
 <CAMknhBHaSBF-a9nLZ0ZxB2-9HzYkPMBqUr4Aa4TthNnJMwtFgg@mail.gmail.com>
 <20250626195323.6336820c@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626195323.6336820c@jic23-huawei>

On Thu, Jun 26, 2025 at 07:53:23PM +0100, Jonathan Cameron wrote:
> > > +static int inv_icm42600_accel_disable_wom(struct iio_dev *indio_dev)
> > > +{
> > > +       struct inv_icm42600_state *st = iio_device_get_drvdata(indio_dev);
> > > +       struct device *pdev = regmap_get_device(st->map);
> > > +       struct inv_icm42600_sensor_conf conf = INV_ICM42600_SENSOR_CONF_INIT;
> > > +       unsigned int sleep_ms = 0;
> > > +       int ret;
> > > +
> > > +       scoped_guard(mutex, &st->lock) {
> > > +               /*
> > > +                * Consider that turning off WoM is always working to avoid
> > > +                * blocking the chip in on mode and prevent going back to sleep.
> > > +                * If there is an error, the chip will anyway go back to sleep
> > > +                * and the feature will not work anymore.
> > > +                */
> > > +               st->apex.wom.enable = false;
> > > +               st->apex.on--;
> > > +               ret = inv_icm42600_disable_wom(st);
> > > +               if (ret)
> > > +                       break;  
> > 
> > The fact that scoped_guard() uses a for loop is an implementation
> > detail so using break here makes this look like improper C code. I
> > think this would be better to split out the protected section to a
> > separate function and just use the regular guard() macro.
> 
> Good catch.  This feels like something we should have some static analysis
> around as we definitely don't want code assuming that implementation.
> 
> +CC Dan / Julia to see if they agree.
> 

I feel like the scoped_guard() macro is so complicated because they
wanted break statements to work as expected...  (As opposed to how I write
half my loop macros using nested for loops so that when I break it only
breaks from the inner loop and corrupts memory).

regards,
dan carpenter

