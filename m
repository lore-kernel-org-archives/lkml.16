Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A0202F88
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744394638; cv=none; b=QURSG+28dkoqrJww4sy+gzFs3ay3E/bhxQjRGj8F6NgQ95dG5EK6aS7y/Lwn2cqQuQ9xYUgeVo5YOdUNxJh2OAyrS07vXnyxk59zzcLS2F0kmC+9apk4cADgoDaWNhxbSmCndNAjRvJsl1T3g9L07LHtiRJyjYTc++o/LcWo2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744394638; c=relaxed/simple;
	bh=x8x+1RUUuoyKVvm4rwiW1cGjTypYl2uDQbLP7Tq+/ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsOIJcHPiVHZgICcFyZBMI+MLjecqrxbKtCAvyYGZzEiyAEHVBC0sXIMTku5dUWvT4T3MA80YcFq454vAElqPPlWlyRrqRk+64+FVLvgh40/kwHMncDXUzweehH0Ke+O6W6SUHulePs2l9jJSQBv27ZeyQNewSXHZYoGZBCBRKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=DXEJAYp/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="DXEJAYp/"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7040987879so2094495276.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744394635; x=1744999435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwUA3HJN+kY+Z/XkRzxrR6K4yzKq89b6kJGOJP40UfI=;
        b=DXEJAYp/YUT7qY6hWE5d6lyGPp2cKofR+BrACFakl3jhGZK4x7NOmb7mrlsQcidUne
         Z7iolTqlMEpZXIWQAQs+2UG+8Sms2U2H34sDS6L0SvEQSrQ9SATrHLkpmaoDayLcSFue
         hcZnJ0rqsXhF5MA6Oc6um1Re4WKSBcskP30SssltzMccn+NrC5UL7ZU6Q3yQCuGsSUoE
         a3qqiZ73WokBSChm+m5VNK1lV1Z6ahrStLtLyVfMuL3GoDQh4NBwD3qUGamOwTv6crD9
         K0xjJt3YiypUckpk3H+HPP9uwIdzDK1v5TpEze5ugZ5XOSXTWizUJLL6q/Oq+4zz3Rs3
         QIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744394635; x=1744999435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwUA3HJN+kY+Z/XkRzxrR6K4yzKq89b6kJGOJP40UfI=;
        b=EfWkLD1Mydcrn+uRUPJorOB+9TR8hHCkxCSOnNCc7n9BCfY1ZReQSX5IO8CJYQVh84
         mnL6ZweVTauq8uuXDYpR3Ck4R9N2SdasxTCrqCO44Crj9UEWKkg3FVFk9IsbgMnvXhcJ
         ic/y/mEtJAVWImqJNk8g14d3HXTaiUARjY9hWJT1j/WmKuMlc90KAv7pTRhtieq3MuYN
         Ctp4lzlKROw7ZsAJocWTG7uKkRhNOw+kZ2vfouGI9qcBcDQUEs/ZI2b99uTxC70cMFEV
         uBLZZIqaRyewGtBUy/WykmJ/oYn8nQ5ZCzUtEGsRbsLsCjtLcBiBT3pFOM0DIaW9k903
         9R/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfSCmy7tmTEOvvic7UGN/CDQt0fyhdpHsUjenTAPijjIEbleLPssWKGS4CESJPsI7sebNDwkHfVXDqVQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwokVm37Z1MMheEfS/8dGD5aVTHtZt4/GgRT926l7N0XXm/JikU
	HJ9E0EoxTW9bXV8XdPzRJtqqI1xqbZutE8/Jw6GyzpiTINa0mcNLU2m+iea1OsT3EkpAxxyMxLs
	nww7aopCbNtiArwzxh+XM+W3PEd/l9NtYviJi
X-Gm-Gg: ASbGnctDyG/YwEhE58EqNvQAvckm6P7HeFTN1I1ZdIh+fTP69l2y9emLvnxRH005+kp
	aqF4zlPQ7WNo8v2dl6LVpGNmW3u3IF/QdjmJt8zq3EDGRnWYUSs6Rd1rmNQJ5OsW95VYsE+7aF6
	JA4iMNG0zMBPnBnGIGVkOEdw==
X-Google-Smtp-Source: AGHT+IEECo1qjKE9+f5KAGYFBltXYqlNcShZy0OxIxRF/dripUpXcghaKlFEoodTVnpFvHNNqn3e9noR9gmhbN9E1gs=
X-Received: by 2002:a05:6902:1404:b0:e6d:f0a6:4cdc with SMTP id
 3f1490d57ef6-e704deca03bmr6577544276.20.1744394635152; Fri, 11 Apr 2025
 11:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313085343.241623-1-andriy.shevchenko@linux.intel.com> <c7f860b806603cd8af7740c73db68197@paul-moore.com>
In-Reply-To: <c7f860b806603cd8af7740c73db68197@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 11 Apr 2025 14:03:44 -0400
X-Gm-Features: ATxdqUEPAvVP9dZVohwiFoxW7AmOhM6emkPlKEK8JPh8cs8epZY_MHf0QmZ7qQk
Message-ID: <CAHC9VhT9VKQuWONEoosKtB_n=xLz6rrRubmEZi8_+dQrJe3nBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] audit: Mark audit_log_vformat() with __printf() attribute
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Eric Paris <eparis@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 6:02=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Mar 13, 2025 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote=
:
> >
> > audit_log_vformat() is using printf() type of format, and GCC compiler
> > (Debian 14.2.0-17) is not happy about this:
> >
> > kernel/audit.c:1978:9: error: function =E2=80=98audit_log_vformat=E2=80=
=99 might be a candidate for =E2=80=98gnu_printf=E2=80=99 format attribute =
[-Werror=3Dsuggest-attribute=3Dformat]
> > kernel/audit.c:1987:17: error: function =E2=80=98audit_log_vformat=E2=
=80=99 might be a candidate for =E2=80=98gnu_printf=E2=80=99 format attribu=
te [-Werror=3Dsuggest-attribute=3Dformat]
> >
> > Fix the compilation errors (`make W=3D1` when CONFIG_WERROR=3Dy, which =
is default)
> > by adding __printf() attribute.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: added necessary technical information to the commit message (Paul)
> >
> >  kernel/audit.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Merged into audit/dev-staging, this will move to audit/dev after the
> upcoming merge window.

... and now it is in audit/dev, thanks.

--=20
paul-moore.com
