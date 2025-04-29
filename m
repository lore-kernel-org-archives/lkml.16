Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B274275857
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913061; cv=none; b=qCF8aKlOHABNYmJTjbdj54rwNLesAGGBtIBmgyctw+NuTZ1xT4TDyNmqo6nKwPGXBF2csqswVr5uuBC3LMLhFw7sJWIBd07YGoLpdQqBY4rOjhIAKFo6BYJarzf/CbLdmAvcP416QHMIFfB3JVJj7KuUjz2z4Xv+M2UExwj+SgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913061; c=relaxed/simple;
	bh=0maA4HWt+dfsb/SO6st7769kV3RQOZp5X82vWych+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZSkQal0BhScq7v8LlapWAQ7u9ogCk+9CNQhvplt1Dlx8waNhbXWL14gJYP+FW79yXrRFogaHTbD+jDH/QuquVmphuAFXBQXuO4sGUzm7fn1TRl/WiXTIASMIrXAjZEPyPOp+z1GYImS9ZooKyuelzEP7q4D/n2uOhh46cVd8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQj5HrM9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQj5HrM9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso912815866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745913058; x=1746517858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
        b=HQj5HrM9UKHvccVC+mihNf6EhrCBAjL27P+u1MU7lepruNBFyZ7LauxMxQlGOFsBF8
         nLCMLxNGL5h2PjX9GqBo1wffrDjxWReDMUrClFEH2vM6KWLras+OqpVVpF5lOoFZhgSm
         T1w4d4aYvevGEjKv3rWrEGnJMIlDTstgioaJlZzWmp7xKLyyBUzg2B8A87YrM1OSTIv3
         pYHVWnn8zfI8c58GKGRsfcun6m6xkgOnwZ+4pVyadaDjqO/8P2afMBXnXfvl+9KQ39WP
         mjtapZbZdNrR1MaBkupOskFVrBeUWAZPnl/qjPwIvGCIRPpQh0Ck8TtHKR81P+g95Y8O
         eD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745913058; x=1746517858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
        b=JPu1sae/DfqlMXp74Vz0sldap3TGKf5nwVdPBPjY58xvT6DTYktPM00DYEnIq3XThb
         wuFVZvQQTB35ga2aob0Pl5IwabYtDsjkY1Irc5ytlG0YbiS/g2h1Diu0jcZ5cO0EA88E
         HpqvWiOMTCFQOOT7wYAx4RV0rhcTpG7ngDWBezm8EGvoQzUbqRWai0nrEUso95A1iaTr
         z6dySfnzkJO6oj3+KpzmWhMvKUSiusd5EbJN8yz9f3BGKbobTg4zIYF3lAFjAIp3WWk6
         sb8Gg7L8rpZxwSJTmNbXAxzgGV8fahMzu8Lon8ZPx2LVzL/NEqor6kqu0rbCfO6Tk6wT
         yqaw==
X-Forwarded-Encrypted: i=1; AJvYcCXSLrB03ENKs1wnet+oznPvPjALaeMzC35/SDZTMUT7tI2x4w2GuZ6lBaD4r1PzBXhDfKTL7o6FFwoTlB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiO/nxq5LwLK3vaKtKKnI7q1xpiEGV55Ttx3uIRYBN0mAMzF+
	y8Lf+fvM9V4RCi0DZYINp4Jx62x2glnEw0xa0Gmh5vfEfDB3CxSjgUUH6gG68Mw=
X-Gm-Gg: ASbGnctLvopkn/e4Oa9nt3IQrA99rAxEpTL26+RJew6Hty6nA/aJKxfUTBKSYMe4llv
	v6y+qi2rZ22DUcwy+/1IBbKVZYGa0QSs9BbOC+GnNm7b6iwKtivwCjdf3jAj7ungbfdCD80CJVp
	AmqCSVbPoslvJKdA1zoUmXmCPC9fncREMIy1GwkXM8piPOoA/+5i0Lormo/RgYyvyiEsLwR/Aby
	z7HZ2YdAz6rpYncqtTW6wRweBXRUfUIbFnKjW/uHY6jcdZL2X/v05fHG6Huie5zHUTajj2e8EY8
	lCSgAyBGZTXIM1ngoobi42nWMLnemu2d5BW4zQ==
X-Google-Smtp-Source: AGHT+IETfUdZEy4CFxn1YEIQmSr6ySR3G/g5zLsPVQSq6DzfPUY0rl3GN75l8UgZGLkV0LGhqQnxFA==
X-Received: by 2002:a17:907:7f0f:b0:ac3:446d:142 with SMTP id a640c23a62f3a-acec84b8840mr173980866b.2.1745913057842;
        Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464e6sm6980176a12.64.2025.04.29.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:50:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBCE3wSG2g5pp7jg@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBB-gl150GVaZPn5@hovoldconsulting.com>

On 25-04-29 09:23:46, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > > >
> > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > adapters or docks with retimers in transparent mode?
> 
> > > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > > if it did work before, as I do not have a Qualcomm based device
> > > > without LTTPR on the baseboard.
> > > 
> > > Abel (or anyone else), do you have one of these docks that you could
> > > test with the X13s to confirm whether this series fixes a regression or
> > > not?
> > 
> > Before the support for LTTPRs has been merged, if you would have one of
> > those docks (I do not own one) with LTTPRs, link training would've just
> > failed if the LTTPRs were not by default in transparent mode, which IIRC
> > is what the standard dictates.
> 
> Ok, but my concern is if they may have worked in a default transparent
> mode.

But if they are by default in transparent mode, doing the setup to
transparent mode will not break it in any way. At least that is my
understanding of the standard. Also, I tested multiple writes to
transparent mode on CRD back when I wrote the LTTPR msm/dp patches and
doing multiple writes doesn't affect the link training that happens
after in any way.

I do not own such dock though to confirm 100%.

> 
> > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > would return 0 and none of the of the transparent/non-transparent setup
> > would happen.
> 
> But this is the crux; does any off-board LTTPRs in transparent mode add
> to the count or not? If they don't, how would you ever learn that there
> are any LTTPRs? If they do, it seems we may have a problem here.

Count gets increased either way. It doesn't matter if they are in
transparent mode or not.

If they are in transparent mode by default, link training will succeed.
No matter how many times the transparent mode is requested.

> 
> Johan
