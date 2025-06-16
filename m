Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F6217BCE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057273; cv=none; b=NUUQqn/9O63AyitNP+T3aUhjbeeuUV2pKEcDP75TXIPMCK6e0jpIxK/FWPssofeEVhj8jTTkpsV7VqmQVyg9npIOH6yIwMZ+vd7qOyzDJ/+rHjuZt8nTHMzPuyxVXGy+kB+Gfk1VKzS78HM3VjjpU/0mweWvjQTbH9WxOFB3hPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057273; c=relaxed/simple;
	bh=SdK7hNT0SsvPg4Kf1lgwrBJghQD6d7y/Csbgr0eUy6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UkIVFCm+nVd4tKAWb2km7IMeZf07FR8C/Z6KjKAXzggJ/p4CSQFn7F0SD1/Z99vb/bZoDIp23asSmt/KkqPCoucEKnx2eCFcATJYkQdFjE42W1AvPxg1VvRd9hxJDkgXww4kkFSt4J5RmouHqBjmwzGiP7qitemMVmTdL6jjr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CqNhsg6R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BndjtlIu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CqNhsg6R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BndjtlIu"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750057269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tR0PpRa25P/6r94RjDMiFci8IhEDIKGx1vacCel/N44=;
	b=CqNhsg6RcuP2ZqAhLPywpo00mP4z75x/P17aoFmK9IXYliCMJQw2TZ/8UIYjZ681w1rDd9
	ajaxqPm9MwH8bENFUpSzK/KmN42vQctRbgpJX66g9crvo4Y/PUIShR1DWm0FU0nG3mRp/b
	V1YKmHUGML4uG92zhpHkoiNA/CZF098n/AB1nUwpctjv2rC2al6rRHQnlmHYMA4nlEMWfO
	QYy8a0BLo2Qqe9QzMS7En4+1CP0FQyTcCzvh4GVr5mGqaLpasv19YD5QYGol6OkYz+36TJ
	ten3419VulosIkNSmVvbt88up+ZHweiWmoHNog4ei8TN7yPWhqXgHGC792Phgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750057269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tR0PpRa25P/6r94RjDMiFci8IhEDIKGx1vacCel/N44=;
	b=BndjtlIuxE5hJAKzyEfu7RPsa8LaU08slqGF3Ka9EYvRTAH2eSlHO+RrzxS7C1MTLvUHZC
	hMaaWYeOTUuLCiBw==
To: Khalid Ali <khaliidcaliy@gmail.com>
Cc: khaliidcaliy@gmail.com, linux-kernel@vger.kernel.org, luto@kernel.org,
 peterz@infradead.org
Subject: Re: [PATCH] kernel/entry: Remove unneeded header "common.h"
In-Reply-To: <20250614194829.10832-1-khaliidcaliy@gmail.com>
References: <875xgziprs.ffs@tglx>
 <20250614194829.10832-1-khaliidcaliy@gmail.com>
Date: Mon, 16 Jun 2025 09:01:08 +0200
Message-ID: <87plf4npaj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 14 2025 at 19:47, Khalid Ali wrote:
>> The reason why common.h exists is that syscall_user_dispatch() is a
>> internal function, which is on purpose not exposed globally. There is no
>> reason to expose it globally, so it stays where it is.
>> Still there is no strong reason "common.h" could exist, there is no doc
>> explicitly mentions that. 
>
> Why can't we just put the prototype into the source since currently it is the
> only place used is common.c, so we should put it on top of the source. Again don't

No. You need the prototype (aka. declaration) for both the usage site
_and_ the definition.

Do I really have to explain the basic C rules?

> see strong reason why entire header exist for single function, even on
> future if more local definations come we should put on top of the
> source, if there is one single source file using it. This makes
> consistent across the entire kernel codebase which mostly do what i
> mentioned.
>
> The only exception for local headers is if the source file using it is
> too large and using many structures, enums and prototypes, in that
> case it is acceptable.

So you define what's acceptable and not?

> However the decision of creation of that local header with no
> exception makes the header pointless.
>
> I didn't find any kernel doc that describes the decision, so we should
> make it consistent with other subsystems if there is no specific
> reason for that this makes the source file more organized.

I explained it to you already why this header exists and there is a
strong emphasis in some subsystems to not expose functions globaly so
that the internals of the subsystem are encapsulated. That's the only
way you can do that in C and it makes a lot of sense.

This _is_ consistent with the rest of the code and you can argue until
you're blue, this header with the declaration of that function stays.

Thanks,

        tglx
