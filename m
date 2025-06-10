Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612B28B412
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549576; cv=none; b=prIVRavS5Q58INkmVgqdefnl4cjG8ReuwpF9oA025ZwTwSdjmhw3eVkxaQ5WCnn7LDmOgiDQ2VDFyIep6gfZrrqPxHCpA6TMGAYCIcLqmF+K4juMTO3XV2DblwWIql7GLw/my7YFpk8Wix44hC+d4nQEA/zRjy6nXacwuPfdQlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549576; c=relaxed/simple;
	bh=xf085i2l6fd/qOZ8bILMrztat3R1PycjTAfMEWFwEQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia5V80e546zAXbGe4tcgPA/M2EZ+XkW7S5SZQvMkQ/cHYNcQkJz1jOfgzIVbmVb1S5W6gCXx3rLj1BJ8QB9cJgyDF4+TYiAI5UMrIQSDq54OOkWUm7tCVSehMi3Dq3M5wcwHd8g/AQYPgxfvXCmrmwBLO7HQf/5/GB7+AZfuOXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ACiUwdIg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ACiUwdIg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442fda876a6so46656335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749549572; x=1750154372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtZfRWe7jumYhORD8bhAM/HNKsZrd0S3kChFZwMp2GU=;
        b=ACiUwdIgRjWJE2RN7eqfgYHeG8BybVuLNr5sPAYsvqiCzW4JPJkTHeOkw9+mMxV7dP
         CGpTZOUt/MnyIVhvKmxxtwPR6H+LSaZ97LH1lU5I3pGqHwIK072bROGrtS1BKJPgVC/L
         uw8E/FXwnWqRnLN8HR6usNdFY2j0fRmjXVQvkfQHogn30S/QaRYETabjg4q7BWcqTC4a
         orJtAgpEPj78D1iDjeyvJwJlr9Xv5RW7Q+l224Te5AJJGwEfWFo88wmao7o6Gzz8kuWB
         yD7osxx1/s0OBLPuev6udraaCnldf154C1Bfn+NYr8VZDAwlgLhx1poeBHp6kOJwfeet
         hM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549572; x=1750154372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtZfRWe7jumYhORD8bhAM/HNKsZrd0S3kChFZwMp2GU=;
        b=GQPZuJrYxw+EAhVoGU+CB/yDE8Hl5+k3QUuH0L31zETp6hJIdjIQmxT199vnvHS+DH
         cjh9ZoKptZSFoVCpo/Js4oTxB6ndeJs2XoCMMzYIzIUE+uuVKoGGX47QFnvPeOjFeJjw
         hGt7vLV66cuKvIl7Wa1RTg6VrpapbqVffxexrUMmwfnQn02HMqmYpHL9faxcWAtwgh7G
         Oh6NQrflkiJedpkoPwxXofzDlg1EXTZKPkBDpPVj7vEI9pK6psHWih8SVMUgOuaOuDSp
         V1uDy2jjFOkqzH/N1BckJHWnKeJ14Ht/vStcp5fSFzaBR5ZhscDkQrg6IPawBOoxRXak
         pxKA==
X-Forwarded-Encrypted: i=1; AJvYcCVIziocnNoJaLWzR66+rbZDoBJJyP0iwb3WnHIIyOZxffqXxK91FLOgWJ7IlNLR7zbMwCnFbmz1IvFTE1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7Qm0x7QuM4629DPrxaBaL8olmq/+ZaSzx3ZGdrTpLpY5Fu9A
	ZhTgrAd9P5TjHyXhPbgGPIXH3ZripQOgoFHx5XjHU22uxIeLbil11KZr4sL2gmSKrkw=
X-Gm-Gg: ASbGnctitBdHGvukh5JXuQRt3pHXRIzG7TlR5m0HDQn+fj4ifBdEOAeJ5JPU8yvAzcl
	bEFKO9vg0F1WD047odA1S8dxFFuG9GxheyvzNb5EBWsBpcGLqPES5c7lprRfTXJYb0gERvYAKcJ
	zy4Is1QGvA81yGmSiENKjAkfaKxjAuqvpBNGNSHZY0z6d1dB8GMohTaJGye5Dk9LwTg08abuUDd
	corY0D8yjxamyqFL9f89qOyaEE0PMHE3l3Mm9ek6mFTOcPs3zDdhlN+heOG0Q9pDJ90bLVvRdDB
	RDs7rSfTXR21gMYlMbYMmj2I3XyUMu8bRCIS2X/NfQGidiyLo5PKf1Njw5l+E35vx0REXmCHO6P
	7QWB8JcZrKQ==
