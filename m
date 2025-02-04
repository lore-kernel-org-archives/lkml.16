Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5EC1DC745
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671426; cv=none; b=B1iNkQnqm6V/RSjz3JoJ518voybt3w0uAlDM3h4MOHw8fZ+0D1wzgcg53sWdwAQO1xwygDzsagZ6jdC++XJyIC3GNmwJzrxuEHhhkADp6lQZs4P8PdjfbQ7F2ov+6hpLdu018EpO7zsG0lKd/Y1H3NWddFfvG4pERslMUA/kDnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671426; c=relaxed/simple;
	bh=1DsnRCD9MC1WNlpE3vjA8aL51Bl2gKT8bWu2APVPL18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ba04AdcJxbzAIURCGtBDhTCtzbNG2mxzRJ2hnddY41QZZ7OWW0CUB+UWCmaqRLNfJAjUXxr98o7Epdl2pkik8OTtWdPq43B5n6dWT78lMu1HcB6WjnEFNKiMOyP69TDemB6H2ZJ11epmw5aASjAC3kQE4vdKjDEx5LZkGm97q9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xe3Qk0Kr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xe3Qk0Kr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1029889766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738671422; x=1739276222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvhNBQWKlCvAqcbBDr5tv0EzdkUSClpqTtdtVXuZUac=;
        b=Xe3Qk0Kr0HP36Qm1W5eKVq8IHDeCaSQYliBW8DvNQZSzRiXW3g28mxcIwdtCUmEQfb
         h/F9hYQQjqOLVHR0HaM4Z7Zx5O6xnWBDOikKmkkMImXfWzq83whRS6+YFb7DcCcK2vAa
         oZgwIDCDY+GEkObFWXwlVt5C+GqcNwsvuTMnnd0rWGNFBEa0/PbODsY8PbYcHrS1ah1o
         CVaUHOkL0f7h/Nb6me4IDHjbNIyZkW6LWam+hVGD35XhCqM+2GJxNILNl+whltEzUW+N
         IyyndLxh8A0LdEjCJLwOFmUq0ct1Onbkjy1s1HQb3fKCYSucNWG5dXLGfjYMWZRYWv4S
         kwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671422; x=1739276222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvhNBQWKlCvAqcbBDr5tv0EzdkUSClpqTtdtVXuZUac=;
        b=PippZdnbPKmuwhd8u3fkTWwokbMtQJiTm7m2Gnvf8BJAcBq1R9V96BSnSqWd9Qw2a3
         rCuvY/Ko/IQXBJl56c/Inoxih/XhT6G2L3X4nlsFaKUHwnNfJjbMADtD0x1Re+CdnMmb
         2LMXp/uPrirSv/7q/BcTh0r3768HaNTrm1ZskeO3Y0HefysJEeWSpEwbKfLk7XMAgy8q
         v1zkfnzs+BHHxrpVoo8M+WTyk8lyRH4E86VnvxikSeZkgnbaH430Rcef9MSES8YY/IxY
         gzAxvvcATHWSa4CrlvBkTZ0L5sIbYus4UEuQ0rocbPzQrop8ynB82eUyEDqqo1g+XO6b
         Zzig==
X-Forwarded-Encrypted: i=1; AJvYcCUcjJ6NJqSF6gJwdfviAGR3NOPPpmVtgR22ABW7TKy1av//sbkDYQYfw1YiFEeYMXfN6oz03fsogPTUmHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDFifo/KYXtOfaf5RpOvqI7GqyWmYeJx88Y9tJQ1tly/KcSI4
	XGJBXiTD8j9fqxbVM3+xFaZriS6mrlLQq6+tXNwrTZ1YHza8RT3YZ7d+PN6iYl0=
X-Gm-Gg: ASbGnctGOtg+mH/bcfRl5/1v/1ZtRlspjJGs+WOjLAY1jmqoyOfFkGz8vH3hc1FFLT5
	s6DrfIRSbGS7FRv2EE7RvDneUmXPoWFM9MWQQ6zakeowXQ96Ly5L4S3IIUJUpCDAT9RqmfFhCA2
	txOA1zg+Bnoeo6RTs2MeO0M70Ef4Ta193Ty9pTYmFKtp75QBf4YznykJPg4fd02A9pZQcgj9m+V
	fx2TeGBRvNrbeTQ8PFOzvCBd3ieJOtc/eOXA1NwZ69Iwo6XwRjNQgiqNWgupglKpCZ/6lzXkDIU
	LtYkf0AreV8byS4XwQ==
X-Google-Smtp-Source: AGHT+IH2G8hYYAkJwoDrdGcDA8/rdA98WX6XXA5JkrXP0w9WRYZajDa9VQmXcTXz1ys2KVFC33ecFA==
X-Received: by 2002:a17:906:d54c:b0:ab6:edd6:a812 with SMTP id a640c23a62f3a-ab6edd6a8camr2102928166b.24.1738671422169;
        Tue, 04 Feb 2025 04:17:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f1e23sm906290566b.82.2025.02.04.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:17:01 -0800 (PST)
Date: Tue, 4 Feb 2025 13:17:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] scanf: convert self-test to KUnit
Message-ID: <Z6IFPAuCz0_vDdB4@pathway.suse.cz>
References: <20250203-scanf-kunit-convert-v2-1-277a618d804e@gmail.com>
 <Z6HSFvvgxFVGDQeI@pathway.suse.cz>
 <CAJ-ks9mfmM-SzkEiJsKL56jSuyXzLrKd4XHgRnp63C9AYcDoAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9mfmM-SzkEiJsKL56jSuyXzLrKd4XHgRnp63C9AYcDoAA@mail.gmail.com>

On Tue 2025-02-04 05:27:23, Tamir Duberstein wrote:
> Oops, meant to address this in the last reply.
> 
> On Tue, Feb 4, 2025 at 3:39 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > Should this go via the printk tree, please?
> > Or is David going to take it via the kunit tree?
> 
> Going via printk would be my preference.

I am fine with it. I assume that you are going to send v3 with
the updated Makefile. Well, let's wait a bit for more potential
feedback.

Best Regards,
Petr
