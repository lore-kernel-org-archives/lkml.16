Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB539215F53
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827526; cv=none; b=fo46PRZtWz0kid2BriudIi2LzkfQzq2QJ5DIoH61t+ABaC26xJzekUFHmJu1NTlKk40SQcbcdaq2EFmQq9tWs5uoP3ZCvYYr045F27k7BBwqsjhPdCnaJ7mCH2MggGVAfm11Bl72zs2JOfnZT9Soxg97FKYNFyh2FRkK1nP4/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827526; c=relaxed/simple;
	bh=4t8NbsINpNM6drNqUUvmX+z/2Bau0sdeRnLycTjxyU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPeAAJdfGjIlPqqpIo7s12CjZdh3K4zuXWF3IOHYRhVHgjynqxBqP5+qfwqIoe7LTyJUEGvCsw9UD90hXu1/pQ9u4Y1w2jP964NOfSBXdvS0eHa6D0ivTRfH3nbeqEXFJQk4qvdLQKUkMzivtbGdqAvlmV4fnnGVyTmzZm30h3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=ebOALU6N; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="ebOALU6N"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecf0e07947so44026d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744827520; x=1745432320; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTtBLueY5bwgui78rPC30wk/ROsoLoNLC0+wzfuiQvA=;
        b=ebOALU6Nqxxx42nW010qJ3aIYKXd+zJEU0Bk8HflDajO0Z75DTkDT6MYBX4vn8K+xo
         Buv3uYcfb9GOLPVnLxC/4WL717BlxwA0qgTHI8sHDaLc6E4dy6tHMqBc6aj3HZX70EHh
         iXFUUqVdrsM03YHX7GGmwbwf5NPqRHXM7VLo9lr/LfHCnkrK9mII5FZ7EtZbN7ukLMja
         GzhCaIU4qtocTv4dkVinhYkQdWn3OKUqYLkGJuXy4MOEgCrCBpMvK40koMvecuoRJ936
         fRBxYI+dx6uQ0lxIjpe+pUbeo5o7N0gnite4fnemJT+nizfdzrHQ2vQuKjbztI6KQPur
         O4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744827520; x=1745432320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTtBLueY5bwgui78rPC30wk/ROsoLoNLC0+wzfuiQvA=;
        b=ukET4BqqY0SrUyBmc9+IvpiHg3LZhB1aEZktoSPOYffFnUnkGfiNIM/B5jUw9zHpKP
         +ZfSl3jkgHhr+ZxHqK4fBWzZIPO2eKaINczqQGmGjOlfZEpzn3nV9gld5CIdU9oQm3cz
         Z4sjvYJ7fPw/fA5hwXLJ3fBrUALAtU3QPGLjdsB21l1d4w8NQebZ1I3RvcOzJ4M+rzl4
         9XFPyln+v6Wh1nmyhFTa2TzuwcmJnDfFzDc4pe1ZeAMXGJePWuSbb8qQMH9OxTkholJR
         siJWM5LjBUACKqu851jdq6VTx4zBBEDIMNTMiOv0hgTBCxArKV/1G7lFwyLyXclMQabi
         AczA==
X-Forwarded-Encrypted: i=1; AJvYcCW67pkZsgWgDY6fqSZhrLOBuCZKZlchnLozY5fEtl62FwpKwYdjMb0Ys0HakGpSrFXJGGnlIdBfUjzCqRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4b0N8SWubSp8amcuVB6GnX+sdHhb4NVsc+umd5ADFI3u5FSWs
	9+hi2o5kfJGvNPYOZN+NAIcEtrhPauCD++RUeW18oxqlsPm2Z9FSa97kDybtbSE=
X-Gm-Gg: ASbGncvm2RoXVa6uYpupRq2M/dgBshoP0GuOAoNxmng3UE2zjMZmXKCJDVUkVIq+St+
	H/BjxNmvVHLoy29GqLoTUtelXW5WbSBK7nV05gtTKPNX/dz3x2Q3koCmOoHtI0Hg2+/0VDQeKQS
	16zYELM46NLiWNe5391ZPmgM6hb66/b7xCOj5HxQHOE2y4QgPuTFIgWk3uc9lb1fpq789uwyzL8
	ZX3txymSUCz7btYPQnsj5O3V5M2XKdbxKGtOyeOTy/CP71ym7odBHUdNstI/RRcwt0HohuU7tMY
	jKguCXLsbJ7/ERzrpEhNQgsFE+YvELBZpvRG+zs=
X-Google-Smtp-Source: AGHT+IH0qED+R09C6b7ocjI3EjgEpmYkEhrRRozeDgmmA7lPl24YxEoaAiknkftJ1gzVOeCdug812g==
X-Received: by 2002:a05:6214:b69:b0:6e4:540b:5352 with SMTP id 6a1803df08f44-6f2b9a20088mr8087586d6.16.1744827520320;
        Wed, 16 Apr 2025 11:18:40 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95f99bsm120292406d6.25.2025.04.16.11.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:18:39 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:18:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@redhat.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
