Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDF24EA8F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899426; cv=none; b=nScuyTJQDby0pqqofL2fUn+w7/d9cLwEK1H/z/AlJNs777SDsQL4HA+h+NMlEMDW7vVhawdbMVPEW5vxlSIvPQ4nwMNQb5wUGSXv6fuDPLdD/AuEfbnTzRxWsmr8xf0/uaftlfWn/yNG1OYkS6rxzbccSJOGtRnwYsrBCQuYGrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899426; c=relaxed/simple;
	bh=a64gshPWWhOwjOKa915Cw0aYEAALOqOcg2/r5aEPVJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NexdLsHbqlFs5OhYcCkFQxF8JPb/cR3Ak26u3GchxpQ5GIX9jCFVmxqRCPcBvLvvg1nPvdiHjsUtfovDYiWi5RuHUpzblYQwIa6Zl6q0xwo9qhOjR9SLNPb6uap8E5PzgDEiN3ZjT8cvAVFlwUR2W9bF/WmJhcJsubAPj3qaLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=CrCOn3sQ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="CrCOn3sQ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c08fc20194so162778285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744899421; x=1745504221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5Z+jFrsEZYauqf2UDP7iW96mFFSs7QxQkpgBFa1b9E=;
        b=CrCOn3sQrBGdwt/PvrfO5MDSzg0foXCEshRD6Mx9LSzjdk+vNLD2UeKDerhwh3o41X
         yVK0K797clGSsk0BQbLApHx60vkp83/ynuUDgEQRX6aypS2ZmEtYQ3v2BanVbH9kODSe
         c4nuNQtcDjXjvelasGEasctVhRyAyTpgm6xd2FN4lXcZh5U6Wn14es1H13GJRZYa3Ttl
         bSUhGrX8r7+jW/5DWeSDUEiLhhZQ/Z5qbejFphLeaeTD9gyJZnZR922tjmk3qaEkaP7V
         JVqlukP9NhZFrImTT7udlaMNRveYaJIKwmQPgun0JCEev5oYLu80xyayD9cKXDTWzgak
         4Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899421; x=1745504221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5Z+jFrsEZYauqf2UDP7iW96mFFSs7QxQkpgBFa1b9E=;
        b=QAxF3GIK0xY11rx0GrVQul1SOW23KKvDhIQgOhYdLYCi1Kh89UE8jZLW8BbtuekrLt
         AoWSJKH9w/SzyP5monyQH+4/ND0firbbvZ4Zl3EmjjxrsCOIUEDsTFIU9sB/gnsGHDwR
         anRmp7aQjX+s1I9xVkHi3FuJncybAP4GxXBQlIfqmC5j50gJWCAkQ/zJKwjSDoYruRDR
         3J4xp7aA4pue0tUsBP9PMhvuqgANHyK+6+b1LK/LPyrx8E5MpfNSeqSZot5kXH77QIoa
         ILm9agufT8nFMnupi9vi4xB2mXmZZTMO7Aepb426et3KbDqRJLQ224f8uJkGtHTZq1VN
         ZxBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIm4M6uCWfL/FbaFUMxJWH7zl/DaNiM68Q553xrM/xcBrwMk83Sy3VtCki0c0BQOLt9vne3uB5xglA9ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4mywGW4iM/CAmsYpESHfpFJW69W2hGd/FDewRZ4XwX1azSNfv
	QaRrkDgedJdtXzJqQ0yYFhh7IOcUsVoTTphbJgeTjknrxEO3TZgnzTJ14TW4ppQ=
X-Gm-Gg: ASbGncuH+gVOPOULPKq6VE0k3L0cVzTkKSG3aFT9ofOiloTVu6k+4R2oGncO86m5xJs
	3pBchbnbeIsa3zH7W0lImPaFNdW7zaYWauv+OuT/1XJ5/IFFIhdoB+hNjy2+hFKCRseAz6qemq4
	kHJpLqnTIDqZkTB3Awl8yhsdgWmWshdCGi0LSGyRn8MisAhz7WCzXFNdpCRoy6VIr81jF52A2jS
	PnnUK6EtlKgL9dWt0R8gKSS3+WMvCIBePSfsYLssvG/rzAxt/CFNQh4uTcMTIaPhnHDRbRJ4E55
	oT0sJn3fOXSme2wc/aFtGq0rXyGSQj/O2VCICYA=
X-Google-Smtp-Source: AGHT+IGrim4bG1Pc8I6KbNzK+iZV2WObMQXVFH8kiCuOPzryfppEkmVM8VAI/OgqYkDVZLRXHC5MHw==
X-Received: by 2002:a05:620a:4045:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c9190048f7mr835173685a.29.1744899421514;
        Thu, 17 Apr 2025 07:17:01 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8943af1sm1196443985a.6.2025.04.17.07.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:17:00 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:16:56 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-ID: <20250417141656.GC780688@cmpxchg.org>
References: <20250416120912.GC741145@cmpxchg.org>
 <1744834223790.7.2308@webmail-backend-production-58ff969799-kbd7f>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1744834223790.7.2308@webmail-backend-production-58ff969799-kbd7f>

