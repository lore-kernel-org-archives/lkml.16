Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE0315687D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066844; cv=none; b=Hn4oCGGOuSasolxQAVoej4SFBeUWDR2W9URDs9b/nl65NeDqLKmPZ8OvFSj9GbzmLz3pk/ZRk1WK77spi7MIdpaf2uXtzFcZGvi1FkRsnc2lKefXLiudUY1DTqzYTMgw2HQiMS44U8Sa+9IqG4Svs0SGFkdh/bHU4rdZm6ctzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066844; c=relaxed/simple;
	bh=HP9vbFV3vUxCVx7bpkpzw8lFeSnABgzR0hDblww+07o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc2V+vqWA3cvkt9KdEDVRY02zo2bZFpD4Frxja/627yDvg6cqizXocgYe7I1MDTATZC2BafPcPrRWWu5OikeOwrlb7LUXzPqWKgSZYn2XQVb0fXlL3Q8/u3TaTsScqT6D6GbFdaGq/3uUAwK2xWjy2+lVT/Mq071QXYpVCzebvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=LvFT+oCQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="LvFT+oCQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so67701265ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 16:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1744066842; x=1744671642; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evNCUqWM/KE8Fgtxc4/OAJwDhlQwnWsjIDPeaW75aro=;
        b=LvFT+oCQtJqvfw+/J/gHlX+6435AsnhgR23GSoZtrDSLtPn63tDhjPcnwQEabUIEMZ
         8svriIETGCA9UopCOLtPyosT0NtclLGEYVuYDbQVbSKLKc+Ri0m7XGiDZigSVVZCEqCS
         VGkL/5FErEFO7Jl/KaurZjwsKXZrnnMxkd5tydWXobY58XgK0+F2IhoKPOXBtAPEFCpm
         vUOnrDkwJnwE/WRDbZRNiLWlHXJUS0mXEUzMTyvpjCcOfCnVOElwZmcO9To63dzbp7uB
         fU2tkZBH6tc8cAQuLyCLk28zx1jq54q+TEox9cONVnogCDJlCGU/h2vG8+TA7JgaZKPv
         axjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744066842; x=1744671642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evNCUqWM/KE8Fgtxc4/OAJwDhlQwnWsjIDPeaW75aro=;
        b=c6GaNb/r6AQyKY9gYdcctCbycHIaCzz+tPRa/yDTSN2Bof3XpluBgQzZrC68woV7V+
         Kbh8XdSzVpe02Ub4lvOb5nx11evGiqaOExhU7TgnIpsE46gav+SXVorKv33yXlShQbC6
         drO2FbAEKiat1krrz3RFaGv+LKfwj0UoB8DXpM0Fqer46zB1308tT7uC0amIANQsAvIc
         PJo2RjTKzJDcv5Qfk2RJmrpT7KASOT29jSjgBrQ3NsUpDlHXqNVUuGn97cqU7r34QHYu
         OImbH1jx1JFWdCaDK7pCqKkRZAwtnsNlgijpnRASSTZrZWj5ozkmdRg/gd8bFgaffRfW
         65rA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpCxiKqVugJf3ioA7A6vDFPz2ZJZvIidbNW1YtBLAeVUr19CberQiXkJPmGpTHCizgGVgSaBKlCnTUtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4wl7rqsvdPuD5ZuH6t9g5DKCf15OuK7bWXfVsfaLNkHEINWdV
	YMnyWQYobveT/5gpZcrCJKCYQh464gPuAxpKt4o0Pp82k7GZzpblTyUeuLJBHIQ=
X-Gm-Gg: ASbGnctsw76hkv5nmhurifoNhLoxG2RpJ/dxKUtNxFwNuIhcIbQHaMGJpr9VhRejiOq
	3cxZRlJO8Fdgp3FQ8Pyb6X0UmK5flJoMk7QtI6t794eugDBDgVtcK5aKTvFUBG12hdsLv8F+wrF
	/y1DAecvoWp7bu6nQs1us13gn/2MNuOJc63qSroaiBYHM7+Zorywtlu9XXAd1qo9djQNDU31uDM
	N6zcpY8EFbHnYwkl9+DrC04fKyKL6c4aQDSd8ik7S6DGU0cfjraF9Lp1xBk0HWMQS8kYns4UfA+
	AvV6xMwrI+SxDDLuRUqZfTVTVB5YWgpWKroyOuAU+pQXIk/t4TLasgFYuzFDRwHKd/sgjQFh5Da
	k9TilpsOZCVHLcjukLg==
X-Google-Smtp-Source: AGHT+IGnjTVKROKhiUbKxR04fwQFtAP05Upi/1tbtxnH3zXCfd/7yJ0o+NE/GXDeWDfof5DG3+Gjjg==
X-Received: by 2002:a17:903:22c2:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22a955738c0mr177726185ad.41.1744066841870;
        Mon, 07 Apr 2025 16:00:41 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e0b4sm87525135ad.154.2025.04.07.16.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:00:41 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1u1vSI-00000005pxh-0x3i;
	Tue, 08 Apr 2025 09:00:38 +1000
