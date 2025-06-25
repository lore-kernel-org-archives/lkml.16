Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D4225BF02
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850388; cv=none; b=Hf3gCtg4RSr9w6jN3DQSlkEG+Ut5JGlTZbkMx/V7NCIpUYxIHNlcWUvvg1rCfFEYG/Xf+cGU95PAbEck8fkBO8EHskllw4K4k0lVm7sqmQscBTI1LjHeHCH+HIxL78iANnu6GXHDEvYsB8zL2d7qOmNSWEIDfMSdY/x2nCgUeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850388; c=relaxed/simple;
	bh=VNz+lSy568xXrNEW/LdsAyCYu0exIyy51MijlASqERI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC4Yz0g8qhe4r8J7aagSC5D9yPqpOfbeN+pecwm85Zu9EhV5vhgi0vOxXXi/oOxMFELDlAoPX2aSJKby6Q/XJWWIYVbjN4Wn2vSmq913jTMv6tbhz1zL+Y9b5+n/usJVZtUOWyzJsLPRFO6NHaExoG8QBDLrQAnjH2wuwEaFA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RC0Go2XJ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RC0Go2XJ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73ac5680bb0so407053a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750850386; x=1751455186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iq4wYZ8O8v8iGoHVKCZbSBs74G20nkHHqtB4OQv75Kk=;
        b=RC0Go2XJZoD2w9YPxoKoro2XpHEqF+1b5xeqdcMsIfB8KxSTHPl+yEaXv/ndqkxdgb
         rPvi2fJgcJBLEdmQNmmuKmecCLxUqbbf6LwF5SQNrXGvTi6oAWGs501Nl7/gwek40IVv
         weMj8/cEyefme9fnHqbq28HMMakgbdO6R5IOqyeN5fdOVSHwvIa3sBA26HCgDaQ5YpgR
         Qn+gzry9zdkSwFnji72w/GPvCtk5PNUbSU7+QH/T+1PwjeVo7u7Nb0PcL9GqhAtQnvUq
         hECmvSlDAMWPAb7HJtn2hT1lGBRfJKhfbRA6+bXMs0+dFMZp1upB72NTXpxwenO6yibh
         V1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850386; x=1751455186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq4wYZ8O8v8iGoHVKCZbSBs74G20nkHHqtB4OQv75Kk=;
        b=wjLhP8dn1L7bM/A0kmDc7uM4hQXMbQWviqBQzxOzpLl3aTQZ3JLvclb1CVRsL5gTrw
         82Y+w6WbyPRTCMSp0PpBU/N61KfSOMBAdOQ09nrl1HkmKvd48cbcEvLf/njfogijSiVz
         WrUpkQH5RVm/HtcCNZkOR6zfnE9DoMZm5GL1f1xfOQCVGAqqbm7OCzgbLwB2N0d+wIfr
         JZaXdLHQLBTARBCWkNYG86W/3bSIH+AEN5LV/Tr8AUzS/Ch11eCawbw/Arg+kgL+hz+D
         Acdcyq6GWHWB+flvz9vNIA9WbbMAWs/DB8kKtM0+dU7x7N93A3rty8zX8OI8l02NO3bp
         fuFw==
X-Forwarded-Encrypted: i=1; AJvYcCWQNH5axSIYi5uKxHVaXnEISKswJI9EWUwbU0LWExrh1X4IEGgsMsPq8Sa27O79Tj7pmtsoo9TpcMT48v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlz+8SG9eD5/xJ+I1sIABobhOGIsPP5egQTi+cWJdl4+/FVw1
	l0SbQxcHvXrsn2ljWsNdsk0MtodGtXCjdgM08eSsMcCTLviqyLaBNOSR1gGma7cbxgc=
X-Gm-Gg: ASbGncsEMBvqslzH1050oNDw3a4Nhi4/YXzbA9fuAEV/Xxybu2wXLTT6taDzFl3mOnz
	Fm/EGFPEwW27VqdSMqYOdVm4s5bHeSGr3fHsu+L0ba5ozXU/tVkP8yW+H+3Tu3BHSi0OU1DHTK9
	+KqqquvXa/yqsY49kczcHrn746t89rysnKGFOvcdH6kO558vvUWk1r/lqN2V/F0zqSxOgDt0E4Q
	iQwoDZwkNcj/0BwiQ0HOXV77DIJqcMD1aFzIUFBhdB66y10woTq7XO112zTTVaeIW0STcj5A+6z
	xrHfWPqIRS54KK3UfBIf7QOngQp90GICsyMUxTiWo7oWCeNvg7q2MPhD7DG04ycGN0RiQlPILeO
	HzcFW
X-Google-Smtp-Source: AGHT+IHUPmQyLG5EAp7kEhFfGkI4eD9tbFqoGyW5KZup0EXS2PDOGnB5h/POMmLnHUjyUistd5gdNg==
X-Received: by 2002:a05:6830:4429:b0:72c:3235:3b97 with SMTP id 46e09a7af769-73adc8984e6mr1795836a34.22.1750850386145;
        Wed, 25 Jun 2025 04:19:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6117598cc6bsm989956eaf.32.2025.06.25.04.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:19:44 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratibimba Khadka <pratibimbakhadka@gmail.com>
Cc: sudipm.mukherjee@gmail.com, Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: Mark g_fbmode as a pointer to const
 pointer
Message-ID: <e477d4a1-a941-4301-b295-c245f9023cd3@suswa.mountain>
References: <20250625045526.82758-1-pratibimbakhadka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625045526.82758-1-pratibimbakhadka@gmail.com>

On Wed, Jun 25, 2025 at 10:40:26AM +0545, Pratibimba Khadka wrote:
> Fixes a checkpatch warning:
> WARNING: static const char * array should probably be static const char * const
> 
> The array `g_fbmode` contains constant string pointers that are not
> supposed to be modified. By declaring it as `const char * const`,
> both the string literals and the pointers themselves are protected
> from accidental modification, which improves code safety and clarity.
> 

You need to compile test code before sending it.  It can't be changed
from being a NULL pointer now so it breaks.

regards,
dan carpenter

