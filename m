Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526125B691;
	Wed,  9 Apr 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194198; cv=none; b=e5PiXc1lois+u/heg740GlAGZY+JPjrTZ93qjsbRZZuSJMkCYkoFF7mcQy6QDzlgE9DJMWjHOTnJj7bo6KBJlYXqx4Imvqg4K1hW2Pd0aisHSFbmfrScPtWiikxlpg7ApM1H6UdeB1EZCqpwm8cDi6A/Cp7N/nxJfzsgT1Bjnss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194198; c=relaxed/simple;
	bh=p4ydNUoVPE1ALE8XOd9i15JNi2SonOG+cg815aN3b9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFbJE1FgsoOUEAAtNRoCsZq+Xw4h/o7mxUGi5h3IJFg2sOTf0Mn1KWDhM7DJ937XauBDwrntBQb91nUulQxS5+n8GQFRk28XmrUQltWJ8c8mkjDlVXdkNteciwmhJvDL3NXniayaCw/0drcaXdFTAW5pZPMA+loDbYb1LWhAffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHl7Qgut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHl7Qgut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC57C4CEE3;
	Wed,  9 Apr 2025 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194198;
	bh=p4ydNUoVPE1ALE8XOd9i15JNi2SonOG+cg815aN3b9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHl7QgutKUKAiJSuIxQxOrMiRcL8Q2fnLzfRybP5jnXeiJI+zjUCykYazLwXXWacZ
	 0kTpcRYFJYrcuEH6ka8EZEW+U1j7vjUskR3hii4wN1TbEDdRapik/jqPzS6mwTCPVw
	 TJ3ZoYb7liqmPE+6NEEkaOIakqhNtGCIbwA9BtVMNkZoWmivowdzWS2HWAhdgSehiD
	 ujgduthNNBhJFRC+E+DT0gDVJcgcsYQDq+4tCnjYk0u48DqpoyHUkbE82zaDiv6bb9
	 0Sd9ZRy/rnkuFin9kAmOUkd6DJy0zoU3VfBnMdjJvpUToaEtylraVJfjJ8EuMIl0u+
	 slgnXzHV9uvNg==
Date: Wed, 9 Apr 2025 12:23:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v1 1/1] x86/early_printk: Use 'mmio32' for consistency
Message-ID: <Z_ZKkccUa9pVH09J@gmail.com>
References: <20250407172214.792745-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407172214.792745-1-andriy.shevchenko@linux.intel.com>


* Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> First of all, using 'mmio' prevents proper implementation of 8-bit accessors.
> Second, it's simply inconsistent with uart8250 set of options. Rename it to
> 'mmio32'. While at it, remove rather misleading comment in the documentation.
> From now on mmio32 is self-explanatory and pciserial supports not only 32-bit
> MMIO accessors.
> 
> Fixes: 3181424aeac2 ("x86/early_printk: Add support for MMIO-based UARTs")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +----
>  arch/x86/kernel/early_printk.c                  | 6 +++---
>  2 files changed, 4 insertions(+), 7 deletions(-)

Thank you for taking care of this, I've queued these fixes in tip:x86/urgent.

	Ingo
