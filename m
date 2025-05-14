Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770DD282E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264867; cv=none; b=pKjxtfAmmMZ+g4T5xHdliKavy8yZTMepVXob032USfH03bHArV8ueMBT/r9TLYZhjKwCvE9qEkef+AiDzX2l3pOa35rSy+xco3RjFxsJ1y21OZKNFRlGWwEfgpW5SYUmuInEbE3ZhAXP9R7bJyInKlibavtrBdN6V78bO+nc0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264867; c=relaxed/simple;
	bh=uQfanbkbNKzMoHOMeVj3wbsTpuwNVNOz8UDzF8whJpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2b2ah/Mx6jKRb+HNnDoAQaignQgSwjBlxpM6pkxvegi/RmIP4S+0yfWM3gsYSqUfJZrSnyMyDos+UsIGcecHlUeQZ9oQA+aFCBqFDpXAhg8MFxmQzcqNHuGhBVvpwxwGZLLDokKTF0sEXnKo01QA44PQf3CFvsbd802Cc2EAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=ozkSjDNB; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="ozkSjDNB"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7426c44e014so362462b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1747264865; x=1747869665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpxE6MEMMzwuyZNOZ6BiIuMXiwrHtKHE10sl2jjdvxE=;
        b=ozkSjDNBF9l/Ir1Bbcku6oBu1IrCGGLbf0ktaw9A1ZZ3mBbkAIxtWE3KkEV3F20RxW
         a/HfdQTNzSGVLxntcOVyQD3CyWpTqTEACODbHrGuXMmJ1tulyI877ae7X/mEkEg/wPq9
         NL/VEYcKtBzEO9QOOkyzEWdANdMZo84GFvMGoUvCalyXYpnrgXJ1+Wp7NMIhEIcjkEFs
         HsyMoNINZ0hJ0BzhKtGdUidzoUFKLpwa/QQIEExZEoewXTeyShc3MEt/PpLD3ASWlZUp
         gb0GaL5njFmot0TLojF/XcGjMHcVbgENI2q+jmGrMdYXYMM2zQbPaz1PSUeZKChNlpW4
         G5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747264865; x=1747869665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpxE6MEMMzwuyZNOZ6BiIuMXiwrHtKHE10sl2jjdvxE=;
        b=xCzppEr/j5fGT6IVlrAmUjaO3d8huBAPagcj0pLA8D8ucg1SxxqaEzHNTLbuwx1k/X
         8xhVKJaiZsU6IyyU28pDVxRdnJTLMUBPoNJZkLcpo8dKRCLUhWsVrmzUs7psmn7XGCcn
         CmLUameuFnw+NAPDsMDR+OmN3lYfx13DYGWkF+kK23FZh70STL5Rq5cVGrjwRCXQLGyu
         cjcqDZKy9wMj2qFksxYoE+2YldkO/6p5nuDBzj2cuE+uOyNJ5BaZphsTVnhgloQJ3ia/
         Raa/oHbVgAR2mwp8ZzA27ItNPJsHW2AUNoZNkItNls0QUUseO7UEJnEMow7HULUVnIRF
         rUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTfRF5oKx2C3nQtJjEuMnqMU9Wh3gfCpgWGOkphuDFkPErxwe0LWqhq6OAGxLGNpjdwqp0h7ZdMEChaeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dMh9GN5x1ONCQAhACeserdm18zQR/jp3Zu0WeL1eAT6osFh4
	8g4bvdUHjGuJH9CgjqIMzUp5bybdJw11/K50R5vttjieGMdD1EyHXEu6U+kdZAE=
X-Gm-Gg: ASbGncvPvdtyWiSXXet9UWImCXRaVHw57RXCTso8bRy2KvWI1sLh2P3RnsD2ftEAeCf
	6a+1mzPcTlrjtkxw61IA1g2W2WwWrR2pbkzfTuxM8uNCZfUMJf3GzxJiUmLtJ0sl22fZTGh7ch1
	ONB6+oSBygNT0SyRdUTi7NAO+/04TCLzLIaGMng5sk7mkf4fbcEOVrG7GZ374uwCG0UxCJ+GsmM
	vBO6zCVXauVYloyW9pK9dbg8CwFADwLJ8Dv+HjMmA78RtVwOn4aeCiKxVed9gAeuqRj/ej47rTW
	5r+Za6y+W0OGPrhU0cckVcwWXZKe5VlAggthZcsyXEWv7ec7UmxpmgJAbvsqUqW+UuuGZd/10Wh
	yaaVt4OrLz7moxWNgYV1/BDdjVs8=
X-Google-Smtp-Source: AGHT+IGbo5cEIC0JUxpfSPsVWhCeQsEIHLbngmmQEFQhMKY4u1ZgqEsu0R0NtVVUP9lCappXR8Q5vA==
X-Received: by 2002:a05:6a21:684:b0:209:ca8b:91f2 with SMTP id adf61e73a8af0-215ff125547mr7347703637.19.1747264864692;
        Wed, 14 May 2025 16:21:04 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b23493257eesm9454409a12.16.2025.05.14.16.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:21:04 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uFLPJ-00000003b3s-17mk;
	Thu, 15 May 2025 09:21:01 +1000
