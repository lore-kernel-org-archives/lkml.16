Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040A217F56
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097782; cv=none; b=kxFgHyjMWVvRJwYi8jApWuoWI/MkiLBTs0v7UXYtUKQGoVRjKnsbqIZNWOQIDeVRjS9D73mMSHYEey6EX20WwixH3gPTG45pfFF3xX0lX0ibA3S/vUKqgGZl5WMBF45ERz7wj9feNiy1ZOnzDbk/hU9sVMjdtPW6k7DZ2zvveb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097782; c=relaxed/simple;
	bh=hishAlYarzpYkWDiZzcN1tYkTRPdwHa+/Z/vANbUma0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKQkoIRrieph5oN2TSFOmYni8rLkTRaEylEp7vUmKU2TGu/ZDpiyTjL/NwdHPPzB1G1JFjDIKpbaQsUmoeqH/i+gYk+gSXLJtcyciBfrRH6EzdsNwTAvxeaup/FR5Xq3atLtQI29uv1p9cnbJJFUa8eZZacPMEpPa6z9toEzXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OlVBQpkO; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OlVBQpkO"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3550821a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750097780; x=1750702580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl8PkghuCWqFkQT5amFIMJEShqvcx+zM//1mjsk79zk=;
        b=OlVBQpkOU7kEuKrcVjDsjV9OxWlUFNgxF39B6Lx7SEw/vGbYoX3Zmx+HIh947qlkNo
         WWbYiADO2xnyE+GPdY/x+fyi83tuLyUGKVyKNKN6i1915wb7HIHV36gbgx91Vf6uNqx2
         13qYCz52FQvyi86Pwx740BhLHYqYXRMiaeo7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097780; x=1750702580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl8PkghuCWqFkQT5amFIMJEShqvcx+zM//1mjsk79zk=;
        b=hFk/M4XIoaMCyhN781NSRar6KjbRI7d9OORgKxhj3c/5pCliB0K6ihjJyBL92no9ko
         r3SoPjQpycanimcTm+VyQCcRZjySzt8nJ/mHg20Y9uEChYq2m8GU9dbbKWkIpy6+z7PH
         H3ifa3gbdlzTgYVgG/YvPsi7G3DlV8IMJGLOhSrMyt1S0kbaYtSJGiOq8WeZJ+pCEttx
         GCRwbiTo0Mo88ZEuFZ+Of9p0/+oPlaev7LMpBybHDjjEWWHGAyZmnu3fHB8uPLxRqBk+
         du79YC99pX3gkO40b1IfeqJfUSH/fvOLlbWrH8N3iNQBojkof3i/1eL1ZXVBdReZnSPU
         4PdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVeNbBd++NDMtxFmwI5cyb9d8zkLRKijLoqSp6JS3lp3lBLebkLJRlVqEguMv5leT6ViIaXiPf5Gksx84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1SBEMcBuBmp6J7xDx/j0vVLS5v/Bg3UA7nR12rhWp+leNmlQ
	2ZDOyDhFo7hK2G+Z0bXBq0CVuY2u8D2YYWXl1jGmkLATJFSI4sq02QjURkTBOfp1IQ==
X-Gm-Gg: ASbGncsay6PJjb8EYT9xdFylI8a8wsKdJSKXvqIDnmmDSU4G1Hbum9nVIcKQjqBPD83
	fTY/vQFTWknL/vKdeSQhIQ7tJtNuhTpIgwoUvbseQlwRagxaxkszmqIwGmYBtFP2grK5U9O3piU
	l+svJTqMSnj8RZwdv457MXdsN1VZOfh8YOZYypf4HONuzc9f4mFNccZ+AQerkc+jHxfqX0YXKnU
	Riy2gRs9Lnia/nNug9oe7GqWvoFb+JG2hwPCPJISgOJ3l9LIXz+sWb2a9hm+W3j81OTfBB6uc3E
	STm470EKNJNwTQfMVXTLiuk/GWso+jNMSwU4Ks9ECoQUiVlof+wdv3GFC9oM7bJOSgG3Usf59W8
	WQLYNYu/WhKUvUhTDalHrdrQ=
X-Google-Smtp-Source: AGHT+IF21Fesko939SBPpCgWRIkPS1DA0RmshZONlWsh46qwm4hB/VYq64E4e1CY0dJS7UBmNcE4vQ==
X-Received: by 2002:a05:6300:614a:b0:21f:51ea:5c57 with SMTP id adf61e73a8af0-21fbd4cd474mr15723881637.16.1750097780283;
        Mon, 16 Jun 2025 11:16:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:89ef:e9ef:a9e:d5b3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1642ecfsm7234288a12.19.2025.06.16.11.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:16:19 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:16:18 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aFBfcg7E38ywGD5W@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
 <aEtWtBKfNhDT1bF9@google.com>
 <aE1wvuamXqVTzpny@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE1wvuamXqVTzpny@cyber-t14sg4>

On Sat, Jun 14, 2025 at 02:53:18PM +0200, Michal Gorlas wrote:
> On Thu, Jun 12, 2025 at 03:37:40PM -0700, Brian Norris wrote:
> > > @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
> > >   * boilerplate.  Each module may only use this macro once, and
> > >   * calling it replaces module_init() and module_exit()
> > >   */
> > > -#define module_coreboot_driver(__coreboot_driver) \
> > > +#define module_coreboot_driver(__coreboot_driver)                  \
> > >  	module_driver(__coreboot_driver, coreboot_driver_register, \
> > > -			coreboot_driver_unregister)
> > > +		      coreboot_driver_unregister)
> > 
> > You're making arbitrary whitespace changes in this hunk. Try to avoid
> > that, please.
> > 
> 
> Sure, will do. It came from a style warning when running
> scripts/checkpatch.pl. I thought it could be useful to fix it on the
> same go.

That's odd, I don't see any such warning. Anyway, typically I'd expect
such things not to be lumped together under the "separate your changes"
guidance of Documentation/process/submitting-patches.rst (if they're
worth changing at all), although that may not be a hard and fast rule.

Brian
