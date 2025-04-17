Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687A72066C3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927713; cv=none; b=gdy+zeD/5DHkyaPyhaTD0B8+CDs9WsYc2oUf/Z/thCyGk/gGobJY/3D9khdD8EGJsVxQIdY7UMCzVIG686oJbKQuaG8i7AD2Y/9HKAyw5wMA2ZiPSreZlu+SDwfVWDgiaTV5VBxwMPBd/8umxtz6Kuh/0isRZIsn5fHnulkbD1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927713; c=relaxed/simple;
	bh=o+qo/RvZDtevq0UAYNWCAjxyhgQu3FqtGxBbcECxZ4c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbvercMfIdjivB/8ADCK0L4/BViRehMyKcf1wrxfLIbYKm4YJR698WOja5iyq4vtHIsdfDFCf2wIFtNsOOvdpLKhqcVPjGIx7ny/5cqLnAEX+1gGJ67KkeFLsyBqUv/s/PB41dcl4W16Lmm1iF0S225BxKYMZpO7fHXC285MDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14C6C4CEE4;
	Thu, 17 Apr 2025 22:08:31 +0000 (UTC)
Date: Thu, 17 Apr 2025 18:10:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mhiramat@kernel.org, andrii@kernel.org,
 kernel-team@meta.com, linux-kernel@vger.kernel.org, Mykyta Yatsenko
 <yatsenko@meta.com>
Subject: Re: [PATCH mm] maccess: fix strncpy_from_user_nofault empty string
 handling
Message-ID: <20250417181010.3cc5777f@gandalf.local.home>
In-Reply-To: <CAEf4BzbVPQ=BjWztmEwBPRKHUwNfKBkS3kce-Rzka6zvbQeVpg@mail.gmail.com>
References: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com>
	<CAEf4BzbVPQ=BjWztmEwBPRKHUwNfKBkS3kce-Rzka6zvbQeVpg@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 13:44:48 -0700
Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:

> > @@ -808,7 +809,9 @@ static __always_inline char *test_string(char *str)
> >         kstr = ubuf->buffer;
> >
> >         /* For safety, do not trust the string pointer */
> > -       if (!strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE))
> > +       cnt = strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE);
> > +       /* Return null if empty string or error */
> > +       if (cnt <= 1)
> >                 return NULL;  
> 
> I wouldn't touch this part and leave it up to Steven to fix (if he
> agrees it needs fixing). Current logic seems wrong already, as it
> won't correctly handle -EFAULT. And, on the other hand, there is
> nothing wrong or special about empty string, so I don't think it needs
> special handling. Let's drop these changes in trace_events_filter.c?

Bah, it is wrong. I don't usually use filtering on strings much, but come
to think of it, the last time I tried, it didn't work, but I found another
way to get what I was looking for, and didn't look deeper into it.

I only care if it faulted or not. I don't care about it just copying zero
bytes. It should have been:

	if (strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE) < 0)

> 
> >         return kstr;
> >  }
> > @@ -818,6 +821,7 @@ static __always_inline char *test_ustring(char *str)
> >         struct ustring_buffer *ubuf;
> >         char __user *ustr;
> >         char *kstr;
> > +       int cnt;
> >
> >         if (!ustring_per_cpu)
> >                 return NULL;
> > @@ -827,7 +831,9 @@ static __always_inline char *test_ustring(char *str)
> >
> >         /* user space address? */
> >         ustr = (char __user *)str;
> > -       if (!strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE))

This is broken too.

As this isn't relying on the other change in this patch, I'll just fix it
myself. I'm getting a pull request ready anyway.

Thanks!

-- Steve


> > +       cnt = strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE);
> > +       /* Return null if empty string or error */
> > +       if (cnt <= 1)
> >                 return NULL;  
> 
> ditto
> 
> >
