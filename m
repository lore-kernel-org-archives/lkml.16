Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96C126B2AE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864888; cv=none; b=f498hZGHSE0imQgJexSQ0h2n6/3f1ddkhRd0sZYNtYhJZpS1nUcFkadM9eAtVf9zFIez8XGMEEtpxycaxV1IrJmNAvMQVOqDJxh21+/gtX2lCyWniAIDn+Bv6Wpt2pov6nw0RGzeTxvIZt2BV4vgq+1G2w27gkizZuNOQlT3yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864888; c=relaxed/simple;
	bh=KyGtK80to6KuEAYehb5mAJU+T+xcgGreIs/Qe+2xesE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9FqWLSHLqHzU/J5n4oMpdR2AB5+mY0H6gyTZSmKX01kHguaxrdFJDEU+FTztohOYRxlP1wR2DA3J0QGvt/OTWkInB5uNcb6CTQ3er4SSSqWaxeBvd6UI8eo66TAJ35j4zJqKH+wVNastv6S0UHDYA1FW5z4Iq8kh0apzum21NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpzF0HvI; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpzF0HvI"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-610d87553b6so741667eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864886; x=1751469686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xaOBbGszEzWNvSbaKJDe5LeOUi5TUUgxvB4nzx65NaE=;
        b=dpzF0HvI50GVO8nmkHYCwMHqnAvt3wsTZZ02W2F2KsVWLuZ+gYHCjokYEAKqmsqNYX
         Rf/luAyTBXTFydtGS2O08FUWHe7+dtAR9lIOi3LZNrdRuaurVRvgttmNfpLnq5G8h78f
         ZSWPx6uKQHj8oCn2WJ6YuWMDVyCUR+l+T/2WPB9KDktcqdYtAilgsSxDxVPx93pC8HEM
         sHOyjNfRWsknhgPxKeG44rvZFHFGbYQ2zwe1xD5HJp9QZxnN5l2hMCbtCO8HsV5Zof3Y
         q8eNddk0Y5ymPa+rkFFsiLJb9vEhgrc9/IPUYfBZT8rqsRrTNILLnKWCpbdum8gyK3Mj
         KdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864886; x=1751469686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaOBbGszEzWNvSbaKJDe5LeOUi5TUUgxvB4nzx65NaE=;
        b=U4UKusL3imoaK2D+QbrzoUdQiJYzZ3w5+RSiIVG8kQsRjeMomR65kMyEkRncST5ZoP
         3hOrYSMTB6Ssw0UCduGST0rdK36bZWgiJWXh78M8/3pGf6TIyZuD4xi0HjxdzGPfGOo+
         wLu5bor70lDrGUaLsbXzSj+ANkU0Gcd3FZMmYqc9+uRjNUr0xFODAcX8PrZpEHS4GX61
         YdoQz5XBaVb5TDgN5L7DmjtRgDdkl4Dz+xM+v8P/OOmsP9saRew8Fcr+zQOyId4HpxfO
         dEVQumG93lx4yHouelzbjC0liq0BpjJTy4RJRDvmLCHToineEgwbG4k/cYRgFQAg30br
         vFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWrlEirsSjrTvL4fPCZ+XfRMmDw96N+RRgzTSLeBBNjqe6raps0NwvbyhbZygsPEXwJLLX1dNCo1AmV/a8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUkS6jEsDCN8LlarAcaLRwtpo2Z9uti0Ezpy/OsYm+rauqunw9
	9avHrWHV/GTw/toqPx/JyXGIiK6wGXBxx1w5JK5oOEhAq9tlLkWfviq4hMijjfjRHXs=
X-Gm-Gg: ASbGncuotwg6Ptf3Ui/lTGFqjdGSHLR1R3mwqaxN4+cahiWzWX1WTlzO8YrvhAtDTs9
	/H8r/AgiN3ekj6LT9omKgpb3inoYNpPEXEPapl5vluG+idD+Ivl8o3uogsrbD4Se1z7Nbt1zn5Y
	h4ayhf2dh6D4Z0crosM9heILk4RzrM6TwvfYExWwNzEIB8RKPwdZBCBWkLfVhelc2hiQHRj8z+x
	TE79JFsFRcHURfiUEYa3/GL4L4ewm7yZRdv15p8cGnoWJ0NMJlH7KQ649uiGlyxpuGHAQJcKhca
	whM+tk7Oo26RE/g2L3OotOnSFjjtMXq6xkcP0P4qLgXZBWyRIMLkmMetGf/sdy5qiEz3Xg==
X-Google-Smtp-Source: AGHT+IGk4J0jSMpXdWyxPvRR18hOuQQOIaOFP1Wr6EYSOJlLgXKdVD4YD5Z5m09gKSGJW9gCVJhNFw==
X-Received: by 2002:a05:6870:e96:b0:29d:c832:7ef6 with SMTP id 586e51a60fabf-2efb29472c7mr2491089fac.39.1750864885674;
        Wed, 25 Jun 2025 08:21:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ee665666d4sm2597761fac.16.2025.06.25.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:21:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:21:24 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: marc.herbert@linux.intel.com
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>, rafael.j.wysocki@intel.com,
	linux-cxl@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ben Cheatham <Benjamin.Cheatham@amd.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] driver core: faux: fix Undefined Behavior in
 faux_device_destroy()
Message-ID: <4d54e4f6-0d98-4b42-9bea-169f3b8772bb@sabinyo.mountain>
References: <20250613191556.4184103-1-marc.herbert@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613191556.4184103-1-marc.herbert@linux.intel.com>

On Fri, Jun 13, 2025 at 07:15:56PM +0000, marc.herbert@linux.intel.com wrote:
> gcc -O0: Segmentation fault (core dumped)
> gcc -O1: ptr is zero
> gcc -O2: ptr is NOT zero!!!
> gcc -O3: ptr is NOT zero!!!
> gcc -Og: ptr is zero

Btw, this is testing dereferences where the kernel code is doing pointer
math.  No one disagrees about dereferences after a check.

regards,
dan carpenter