X-Google-Smtp-Source: AGHT+IGl3y7tGpOe1smwbVjVe6Qrr+nVtzasTtqSpTPNV7IeliyjEvSIX1HfFN4Q5jCM9QnyAR7OyQ==
X-Received: by 2002:a05:600c:37c9:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-452013d7e24mr138183715e9.23.1749549572531;
        Tue, 10 Jun 2025 02:59:32 -0700 (PDT)
Received: from localhost (109-81-91-146.rct.o2.cz. [109.81.91.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53229de7csm12006149f8f.14.2025.06.10.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:59:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:59:31 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, surenb@google.com, donettom@linux.ibm.com,
	aboorvad@linux.ibm.com, sj@kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fix the inaccurate memory statistics issue for
 users
Message-ID: <aEgCA3lJDWVu32Gc@tiehlicka>
References: <f4586b17f66f97c174f7fd1f8647374fdb53de1c.1749119050.git.baolin.wang@linux.alibaba.com>
 <87bjqx4h82.fsf@gmail.com>
 <aEaOzpQElnG2I3Tz@tiehlicka>
 <890b825e-b3b1-4d32-83ec-662495e35023@linux.alibaba.com>
 <87a56h48ow.fsf@gmail.com>
 <4c113d58-c858-4ef8-a7f1-bae05c293edf@suse.cz>
 <06d9981e-4a4a-4b99-9418-9dec0a3420e8@suse.cz>
 <20250609171758.afc946b81451e1ad5a8ce027@linux-foundation.org>
 <advwinpel3emiq3otlxet2q7k5qwl43urgewhicvqhqliyqpcg@vztzhkqjig6n>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <advwinpel3emiq3otlxet2q7k5qwl43urgewhicvqhqliyqpcg@vztzhkqjig6n>

On Mon 09-06-25 17:45:05, Shakeel Butt wrote:
> On Mon, Jun 09, 2025 at 05:17:58PM -0700, Andrew Morton wrote:
> > On Mon, 9 Jun 2025 10:56:46 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
> > 
> > > On 6/9/25 10:52 AM, Vlastimil Babka wrote:
> > > > On 6/9/25 10:31 AM, Ritesh Harjani (IBM) wrote:
> > > >> Baolin Wang <baolin.wang@linux.alibaba.com> writes:
> > > >>
> > > >>> On 2025/6/9 15:35, Michal Hocko wrote:
> > > >>>> On Mon 09-06-25 10:57:41, Ritesh Harjani wrote:
> > > >>>>>
> > > >>>>> Any reason why we dropped the Fixes tag? I see there were a series of
> > > >>>>> discussion on v1 and it got concluded that the fix was correct, then why
> > > >>>>> drop the fixes tag?
> > > >>>>
> > > >>>> This seems more like an improvement than a bug fix.
> > > >>>
> > > >>> Yes. I don't have a strong opinion on this, but we (Alibaba) will 
> > > >>> backport it manually,
> > > >>>
> > > >>> because some of user-space monitoring tools depend 
> > > >>> on these statistics.
> > > >>
> > > >> That sounds like a regression then, isn't it?
> > > > 
> > > > Hm if counters were accurate before f1a7941243c1 and not afterwards, and
> > > > this is making them accurate again, and some userspace depends on it,
> > > > then Fixes: and stable is probably warranted then. If this was just a
> > > > perf improvement, then not. But AFAIU f1a7941243c1 was the perf
> > > > improvement...
> > > 
> > > Dang, should have re-read the commit log of f1a7941243c1 first. It seems
> > > like the error margin due to batching existed also before f1a7941243c1.
> > > 
> > > " This patch converts the rss_stats into percpu_counter to convert the
> > > error  margin from (nr_threads * 64) to approximately (nr_cpus ^ 2)."
> > > 
> > > so if on some systems this means worse margin than before, the above
> > > "if" chain of thought might still hold.
> > 
> > f1a7941243c1 seems like a good enough place to tell -stable
> > maintainers where to insert the patch (why does this sound rude).
> > 
> > The patch is simple enough.  I'll add fixes:f1a7941243c1 and cc:stable
> > and, as the problem has been there for years, I'll leave the patch in
> > mm-unstable so it will eventually get into LTS, in a well tested state.
> 
> One thing f1a7941243c1 noted was that the percpu counter conversion
> enabled us to get more accurate stats with some cpu cost and in this
> patch Baolin has shown that the cpu cost of accurate stats is
> reasonable, so seems safe for stable backport. Also it seems like
> multiple users are impacted by this issue, so I am fine with stable
> backport.

Fair point.

-- 
Michal Hocko
SUSE Labs
