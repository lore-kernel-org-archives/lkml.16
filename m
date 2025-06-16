Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382B1DFE09
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057700; cv=none; b=GpJt1QFhjW7GxKQU3k6e+RM2Dd+5Xh2qR/aVDbjcFC/tg6CLY5ARMlH73GLQyiwd/W/H1NQhpo7hAY6HPPpG1Z1R2rovLXNvRUfTP2XTxfWzy/JLlbDnX0vjXPyM9sKF5BjPggza6hq0YzSC0szSmoenwnbEeI0WD+XE8aMetKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057700; c=relaxed/simple;
	bh=JwbKl3feLu/8cncEFpDsCRl/UeTPTN9Bv3t3VPVssUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PNHkk3n2pzKS5GGO6W7joBHw7PUy1OQ9nP7eZSn+nqC7mTZI3pw+AqPZj6ISZOODfHz4dxHFXhQjHPeYNzD+cm4D7AuEGV2NgL+r3h/R46yj6iPN9U5U1LYrDx3RINkL6RKqYa+WeK4p9q7iALLS6VPeSBlX1zyGpwL6XdwWWv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oK1e2SO+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SDaWvH9y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oK1e2SO+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SDaWvH9y"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750057697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2/OD/T2W87+aWFUW931ab+HNwxYEUAlG9HC7Wgrmgc=;
	b=oK1e2SO+X5ctVt1EItqZ3c30piqpxhOQQcxSvKQ8Kyblut2ohWMN/zEHbj1bC//pdr6awf
	mD+4tEAN3N59s/zaP6k+5XHbGBbvKVjyRi1G8Eki6Qq0aEUJ69/pQ/Nkoib41kbhH6HHfk
	t9udknsb1kqZqwpX/gkCJiCRv9sHIxnONmoAYgxiht9/+cJYt2TwTjj5Em8dtvr+yknT6H
	+iXzvWIfwW7GPPwXxXgTwy0XBsnF6OLcMbLfaNdGOzK6ddASwYoKTEJsguCnoeL6N81ULv
	7IJ4G3BS2cwKAVCCixLLVJyN7JIzIHiw7pB0QvCx0eQKom8FYGHRxLKDA2Jldw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750057697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2/OD/T2W87+aWFUW931ab+HNwxYEUAlG9HC7Wgrmgc=;
	b=SDaWvH9ygXCWKTkh2iwl4crI685BnbiZ/tkRiew5rQ9WcxVdTNkFqIkrhFoDaP4wfyUywU
	RYAC1sI9YV0ZFdCQ==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org,
 luto@kernel.org, linux-kernel@vger.kernel.org
Cc: Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH] kernel/entry: Fix misleading comment in irqentry_enter()
In-Reply-To: <20250614192729.10760-1-khaliidcaliy@gmail.com>
References: <20250614192729.10760-1-khaliidcaliy@gmail.com>
Date: Mon, 16 Jun 2025 09:08:16 +0200
Message-ID: <87msa8noyn.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 14 2025 at 19:26, Khalid Ali wrote:
> Change irqentry_enter_from_user_mode() to enter_from_user_mode(),
> because enter_from_user_mode() function is the one doing the action 
> comment indicates.

irqentry_enter_from_user_mode() is what is called in the user entry
branch, so the comment is not misleading at all. If someone can't follow
that function and figure out that it calls enter_from_user_mode() so be
it.

Thanks,

        tglx

