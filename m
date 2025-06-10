Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE7241CBA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530537; cv=none; b=RzET2x9Wxa397QjKvLDqy6kanbSkTaGpsYeSMR9aavmA4Uf1dCosoarM96ZTWAwRqr2UHX0RtDDkoA28nKa2pR85suvQm5OVigXn9BpNhP6xtlLFNYcsn378Vqo+sx5D5fvPIRDVGI6wLsI96PjI3ReXl9alFMUOt+jD3mjR6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530537; c=relaxed/simple;
	bh=CAzDFjhSAzbmD8Txu7d1pGievjGb5rkrE7JNed1lhig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnG/jrTK6NwS6E53ZxXjDft5BEx75VdDcs+NvIV46Nli3W5TQrzpgT+Y/tG31bQdGF6BKGff4zXXeW7ldzoHrxfZChUK4lsIAOZ/hWZdC6o4tyIcWZWAq6lF0Rutx+pAaMsilB1p8QDiK4lPNyFB5weTZBjQrf4uwhzG2O0RbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jSVXQt6c; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jSVXQt6c"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2353a2bc210so43225585ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 21:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749530535; x=1750135335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVeTEtZcl1m4ClJ2o9p5dHCV4fbTAw96xygmKyHd+ZA=;
        b=jSVXQt6cLqIWP2AdpnrUhsBreW4p2wU25oiaJN790VwdPuc+ze2tIRIQ7mDrgv6rFF
         uY/yfialTOt6CMMNQiGP1bxkV1VrWS+M0CvGPEHv1hoLmjuu4UbQXch4WTOB4uKXXn/W
         4rqK6PbVoPtqNUgi/1Ytoucsy9MD+ylnZY7NZjQfSYay1/yEGf6o4ahiE24XHg+SUmN6
         6Et8ze4Tz/BNL+qIQgD1qfSrrMmOm3fvD8fFpZUOsg/dtS76F1Yf7XQCOHSKqoO/lpia
         vXtXUBhWdqVe3PV8po5IUOGQqUzn/5NQp9qxvFsEDlfURhM/3wPsVoAFbCfrfQ7DJKfr
         +QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530535; x=1750135335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVeTEtZcl1m4ClJ2o9p5dHCV4fbTAw96xygmKyHd+ZA=;
        b=DRQlEpbzfXloCn+5z63BbVBA8K/dmjKiTzMOR5WrCPfY444Yctzn9ClWcaMMdioswb
         SEGMWEwPF5xDqBjONDQToyNAjHs9yDzt+Rqgqko2m4HEcffl5wCvxkJ6pFZCzaGwwo52
         l7Q/BbTnqFsguYznAAYgN5sXRIDHQXbDG+sRiQeSMx1TMLeywS+9VZ4aQ/e9gsJXFJ3r
         Ob6WuSotynMF61LxHxsWMaGJ7L93guB510uP+U4CdOOhvKbdmeVjeH1rrsRC4vBo7WxC
         PjXhqQABZM/CVLaIiGGhv6RSuFTSEbAlX/ZCtOp44VxNyxJ0aac6xwpbs5yoGpR+8zKJ
         3OeA==
X-Forwarded-Encrypted: i=1; AJvYcCUYJVUI81IjtskZs3wtzoH1qPXKZTreUwIGgHgq05G9CJnsiqI0DKchSDpNemd9/u+/UrGSAL4EM1kTBA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeTZ1Asc7AH3ixtTxuYkYVWreSrLXMbrDFSdNZ1mNhuHOkx94c
	g+SH0etgLuAslzLKIkICp0eCmA7pbyDK7TIKUrvbkihji36L3kTi6IHdiqMDKCwkjmg=
X-Gm-Gg: ASbGncsdepJrkIl8swOvRnvKY1ntPMLMf4NDwJZntM0syCB/4jYiLIpn/FZNf0DWget
	auhrhPpQUO+4jpZcaQKDljlA2ovZpVqI6s9p1CXYOUgR0hvO3UrrI4Y5z8MpaGF++xoP54ONHVP
	cPiwldtQ9giBcCANqGasCvvLxxvKYtLrSTIB2N3DQixbVq6vK5vZ0nsBD6cJlbL2CF9HEnHLqPn
	Ua6BnqZ2VXcYQl0rdrUFPD9oEQxhLYoXdI+6hQTxIvu7tfE2AeDaIJgOI4LC5bkbEtQtLvMnI7M
	MIH8LWVMHBXp8BU5mU4tqc6uoZsRR6UtNxaIOFomMIni4O31KFgtx5apm+5XNXDlECO0BA==
X-Google-Smtp-Source: AGHT+IEkTU+gBcq13St9Qw/Wf0Um/jTGbpeL8M59SViyqMxrr/ADp4BVSyewhIKv47GXRKYXDjzYQQ==
X-Received: by 2002:a17:902:d2c3:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-23601d2296bmr201118235ad.31.1749530535298;
        Mon, 09 Jun 2025 21:42:15 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad3492esm1896875ad.154.2025.06.09.21.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:42:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:12:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aEe3m23wIDM1I-AH@sunil-laptop>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
 <aDbuABrlO30TIrx1@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDbuABrlO30TIrx1@smile.fi.intel.com>

On Wed, May 28, 2025 at 02:05:36PM +0300, Andy Shevchenko wrote:
> On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:
> > 
> > Currently, the interrupt controller list is created without any order.
> > Create the list sorted with the GSI base of the interrupt controllers.
> 
> ...
> 
> > -	list_add_tail(&ext_intc_element->list, &ext_intc_list);
> > +	if (list_empty(&ext_intc_list)) {
> > +		list_add(&ext_intc_element->list, &ext_intc_list);
> > +		return 0;
> > +	}
> 
> With the below done the above can be optimized (hopefully).
> 
> > +	list_for_each_entry(node, &ext_intc_list, list) {
> > +		if (node->gsi_base < ext_intc_element->gsi_base)
> > +			break;
> > +	}
> > +
> > +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
> 
> Is this reimplementation of list_add_tail()? And why list debug is excluded here?
> 
Sure. Let me use list_add_tail() itself in the next revision. However, I
didn't understand the list debug question. IIUC, list_add_tail() is a
wrapper around __list_add() and doesn't exclude the list debug, right?

Thanks!
Sunil
