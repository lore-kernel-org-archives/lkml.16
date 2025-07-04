Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD592D29D0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629313; cv=none; b=rva6wtdThqNU1QwkJjYP+WVCL+9o7ld625okRgrzY4KhkvYOb1TOgGMyV4u8bBOzPacekt2vZS/QZ9qVarxEAwhPRSFLhx7YfRhM+TWC/hjY4FlpKWWljvg7sTUhTovotSQby+jnNwjWCRrIjTrnk6+lKjSVyksk20xefQp2EHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629313; c=relaxed/simple;
	bh=uwIhE/3HVQyl+sWUanuxQhmfexHDdoAguey4Xn/NW7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUWMQdeJakb/ZQXOi69z8gm4xg25aPS5tjFbZT5kSL1U8u9WDTDEthxsSxFH9gGe9nbm7SqQw5PuphYv6x9vnqnqpGQnXvolQNsxZO16d0moaRu1gSVakQWgu1m7UOrGMGu007pxxnjlU1OcxayD2iEgij9PQwBsn1JlWsOJHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eOpA3+JM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ofrhEaWx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eOpA3+JM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ofrhEaWx"
Date: Fri, 4 Jul 2025 13:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751629308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEPPK4tBp+Nrii/kOs/AFNpAI/nG2VOoHTxctHm3vCg=;
	b=eOpA3+JMiMRj8qrPq9FVpwxZ0pj5LlBiP+61u5HHpVNbgA22lv0pCvU1U9uZ7Hhj7PXMVA
	SrHNwEjxZ/wBVK07iiWmlGf3w4oQJz5+9cl4vIzEo1FSxi1IE0Na9mL6oaotmhiay6o0gH
	mkk28AbF9wHzaPcR5sxjTcoEHbnZgeLe2LOsmzFkXIhrhPBCPDPv84rfe0puk7/Ho7o8f3
	WFC4keC0rKqMR4GB8OxWdabsEvwgzRp4OFZ9noFwGC5DkqWYIt28AtT03kbvR10IVVgPaG
	WYlqfHGc4p54jZ2xYc58y2sbvKE88I8s0PUXuRBkPfqq0H/2hZLAOspFsNW21A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751629308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEPPK4tBp+Nrii/kOs/AFNpAI/nG2VOoHTxctHm3vCg=;
	b=ofrhEaWx4iVHxgGGSODOEsQWCuw0jz9On7xhtqngLJKyA+zMEo2HSrXMAQdJBFeV5sMRBt
	KahvpGTwZZA4EMCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Willy Tarreau <w@1wt.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] tools/build: Fix s390(x) cross-compilation with
 clang
Message-ID: <20250704133926-0cb06bd0-0e90-4cf7-94cd-d46330269250@linutronix.de>
References: <20250620-tools-cross-s390-v2-0-ecda886e00e5@linutronix.de>
 <20250702214133.GB2103156@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702214133.GB2103156@ax162>

Hi Nathan,

On Wed, Jul 02, 2025 at 02:41:33PM -0700, Nathan Chancellor wrote:
> On Fri, Jun 20, 2025 at 01:00:26PM +0200, Thomas Weißschuh wrote:
> > The heuristic to derive a clang target triple from a GCC one does not work
> > for s390. GCC uses "s390-linux" while clang expects "s390x-linux" or
> > "powerz-linux".
> 
> This generally seems fine to me but I do not interact with tools/ much.

Is it enough for a formal Reviewed-by?

> > There doesn't seem to be a formal maintainer for this file.
> > Maybe the clang/llvm maintainers can pick it up.
> 
> I do not have a tree nor do I send pull requests to Linus. Perhaps you
> could just pick this up in the nolibc tree or have Shuah take it as a
> greater kselftests update?

It's not really only related to kselftest either.
But I'll ping Shuah. Otherwise I'll indeed take it directly.

Thanks,
Thomas
