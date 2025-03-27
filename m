Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E49212B00
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082429; cv=none; b=WDPH/5Ygt0tHWITLJTSMk/J385ejIXlQjrVT/Z8N3MdEa6Bl3mdcPQaCke2pv1Gk9qdRC6Ba3vciT8KDvvNEK4JzTlVJv11iVHz691fjwX/7SpVdt7t/+JME4U/FMvSxTGlyk2b815LGtWEe2GOVhAKVfpYvhQudtM3omcjSiDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082429; c=relaxed/simple;
	bh=cOc8LCDY2PxMM4Upz3Qx6IpJnYJ4ukJ8vXPLXQAPYog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4nHpBj3sercYiUr9s7pd1vDMPEC/R3XRS0ZScqeH5Ws1HO7LS7owb5CejDIwsbyGjCtt/z0pkpEL68sGXXFVnCYvPk2gZKUX4r4d+SZGxOoGIo+7Q9rxhhGRIzoR0rlt+HlOjS5JjEvFGT0Fpjhma9wt/4RSb9jKi2W03+30sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KXLXhvuY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KXLXhvuY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf680d351so12206845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743082425; x=1743687225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfGsglect/LEYT5jGHCw8dpISd3XhE3QR5XcCFcCyX0=;
        b=KXLXhvuYtjPtvt89wItROo3PgQbqPjUqnrU0hslW8S4kGU1RMpZUJ3AbE9kfMSQvaw
         JVyXN3SNeonwEQ1J8LBpIk3K9aIBwhewfV8PgJlQ87pEVcb68I1xJfQ9lCppiVen0Wlc
         2lHEMybEXVlhlfXhOiDDIZIsTD4p8qeYw/VZseXFafajys9gxw8IEs4eLgG9Yw+iXY7t
         NGEO8Jt8W8AuaNn4xZSYuktulsOAuXJAfcYBsWLVOGoQ6IjMMfj36ZLS1q8LzmdNJBSm
         mFnfbZliiKZJ3rHHsHzKzLH6ezF+uEZ7itqN2+X51TOgwaS5xO2D3HI2Ug8jMUArF1cz
         MmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082425; x=1743687225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfGsglect/LEYT5jGHCw8dpISd3XhE3QR5XcCFcCyX0=;
        b=TXr964oN/DrUFUutPPmQ1/f3den1RjQvhIUgsPbgM0Lu1thoArjwP5xa5iQv12JTuU
         ZwGSZqAave/9a+fDR+7RyL994VLkqHjTPhImWxI47vAR/RcSZHK5Fid5xaaWnlNAzwGT
         QYpyw3LDNMXRbsYGxL7kuaTFAohxkAHjifbe/7IAJjdk8eSxMM8Q2wHVDa32KfoDFGFN
         u5o5lH+V998lfG3FGUk43HLU9d4EAlFRPvhIo5sx5d068Qhct4pr1nP2EdDluoxcOt1b
         85CmqFWAR2hN8Js1ykXKtVdbXJn3tMofVIkQ717kUfAf/OndBYASn0w8RXMfPppyPJ4b
         YSWg==
X-Forwarded-Encrypted: i=1; AJvYcCXhCDEDd8WNwbqTQcPzZvb1k7UYkc2GrXJt1VScJFKUHVQd9TG4KZVDLT2MHUvBEq1vgmWo8S0pYbi+02c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhfq5mLuRX0IS2gV/dbYJjbZ1rQt/uRpZ0/STYba9I6arb1o2
	JxY4oOsnbx/ryuFn+j+4GYzUzxHCIifpK+VnN+HTMewgaANrgby4BiqFnX10zZo=
X-Gm-Gg: ASbGnctnegsCr+ajHfC6eYkdmNwhi4edQvFq2+D2GOmj0AeXCfdAPjTUsXjJURrx8wH
	ej/jX/tRHHtp5CxgGYNMu3fXw9azUIGqJbFe+bMoaZgHBs4Sm4Up1Mrkbv0xt6l6DsBhg9WOTBh
	pl/wKHSfXA9mzdPKjB2ioc2pTd5V/TW0P1TO2AV6Xzkp0K4ntj/rYl5TdSIhIEVhdEuYKSrfFBX
	lymkdECe+yYzR1ezDWBAoJbjBzMLbYH+mPFhG+1sEOIVIzjRky//hqu8HVIc3V5kuvcAhkUs/d4
	USa2AGjv0n2OXDpFyW5VVJDlgxulJkoTEA==
X-Google-Smtp-Source: AGHT+IHzWFEXZ5U0vXzts559RcIeKqDt6Nf9/sABLuQ5qhrFWzD7zpdD06OzsxLaztHfhtWVMMcISQ==
X-Received: by 2002:a5d:6481:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39c099d32e0mr358717f8f.11.1743082424899;
        Thu, 27 Mar 2025 06:33:44 -0700 (PDT)
Received: from localhost ([99.209.85.25])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eb3efc568csm79774646d6.92.2025.03.27.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:33:44 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:33:43 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: add my isub-entries to MM part.
Message-ID: <Z-VTtzaU6Rk4uVyp@tiehlicka>
References: <20250326215541.1809379-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326215541.1809379-1-rppt@kernel.org>

On Wed 26-03-25 23:55:37, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Following discussion at LSF/MM/BPF I'm adding execmem, secretmem and
> numa memblocks sub-entries for MEMORY MANAGEMENT in MAINTAINERS.
> 
> The changes for USERFAULTFD entry are fixups that can be folded into the
> original patch if Peter does not mind.

Thanks for acting really swiftly Mike.

Acked-by: Michal Hocko <mhocko@suse.com>

> 
> Mike Rapoport (Microsoft) (4):
>   MAINTAINERS: fixup USERFAULTFD entry
>   MAINTAINERS: mm: add entry for execmem
>   MAINTAINERS: mm: add entry for numa memblocks and numa emulation
>   MAINTAINERS: mm: add entry for secretmem
> 
>  MAINTAINERS | 50 +++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 87f556baedc9cca2edb318efe9d8cf009d916c4d
> -- 
> 2.47.2

-- 
Michal Hocko
SUSE Labs
