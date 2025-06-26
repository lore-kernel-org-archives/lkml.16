Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3028727E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944105; cv=none; b=j6C0mKVacZQVYGAtVvqSsDSRVjzJq52eg78t6Ayy5FVnih4u5TsFmLhQDvGYT/6Y95ULqyL8umswUa4ky7x5qujxTVk2YbqTqLUO9UJiZnFuSeLR1aUYAHLJqTtYPJPkCJPl8rwq+3S9iIn9OnPij4Gff0zTGgbnHWPkaBlbPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944105; c=relaxed/simple;
	bh=d2ynvgpLC9KJpAzvF0WB5ZbHDMmgOpXwsY5NyyE8fxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaaHAYJDPfyAtxFQXYrWefTcX453DJ69JeqmNEq06tLSPeEKa1MO2hQVGT5hMp0Wb1Z9K5MonK/XomYN8hpgVrDZMZqoi8jOvmUjhxRR9LJXLmgw65e7VOTQUJGR9g39AgHUFPjo93zh6tIs8tfe9/74PChEgB6OReDWCuxXPZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD4GuiAG; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD4GuiAG"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40b1f402deaso477166b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750944103; x=1751548903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOFVRCcBUw+mWK+/Dekm7KTQk+bIykTI3bUscdv9A2w=;
        b=HD4GuiAGNq49KvM6T83C885B0zipbqFxxEVGRMbmbuW6qRSuaLdgmlAP7faMJKpYny
         1ngzXEK4y90dAAWM+rDQxjP8eDVRUx9W7FScg6GTd300gZzJoo7qV5DszmTPiNQwQt9G
         S/L5XQdfgHcSfv2ALF5LvX1B9DDd6+lc8dVejfw4SBYkzJOGE7bwQLMS+bsUpge2tXQE
         o23rVZ2cIGoZciTTw+t9316b+MFiOVCazdL4csVh5YIAeAIi82BxGuR63XtUcjEoJ27y
         aEFCX8DUCxa2gSq+6mMAfXar5EEb3pudqylUCz3aqcS25R7oH7EpAJ/mHMO5efUTnIFW
         CtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944103; x=1751548903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOFVRCcBUw+mWK+/Dekm7KTQk+bIykTI3bUscdv9A2w=;
        b=G3S5tHx5buQAsH0lMTgmcEzTJAnvkdR0dEZATiCxjqiZ+buJiv7VkKjVWj5lzONSc6
         lIKmxPjdxUpEV5693R5y8bfRTg7U8sltGSoE4AX4k33XuUl1c2d9hqHjsCaXW0hhXkfz
         RjkCXcQOvhw06o3Bp99vlDkQy+xsoi4b3En+NfQ7PL2Q3B0J7FMimECT1/yVJquFoFkF
         08zStuNbuwrj7qzE5uXhuB3EZJ/RH0mk7HSuVBNkzbzkVqJlC5KF7L3JjBAzRnuRodiL
         VXlfZdH/GG+wwRsj9fkEw6KO/xJGpFzo+F0wR77wxaRYiXPgWuEXExpe5Am95/fTuvPP
         nbyA==
X-Forwarded-Encrypted: i=1; AJvYcCUNdnhSAFzZs4AKJi7WckGoeh0RL+XJio2unr9bsI5TXz2tEUH29MTYF+tKBhGaxggkj3pcrnp8ZYp4dOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXak6Xn++9VJdVuy/J5pxWUIs9qi8/8a2T8Vp0ri8ClUVHTyL
	vOKty9jewAPCREDyWOQHvzW5OgZJPtUhFjpPwIl+fbyzr/Kz8rMXAx7u4RlnqRf6RIs=
X-Gm-Gg: ASbGncujolmUQkWdl/VFM2cMCzUdFqQJbmvFM663cWcOW3KEqvXr/SaAN7He1qEFBN5
	daMj5jUn8eVD4KjvCdQ292BTu59OhjlEExWZkSP4phhuWIcYt1pWYlQIB1TGXUjRm2CBXo+O3+w
	q7ddOcEAb+Le6e/Tv6RRrDQElsyeEZ7hXOMJEydVkLoogv2pqohJqOSlv5ARhjK6bjsQ6xQPoAk
	ituWHQ1fK56lX1tgdtRRfVl686fhhmM7LAQA6bnKzbqJB9R68fWeiirtt2WGeDTKq0GZPmKuhiH
	cCEBH680xnFGh9fhKzC8Qe9cpeXCEErzeJWQKKKFfvZ5l2v/L3gMAzt3PwfRtTLROlw=
X-Google-Smtp-Source: AGHT+IGvz6gUhA5u66fVOK5ErmCf+/tRiLHCvux4O1ovgU9jkUorXeS90Wph1Qw856JXzjrMzzPw4w==
X-Received: by 2002:a05:6808:ec3:b0:406:6669:f4c8 with SMTP id 5614622812f47-40b1c3bdc99mr2599256b6e.36.1750944103075;
        Thu, 26 Jun 2025 06:21:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c327c3sm2588372b6e.19.2025.06.26.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:21:41 -0700 (PDT)
Date: Thu, 26 Jun 2025 16:21:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lianqin Hu <hulianqin@vivo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: remove some dead code
Message-ID: <81a704b2-56c4-4ea7-bcce-831ad2e4d070@suswa.mountain>
References: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
 <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>

On Thu, Jun 26, 2025 at 11:53:05AM +0530, Prashanth K wrote:
> 
> 
> On 6/25/2025 8:51 PM, Dan Carpenter wrote:
> > There is no need to check if "port" is NULL.  We already verified that it
> > is non-NULL.  It's a stack variable and can't be modified by a different
> > thread.  Delete this dead code.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Perhaps you could add Closes and Fixes tag, but its up to you.

Fixes is only for bugs.  If I put a Closes tag, then I'd have to give
myself reported by credit as well which is just being greedy for tags. :P

regards,
dan carpenter

