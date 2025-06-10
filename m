Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759B27FD64
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546229; cv=none; b=rz6cyD4FD1LA40jQz59KJGvvppb4+v4f5NVMD683ZCqdjdYppAifIyt+U8OOxdaDhD9c9qIDC0GN0XP9usdTlY3vNxUjW0tNSIOGY3QqfQ7WsdM2NyHRFIgDH3FWcXZLo+2zxnbpZPDZDbgzJ897N/L6M826mFpwN1Es4ZuWk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546229; c=relaxed/simple;
	bh=dp1+Pq5qaOZvFOFXWZNTO8Z6reL0XK4inF9engZSOHI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sm6FYXla0+WVs25pM5+P7bIBuJyKgtzVMi5pVArXGfUGBx0o+f07HnVzML2JNEaCJX/kAXrRw+ZOUwsQGDHRrXjklXKz6Z6wnh8V6wP8of8nI5Lh+PCWpykMYczlgUAg16hkLFtVL0qzRtNgywxT50+DX8cmGM7JZul+mtaFyXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PCCZc5QF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0fz8Y82a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PCCZc5QF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0fz8Y82a"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749546225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QhxRsDdql0Nl3GR74eXJjuLHXb+j0CJcl46lmXDsw04=;
	b=PCCZc5QFkSHt17+QKrOaZIDYBZKIH7BZbd06nEfFKMNaASXZHqRC0lAkD8NY5y2tYqqA8U
	QZdqpgPtnMQmTcD1sD0qpyY8AjKj/OZD9tXu3VLDnuSyFiPJSN///SToYDmN79odJQwGeW
	Tfh/inzq3NxDrVebNyqyCHpaUNYJpj5Wl5R0S3vgu016Yw5+aoXnms8F49lSYQ4kXci+lO
	GJL2+B2HPNuz4ibhC9BsrM7N+NTds/I6P5iYHYIsqA94sGKA4V/3fVt5hv8YKwlFvy1bVF
	kqBbXDspzKrk6Ft3ZOTzaaBpvYPr/NPuJe+11ULyryhCffamoEoUU0tCmAjIWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749546225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QhxRsDdql0Nl3GR74eXJjuLHXb+j0CJcl46lmXDsw04=;
	b=0fz8Y82avtl/D9yao5vNyhJA0sLLKfSTId2NqqBpfvehwjT8lSpI4cBKFYbmYk+O0wTnwl
	SHRnBeIk7y6ZpVDg==
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clocksource: Fix opencoded cpumask_any_but() in
 clocksource_verify_choose_cpus()
In-Reply-To: <aEbwsyJyqm7WYJkJ@yury>
References: <20250607141106.563924-1-yury.norov@gmail.com>
 <20250607141106.563924-2-yury.norov@gmail.com> <8734c9p6z8.ffs@tglx>
 <aEbwsyJyqm7WYJkJ@yury>
Date: Tue, 10 Jun 2025 11:03:44 +0200
Message-ID: <87wm9knf2n.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 09 2025 at 10:33, Yury Norov wrote:
> On Mon, Jun 09, 2025 at 12:03:23PM +0200, Thomas Gleixner wrote:
>> On Sat, Jun 07 2025 at 10:11, Yury Norov wrote:
>> 
>> Why are you so obsessed to slap 'Fix' on every subject line?
>> 
>> This fixes absolutely nothing at all.
>
> Opencoding helpers is an error, isn't? That's why 'fix'.

It's not. It's functionally correct, so there is no error. It's an
oversight in terms of code efficiency, not more.
