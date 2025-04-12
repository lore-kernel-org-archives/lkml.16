Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8F78F45
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467560; cv=none; b=jKdfUvyNZqwqcdlMItqe4W/Bxluq58HEmM4ht7+xnJn/hQ3chZOhmJdFmDsgIVruIXTaURP5rZFYyW3lOiPI5f8tcyqkJ4EwUhKTiB+YDP29YHgg8bokcKF5RKXAuRVkD51r4Aua/M+C0IxKB7fCnRWmvrJ+Kx19t3QDwsHAblw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467560; c=relaxed/simple;
	bh=yz6epcKAphDwC4sqY+d8Vu+1Rl6M0axJyNhIkKMyQ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCbYfpIcYpxi51p1cttihcs24NG2T7tToaJ+iv6Tz9F1oYnYHKxC3RwSW59fttICsMOGmdLMsDRUAt0hMjmcLi42noLaJ+Zf8DAjyUdIIQfWsiZDBO0ch7S4VxrbvNEWKLhLZ/WE/Ti3VBuAkqcjZLEnCNhGrAugI5VXvHMaVPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFOxd/Y3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFOxd/Y3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2417766f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744467557; x=1745072357; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JHBL7CYWwnBjd3jrunm4nVzAhAz8iBRNbPGJWtoj108=;
        b=IFOxd/Y351UG41jeBThkv0ejYLHqu3/05GsrDElkmDnyDB8heGhazJoyZX+r80Njnp
         XqEiJIA1K6aNHQpjTmwAXdHvmOXF1YW2mlsv1s2wS2mpzWIFagsjA2k4bQ40bEAFBWug
         mLwB8W6CuraHcxsVvC0c/4bRYCWfzWqlGu3SDib4ebEpNm6j30OouW4ymMNWog2qEWcU
         of+tP4pXq5R+WpvoJMjuVjRC/zHJcreEcmAtLnkD3PkOFvLlxB2Eex1aSjKknOlVpHwD
         meh2GFdFpzoFeBfGpC9DvqV4el3tuMQwW5HltQZOTnV0TVkQCOxnCnDjf6KZ8Qe54gxy
         mstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744467557; x=1745072357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHBL7CYWwnBjd3jrunm4nVzAhAz8iBRNbPGJWtoj108=;
        b=WTfclEiGRwEZRPFmIetL78Kyf/yE+H+u70xX6vS7XZTkeWwEN6uayBtv5F6fAZH0Lt
         U86yct1JLCclZmlmophyXZWBp6zW+mUJfjBRhgffl3pLwbdvmuIK4y/mY896WoZ7D44V
         5R4WnxAJCeNH3aU+eb8GTaSQZnLesZRkk6Lo3jPGQdZw4WcfIc0y7/WnpzDhhzJajCBa
         NfKVFwB0+JfBLhp7bq92zZBPsFo+zwHyMRG2IWHZ4rtY3YKbmtE5aRprpAmWa3IDsJ3h
         Za1hasLidWzClh+CxjyH12wlPrfetHR/HYCUu3spmpHgkJsFI57rDRntE804irlbCEcR
         XmCA==
X-Forwarded-Encrypted: i=1; AJvYcCUhQCmQ6NNIEd9FuILRyfhgDAr+FTlZTio7CnMJGjhhtl/8Vnx1i8Vu3W0QJ+xRxFbeZKrZ//akuQjmN04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLb41KR0U2cxu+gG7olxXe/5qP5kiFdrOkXGVnPj6MwED+YC4b
	9asAUFFtW4y8xuYE4C1tQnatJAnuAW5TQKqPz624R9UKP850Vk/jdZd9R+6bs9o=
X-Gm-Gg: ASbGncsRxdjcf9BMl2A5/w/REiqRzwR/BNeQSVj/mBZMhWIXc4R9me+uDbrK3gMQXc+
	+kO6E4AYqCU/L8I2zIzKZqOY/tyBaOkqrZCyoi1QS8ECJNJjFenriWghy6XaIQidd3HBlagoU+t
	AjZqeYWCllOgjP1D2mSdlGZ7jQf4u9f6yUb6UdEuDnq3HSJMM73is0yWidtvxs2Nx0tkWrI8Zs1
	PIBnsi3uQSW5r7urBQWvas1ZSFeSZfO27HPl765XHx1qSpqwnhSvuSGrDjHEa21bqqMPp5bdV0A
	osYMHFyO5s9AJoDXxVj6YQc142l976i+kyaJ3c0s0CM2PA==
X-Google-Smtp-Source: AGHT+IEaXX2OSI4xMiPL2LlRp9XzH1rVJcRvtRXaUMBzdzy+GqUqBfNUNEsYMNnIK3gvqLJKjB6vpg==
X-Received: by 2002:a5d:5f96:0:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-39eaaebeb38mr5812638f8f.44.1744467556566;
        Sat, 12 Apr 2025 07:19:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae97b249sm5222195f8f.58.2025.04.12.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:19:16 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:19:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	andy@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
Message-ID: <209e5330-a4d4-4ecc-8d56-199f4a190c3c@stanley.mountain>
References: <Z/bA4tMF5uKLe55p@ubuntu>
 <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
 <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
 <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>

On Fri, Apr 11, 2025 at 03:47:40PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 11, 2025 at 1:37 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> > >
> > > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> > >
> > > cmp is good but not good enough in general. Here it shows the 1:1
> > > binary, but in some cases code can be the same, while binaries are
> > > different. To make sure the code is the same use the bloat-o-meter
> > > tool instead.
> >
> > I don't understand what you're saying at all.  cmp shows that the compiler
> > was automaticall tanslating the "& 0xfff" into "% 04096u" so the resulting
> > object files are exactly the same.
> 
> There is a possibility that the compiler changes the code to the
> equivalent and cmp will break, bloat-o-meter will check at least what
> happened to the size of the *code*. object file is not only a code. It
> may also contain debug symbols and other stuff which may break cmp,
> while the code can be *the same*.

So far as I can see bloat-o-meter is only looking at the size.  I
deliberately introduced a bug to see if bloat-o-meter said anything but
it said the size was the same.

regards,
dan carpenter

