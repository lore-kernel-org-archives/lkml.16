Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A725CC64
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985768; cv=none; b=SdqI/aPnI6W/WtzGtaIeLLiHOraGFL9X0VIutPjLaG/Y0fnxHz1NfZU/hNcFAOF4qzKG9uzt7Lr5GZLkjubJP+51jHKDm0N2Zz+b6AGxUOQIwPRmi+iLF343uv0wkSRmOs6wgkg4tOP3SnJyR1a0gHLLamG9/vDE2xeeZW7yl2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985768; c=relaxed/simple;
	bh=aQ/j1yBHRAA1+DRghquW3UiJiHBqN9d+SwVXx0rBpzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9mM8djpVgyBF2baa9RllPS2FuzeQ52JrSpJPxGNPmgtNuhSNDmLGr1TOZBrCVvd2h1xS1OV2gyN8HNciReB10K+27+UPum3E+bfHZsmqUHt0GfFyF627b6avbGfXCD9yvBJNaByoEQdyGpNWvYlGQgXwuAYhTXH2Txf2Jkl90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gekIODnr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gekIODnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2AEC4CEE4;
	Sun, 11 May 2025 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746985767;
	bh=aQ/j1yBHRAA1+DRghquW3UiJiHBqN9d+SwVXx0rBpzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gekIODnrGauTDiasH64ZXQI4gOMwS+VP7d0tOOXYEXgdADdS3worebx84SGRk7Gvq
	 srPynGdR/li8fIKdozp9/CjCkm3DQh9RyK4UNysrdg2SkQYk+d8csGNWlj5KPoIU0S
	 VkflLkKJwOxuXcDxU6pi72ruNDab2IcFvos9Ux/FZfAV44cE6QiZodflHySDN5Na7A
	 8ccwbz64Igpojn2Ce5AJJvdsqe3vrpQ9tRAlK0Tk43izJyAMKr9oKKoPvmyEU2qEsc
	 ogJWy5CGL4CE00z0F495/R5WU6wPGKT5d5CCK9SGSRtEz079GCQ4pQiN7a9j9ljBOr
	 Wf8xlg4FCT9Kw==
Date: Sun, 11 May 2025 18:49:23 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: jirislaby@kernel.org, linux-kernel@vger.kernel.org,
	peterz@infradead.org, tglx@linutronix.de
Subject: Re: [patch V2 26/45] genirq/chip: Rework irq_set_handler() variants
Message-ID: <20250511174923.GA3193067@ax162>
References: <20250509132211.GA3618294@ax162>
 <20250511172911.1008109-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511172911.1008109-1-ojeda@kernel.org>

On Sun, May 11, 2025 at 07:29:11PM +0200, Miguel Ojeda wrote:
> On Fri, 09 May 2025 14:22:11 +0100 Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I am investigating some cases where
> >
> > WARN(!irqs_disabled(), "Interrupts were enabled early\n");
> >
> > in start_kernel() in init/main.c is triggered in certain builds with
> > clang after patch 23 of this series (very bizarre since the conversion
> > seems to be correct) and I happened to notice that this conversion seems
> > to be incorrect? Should this be scoped_irqdesc_get_and_buslock() like
> > below?
> 
> Yeah, I am also seeing this in next-20250509 in a LLVM=1 arm64 defconfig + Rust
> build under QEMU.

I noticed that the warning was reproducible with just the first patch of
the series that adds the lock guards and patch 23 but also several other
individual patches within the series, as I could not just revert patch
23 on next-20250509 to fix it. I have no idea why yet because I have not
had the chance to actually sit down and dig into it but this diff fixes
every instance of the warning that I saw in my tests... :/ could be a
compiler bug or just some difference in behavior between compilers.

diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index bd2db6ebb98e..94f463de8f26 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -176,10 +176,9 @@ __DEFINE_UNLOCK_GUARD(irqdesc_lock, struct irq_desc,
 static inline class_irqdesc_lock_t class_irqdesc_lock_constructor(unsigned int irq, bool bus,
 								  unsigned int check)
 {
-	class_irqdesc_lock_t _t = {
-		.bus	= bus,
-		.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check),
-	};
+	class_irqdesc_lock_t _t = {};
+	_t.bus	= bus;
+	_t.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check);
 	return _t;
 }
 
