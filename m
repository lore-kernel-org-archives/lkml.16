Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6326FA52
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362105; cv=none; b=d9x+RrZaufm1zE1+gYqH2tQTeqHy0NKXHTujIazAp54KMNBEk6x7NX4fejvYk/B6aLqFk0i1Kjur5xl9ABUijzQb5YQhR4hNpqZW9NA5C9io2UUe725LkEUgTDX2NNyQ1YGPxfN0pbLZZ1jpwBBq2lckVj3xz7PU/QW9cDo33sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362105; c=relaxed/simple;
	bh=xU+kDdU0gwzb9LPPDqkZf5rUekFrGYUlG52+CjTps7A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNFSgsRfKTqPAJnBfD400CXAoyM46Z+Fr1t5/wV+5hUmU2Fme8EXfm5Dysv6KI8LxaLqR84jtmICNNc7LGh6mMuJtplAoLb3VcKzUe9NHG9loJMOFJs0RCLaPtFWSzprs0urR20sxloE7TT8HizFXpIDjhpNdewy1qFsjA1SG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z8s/K30a; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z8s/K30a"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb5ec407b1so544611566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751362101; x=1751966901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vW8tXWZC+/EOEMWh/X8OhS7IFKfYxgh/KBq6rDgPsK4=;
        b=Z8s/K30aun/xPgKGqAjd0fMnXCDU3mgK0OgZbHXARIBxjPzOL3aQ60RPO7OmD0ETKn
         Rfe4sLdiiP8HTDHybRwu2slNwtUM204NfDhAeCqMl8q6DME2aEFWaIr5Btak2+Odytpm
         M1U25VIpmqsW43umLqsTK5jVNv9x4iXFCiJkA0assksKUv/WB90O2JqNfRx6zkXRIbJb
         pCijUpnNDCc9pVw36K7nrSkXGkZsYwnrVTGTNvJ++/x943jGME9P/7zqcVO3dOeYKQLm
         DBfa1royiNE+C6c9QTGYw4dZrHriapjZRAGwdbw/rs5MOV0RpEkn/lekzvfK5MNyDgEp
         vF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362101; x=1751966901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW8tXWZC+/EOEMWh/X8OhS7IFKfYxgh/KBq6rDgPsK4=;
        b=xI0o2nB4Y7khQZfJmNcs5sLmC1/6s9FWo45cgWstbEgJxEh0IsVOhzMud6xpFU7hnN
         Q1noimF7e6H3tp2yL+WAUMCjk8BpocmUSbxJ6cAM5FQZC9e1/sVceSS282L63BFU5O7/
         ihnxW5J8RxAVa7d4425mrg4Rb/DdmN0+C800z7YGhSY21WZVYxTq9Oz+gnfEMX9yVEQb
         3ck7sCRT//1vd9Azg0FkDfZ9t+xnUXKPhB7Ud/9tG9/Gkrnr93bWRmsfHYBJNZ/Ckmm/
         gM+mAYEJY7TNn0u8Uw/b2ul04ikuaSHCWMbKHFAO7dx01WkGuWCBNFvZCp4YJx/PI3oz
         vWPA==
X-Forwarded-Encrypted: i=1; AJvYcCUDMDJDj1njdZG9zDzQZZcjJ6Kcitvk2gAQLJehbTsfYV37PBWTEYb6+5Rdb2aya5JPwrtm+4gNRNUrJYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmcMROmwIAfviLNtwxwxdX6fRSitctTUPkFRWYHMrAcXlMCP7A
	JivP3iknI/zUJtYqDHa/jOcsgf6BgiKOASCVxLN45u7mx+BFM5Rpo0dY2RvFNU6mRT0=
X-Gm-Gg: ASbGncuzfs/vvThrW8WHcC8b98j9VvfXJSwM6JoobEho6SlhT+hhquxap4h8ZKnGPnM
	BQMsW5IoLgTnQIfO9BD51LHBvFdmKjCsWeQ6eXw5+OJFQfKWG6rtdGUrVDFRvn80a4Gs0I8YU4+
	sWY2k6SJBb+X8iRvOVgZ8EsllX5iBk0C96672IRbzmuzqyvBtvUc7EEt+PNPjS8uUyxOlf3ERbe
	HNBgocBQslxw+Iew6iYm8z0h495GsFIHhF7UOjk6pJnbaqxeQehAbbTfXpZH/MWs6honyykwlPc
	BMiRdKn2jMWWhWuPxClm8uP6Y86TukrFWPxcQ7qiW+9JAsD0GrgKnFEg5fZcqkjjiDtNr1IjlAl
	071PJ3+QNyugnh766Y4UCpXj7QcH5V1SR
X-Google-Smtp-Source: AGHT+IHbFo4CW/gWO5mfmqvdr8G+K+m/vpRfFZfo55Xt83CarSb1cUQYS0Vzv+Vrkh5sEZMITIneQQ==
X-Received: by 2002:a17:907:a4e:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae35016b435mr1478913866b.51.1751362101509;
        Tue, 01 Jul 2025 02:28:21 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e2a743d53sm1292386a12.28.2025.07.01.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:28:21 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 1 Jul 2025 11:30:01 +0200
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <aGOqmd5cvCeBjWMI@apocalypse>
References: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>

Hi Dan,

On 14:35 Mon 30 Jun     , Dan Carpenter wrote:
> This default path could probably can't be reached but Smatch can't
> verify it so it complains that "arg" isn't initialized on this path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for your patch!

> ---
> I didn't add a Fixes tag because this likely isn't a real bug.  Plus this
> code is very new so it doesn't need to be backported anyway.
> 
> Also checkpatch complains:
> 
> 	WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> 
> But I left it that way so it's consistent with the other return in
> the function.  Maybe we should change both?

We really can't get rid of that warning by replacing ENOTSUPP with
EOPNOTSUPP because the core pinctrl code still rely on the 'wrong'
define, like this excerpt from drivers/pinctrl/pinconf-generic.c:

...
	if (gname)
		ret = pin_config_group_get(dev_name(pctldev->dev),
					   gname, &config);
	else
		ret = pin_config_get_for_pin(pctldev, pin, &config);
	/* These are legal errors */
	if (ret == -EINVAL || ret == -ENOTSUPP)
		continue;
...

Also, many drivers still rely on ENOTSUPP. Maybe a patch that will
fix all of them at once (drivers and core code) is in order, I have
it in my todo list, indeed.
Besides that,

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> 
>  drivers/pinctrl/pinctrl-rp1.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> index d300f28c52cd..f9cc6b28994c 100644
> --- a/drivers/pinctrl/pinctrl-rp1.c
> +++ b/drivers/pinctrl/pinctrl-rp1.c
> @@ -1524,6 +1524,8 @@ static int rp1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
>  		case RP1_PAD_DRIVE_12MA:
>  			arg = 12;
>  			break;
> +		default:
> +			return -ENOTSUPP;
>  		}
>  		break;
>  	case PIN_CONFIG_BIAS_DISABLE:
> -- 
> 2.47.2
> 
