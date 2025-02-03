Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481E205AC3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590728; cv=none; b=epLCLFRVIUFW1vgvbSEQUsz4sBahL8OMORRWUX7fid9cBOVol8ohu2+YXAWKJEoOTQReMrdlcVx8qyw2LXHNd17Wzo3eBmxyITxqcHu4fZzyQCpdwEvf5M2f1al8TDszaDKh4hr7tP9MbHAChYBXXDKsIWIuo5JNXWNfnICYv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590728; c=relaxed/simple;
	bh=zOEa5J0DQ6HrR52RCclALxC8DwegVQqT5KeigVclXS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TakSneTq7vicG3k+egrZ9U6Jzn7Ag9pSisUIDXR7Q/44wPQJicG+F8wldZWyvnebU8bQVx0O8bNPNP3qpHarS7ekwcE/l5+0iX1VAoWx1u+RZPP6aW+QJLWLcOv4UoEaJ5s0POUI+rfMnvmesiD+lx0oFfbXMJhl3eHXwutH/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XvjTXOsM; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XvjTXOsM"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467bc28277eso37086421cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738590726; x=1739195526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mVVIkFEJaT8OVYZXmsLtAPpHN2DcsQyr/t9U6rVjLCg=;
        b=XvjTXOsME5NJxtt7sw4wAviJUO3M/2vt1FCuN+YhW61xJMppo2F/mYzZJjzDEuwGKW
         vTbzKRH6aCTqiyRf7Hz+wMjVphgorNKKO0BYHnm1JX/1hcOj9/b5sVZDV87aRT0H0AMe
         C0qeeviQUZ27JpqI102phEoRRa82yrcNQcENo+2tAhv5EMmY2cuY7PmR20xbmA6O+yJm
         GGWpWrzsN+5MOZfwodXUVGBqSJQ1cEwbswZvj3+Wu45bwnNtuKnDVjrMYfPsaRFEQCYy
         NU8eLy+UUz9takN70dvazzkNDTuw+jMmafcl+VClldEUJjJjZUawgUZKTypEyZziJ6ZK
         WpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590726; x=1739195526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVVIkFEJaT8OVYZXmsLtAPpHN2DcsQyr/t9U6rVjLCg=;
        b=j/UkgmxCcGfnqZNj3mesBvW6vc8+176gxyY52WFMoft8ZLmjhEFMT8udb+8emO+MZf
         /LqU237TJTJZw8jp61KvqTYLwhzJPoIBIEfnj+WXFLSHX9IwX/dzw06HlI1mDzY4/zQG
         /3APqwtb4Vbk9uPcfl49z5lPsehppSKFRunH6q6afg/S9aaGI2hQ9mt4XC7YE055PXG4
         Nq54b8IG2IURlgrPqPbVtl9u9LwCNuzO+jEtx3XINcV2Hyh9PeN1kEwR5/jk0k5G+6W4
         nP2afFpetCfIHMEDLPUQCyeNHtDItDeZRnWlSHt3S5gIYPi6K+y28qgbYbioijXPEjyn
         DI3A==
X-Forwarded-Encrypted: i=1; AJvYcCXsgVxXb+SiTL+zIQkMR6rp326tuNLI4fBAycEilr1alL1rrR8EzZAIMg4wOkrEfRo7p76zJsBWV0ZJiz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPR63S9ajSzi9/+/4PgRc4JoSiIHsid6v46VEpaZ7XONU59/M
	fMESPEFkLNe+2X1aB+Q3Q6vL1DBJ8hI4cRndxUF4eBG04waFQaU8J9aE3LiEULA=
X-Gm-Gg: ASbGnct7QgWBUl6EGRJBEwZo1wnfPndwUX4Urg/l4ZhM+QLp+GaUU5MDmSAq3CcVHRz
	9oUmfyzxaF/F2YYHTGSCvN/VujC1V9kM6c1xPWtcYvp+v+QPgE3JlYivSN8XO5BWeCKpgJd+g7p
	qK0x3XXrp6ZecTluDebJqNYClTNpyf++1PsKdWMmmXy112VT+LdBxyrsAweXfDzBZP4pT+NWRF2
	QcVY0txjG1+IM6f6546/uUbvYkIzjpEPJDswY7uKGPcUz6HGHZ20t4+HVW3lksHqfYU05aK028C
	XEiuSBQCRs7CL7LmLc5tFgw=
X-Google-Smtp-Source: AGHT+IG1DREDrqF3xYxNZzwm1ndtBiVa4OQybfLg4yQAt6D5mkHaEPMmuoTDFccTftQIjA1j5K+MmQ==
X-Received: by 2002:a05:622a:2d4:b0:46c:78f2:cd1f with SMTP id d75a77b69052e-46fd0b68875mr301532491cf.37.1738590725644;
        Mon, 03 Feb 2025 05:52:05 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf18a42bsm48670911cf.76.2025.02.03.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:52:05 -0800 (PST)
Date: Mon, 3 Feb 2025 19:21:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6DJ9kmNx4JoqRg-@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203123658.GI3713119@black.fi.intel.com>

On Mon, Feb 03, 2025 at 02:36:58PM +0200, Mika Westerberg wrote:
> On Mon, Feb 03, 2025 at 05:54:18PM +0530, Sunil V L wrote:
> > On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> > > On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > > > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > > > 
> > > > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > > > a property name like #mbox-cells which needs to be fetched from the
> > > > > reference node to determine the number of arguments needed for the
> > > > > property. However, the ACPI version of this function doesn't support
> > > > > this and simply ignores the parameter passed from the wrapper function.
> > > > > Add support for dynamically finding number of arguments by reading the
> > > > > nargs property value. Update the callers to pass extra parameter.
> > > > 
> > > > I don't like this (implementation).
> > > 
> > > Agree.
> > > 
> > > > It seems that we basically have two parameters which values are duplicating
> > > > each other. This is error prone API and confusing in the cases when both are
> > > > defined. If you want property, add a new API that takes const char *nargs
> > > > and relies on the property be present.
> > > 
> > > Also this is not really needed for ACPI case because it has types so it can
> > > distinguish references from integer. Having separate property for this just
> > > makes things more complex than they need to be IMHO.
> > 
> > Thanks! Andy and Mika for your kind feedback. I agree that having both
> > property name and nargs is confusing and also ACPI would not need
> > nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
> > as well from the caller since all integers after the reference are
> > counted as arguments.  However, the issue is acpi_get_ref_args() assumes
> > that caller passes valid num_args. But typically the common
> > fwnode_property_get_reference_args() doesn't usually pass both valid
> > values. So, should fwnode_property_get_reference_args() pass both
> > nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
> > remove the check for num_args in the loop inside acpi_get_ref_args()
> > function?
> 
> Can you show an example of a case you are trying to solve with this? So far
> we have been able to go with the current implementation so why this is
> needed now?

Basically one can call fwnode_property_get_reference_args()
irrespective of DT/ACPI. The case we are trying is like below.

if (fwnode_property_get_reference_args(dev->fwnode, "mboxes",
					       "#mbox-cells", 0, index, &fwspec)) {
...
}

As you can see this works for DT since OF interface handles
"#mbox-cells". But since nargs is passed as 0, it won't work for ACPI
due to the reason I mentioned earlier.

Mandating to pass both "#mbox-cell" and valid nargs count looks
redundant to me.

Thanks,
Sunil 
