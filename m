Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13386125B2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115955; cv=none; b=lJzwHvZ4Ogqx2ydtwBUtOwzd08G/KyZABgKWocU6kSvU+oXV4ndcWhBN6K9aNTgV87P37tEXTBr8D4QEg0KvisCp7+6KjI4+18t7fuJwlNQMuEsGuzqMu2o0Fn7deZxLRjUot3fM4ek580shwv8mctWWQW5mcbpT1jhBs0XuSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115955; c=relaxed/simple;
	bh=+3nolFJS3GDU61tRWYyiY4l61kABXZK0asxpUNd0eHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WHx/aHv15RBgXNBQOre1wCtKXYuB2py63m0H5+/pWxbJKMFhCK9MCqUCUy9bLNyWN49mHVT88O0CqIO4/QcQ3b42wzgS/WY9wOg7K4eVxwAzyB5bqIhe0SqXcPXEHciMWVaPoO63AoGccQeUo5AgfYIApWhbsyo/2YY8/KXLy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NqH8SnvR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Onm9Zo8r; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NqH8SnvR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Onm9Zo8r"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743115951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D6yyZnt8KqfLHyHM7P38OJddKZk6nvBIoDwIAEF8g2k=;
	b=NqH8SnvRcISwtgLZRUcsloj3O/ZudaIRaT3mcjw38LjMag9g2Hns2YEYPo3GVZyaa8Nwv8
	USofFnrQRtDtOrGL9qdfvVYQU/g5du5Mn4EqR8MrulayVtOD8J4cjkfWPG6rX5IjSesumw
	zocnPQz8y3czFEiLjlETKgvKD5zK4VpD63OGSBiTNchJvPmM9cot3IPBLXzLCCC994hh5f
	gnqKH+vliR3pPRu9NC5LHc5N6A+VLwMU2Q4Eu5B0Mn1jKgdk0LWFbRS6Oyn0sQPygz/UES
	ycxqigtBmAL1p0Nktfb0cIYLC/c4+ZTBxJb2SGb1/tKK3UYDAoRdUqVJxZMwtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743115951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D6yyZnt8KqfLHyHM7P38OJddKZk6nvBIoDwIAEF8g2k=;
	b=Onm9Zo8raRd6c1kFpqDesNqUR9JwJIN1SVaQCF7Qgr9ZZUlplEeB+ODK9m0/URtCyrz1nR
	RQga/rlRWiDHmdDA==
To: Fernando Fernandez Mancera <ffmancera@riseup.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, mhkelley@outlook.com, mingo@kernel.org
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off
 the PIT
In-Reply-To: <878qoqxjew.ffs@tglx>
References: <20250327152258.3097-1-ffmancera@riseup.net>
 <87ecyixuna.ffs@tglx> <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net>
 <878qoqxjew.ffs@tglx>
Date: Thu, 27 Mar 2025 23:52:31 +0100
Message-ID: <87y0wqw0gg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Mar 27 2025 at 22:17, Thomas Gleixner wrote:
> Though I really want people to sit down and think about the factual
> impact of a tool based problem observation. Tools are good in detecting
> problems, but they are patently bad in properly analysing them. And no,
> AI is not going to fix that anytime soon, quite the contrary.

May I recommend you to ask your favorite AI model of the moment the
following question:

 "Explain the discussion in the email thread starting at:
  https://lore.kernel.org/all/20250327152258.3097-1-ffmancera@riseup.net"

I'm sure that I'm patently bad at AI prompt engineering, but that does
not justify the utter insanities which these models threw back at me.

 ChapGPT:

   "....
    This patch adds a selftest (automated test) for the nftables
    flowtable feature using a netdevice. It targets the netfilter
    subsystem, which is responsible for packet filtering, NAT, and other
    packet mangling in the Linux kernel."

 Grok:

   See

        https://tglx.de/~tglx/grok.html
   
   for the full glory of AI hallucinations.

At least those two were halfways reasonable:

 Gemini:

   "API REQUEST ERROR Reason: Unknown."

 Claude:

   "I don't have access to the specific URL you've provided ...
    my knowledge cutoff was in October 2024 ..."

Seriously?