Date: Tue, 8 Apr 2025 09:00:38 +1000
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Matt Fleming <matt@readmodwrite.com>, adilger.kernel@dilger.ca,
	akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, luka.2016.cs@gmail.com, tytso@mit.edu,
	Barry Song <baohua@kernel.org>, kernel-team@cloudflare.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>
Subject: Re: Potential Linux Crash: WARNING in ext4_dirty_folio in Linux
 kernel v6.13-rc5
Message-ID: <Z_RZFrlPArdj9d-5@dread.disaster.area>
References: <Z8kvDz70Wjh5By7c@casper.infradead.org>
 <20250326105914.3803197-1-matt@readmodwrite.com>
 <CAENh_SSbkoa3srjkAMmJuf-iTFxHOtwESHoXiPAu6bO7MLOkDA@mail.gmail.com>
 <Z-7BengoC1j6WQBE@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-7BengoC1j6WQBE@casper.infradead.org>

On Thu, Apr 03, 2025 at 06:12:26PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 03, 2025 at 01:29:44PM +0100, Matt Fleming wrote:
> > On Wed, Mar 26, 2025 at 10:59 AM Matt Fleming <matt@readmodwrite.com> wrote:
> > >
> > > Hi there,
> > >
> > > I'm also seeing this PF_MEMALLOC WARN triggered from kswapd in 6.12.19.
> > >
> > > Does overlayfs need some kind of background inode reclaim support?
> > 
> > Hey everyone, I know there was some off-list discussion last week at
> > LSFMM, but I don't think a definite solution has been proposed for the
> > below stacktrace.
> 
> Hi Matt,
> 
> We did have a substantial discussion at LSFMM and we just had another
> discussion on the ext4 call.  I'm going to try to summarise those
> discussions here, and people can jump in to correct me (I'm not really
> an expert on this part of MM-FS interaction).
> 
> At LSFMM, we came up with a solution that doesn't work, so let's start
> with ideas that don't work:
> 
>  - Allow PF_MEMALLOC to dip into the atomic reserves.  With large block
>    devices, we might end up doing emergency high-order allocations, and
>    that makes everybody nervous
>  - Only allow inode reclaim from kswapd and not from direct reclaim.

That's what GFP_NOFS does. We already rely on kswapd to do inode
reclaim rather than direct reclaim when filesystem cache pressure
is driving memory reclaim...

>    Your stack trace here is from kswapd, so obviously that doesn't work.
>  - Allow ->evict_inode to return an error.  At this point the inode has
>    been taken off the lists which means that somebody else may have
>    started to start constructing it again, and we can't just put it back
>    on the lists.

No. When ->evict_inode is called, the inode hasn't been taken off
the inode hash list. Hence the inode can still be found
via cache lookups whilst evict_inode() is running. However, the
inode will have I_FREEING set, so lookups will call
wait_on_freeing_inode() before retrying the lookup. They will
get woken by the inode_wake_up_bit() call in evict() that happens
after ->evict_inode returns, so I_FREEING is what provides
->evict_inode serialisation against new lookups trying to recreate
the inode whilst it is being torn down.

IOWs, nothing should be reconstructing the inode whilst evict() is
tearing it down because it can still be found in the inode hash.

> Jan explained that _usually_ the reclaim path is not the last
> holder of a reference to the inode.  What's happening here is that
> we've lost a race where the dentry is being turned negative by
> somebody else at the same time, and usually they'd have the last
> reference and call evict.  But if the shrinker has the last
> reference, it has to do the eviction.
> 
> Jan does not think that Overlayfs is a factor here.  It may change
> the timing somewhat but should not make the race wider (nor
> narrower).
> 
> Ideas still on the table:
> 
>  - Convert all filesystems to use the XFS inode management scheme.
>  Nobody is thrilled by this large amount of work.

There is no need to do that.

>  - Find a simpler version of the XFS scheme to implement for other
>    filesystems.

If we push the last half of evict_inode() out to the background
thread (i.e. go async before remove_inode_hash() is called), then
new lookups will still serialise on the inode hash due to I_FREEING
being set. i.e. Problems only arise if the inode is removed from
lookup visibility whilst they still have cleanup work pending.

e.g. have the filesystem provide a ->evict_inode_async() method
that either completes inode eviction directly or punts it to a
workqueue where it does the work and then completes inode eviction.
As long as all this work is done whilst the inode is marked
I_FREEING and is present in the inode hash, then new lookups will
serialise on the eviction work regardless of how it is scheduled.

It is likely we could simplify the XFS code by converting it over to
a mechanism like this, rather than playing the long-standing "defer
everything to background threads from ->destroy_inode()" game that
we current do.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
