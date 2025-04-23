Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87E17D346
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402761; cv=none; b=FxrpmoBhug3l43fYXpqo+iwTbtHyYrTi0wms9hPzroeahG1j0pcgew1jp9GPIHd4H8vRz1emuPOLDskYP8XAvIbWUakaHcbBbjZGnI35Ar4e3KudnHLMcDMrBlKjjLmYdbvXKP7sDoyGwHR3rb7LVLXPTJkkkMpooIN7FPkSgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402761; c=relaxed/simple;
	bh=kw3oA6g0L/J+SJt52KtP3qj/6ZRBvYA/Jj7aRmbJo2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGFiyNCekBR6p7LmSWo8QyT7qu62kizEXgMExhantvpWWmAA6GIhRQ8uhX8LVzHmAvFNM0ECGBx/MBRUA/vdEQ2YfKiloRjQ2e3wMonfGNzEHUYfNugcMG8xUfv+9ghfgNEBkKGEmyGOpq3ld3VNFTqviifaC65X/usy2eiM2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZaUwGUI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZaUwGUI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5260835e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745402757; x=1746007557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUbJaI9VUAIMhFIIcaT0OkYeQfgO+gViGfE+fCTNZxE=;
        b=ZZaUwGUIG0lRs1GV/UbImRtSvwp/uFdK7NO3fZYZ0z+6H+c9MyhLXH8+IKLfniBS+V
         A9HWCIxeGh9rWikmPYY3Ve5DlZNn5Irpg+mq30lP/SLRsWn2Y5U8VCRTna5j1uEZpiLi
         VcDUcXv8rRG3hXTN03WJbmXK554J6TYjxUZKLUsFiUDmviB6c6iBA7vG/iN1UIA6ZRo7
         u7wZh14U3H3wP35O+4vAUcWxxHS4DMWNE46FZu4d9pFEEWrEftL6XGgupMG+FifOg67P
         QAl60cj0Ifx9fV82ndMHkVvG71VZ/KxeSJN5E5KQHkOBXxFl6d/m7/ja3TsoeE6aqG6d
         Dfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402757; x=1746007557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUbJaI9VUAIMhFIIcaT0OkYeQfgO+gViGfE+fCTNZxE=;
        b=d2A99laG9Rz/5bJ6pjk/NOX5IgH3fL3c7ZmsXmsg/H95pNjr3VF6gPqHkhz/mR/aq1
         MDTbEOI0d7phKSXm7radAgNzxRfRp0Sz+s4pgzIfbWGx6nNvp8J2hq8d9wIiAJCIfrhG
         cRpR52q/VtfN0gQIr/j+7oz1gV9+t5nzZKUnw/5egJ5MPBN0JlGgDReE1Dje54iX8fon
         T+ulBVqhM8jztPgHFnqb8QPX7zh7pOy9I3nM6tbNa6r7AVirk1vLrXc/a0UNE8MKHpLO
         aCZdPTZg9m0yfZhocd9HmbJSkYSRG7YlWni9hpI1PlTLeZNuta67YIxGBZrHCtTsscKT
         JR9A==
X-Forwarded-Encrypted: i=1; AJvYcCU8TXLbR4l+amsAlaZG0Xa9yXP3LyxiMuj3hNYScWvGgN364bGwE9i4CKw6gfnToLpyRvzfupk6b4+jDpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXesFeLhK/QZyGiJ42bHAkNupGzSscCXXVM2ra3wfDCb3i4Z81
	Lh39o7oe/nZhVvohR4Sk4cQf1Dc7Xa3ZUdOuUCvnqWrMiYJDwjgs/0qcufmijrk=
X-Gm-Gg: ASbGncsWgJbtwGbKFyaLEYA/AZMMl10LdfhXPoc7V5Tq8sTPP3qXEKS/M4ligDm60jI
	4JCz0rPR1XZ0V+F5uDkrxcJc98qqaQMNE6yL0JEMScjz9b5d/AX7J+PjsV3zvTEPe1/7IMkWTsO
	7QRWtwF7adUBi5MomVJWu3ZEhCYHVuvtF9nl0cRjPXkmlEiLAyC8IwI2j0S/RU7RHuLl0L7G4kT
	RiXlecji7gXkprhCkktg28TP+MYw7lrXkWELOZ90tDKFOCPK8OY+RVHnVwPwrxHV8jwd+EK31LN
	urkdUxT2vbeL/0O+qOlNVJu5Q0mai9+gQvbK9P/lG3J36g==
X-Google-Smtp-Source: AGHT+IFPFttObT8wggvieeFV9lBPKhqslxXbFCmW0/ya4RhTdPNGx6jYRFvipkYVNlPNySJfBOYuEA==
X-Received: by 2002:a05:600c:3b24:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4409386c438mr17536985e9.11.1745402757553;
        Wed, 23 Apr 2025 03:05:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092dbfac7sm20079765e9.37.2025.04.23.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:05:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:05:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] driver core: auxiliary bus: Fix IS_ERR() vs NULL
 check in __devm_auxiliary_device_create()
Message-ID: <0354481c-c6a3-4573-a138-56449b55034c@stanley.mountain>
References: <aAiiLzqVulfGDPsl@stanley.mountain>
 <1jzfg7nrzn.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jzfg7nrzn.fsf@starbuckisacylon.baylibre.com>

On Wed, Apr 23, 2025 at 11:31:56AM +0200, Jerome Brunet wrote:
> On Wed 23 Apr 2025 at 11:17, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > The auxiliary_device_create() function returns NULL.  It doesn't return
> > error pointers.  Update the checking to match.
> >
> > Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks for catching this mistake Dan.
> 
> The thing was initially setup to return error code. Greg asked to
> simply return NULL on error and I forgot to re-align the devm variant.
> 
> So I think the fix should be to check for NULL as you did but return
> NULL too so it is aligned with non-devm variant.
> 
> If you wish, I can handle a v2.

Of course, it's hard to resist an offer like that but I can send a v2.

regards,
dan carpenter

