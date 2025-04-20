Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CF1448F2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745191767; cv=none; b=bN7QpgP7H0swHQEawsRqfE+gGVdzyVzu896i8eJ++ICGXfrH1JlFQgzE43JPAJ/5Grx/e9CZkdLSk7Zv5Uc7ATwaTc8FaftEBYXk89do8eYUUui2NQxZgXPNQhhrldY8zHq2tUZtf0krAPUaQC7gkhHffPqLKOahOL+HtET54UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745191767; c=relaxed/simple;
	bh=hZZIo8gXgK2BKK6vqVqgo5DK25CT1g/EXFasXSCrT+E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=B0IrFy0ocxwVPNzC4cSfP0szz5EATkS2lVHQYVM07xAVHuVTO8737/Os8YI9fpE5WGO2KyjlzRJw4QwGMv7krB9gfSghoiXTMqmm+lp5N6MpKAjKRnE957XOHoTf7Z2LWhcrixgGZgGNKH27pi2nds7WFZQNhueVqb2wiKje0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FiaKRZyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FiaKRZyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B3FC4CEE2;
	Sun, 20 Apr 2025 23:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745191766;
	bh=hZZIo8gXgK2BKK6vqVqgo5DK25CT1g/EXFasXSCrT+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FiaKRZyNECXzqsmm518kY4YImut7+RqRY/u83sC0CbO0A2dvgSnZSxhG2D13VF6XT
	 9b72x5RWt/r/PglfRYS7083GHijxTz45dd0gRECwTHnfrmZiBNbGeogmirECw8klLV
	 +U8gI0Ju59qaUC84ShjO9Dr6m0Z49KKB/sNFaeiI=
Date: Sun, 20 Apr 2025 16:29:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
Message-Id: <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
In-Reply-To: <20250418152228.20545-1-lance.yang@linux.dev>
References: <20250418152228.20545-1-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Apr 2025 23:22:28 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> From: Lance Yang <lance.yang@linux.dev>
> 
> To prevent folio_test_large_maybe_mapped_shared() from being used without
> CONFIG_MM_ID, we add a compile-time check rather than wrapping it in
> '#ifdef', avoiding even more #ifdef in callers that already use
> IS_ENABLED(CONFIG_MM_ID).
> 
> Also, we used plenty of IS_ENABLED() on purpose to keep the code free of
> '#ifdef' mess.

I dunno, this just seems really whacky.

> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
>  
>  static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
>  {
> +	/* This function should never be called without CONFIG_MM_ID enabled. */

A correcter comment would be "This function should never be compiled
without CONFIG_MM_ID enabled".

Which lets the cat out of the bag.  Why the heck is it being compiled
with CONFIG_MM_ID=n??  We have tools to prevent that.

Can we just slap "#ifdef CONFIG_MM_ID" around the whole function?  It
should have no callers, right?  If the linker ends up complaining then
something went wrong.