On Wed, Apr 16, 2025 at 10:10:23PM +0200, Vitaly wrote:
> 
> On Wednesday, April 16, 2025 at 2:09:12 pm +02:00, Johannes Weiner <hannes@cmpxchg.org> wrote:
> 
> >> zblock is also in most cases superior to zsmalloc with regard to
> >> average performance and worst execution times, thus allowing for better
> >> response time and real-time characteristics of the whole system.
> 
> >> Is there a reason not to use this allocation scheme in zsmalloc then?
> 
> Introducing such a scheme in zsmalloc is theoretically possible but
> it appears to be more complicated than implementing it from scratch,
> which is exactly what was done.

Sure, but having two options adds sizable complexity as well.

> > I'm curious what others think, but I'm still not convinced a second
> > allocator makes sense. It's maintenance overhead, a permanent struggle
> > to match feature parity, and it fragments development and testing base.
> 
> > Not long ago several slab allocators were removed for those
> > reasons. Likewise, we just deleted zbud and z3fold because they didn't
> > get any attention and bitrotted, but not before years of inflicting
> > pain through the zpool interface, users accidentally making very
> > suboptimal choices, reporting the same bugs over and over again etc.
> 
> I'm not sure what pain you are talking about.

I list them in the paragraph you're replying to, and I've previously
outlined the burden on developers, maintainers, and admins to support
multiple implementations of the same functionality.

There is a real cost to doing this that you seem to dismiss.

> There were reasons why z3fold and zbud existed. z3fold and zbud were
> the ones that supported page reclaim, zsmalloc wasn't quite usable
> with zswap until recently. When we did z3fold it was outperforming
> zsmalloc.

We see a higher compression ratio than 3 on a wide variety of
workloads, so I'm a little doubtful z3fold ever outperformed zsmalloc
in general-purpose environments.

When Meta started using zswap, certainly zsmalloc was the only real
contender. zbud's storage density was almost not worth the cost of
compression. z3fold was also not dense enough, and we ran into
stability issues and crashes. The page reclaim/writeback
implementation was not very useful either - take a look at the history
of changes from Nhat and Domenico. These weren't just issues specific
to our usecases, but much more blatant "how was this ever supposed to
work?" problems.

There is nothing wrong with the evolution from zbud to more
sophisticated allocators. But there is a pretty mature and
feature-rich allocator now, and that sets a floor on what new
allocators need to support to be considered general-purpose.

> With that said, I didn't object to removing z3fold because I did
> understand that it made no sense to keep it at that point.

But you're proposing to do the same thing again, when multiple people
just got done phasing out and cleaning up your previous experiments.

> > I also don't buy the fragmentation argument. Even if you are better at
> > packing during allocation time (although, citation needed), the
> > workload can unmap swap pages such that they leave partial blocks
> > behind indefinitely if you don't have block compaction.
> 
> We published Zswap/Zswapped values for zblock/zsmalloc after stress
> loads and those were on par, basically.

Those are accounted in zswap, so unfortunately don't capture backend
fragmentation. You'd need to implement some of the debugging features
and memory counters that zsmalloc has in order to compare them.

> > Then there is the migration support, which you said is planned, but
> > which would presumably require the same indirection between handle and
> > the backing pages that zsmalloc has. How much will this eat into the
> > performance advantage?
> 
> I don't think that will be necessary. We're working on supporting
> GFP_MOVABLE and minimising high order allocations

> > I'd much rather you'd focus on making zsmalloc better. Improve the
> > packing scheme, make expensive features optional/configurable etc.
> > That would be easier on developers and users alike.
> 
> zblock's source code is almost 5x smaller in size than zsmalloc's

It's an apple-to-oranges comparison.

zsmalloc has memory pressure handling and a rich debugging
infrastructure that was added over time based on what people thought
necessary and useful from production experience.

Implement the same functionality in zblock and we can compare lines
and performance.

> and yet zblock works better in many cases with just a few
> bottlenecks. Why would you mind that we'd focus on making zblock
> better instead and possibly retire zsmalloc when that mission is
> accomplished, just like we retired z3fold a while ago?

You're proposing a significant, open-ended maintenance burden for
everybody else. I'm just asking for some justification stronger than
"the small subset of the backend allocator that we implemented is
slightly faster in a limited number of benchmarks."

The fact that zstd - a very commonly used compressor - immediately
surfaced bugs that made it *much slower* is not reassuring.

The freelist issues that came up suggest strongly that you haven't
looked too closely at zsmalloc and actually tried to find out why it
does things the way it does. Which in turn suggests to me that this is
not going to be the only cornercase lesson that zblock will go through
for things that have been addressed in zsmalloc a long time ago.

All new research is expected to address prior work in its space. A new
allocator should at least come with some analysis of where exactly the
current allocator is flawed and why fixing that would likely amount to
an entire rewrite anyway. Or be a more realistic drop-in replacement
for the existing allocator already.

Making incremental improvements is the default. Forking needs a very
good reason.
