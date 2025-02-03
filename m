Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D2208995
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596962; cv=none; b=UWwXUitUTB+SYX9rLf16cvpNnBYWvHUqWiz21R2NrX/FPj0zqemSDjdAQX0Tw8mI70Sf5Nhr4qlSZqUx3qoigMJmwaGd/rk+d6uadZS27OWutE2Wd+7+gv70a6WEhMR/UTUQBreFiA0Bx9nFoewK66YaYoJohlISJth2fHtYPwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596962; c=relaxed/simple;
	bh=NbT2jse7OVFtYE1b/6ZwaPDTwl+uyOn9KBHEP6I2QzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZYuV7HcPa1Kcib+6JMAxrBBKZCRjR87M4FOxP5Uj3YcgcT+cis0Hpf3qMAQHaFwwcz71v4JFjBENlkvP7Owp1cgJatMlEdlrBSD378N93VdDUfhPFRnputz77e2t1Vc2tNQGR7SpuDasfvfB7JyezgpA7BuHpTiQQU1CmHOjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFAM/nHP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFAM/nHP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso31363135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738596958; x=1739201758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=azH/4pudPJJXolsxfYoMtAK2j6+tp+fBiLsk0O5rQeQ=;
        b=lFAM/nHPM8PB2TXpcghtBQCtg9xdjWRX7SoKOnWuo2sfoEXeaZ0n8UG2kyjUQzCo4L
         I+uoYFPvz0vRM2nt3/P3qXseblr1zPVr/MfhubhwC3romehyUeXT9GhozbbcUxiapDOY
         /0nLLUE1QsjIeuq9/dW+HjYyzsnyRZBwDNI54HSS/MYguf6+ZGhPeJPNMK/iQbx7pH6x
         yWmnVYqJdfF0gZt3WBG0HKLERoZ+OVPeyXjkS0FE34PvAfstihtr6pPADF4eE1ZDamt9
         bD9xdqk2zWcDNbkySx6TCTI9dIMZeEfnVvIuDQ4+pkZfaq6LADUuVVxvQjGm2suuf+ZI
         hAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596958; x=1739201758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azH/4pudPJJXolsxfYoMtAK2j6+tp+fBiLsk0O5rQeQ=;
        b=EXJDPoCULpFB6RWilZ61jAxOTtRiXR+85TbNsLebUcn5PWgaPHXbT6Qa1hAZxbRCmX
         RognH8Twb/pxoE5ewlanF/FmknfLytTEAIKenKfS7BD74z8IfHKza6tOJa+rlJo1XWm0
         3ip+CcmlF5DchpN5McRHs7unTUHIRzCubgkRUU0jdIYV0OGndsN9Hy+ao8w9txoi+2PI
         7y0wzgl9b5RJ7Wl5PwL1Qb9n4PH72gh3gS7c17kdGmWfsuUtiTg80L5ib9igFF7OnTW/
         033JlQiJzmEAKfn4lo27ei+f3tRbIY0jSYPYZQhVXrl5CMGmw9CiPavPLhv9hizhkzQX
         clRg==
X-Forwarded-Encrypted: i=1; AJvYcCXzrBgNsQtEY6REwWKZscAmEEJG9U4+qD9Yk6lnKarlmwvDfi2mzwBgD0xpc18wbA24D1hMMVxKx+jp+GI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ndxiusMKbpWBeu6ssHGF+VZgc9EBvSKqAxcrWJiedEjww/+b
	Kcl3sqUKPckcl+cxx+vSeZElOyDGjNIhSQHLnJXeMp3CpVBpibqNIMxOn5TK
X-Gm-Gg: ASbGncvISDyY9rVnmLYcg6XjKI44c8ZszblQUWjQ7ug0wJOtEAukZpybXVJKKi98TRh
	UK+kNE02fMKZmhiyh1xnj+g88uM9lQV6lTqR3m6yx2ise5XayB6w0NEduQL0WIa7Q+U3dhoSVNT
	DinN1ej+ubuFdLPplP5B21vhqbrUlf5ANz/4GDS/fg/yuZonOnx8YuwQKTnND5nmTXgut6hxQSA
	SGlebzehTatwOsN6Zm820k7+WlWM6dw/8zMXEvDRmzweWNT5acySwl1msdhQA6t69ULrMTjuQKX
	uRFRqDqk
X-Google-Smtp-Source: AGHT+IHXIqNw+N1lB9ZZpb0dsMHwzYhno1UN8hXSkLNTI/vtKpv/45SICNEZcEigBsrTiarPNrxXGg==
X-Received: by 2002:a05:600c:1c29:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-438dc43625bmr201127175e9.31.1738596958366;
        Mon, 03 Feb 2025 07:35:58 -0800 (PST)
Received: from egonzo ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm196512015e9.34.2025.02.03.07.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:35:57 -0800 (PST)
Date: Mon, 3 Feb 2025 16:35:55 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ian To <onlyian4981@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: format no multiple blank lines
Message-ID: <Z6DiWyufORWca-4T@egonzo>
References: <Z5yISXwXoyl59XWo@DESKTOP-GL3U3CJ>
 <2025020335-impromptu-renewable-83e8@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020335-impromptu-renewable-83e8@gregkh>

On Mon, Feb 03, 2025 at 04:09:45PM +0100, Greg KH wrote:
> On Fri, Jan 31, 2025 at 12:22:33AM -0800, Ian To wrote:
> > Avoid adding multiple blank lines. Reported by checkpatch.
> > 
> > Signed-off-by: Ian To <onlyian4981@gmail.com>
> > ---
> >  drivers/staging/gpib/hp_82341/hp_82341.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/staging/gpib/hp_82341/hp_82341.h
> > index 0065ebd9747c..d3cf1f43a1ef 100644
> > --- a/drivers/staging/gpib/hp_82341/hp_82341.h
> > +++ b/drivers/staging/gpib/hp_82341/hp_82341.h
> > @@ -26,7 +26,6 @@ struct hp_82341_priv {
> >  	enum hp_82341_hardware_version hw_version;
> >  };
> >  
> > -
> >  // interface functions
> >  int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
> >  			size_t *bytes_read);
> > -- 
> > 2.45.3
> > 
> > 
> 
> Does not apply cleanly to 6.14-rc1 :(
An earlier patch, commit 8418753187ba ("staging: gpib: Make static, reduce fwd declarations") changed this file. It is at this point checkpatch clean.
cheers,
-dave
