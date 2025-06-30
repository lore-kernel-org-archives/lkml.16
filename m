Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31C285CA4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288170; cv=none; b=rmp1GQlp7S3K6bh8NUa7EQsVsHjjauAxNxNaQxtsStWMv1LnNofeAQCWjX0qnQQrdlOfDXi3OJZqDdYGRbvzLiqbDUHYQHX1uEYCXqP1F7xjWSc0C9tC4iXd1ZI/lGuTCsDukipIp54ceUh3es80zhaBNRKJqc8elMomK0N408o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288170; c=relaxed/simple;
	bh=bhcuKmwG6douTkFojaIV1GGRHXIaqFyCaUWuydWmrrA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jM9nD8s6dXSfDK20a+lGKCocWTY4fRelyvsKhY6/VmzPQFUQ+lhe5A2vwov0pl3cUI3PU0elsbdklk69astdyw2ZyqSxHJGSayAPgpcepwWqxXpXXHt9A9n+MEcy/oC1lX3rx97JlQDaTlOrzLCMw3uoxDwbywz794i2WNTBDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GwxjycbR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9+6RJaLp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GwxjycbR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9+6RJaLp"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751288165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCJoJvW+DfJH61mUURyAQWE0QIG8Ut/dX+POiFVg8rM=;
	b=GwxjycbRHFblLXHVQBXkDrusFxkM4wIsHYy5QoyZDgg63mays/0MgO1rwIZ0DPDwQUms9a
	Acdor+105oArMq8tUsu6F3xDSRgAt80l+KpvXnbl0gZ9VIrTVUjcPq4+3tLEXL8OZWUhug
	lFLhnh4q8lg1CZGluGO1yA3kIvhu/AX+THJtt5EgYk6re2gxbb2RGMSsCUKtA/mx1K6l6g
	3oxUz5jy98okXo7CHC3bfYHg7pByjPtJPa0phiUulCzE3AtYgBmpwqd+tr4+waeOy/PEOe
	GMghXXM3f4lIJW6BKPLEDWD0uC4oAYJIIV2VETCTsFA1H4hBjAf7rKh3tCCxfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751288165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCJoJvW+DfJH61mUURyAQWE0QIG8Ut/dX+POiFVg8rM=;
	b=9+6RJaLp45Ii+G8MXSIvz3JER5zlrjgLDd6pg16SSBxsTyddMWQwvR+EdvZQYQd49kqp05
	FGcp+y3NkAGyvUAQ==
To: Li Chen <me@linux.beauty>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>, "H . Peter
 Anvin" <hpa@zytor.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Sohil Mehta
 <sohil.mehta@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
 <patryk.wlazlyn@linux.intel.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH v3 1/2] x86/smpboot: Decrapify build_sched_topology()
In-Reply-To: <197be36341f.121c2d667978523.290703926590546064@linux.beauty>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-2-me@linux.beauty>
 <20250625082819.GZ1613200@noisy.programming.kicks-ass.net>
 <197be36341f.121c2d667978523.290703926590546064@linux.beauty>
Date: Mon, 30 Jun 2025 14:56:04 +0200
Message-ID: <87bjq5o0bf.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 30 2025 at 08:21, Li Chen wrote:
>  ---- On Wed, 25 Jun 2025 16:28:19 +0800  Peter Zijlstra <peterz@infradead.org> wrote --- 
>  > Urgh, this patch is doing at least 4 things and nigh on unreadable
>  > because of that.
>  > 
>  >  - introduces DOMAIN() helper
>  >  - drops (the now pointless) SD_INIT_NAME() helper
>  >  - drops CONFIG_SCHED_SMT (x86 special)
>  >  - moves to static initialize and truncate
>
> Thanks for your review, I would split this Thomas's patch to 4 different patches
> and preserve his signoff

Nah. Just split it up and add

     Suggested-by: Thomas ....

