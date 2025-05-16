Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E04216E24
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392660; cv=none; b=nzP8BG590y5CcC9CubGj10hso+b32wQ4qB7tVDPeaUUi5anSCoz6GUmG3NRXvbUSIeJtANPkCDAZ2Ws2fxSnBU3RlB2MZboiIX0/o81S6AO+PbIBqI6ApD5f3gji3cXEFBBmfQt2uGQrVm9dhbt/WYaRJx3gWLgUnHtdH+RcVh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392660; c=relaxed/simple;
	bh=PjIBdEspIuRNKfgex/Sx4FHiOPlm4IpihsDCkb+6Uro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jk2lcRffBRyJUzXiZ9saFX8Pp4G4QMPN/43nB2/Tic98pOR2kVq/IcK32HC5ayDQ7ScoB/rS1uJasbtwZWWEEasQwn75aRnV83zTPpu8S90Og0Tsye8OpqTJVBxpd4npmQlqb8a3EUkRfIVYTRV24YNPwTCjK9CGvRL6/wrG8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qsL/mpUm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WV/ov43I; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qsL/mpUm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WV/ov43I"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747392657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7WYvZ69gHntE0lRFx7+IU0yfEcVm/Lp1fcyziZuekmc=;
	b=qsL/mpUmQUEsXw8LuDsj9+E6p4/SHKUfK6e/fJECbYhQHc7G5/3qjEolI9klKbFjRZ5xZk
	p3Sp8liC0U09hw0JMhboxKJIA68sVlTgSbR2WiaHJo1tJdiAjUDjCAsBg9pCdDmWsUgm9n
	fADM12toZdzBU/+CX9Zm7Y14VnsSDiV8FBVi3PQZfJ3/8aiXA/haYX/bLw8H7SMhOcJ3gR
	FJLdfe537m9ViSVoW+cE4MKoEayVPg2BVvyhWoiXxZFKJr10TuUIn2tcmSQcxCV+rMCZHh
	AMrkLysLGBajYG3AMV/pRUabntLZmzydv6k8PFZ4lBECxXzleRT3vXuZQYqVGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747392657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7WYvZ69gHntE0lRFx7+IU0yfEcVm/Lp1fcyziZuekmc=;
	b=WV/ov43ImEa88TIC2oFvPB/qCDeY7v03O1MNLhGrq+tfRHPDFSvhDSpFyWSDjwMfsBiyLr
	uqK64pVBQ4asGwDw==
To: Xavier Xia <xavier_qy@163.com>, anna-maria@linutronix.de,
 frederic@kernel.org
Cc: linux-kernel@vger.kernel.org, Xavier Xia <xavier_qy@163.com>
Subject: Re: [PATCH v1] hrtimer: Simplify the logic of __hrtimer_get_next_event
In-Reply-To: <20250516070153.2410363-1-xavier_qy@163.com>
References: <20250516070153.2410363-1-xavier_qy@163.com>
Date: Fri, 16 May 2025 12:50:56 +0200
Message-ID: <87ecwoj0bz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 16 2025 at 15:01, Xavier Xia wrote:
> Currently, __hrtimer_get_next_event makes two separate calls to
> __hrtimer_next_event_base for HRTIMER_ACTIVE_SOFT and HRTIMER_ACTIVE_HARD
> respectively to obtain expires_next. However, __hrtimer_next_event_base is
> capable of traversing all timer types simultaneously by simply controlling
> the active mask. There is no need to distinguish the order of traversal
> between soft and hard timers, as the sole purpose is to find the earliest
> expiration time.
> Therefore, the code can be simplified by reducing the two calls to a single
> invocation of __hrtimer_next_event_base, making the code more
> straightforward and easier to understand.

... and broken

> -		cpu_base->softirq_next_timer = NULL;
> -		next_timer = cpu_base->softirq_next_timer;
> -		cpu_base->next_timer = next_timer;

because you removed the cpu_base::[softirq_]next_timer update logic.

Thanks,

        tglx