Date: Thu, 15 May 2025 09:21:01 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
	cen zhang <zzzccc427@gmail.com>, lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xfs: mark the i_delayed_blks access in xfs_file_release
 as racy
Message-ID: <aCUlXbEg9wuyPEB6@dread.disaster.area>
References: <20250513052614.753577-1-hch@lst.de>
 <aCO7injOF7DFJGY9@dread.disaster.area>
 <FezVRpM-CK9-HuEp3IpLjF-tP7zIL0rzKfhspjIkdGvS3giuWzM9eeby5_eQjL5_gNG1YC4Zu0snd2lBHnL0xg==@protonmail.internalid>
 <20250514042946.GA23355@lst.de>
 <ymjsjb7ich2s5f7tmhslhlnymjmso5o2lsvdoudy3dtbr7vjwk@moxzvvjdh6zl>
 <20250514130417.GA21064@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514130417.GA21064@lst.de>

On Wed, May 14, 2025 at 03:04:17PM +0200, Christoph Hellwig wrote:
> On Wed, May 14, 2025 at 10:00:28AM +0200, Carlos Maiolino wrote:
> > I agree with you here, and we could slowly start marking those shared accesses
> > as racy, but bots spitting false-positivies all the time doesn't help much,
> > other than taking somebody's else time to look into the report.
> > 
> > Taking as example one case in the previous report, where the report complained
> > about concurrent bp->b_addr access during the buffer instantiation.
> 
> I'd like to understand that one a bit more.  It might be because the
> validator doesn't understand a semaphore used as lock is a lock, but
> I'll follow up there.

Even so, it's not a race because at that point in time the object
cannot be seen by anything other than the process that is
initialising it.

We initialise objects without holding the object locked all over the
place - if this is something that the sanitiser cannot determine
automatically, then we're also going to need annotations to indicate
that the initialisation function(s) contain valid data races.


> 
> > So, I think Dave has a point too. Like what happens with syzkaller
> > and random people reporting random syzkaller warnings.
> > 
> > While I appreciate the reports too, I think it would be fair for the reporters
> > to spend some time to at least craft a RFC patch fixing the warning.
> 
> Well, it was polite mails about their finding, which I find useful.
> If we got a huge amount of spam that might be different.

That's kinda of my point about it being the "thin edge of the
wedge".

Once we indicate that this is something we want reported so we can
address, then the floodgates open.

I'm wary of this, because at this point I suspect that there aren't
a lot of people with sufficient time and knowledge to adequately
address these issues.

Asking the reporter to "send a patch to data_race() that instance"
isn't a good solution to the problem because it doesn't address the
wider issue indicated by the specific report. It just kicks the can
down the road and introduces technical debt that we will eventually
have to address.

We should have learnt this lesson from lockdep - false positive
whack-a-mole shut up individual reports but introduced technical
debt that had to be addressed later because whack-a-mole didn't
address the underlying issues. When the stack of cards fell, someone
(i.e. me) had to work out how to do lockdep annotations properly
(e.g. via the complex inode locking subclass stuff) to make the
issues go away and require minimal long term maintenance.

I don't want to see this pattern repeated.

We need a sane policy for addressing the entire classes of issuesi
underlying individual reports, not just apply a band-aid that
silences the indivual report.

So, let's look at what kcsan provides us with.

We need functions like xfs_vn_getattr(), the allocation AG selection
alogrithms and object initialisation functions to be marked as
inherently racy, because they intentionally don't hold locks for any
of the accesses they make. kcsan provides:

/* comment on why __no_kcsan is needed */
__no_kcsan void
xfs_foo(
	struct xfs_bar	*bar)
{
...

the __no_kcsan attribute for function declarations to mark the
entire function as inherently racy and so should be ignored.

For variables like ip->i_delayed_blks, where we intentionally
serialise modifications but do not serialise readers, we have:

-	uint64_t                i_delayed_blks; /* count of delay alloc blks */
+	uint64_t __data_racy    i_delayed_blks; /* count of delay alloc blks */

This means all accesses to the variable are considered to be racy
and kcsan will ignore it and not report it. We can do the same for
lip->li_lsn and other variables.

IOWs, we do not need to spew data_race() wrappers or random
READ_ONCE/WRITE_ONCE macros all over the code to silence known false
positives.  If we mark the variables and functions we know have racy
accesses, these one-line changes will avoid -all- false positives on
those variables/from those functions.

This, IMO, is a much better solution than "send a patch marking that
access as data_race()". We fix the issue for all accesses and entire
algorithms with simple changes to variable and/or function
declarations.

To reiterate my point: if we are goign to make XFS KCSAN friendly,
we need to work out how to do it quickly and efficiently before we
start changing code. Engaging in random whack-a-mole shootdown games
will not lead to a viable long term solution, so let's not waste
time on playing whack-a-mole.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
