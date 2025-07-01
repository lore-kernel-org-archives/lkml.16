Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7022A7E2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396656; cv=none; b=miazngeh7cJO8FZUE7kJ7PZhdLK2yX8XH0jIEiRyMCyccCJddUdnBT7fKbze7eHyYxaLIZT/HRrrXz3diqPyHmFBVsC9Uc73ul1VplN1eiabq1Nb08aQ0WSJnY/zcjUgk3L7GVE8G1dSkEJ2SMFYevyhp1ubIiWNM8xSu2g20gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396656; c=relaxed/simple;
	bh=tdMUAe5SXwK2+HqDWwEF+ff83QQq+x5NhkU7fbGpGLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBtKLL6rn0iAXEhF+ahDMUDn7YGt2+rnOCaCE0R6I+mNCJo/tMkVpKNa7N1L1wu2Kd1dE5xAmPPx9sBI27ay/bGyRP27Fj4fLGxZc7d+bxEYCSCQ5dHzuNsPQOZCjbdpJqOw3/Osjjq6JcP6aN71St/fZkfb/pGnPe6SfpoFR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wi4IbO0e; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wi4IbO0e"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so3197636fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751396653; x=1752001453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEK3EncUVMtlip1R7eb2kLN0bNbNbxBTXXQymbbA6E8=;
        b=Wi4IbO0eVmzFTdq6qgZqyLfx9Ac4KETYqVo7987Vy11SmbdhcJX675R9C+3to902gm
         cdMJncn1FV1alw8ei9DWLUDlq5mdmThUhgcs7k5ufn24FjYuvjijDsNfw04jHW3/TQ9j
         hTG+McyFBZs5S7EVGhRKR6CrI4Al0xdd+2aENXjnfIsANYF+LaJpJQW4IgG3bGAXDx8c
         smjbOtNj9VfiqyVbXyJyaXq47yamzLMPjyVc9Yh9ZgQKPNTQf52eWjdLssR/BuQ2Wkx4
         dHAKX9HONsow38l0z379caXDINRDfyutp6DxiMNBCMrXKQ56RLvgIs0bysBImNEPNt07
         +VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396653; x=1752001453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEK3EncUVMtlip1R7eb2kLN0bNbNbxBTXXQymbbA6E8=;
        b=gweSjaGG6wI/R2+pN0O99/mriq1ANT/0gEIS1gjdQFQG9yhoehGM2Oa0MkmJA6nrjo
         ubtk/bIG5/yn9+NqeTBknHE6iq64fEnoSHHFb082cmO/cu54fQ4NDi/JozeYS/drQGC7
         WR4BRH8wp58d/sKZbjy0Xx1rmswr4HOLBdfIxvepbi9FqZ2NGIZICW2v1h1+3IIjYdPD
         NHwpqF66KJkMb/zYDdxR3uyY+Bkyqqev50D284GhUMaB3OapzoZpdTwV1IKcxlPYBDgr
         d8ewfKZ+SQBYCS0eQraT61d3X4oXGNuVVtaFRGVEYZvgT1QF5j1xZFFfv5ytu01j4olh
         XHHA==
X-Forwarded-Encrypted: i=1; AJvYcCWgJhaH9c4cp/fsUgiMPgMdNrSOQ7dEMHV0To2FvS1SRHtLFSpymX47A6I5EUqhFrbtUmgd6FMRMvtJ8PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3n408NGvkJzwdXWoxeONyvdHcq8NtPRFLECOFRbgrT+3yZQe
	+amKl7JeyszeEQCUvbnFBS3llrUBdbWNinB3i28K/G7s0zJoHfcmouYJhl/QpPzxuxc=
X-Gm-Gg: ASbGncv9fMcxcF+MjwqhwV2cS9CHKruQq6ocMay4TLu9K2OQZx4xKTGErQoQlXk5G/D
	HJlYpbyB/82kfVBDmmMKSdB6YO4ME/CCC0PiSFU0S+UEMXbHjvS62df+uopLhD9bkozOL6KG2M1
	ZEBdlkFxko4HUva4fmaydf2y0IFsQmuFpIlxM+yP6T1amUmF0fSKzbpHkOmNZ3DPnFbs4qSCgJ5
	khFxJrGbmGMSeQ01Im7CJHRnCGFTWYtlkBIO5kw5VSTov0w3VMrXU/+hmFnIQLIeKeyFxRnkGEJ
	bYc2PMSD8jzShQSkKXIaHPHpNgakVI46WsZY3j5tqrXoegfzFvr+m5rTLJ4Gd+4PfDIeew==
X-Google-Smtp-Source: AGHT+IHDxUr1xC3O4B3KUwXveX27ECu3+OaL0Y+zUBHu9uWrNi0sz8Q+GhGn5hs1DTYqhbsigADOQg==
X-Received: by 2002:a05:6870:8614:b0:2e9:e2e6:4a20 with SMTP id 586e51a60fabf-2efed4b8854mr12938843fac.16.1751396652741;
        Tue, 01 Jul 2025 12:04:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea5a35sm3456703fac.2.2025.07.01.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:04:12 -0700 (PDT)
Date: Tue, 1 Jul 2025 22:04:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <496f817d-802a-4889-a7dd-155d51895d16@suswa.mountain>
References: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
 <aGOqmd5cvCeBjWMI@apocalypse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGOqmd5cvCeBjWMI@apocalypse>

On Tue, Jul 01, 2025 at 11:30:01AM +0200, Andrea della Porta wrote:
> We really can't get rid of that warning by replacing ENOTSUPP with
> EOPNOTSUPP because the core pinctrl code still rely on the 'wrong'
> define

Ah good.  Thanks for the explanation.  I'm glad I didn't try "fix" it
then.  :)

> like this excerpt from drivers/pinctrl/pinconf-generic.c:
> 
> ...
> 	if (gname)
> 		ret = pin_config_group_get(dev_name(pctldev->dev),
> 					   gname, &config);
> 	else
> 		ret = pin_config_get_for_pin(pctldev, pin, &config);
> 	/* These are legal errors */
> 	if (ret == -EINVAL || ret == -ENOTSUPP)
> 		continue;
> ...
> 
> Also, many drivers still rely on ENOTSUPP. Maybe a patch that will
> fix all of them at once (drivers and core code) is in order, I have
> it in my todo list, indeed.
> Besides that,
> 
> Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!

regards,
dan carpenter

