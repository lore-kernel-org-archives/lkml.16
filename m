Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324320B81D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748466942; cv=none; b=WSBL1ofIFvYL7KZuthcEj1O6qNYsdzMcsAFIMfrtuSBGXFRHh5foO4O/jZdBvKMwOspV1UPByBT9M+XqVUbgFRMYVXgwj9w5X35d1PIA1M6p2QaJSCHljgoUsNxBlsloV9lXRMgHCPkcdn18T14pyt96d1cimOP5gTXD81+nmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748466942; c=relaxed/simple;
	bh=nXn+wXAoJhkyG8ofm/ExCnXy7oUI9VfL/+vQqxSGe9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARrgP8A10Qbv0QySCnReE1jgSNC8G1U8MJeEdXzX4Zx0TLqWN2sbd8J8bmgyEUaB22dnATMxhh7dg7rK6hMrYweyPGIm2nEj4wJcxjgz6fGzw2pX0lzF4m/vsPq2UQ/xG01CT2hMyJmT444JrJAZf7pM0qG1xLXohKnxbq+EGDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZpBNhcOf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MmhetUGV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZpBNhcOf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MmhetUGV"
Date: Wed, 28 May 2025 23:15:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748466939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cWy6btfBQfoyMDP3wixDSkg3X8PmaNXcvttzTA8Kyts=;
	b=ZpBNhcOfed6fiDpGU8JMgwmL20NKnAr9GpwaA2y3QC+VXGguZH9LEHi4mCGibnNjKxJH2r
	eAyqiYBiEkHocKoTtKkdiae4ECAhP/IqDHiFMF+8TfqJJNUIVFgpfGp0TYgq8G8PkrSPKq
	o9puNzVk57vxN08Kn2iOWeTQFZOGwQZVtV76y91tc+I43RUtaBmOm46+aYj9aIucPnIvXF
	JZJuOThnFUhkaeYJV8Fcj+/r7KZLowR4f6PN8As7qHgjWSRJUsrr6kZmwkOjo5jBE72/5y
	cxh0lDyt7yFUBCKiLo7TAvXW27COHv520PuUzycfZ0Bkwv3BIKYjJtSw16/Z0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748466939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cWy6btfBQfoyMDP3wixDSkg3X8PmaNXcvttzTA8Kyts=;
	b=MmhetUGVZlGy3AuwpTxLdVGlojtPcYF5pZeStYiFobNy0Yx4LJvVQCY3KeotI2PC9e45Fk
	MZNCiOZCLWC/MOAw==
From: Nam Cao <namcao@linutronix.de>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: rtl8723bs: rename _Read_EEPROM and other
 functions to snake_case
Message-ID: <20250528211533.DIM_zxnE@linutronix.de>
References: <20250527004327.3627-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527004327.3627-1-donnyturizo13@gmail.com>

On Tue, May 27, 2025 at 12:43:27AM +0000, Donny Turizo wrote:
> Renamed _Read_EEPROM and several other functions in rtw_cmd.c to follow
> the kernel coding style (snake_case). This fixes checkpatch warnings
> related to naming conventions.
> 
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> 
> ---
> v8:
> Actually rebased on top of the latest gregkh/staging-testing.
> In v7 I mentioned a rebase, but I had forgotten to run
> `git fetch gregkh`, so the patch was not properly rebased.
> No code changes from v7. Only the base of the patch is updated.

I still cannot apply the patch. Are you sure you rebased correctly? You
mentioned that the patch didn't change, so I think no :(

I couldn't apply it to verify the build, but I seriously doubt that this
patch doesn't break the build. Are you sure you built the driver? Make sure
you have CONFIG_RTL8723BS=y in your .config file. Also double check that
there is a drivers/staging/rtl8723bs/core/rtw_cmd.o object file after the
build.

Best regards,
Nam
