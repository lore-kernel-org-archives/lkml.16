Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F15021CC4F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872896; cv=none; b=uCzomp3pKOcBM/+/zURW+p4IBFcmPz/cfiKrrQX0op1wCtIk3HWc72BZshxaxEY5Jo285QcKcRNhVuhSXXcOwQURqFDH4S8IgxvVFr+3Gbo9dOGeq7kzHoYGBg8FZGidRH9QJsXpOVt4FajWsgLNuiZZ8uBD7bgnV0C5OJ1UHqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872896; c=relaxed/simple;
	bh=NagQOnPJDvkb2mkYf+XeOB5En0lYB8s9niseheZBotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mai6HCXcIl4xwzoTczTxKIspfrRJnZ7heZBBHe2GPbRs3uCPj6bxENRuA4LsCc2AqzQRn2FcrAo41cyK96A4tzrg8/heH7RuowUwrMbsO1/yAr8us+9HWYg0Tw9nhsyox29cU2f+npLUu/oBtsUQPOWx9gRSAHjSTagUmytpg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uanr9LLf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uanr9LLf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so1126050f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748872892; x=1749477692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=Uanr9LLfoTE01oJ841zWFY8P8MyvuFKYUt8W4IaN94K3MEFNbx580BM2nA8iPXx0b7
         9z2X5cvJx07rQj2DEDyKm49sEB/cRPxF3YGzicESzGPU0x7d44TVIdGUDU8Bczfm3sy3
         NeVVfUPIVATbwsA6vLIPzdunACnwWrxL8477xKe1/7rryRjaNfVte4MYCgWluOO74nCJ
         k6eu2SgQ0alRROv1BzNtIg5ply8gvY8LYYrfmoRrckWaDH/TPL1eehAmJffxua+qBoql
         QA8Rbhm07x2vukGaOP+47O9s4tHTwRn7uYG5ENNkSvciD4S9YX8ZPeyPjApiW/xfdfqF
         VQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872892; x=1749477692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=E6a3tTcfKXir8u/wXxtf5lu1rbFXp0Vcow0NVoMRI+JulWDadR0zN7307RLwEUJVzp
         5NPMdEM3RiT8K9Xmt5X0QWEJT2mQggHA87/i+UXr6xLdufLjQ+ar+ykom63dVV1ZpA+M
         qW/bD+rEtHJIg4aGdjduffRY5ap1/VINvBwXgv4grtp+yAST9TtqmKpPYl5WDAetzkYb
         MEbJBR38REJaPooN5PeLWHL66ICw8C4hT0umZzEpMsUAX9ofRusYAmeGeg/LscRhlXtL
         hWo3Wi4896bxMUsHJgvkuAlO4wuNdL085w/JvV7JQimTXnHMAcXqjqKN8045AeXhYZGy
         fLlg==
X-Forwarded-Encrypted: i=1; AJvYcCWWlUCun64MXE1Cqk1c64ixRymFNLDryjWzwYDjIM5TPaHma1QWgK6jrb1B73ogsJO1dki+aOcQIucZkp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfiiXK2DXmhMkQYjU+DnV5UJu1mRBsOvg3nARz8qlxGOyy+N8O
	aVi2s6PGizGV8uvaEUI5JZt35dJrwxVcOIWfpxDr8+eYb0+cYBmMM08DkL6csHsgcuA=
X-Gm-Gg: ASbGncsQ9MatZfRh9hHUutVU/3dhPQvm5GNy0Uz1czdOJkIl4d+c70TFv0fp2PD6mZ7
	gYgToaAgXQ5A6v1Ic656FbFqB17/7eZKMGRQzLxX1MNDVM+xaCtEdqsmYuwNHPxZntmzRQzd6Mi
	Erhhm8Yx1Mgk++t1mIngSZs7Ruy6bnYgw0diHpYmMn4WDtBDzaMm6H7Pd9nLbQ85FBgIwH7ySSs
	3EA/CNbzQnocFgyKkP2ADOUQ1AehuF/jaHWBAC5ZcXSWiZClBW74ZzGD/Ml+R8PQz20i9qY/rfR
	1H8Zt5A279Nl01O7FMaY8l4NhAjVoU2kA7Vkr0E7QdiSeL4uUtgoZt3o77yztL6qBmU=
X-Google-Smtp-Source: AGHT+IFcK/6ISQPxykPrncma5VHws55L2Y9hI5oNzFpiILYMm6BZyuZo0dKaVkm4FGL7w36sh5Q2lg==
X-Received: by 2002:a05:6000:2409:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a4f7a3650bmr10615706f8f.27.1748872892237;
        Mon, 02 Jun 2025 07:01:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe5b871sm15236681f8f.13.2025.06.02.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:01:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 17:01:28 +0300
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
Subject: Re: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a
 REINIT_DURING_RESUME flag
Message-ID: <aD2uuP6Tx9NH7wVg@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
 <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:27:00PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:20PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > The s32g2 and s32g3 chips will need to re-initialize in the resume path.
> > Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.
> 
> why power_lost_check() doesn't work for you?
> 

Yeah.  That looks like it should work.  Thanks.

regards,
dan carpenter

