Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE62517BB21
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439062; cv=none; b=gmiblXUPSgxKerqaNtF+2H5c+03UqiaFb7Kiq5FqE5K4R6qwzLdCkPwki2NXHNVePWpcqhSB/bGABxGqMR7cBJJbdOjgd7IgojtYstjA4xub4WSKD5RoVquFuv0kRnuV49RL3/xqdjDxUyJNy/Em7385SR4bnxf/wYs+FVN69hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439062; c=relaxed/simple;
	bh=5Bl2JfufO0kilZvR2+InuLVK8V/BBwppLn4v4RgxlZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L7nxAxf7TaYHZx3pfALspOxyl5yy4HWfz4YICN1l9fVwtgZT1tJ6KeeGvHZHlx9jtB4s+zun4Qx34oWzgE8Gm2yO/3wbWC3lT3hAs4dy0M143c6JBSQPy9f0tf0FpXZWMJUV2CnFxn+IszJYJnfQUwiIh4u7C7LFgiQfPJBt6ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vy7LxSEJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eZfOGm9T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vy7LxSEJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eZfOGm9T"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750439057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZXazKZ81Fm88VrT+aVvxTAZu5b40oSlFcSyhlUiRbA=;
	b=vy7LxSEJVopfKvvQMVUGPPMsYKCz6ei3gQg3nSnu3NQB2iVTa+CmG0HPT5XQ7k5B5ZAKo8
	t3dsKX7pub3oVPTr6vdbH8VfqT69IvqwcflitsZKX5pHsL2Usg0gQFxGcqyt41LhtL6qjc
	rcmBW6D6h4bip47TpyhAtZDmOuaHcDAGTG4mVsZhkScE5X+fAHiUzz5iHbad8HKT3AVPuz
	BBK7Jgt2r2uzY2kE8jn+/ltAuqU/6FuwltyoH2PMc8wRtIcKEEUYRKHWT8npxEFCb2BS5I
	xGvob6YKj1pKT/WhgdZmYoWTO5Tv8MyTBPRDNwpRx61s/Hi5jwW1CSEbiwAQGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750439057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZXazKZ81Fm88VrT+aVvxTAZu5b40oSlFcSyhlUiRbA=;
	b=eZfOGm9TUs+KViOzIKW6MMD+b9lBu93S6bh7rJGQyplVg2WwP/C8MymYJiXW1+liviMjM8
	4woUS5KYYMxbv2Aw==
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH v6 1/6] timers: Rename tmigr 'online' bit to 'available'
In-Reply-To: <20250530142031.215594-2-gmonaco@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-2-gmonaco@redhat.com>
Date: Fri, 20 Jun 2025 19:04:16 +0200
Message-ID: <8734buqr8v.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 30 2025 at 16:20, Gabriele Monaco wrote:
>  
> -static int tmigr_cpu_offline(unsigned int cpu)
> +static int tmigr_cpu_unavailable(unsigned int cpu)

tmigr_clear_cpu_available() and tmigr_set_cpu_available() are way more
clear function names because they explicitly state the action.

cpu_offline/online are not entirely clear either but at least
offline/online can be used as verbs, while [un]available definitely
cannot.

Thanks,

        tglx
