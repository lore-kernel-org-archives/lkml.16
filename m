Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123823956A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960927; cv=none; b=JJV5T2LsmPkndeI0sEBfzVYitJz67AcjEqJc8bTM4KJAGcaFLnxDEnerc3+8hganurUqmNk7kPkWD0lIPpkvMq7B2DA/9YBTbnTaz+evoPK9+YZ3ZPniXOu0pKRPx2TXiRZXuvpQ1BCV53bQ2uR7Raz4HOPEvVJc2SZurcuNLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960927; c=relaxed/simple;
	bh=84arr64fJqUwFWGQ/5viSuxqmTf76JKBuvpYkZ9qiBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9LpB6fC9tZBbt6C4XSkiIkMT59rIFw/ImlV6pD5yte1o5kJdIVRdAUnTkRhnGfyqp6ojjSAaUEydLwEOj++LUhEHPTC47bZ6JgXvaWlwZy/J/kaP6s0Zp7tKmUXeZz1Yd8S5ZsaODWS3pWCUXIVDs+aMlf9V4dTV1FGAwgQqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E196DC4CEED;
	Tue,  3 Jun 2025 14:28:45 +0000 (UTC)
Date: Tue, 3 Jun 2025 10:29:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Hugh Dickins <hughd@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250603102959.20c85adb@gandalf.local.home>
In-Reply-To: <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
References: <20250602170500.48713a2b@gandalf.local.home>
	<20250602171458.7ceabb1c@gandalf.local.home>
	<aD4boBrdZXtz_5kL@casper.infradead.org>
	<fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 01:02:36 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> Agreed that ramfs does not use swap, so calling swap_writepage() would
> be weird.  But, thanks for the build fix Steve, but it cannot be right
> because return 0 says shmem_writeout() successfully sent the page to
> swap, and that has unlocked the page (or soon will do so).  It should
> return an error (-ENXIO?), but I haven't checked what the callers do with

Yeah, I figured it should return an error, but looking at the code I
couldn't figure out what the proper error would be. Then I also noticed
that the other stub functions just returned zero so I did the same.

Perhaps add a WARN_ON_ONCE() if it is called without CONFIG_SHMEM configured?

> that, nor whether they need the folio to be redirtied.  And wouldn't it
> need an EXPORT like the real one?  Sorry, can't keep up, there are many
> many things I should have looked at but have not... Tomorrow?

Yeah, it probably needs an export as well.

Note, if you come up with a solution, by all means use it and don't use my
patch. I'm happy with a "Reported-by" and don't need to be the author. This
is the "fix" I'm using so that I can test my code because without it, my
tests fail.

I'm also happy to send another update if it's simple.

-- Steve