Message-ID: <20250416181835.GA779666@cmpxchg.org>
References: <20250412085852.48524-1-21cnbao@gmail.com>
 <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
 <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>
 <20250416141531.GD741145@cmpxchg.org>
 <239cfe47-9826-402b-8008-de707faa160e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <239cfe47-9826-402b-8008-de707faa160e@redhat.com>

On Wed, Apr 16, 2025 at 05:59:12PM +0200, David Hildenbrand wrote:
> On 16.04.25 16:15, Johannes Weiner wrote:
> > On Wed, Apr 16, 2025 at 11:40:31AM +0200, David Hildenbrand wrote:
> >> On 16.04.25 11:38, Barry Song wrote:
> >>> On Wed, Apr 16, 2025 at 5:32 PM David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>> On 16.04.25 11:24, Barry Song wrote:
> >>>>> On Wed, Apr 16, 2025 at 4:32 PM David Hildenbrand <david@redhat.com> wrote:
> >>>>>>
> >>>>>> On 12.04.25 10:58, Barry Song wrote:
> >>>>>>> From: Barry Song <v-songbaohua@oppo.com>
> >>>>>>>
> >>>>>>> Promoting exclusive file folios of a dying process is unnecessary and
> >>>>>>> harmful. For example, while Firefox is killed and LibreOffice is
> >>>>>>> launched, activating Firefox's young file-backed folios makes it
> >>>>>>> harder to reclaim memory that LibreOffice doesn't use at all.
> >>>>>>
> >>>>>> Do we know when it is reasonable to promote any folios of a dying process?
> >>>>>>
> >>>>>
> >>>>> I don't know. It seems not reasonable at all. if one service crashes due to
> >>>>> SW bug, systemd will restart it immediately. this might be the case promoting
> >>>>> folios might be good. but it is really a bug of the service, not a normal case.
> >>>>>
> >>>>>> Assume you restart Firefox, would it really matter to promote them when
> >>>>>> unmapping? New Firefox would fault-in / touch the ones it really needs
> >>>>>> immediately afterwards?
> >>>>>
> >>>>> Usually users kill firefox to start other applications (users intend
> >>>>> to free memory
> >>>>> for new applications). For Android, an app might be killed because it has been
> >>>>> staying in the background inactively for a while.
> >>>>
> >>>>> On the other hand, even if users restart firefox immediately, their folios are
> >>>>> probably still in LRU to hit.
> >>>>
> >>>> Right, that's what I'm thinking.
> >>>>
> >>>> So I wonder if we could just say "the whole process is going down; even
> >>>> if we had some recency information, that could only affect some other
> >>>> process, where we would have to guess if it really matters".
> >>>>
> >>>> If the data is important, one would assume that another process would
> >>>> soon access it either way, and as you say, likely it will still be on
> >>>> the LRU to hit.
> >>>
> >>> I'll include this additional information in the v2 version of the patch since
> >>> you think it would be helpful.
> >>>
> >>> Regarding the exclusive flag - I'm wondering whether we actually need to
> >>> distinguish between exclusive and shared folios in this case. The current
> >>> patch uses the exclusive flag mainly to reduce controversy, but even for
> >>> shared folios: does the recency from a dying process matter? The
> >>> recency information only reflects the dying process's usage pattern, which
> >>> will soon be irrelevant.
> >>
> >> Exactly my thoughts. So if we can simplify -- ignore it completely --
> >> that would certainly be nice.
> > 
> > This doesn't sound right to me.
> > 
> > Remembering the accesses of an exiting task is very much the point of
> > this. Consider executables and shared libraries repeatedly referenced
> > by short-lived jobs, like shell scripts, compiles etc.
> 
> For these always-mmaped / never read/write files I tend to agree.
> 
> But, is it really a good indication whether a folio is exclusive to this 
> process or not?
>
> I mean, if a bash scripts executes the same executable repeatedly, but 
> never multiple copies at the same time, we would also not tracking the 
> access with this patch.
> 
> Similarly with an app that mmaps() a large data set (DB, VM, ML, ..) 
> exclusively. Re-starting the app would not track recency with this patch.
> 
> But I guess there is no right or wrong ...

Right, I'm more broadly objecting to the patch and its premise, but
thought the exclusive filtering would at least mitigate its downsides
somewhat. You raise good points that it's not as clear cut.

IMO this is too subtle and unpredictable for everybody else. The
kernel can't see the future, but access locality and recent use is a
proven predictor. We generally don't discard access information,
unless the user asks us to, and that's what the madvise calls are for.
