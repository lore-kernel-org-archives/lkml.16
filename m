Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29723202961
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072884; cv=none; b=uJmlZUCNS2M9HhMObWAZ8mWhhB4OC6UJO7yhYr3bekeWB18fygTUfNyYRfT+GGIDJjFQvZFyjixvpbK9Uce+O709VGxqFNCWV5o8RJ1jvSc7CA4IqWUxujFvxo7UW3/bCoF7YAHtnEvE7m3Wvs66ju2O8GDRX1MpWGmXLWj/gq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072884; c=relaxed/simple;
	bh=I7krYy6q0FyCB6PgQfQzdf9QVGq1w/Z6Etz6ApZJSBI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uQgSQzdDcudAYMRXxcxOgxA0bRD1gbuVpm+mJGXSI9MDbrW7tK0OfjZe/xFXyhx/hA7s+JY0VpLWvUZCoBIQea7zdXXB3zKncIpc1wiDAFodidx6/8G5JWTRdMeHcB+QGxYuU4RQBHwE8YWr15xD3ycHFZoQijEC0lL9jPXPtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PVP3vGxI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PVP3vGxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E2DC4CEE4;
	Wed,  4 Jun 2025 21:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749072883;
	bh=I7krYy6q0FyCB6PgQfQzdf9QVGq1w/Z6Etz6ApZJSBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PVP3vGxIFXIq5TJ+Mm81Q2ivcpj0rEvoZK6dAgfgNr/QaeLt59GXTOJHwwXneP64o
	 1HMJ7ccy65dSDJ+3ZCsl9vBI/wUjnU53y9zwMgD6DV6XLFcRf6kG7P43K5Huny4mIW
	 NVbONpO9KEv//ZOZQlQZrl49wqTWhaP/VGr/GAfA=
Date: Wed, 4 Jun 2025 14:34:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, John Stultz <jstultz@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] bitmap: generalize node_random()
Message-Id: <20250604143442.37635ce63e50a7425a390c2e@linux-foundation.org>
In-Reply-To: <20250604212125.25656-2-yury.norov@gmail.com>
References: <20250604212125.25656-1-yury.norov@gmail.com>
	<20250604212125.25656-2-yury.norov@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Jun 2025 17:21:21 -0400 Yury Norov <yury.norov@gmail.com> wrote:

> Generalize node_random and make it available to general bitmaps and
> cpumasks users.

Seems sensible.

> --- a/lib/find_bit.c
> +++ b/lib/find_bit.c
>  
> +unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
> +{
> +	int w = bitmap_weight(addr, size);
> +
> +	switch (w) {
> +	case 0:
> +		return size;
> +	case 1:
> +		return find_first_bit(addr, size);

Is the `1' special case useful?  The `default' case should still work OK?

> +	default:
> +		return find_nth_bit(addr, size, get_random_u32_below(w));
> +	}
> +}
> +EXPORT_SYMBOL(find_random_bit);

Some kerneldoc, please?

Of course, the hard-coding of get_random_u32_below() might be
unsuitable for some future potential callers but we can deal with that
if it ever occurs.
