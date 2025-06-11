Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6A17A31F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669473; cv=none; b=PqELWE6ijtk8kxQFEKEbENPJusE6r+Jy+ynOQxn121qGE/w3RLWAFysQV+swlc0q5HH/nl3CNjQJvCmVKN2vsgm5qJeRQabpwPU9jCUqL0IgGlIWnZFUihZf40XlZ0utvksDcx9qNhDX+1AVyqRKUqnrITbWbiZhH7pLxDYGldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669473; c=relaxed/simple;
	bh=fUrUvj/NKrnOKNMJe9QMJYc8JHU2TblrN3dQxgOBq8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpmnFalms3dOvXx/wYtvIc7NcfP6G5Pvmv8iMRZqo6jW2C8I9l0ZXJtP1KZ2Wm3NxQNhl3/3N3NbvTZYB7Nv/pfl5MQu8k08rkO96mkl72VuvrdwwvKtm+4fWfAH17MbpQ8uFRk6XqRT1qDB1WeNuJbLPZB7FubB76wGyzrmlPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRXt3QTR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRXt3QTR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d54214adso1007075e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749669469; x=1750274269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=jRXt3QTR0RkTFpZZ9RHIHotyB/bNZ6Ph723nU/rrsLoadckzIJbf8Ifp5Srk4b2sDs
         0HZSKV2YCrT7w5Y8EMT+yejZgbQdujrHJ6TBgPAqn/PuIjzX4dwXyin62EWbgLr1n0z5
         nN8tAGrW8breBBMCvG7WnWV6Ra7ktuOlaDzi6Qp5GeLcC99nfVtUJFxCswUhOgrAl5l6
         m9zNPu4bouUVN18QOSUuveL06OKc3s3BJ848tvIiNGWnKznIdi6GpWo6idHkMhMjXxVH
         Z1eNRkWKc4BcaZTHm3rOvNQD30dN2tXMQ7E9TFRausAaP+2Bc/B9PC6U1bjLhLCcjPEY
         Lr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749669469; x=1750274269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=dU4PcRLfO7zCa3C72Qq1iw2FvhjEuHN7H8Kh0mi1ADOAngrQEzn6cNlZAiLmoHq1ot
         wY7ki1tZQDU/SCgOa+GOevF75XTi2ue0nm8iJr7JuPKhIkgcn5PW8rjjx9SNIDpW3/1Y
         XVTICZdiidqiShqPquY9Abdu/LEX2RamNk8Haz+1Q3lKtftKjzpYec5uex9uxR8FhI8H
         NFYqv/R9DUu1msNwds88Pb8i+dZMfLgEp8XLH06VcbpapZSY/POMZbuEDISG4qfNlBD/
         MrSUEyzCVyuTvrPX9Na5p8CvENKScW6ql9532NyRl4ZiHASPrbZ7rfDb63MJfv1E2h1b
         Yuiw==
X-Forwarded-Encrypted: i=1; AJvYcCWcRpMbkleZ8gB7GkTNVrcvTo4Oy6QVRJ8AgFeQrk9It+S6y8tFwKNLRmW5QzHPEAOyfLDP1zCoMi9z8jI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Q6iqJLCikDjJjFQZyoWBW3cxTDcKm+DSpjbFvHlG0zNuuk5a
	ke4C9Lhs7CUBH1shVC66FHEqY+6YQ/tST8JQ2W7Podc2nFob25URsk33R80Q7MAng/o=
X-Gm-Gg: ASbGncuJZa2nTyptj5t4aVWRKpKYV8SSZQZesKUV3nUBOFOXJHfK8suPXwVXIjjabpB
	QtEukkKkC4ofnwCCggxXUe3iKmFFsmiDj8gmMAiY3e4g6MpB9Ydk7AB+UbQE3atyWChrAntkeod
	SCM5JcCnTCGDMrGxIlIO8rF8lbnR5cYMzN9GPRO9uzvgoE31alWC3HSmEMHAMjRyYYKpsHon7e3
	GGi76HNFpspOqp4VWVgiFdbktPi2t4a5VeyuKmU4dlCPYlXqbuLVddMePmDIaunqZzrF4WCFs2T
	kjPllol5TtkxhIBDqI6QlhT+9fRzx7f83HWQLGtfoxuDEnr+miCxTjPy/O8GmFk6Fks=
X-Google-Smtp-Source: AGHT+IGJ3NQ8AU+WANwLf0nZAuX7XDSfVjhF8GwX89vHnWLiFcZb6a/55FgYJ7VjRdDmwl1wu3ltxw==
X-Received: by 2002:a05:600c:6612:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4532487b346mr48416505e9.14.1749669468976;
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm29370725e9.21.2025.06.11.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:17:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <aEnWWPgXseRGdSz1@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
 <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:40:17PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:39PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > Enable USB driver for the s32g3 USB device.
> >
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
> >  drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index ce207f8566d5..d062399ce15e 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
> >  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
> >  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> >  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
> > +	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
> 
> If it is same, suggest compatible string fallback to nxp,s32g2-usb
> 
> compatible = "nxp,s32g3-usb", "nxp,s32g2-usb".
> 

These are the same, yeah.  I'm not sure I understand.  Did you mean just
add the "nxp,s32g2-usb" string to the driver, and put both the g2 and g3
in the devicetree file?

regards,
dan carpenter

