Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF72321CC4D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377482; cv=none; b=sHA6klqrmcplpdJaMUlDot7MMXBNrMzftLNyvYFnbGj06SDZrfNNUMx/wT3zYdxjkokcH7So/HZiZ+RoiIvFxLJo+wSLVT8hMqSEG+P05cI8bZ5JRLI7rQTXf1huJObC14WHAMMbyRzxnuCVVFsQxO88jDiNZBQeIq5YolWLnsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377482; c=relaxed/simple;
	bh=2SEeLl2UREjy7AHA/nZ7NwI6Ewg64Uaok6Kmeuh3KJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gxr7KhPpNp7MGXuDe7gpNO0AhgmP0qQuJKQ8SQVOeAD/AI/5eQP0L0QNe6xz7fkoCKQfMPv57vcn1f5FEnPTZOR6NAREsHIo/1mzJhWGc/EVsBSuYBSV2sx2E84vqJVdfHgNgIOupWEaAAI1IZb52IwE1hLhwNo0n1YLRFwvUjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zAo7bJCZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W1U1lHnP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zAo7bJCZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W1U1lHnP"
Date: Fri, 16 May 2025 08:37:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747377478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4xmhfhEFc3Xpalb8tjD68C+ttWeUsI04TwhqzTxAvc=;
	b=zAo7bJCZ+cXd53VIfwPKawImat3IwFct+gFRE28yoRepDCM/KE0F0IiyQB7/4ShqtZYo6I
	lLzc+VQnw6KpMoqdlY92DMNZXU1FPBYIcJntMQUSwKTj0QCqsE8KvGnLfa05Eu+1Ld/jUn
	v4l5THkzyfLniZ4Gbfr0fWjlcUMWzNmVI7L/2tKQrV7A1ZPLi9hGVAZKfcXHl9AyZszt1o
	8nahh4E5nelPI2LaigNRnoG1J5NHDtnF/s8DMw4W+1sCLgrgxR1PXa6IjLvTr7nAoqljdw
	vkiY8jOxFu+Ek/hZDii3tDnra4W3EDU9R2Q6R08hleWNXC4xnbkr12ie4/mxeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747377478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4xmhfhEFc3Xpalb8tjD68C+ttWeUsI04TwhqzTxAvc=;
	b=W1U1lHnPDvLMRYdYh9IbWm38jdwrjYWZEwCvvjkh7eQEQ5qzNK0e1dt1SIAzMHBNPtqHrb
	qfIivpljg/FRNbCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Borislav Petkov <bp@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] fitex: Fix kernel-doc comments
Message-ID: <20250516063757.dBSZYn-5@linutronix.de>
References: <20250515171641.24073-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515171641.24073-1-bp@kernel.org>

On 2025-05-15 19:16:41 [+0200], Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> Fix those:
> 
>   ./kernel/futex/futex.h:208: warning: Function parameter or struct member 'drop_hb_ref' not described in 'futex_q'
>   ./kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
>   ./kernel/futex/waitwake.c:594: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'

Thank you. It was on my list for today. Let me fix this up and resend it
(unless you beat me to it).

> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Sebastian
