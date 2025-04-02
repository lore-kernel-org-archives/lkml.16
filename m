Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBA78C91
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624024; cv=none; b=Zbm9zIWazT9lg4SWJuxN/amdoH6ajXC+ke27qZ95VmhDaUBikAbnBV6UNUdPow+aihOqVPOedLBtwlXdb6EHpNcmpdkEP8iGkcGRJa2J40IYB3JnRFiw3yqfN0R+SEZHY6egjIoQ8BtHrq9waJTN1uzQVB3l8JoV4Nlf+/nzzZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624024; c=relaxed/simple;
	bh=avfZeUFJvpSMk8CAcLxTTKqIg05Viw4KaEkdD91sAbI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tz5j2tbqN31zqGXAYhoftWM3n4MdGKHc31NVBoEO8ccusCyccIIiX12o9/wFP+40PPPhHr31+NkWpbMS5LMNKWZgZ3T3RcY42xglydDR9An6qQ7KyT53PrDZX+HvjlvF2IrkPokxYdWwjKg2T2+9uHNjDzwarOKZaeetzi3Ot/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aaQrODid; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aaQrODid"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cd36189bso241550b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743624022; x=1744228822; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=txAy9D37DW/I7ymkG3CLEN/VtWCGgjWjWlj3mTd+JV8=;
        b=aaQrODidsBndDZRh2z/htGN5tMUZ3os29Tn5QjRnF6PYSkTvvhR4DTVex9nI679D4v
         O2aONtbz7duUefix74bWbqEtp/+NdKdWr5cGG/GINRlPT061GzWvtUer9WKS9wXD7H7N
         /yBRc/75ZgNr2KUcPg6UhoLV5dGlZHJEEKxuHdqMxEub/IVc+yHs0EIKWEgAdpXmG27/
         cJTEUWBaqxQoULxG4hJLrQyWJWEggqZYA57esOXmYxO1o3DscRLOFf7tn5MVIv07ZPik
         JUndWar5VGFQ/A+fHaxxpE3zHozjPvAgmBCCcC6aqi9+IRzS3nBZ+epFue9jjuMbcH5Z
         PNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624022; x=1744228822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txAy9D37DW/I7ymkG3CLEN/VtWCGgjWjWlj3mTd+JV8=;
        b=wGREHtVhXGUjmVj+EFQVNNiysONh+oa57594Gft4EyFN1LTefVxS2tReOC/jZSrz1k
         Yb4P+GQLtR2EsBVA3r6BwxvehyTF6Zq1Vo4aDVpHNKvHpAJTkPKP84xsslhy7CZ8OGe2
         M0f9N33uU+0MU8wYJx5dbOAupod4GAt8iM1cjnUb05AByX3ck10a2BG+ueJOcraMfPGE
         YBb8fr9bB26U6TSqtiIBCxlwC6OgpdBf6ETN0TGHmRuG2otzVjwi/EQhb8MgFAR/e733
         WGAzr7sNYgOEyOKTc8nn1Brlg+d3s0k2a/81gdkckXdwMyunCCNYHIIFNZwWeBLLpGz8
         4iHg==
X-Forwarded-Encrypted: i=1; AJvYcCUrVVKLfGyTQcwVOTYD3juP5KwETN/fIzxWl8IgjeMnh9uv9qotHHAW3DSCVZgrB58L2YZvIDrhySk1MDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGOGceD1LlhlCN6BLVRFBAl0ZN26sM3k89PMqkH7jKFTWXlOKZ
	d204WJEs37Mn6fmbsLKiMFuzAe0tG0BFUL801nGz92Hf+vZHdsKGqOY9fSjO881OVNZVoZvIi+5
	hEA==
X-Google-Smtp-Source: AGHT+IEc5+Uh/d7pjKlHbI0WobukHeDGSozoRnvtVqNlg/trh5/4B1dBUeXBu8caipBdB4Y11GwJmU9nJ1c=
X-Received: from pfnz3.prod.google.com ([2002:aa7:85c3:0:b0:736:5ca8:c79a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f8b:b0:1f5:8fe3:4e29
 with SMTP id adf61e73a8af0-200f72cd75fmr322432637.3.1743624021824; Wed, 02
 Apr 2025 13:00:21 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:00:20 -0700
In-Reply-To: <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain> <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
 <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
Message-ID: <Z-2XVMOJXUjVYXV0@google.com>
Subject: Re: [GIT PULL] more printk for 6.15
From: Sean Christopherson <seanjc@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 02, 2025, Linus Torvalds wrote:
> On Wed, 2 Apr 2025 at 12:07, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > The whole "link to original submission" is garbage.
> 
> Just to clarify: people should link to the *problem* report. Or to the
> *debugging* thread.
> 
> But linking to the final result is pointless. That's what in the tree,
> and any subsequent discussion about it is stale and late.

It's not pointless noise to everyone.

For people that come across the commit after the fact, which may be years down
the road, e.g. when doing git archaeology, having an explicit link to *something*
is extremely valuable.  The final submission may not have the full context, but
more often than not there are links and references to threads that do provide
additional context.  At the very least, it's a starting point for the hunt.

"just Google it" does work most of the time, but search engines won't help all
that much if the maintainer massaged the shortlog and/or changelog, especially
if the surgery done when applying is significant.  And if the source patch was
never posted to a public list, lack of a source Link is a hint that trying to
find the source/context may be futile.

Linking to source of the commit also provides a paper trail that can be used to
audit the final result.  As a maintainer, I've used the link to verify that I
actually applied the version I intended to apply.

E.g. with zero a priori knowledge of the situation, it was trivially easy for me
to verify that Thomas' goof[*] with the irq/msi series was due to v2 getting
applied instead of v4, thanks to the Links in the buggy commits.

I can appreciate that in your role, a Link to the source patch is a false positive
more often than not.  But isn't that a problem with the tag being ambiguous?  I
assume it's not the mere presense of the line in the changelog that's most
frustrating, it's the wasted time and crushing disappointment of following the
link and finding nothing useful.

So rather than trash the convention entirely and risk throwing out the baby with
the bath water, what if we tweak the convention to use a dedicated tag, a la
Closes?  E.g. Source or something.  If b4 implements the new tag, it shouldn't be
too hard to get maintainers to follow suit.  Then you can quickly gloss over the
tag and mutter about its uselessness as you do so, and us plebs can continue
reveling in the joy of our source links.

[*] https://lkml.kernel.org/r/20250319104921.201434198%40linutronix.de

