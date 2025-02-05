Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3D211A0C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723405; cv=none; b=KgtJKirbsB/UNNDw4v++bCg8puVcBearYX2YKeswHKZ9PTvnFTijll3KsZengTXLkuG0+/bhebhvax9vBZtZWr5puYAP8Oz+4COadUW1yX8euYCKhOXLa1wdFi/RtXsP9kAswBuNCtUmaDDcgFCXtBj88G6wa0sKNUY5TD42aDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723405; c=relaxed/simple;
	bh=NASyQf4OjOsLdXT6p0CJxsTqPKWQGG2LzhnWr0K/lik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvl5TM00PO9a8ZWZ5UoD+0MwfFQjJVRi2gKJuYVj0btfsjMcZASqIj30ahZBzq3gZfNoB11mtzV2gHrQ6+KYgsbDV3IA3LewF5uLIN4H3RD83T0xuJLqtetYBaaEeBa7qA5mhQYFQfuHMdupCW9djxYYh6/TP2MF2Y8uLKIV1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hh5cIfSW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hh5cIfSW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f0444b478so19801375ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 18:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738723403; x=1739328203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBrHPuVmyWNdWdsZVCF6A9XAzFkJOG30Q3Gn/3kEVpY=;
        b=hh5cIfSWB8HDWFHpJktLUFHKUWqkryfVkgYPSu9KzX6pl+eodLhVo9B6u66tHW0KaP
         Mxip0bQrvrkKECCYq0f5DN/SQfhhT/UI4lO06mnyYTgSwlcNXadTn5gNkew1gg+nleny
         zH8w8hG02rfbrECgHOz5sDv923PMnR/oGMnmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723403; x=1739328203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBrHPuVmyWNdWdsZVCF6A9XAzFkJOG30Q3Gn/3kEVpY=;
        b=YZNrpoKFmttwOLiQzQB8e4g+q8LK0nkkvAeDZH8mxY2RCLy4uC4sLMy8FCBcb2Oy9R
         FI97cvYyJk8KG0CELRqB5X9qsuh7wULNcX/9T72MS9+RTT9Mn8Q35h8eUV5ntPAcB/g+
         S3BbrqkQ6x7BsN+goUBdG4pHjrR8m9yogjDiwGlgeZN7cdliFYLjShB+GP7vgNcrDEGH
         PE1hnlwMZQqceDXwWP4kwaaGdGP116kNmgIq0Dg456FSyQZj4vkbLrfbsFVQL67oAus1
         +4QsOkXQCDh1T6HXLEhVFfls6fTseuv6iirw1OuEJQYoc8mQXOSBaJCKsytJAaLLbgAC
         S5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXM5eRWGWTkFljRtRDs4RofKEZBfpqnOHRAbwu5dlTVORBk0a+6MBIm24ByRtjDlrX7wHCF/+3cWv1L0CA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8neYw+j/mVmWSyNj/Fao0sUvJ+sXf6RN0CFthPx4p9GiBSt2
	EV+WKvgn4ye3cyluM/JlIddrvt+IKOmqvXY7acIj/qsONzlZiTb4RIPqbTkaxA==
X-Gm-Gg: ASbGnctkeRNSqNmT9z10Ajvcxya7HAKUMBulbvPlf16iZijVT/RWN3/H+TagRlo473J
	DkgqPnTIGNcp9Ma1iyb9gqQfSrD9Xl0ub6UNUyMY1JVas5UZN/QupUFIpd7O/dUOh0PcUfxs7ga
	qlKVWNIon3QXO4mt//LNOntffwfGtH0URUrX9wW/zkWR4bpoRmkknDNqeHUWl+zMTfxBWjvLFpl
	xxv8nwhMlYAHEvJQ78EK5XOweqfdrCyKyulmzufZU1AmgX45DvzQV8RUz965TubeHA/f8PszeX1
	MnK457RdgmnbJQihvSE=
X-Google-Smtp-Source: AGHT+IFWDIBI3L1G1wcU9fpNE+tjjiOnhkKSnDmkzKhD2iNyGiziKwAaNefN3LiNkKYbdp1TpT00YQ==
X-Received: by 2002:a17:902:cec5:b0:21f:456:3afc with SMTP id d9443c01a7336-21f17e74b85mr18678125ad.29.1738723402571;
        Tue, 04 Feb 2025 18:43:22 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:5d42:47ec:e16e:5797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f836csm103708655ad.93.2025.02.04.18.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:43:21 -0800 (PST)
Date: Wed, 5 Feb 2025 11:43:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6JMIKlO9U5P-5gE@google.com>

On (25/02/04 17:19), Yosry Ahmed wrote:
> > sizeof(struct zs_page) change is one thing.  Another thing is that
> > zspage->lock is taken from atomic sections, pretty much everywhere.
> > compaction/migration write-lock it under pool rwlock and class spinlock,
> > but both compaction and migration now EAGAIN if the lock is locked
> > already, so that is sorted out.
> > 
> > The remaining problem is map(), which takes zspage read-lock under pool
> > rwlock.  RFC series (which you hated with passion :P) converted all zsmalloc
> > into preemptible ones because of this - zspage->lock is a nested leaf-lock,
> > so it cannot schedule unless locks it's nested under permit it (needless to
> > say neither rwlock nor spinlock permit it).
> 
> Hmm, so we want the lock to be preemtible, but we don't want to use an
> existing preemtible lock because it may be held it from atomic context.
> 
> I think one problem here is that the lock you are introducing is a
> spinning lock but the lock holder can be preempted. This is why spinning
> locks do not allow preemption. Others waiting for the lock can spin
> waiting for a process that is scheduled out.
> 
> For example, the compaction/migration code could be sleeping holding the
> write lock, and a map() call would spin waiting for that sleeping task.

write-lock holders cannot sleep, that's the key part.

So the rules are:

1) writer cannot sleep
   - migration/compaction runs in atomic context and grabs
	 write-lock only from atomic context
   - write-locking function disables preemption before lock(), just to be
	 safe, and enables it after unlock()

2) writer does not spin waiting
   - that's why there is only write_try_lock function
	  - compaction and migration bail out when they cannot lock the
		zspage

3) readers can sleep and can spin waiting for a lock
   - other (even preempted) readers don't block new readers
   - writers don't sleep, they always unlock

> I wonder if there's a way to rework the locking instead to avoid the
> nesting. It seems like sometimes we lock the zspage with the pool lock
> held, sometimes with the class lock held, and sometimes with no lock
> held.
> 
> What are the rules here for acquiring the zspage lock?

Most of that code is not written by me, but I think the rule is to disable
"migration" be it via pool lock or class lock.

> Do we need to hold another lock just to make sure the zspage does not go
> away from under us?

Yes, the page cannot go away via "normal" path:
   zs_free(last object) -> zspage becomes empty -> free zspage

so when we have active mapping() it's only migration and compaction
that can free zspage (its content is migrated and so it becomes empty).

> Can we use RCU or something similar to do that instead?

Hmm, I don't know... zsmalloc is not "read-mostly", it's whatever data
patterns the clients have.   I suspect we'd need to synchronize RCU every
time a zspage is freed: zs_free() [this one is complicated], or migration,
or compaction?  Sounds like anti-pattern for RCU?
