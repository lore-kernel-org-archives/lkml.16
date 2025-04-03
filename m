Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62E2CA6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672900; cv=none; b=LiO9pCGfeox1yCBeogh6dWzFL+LXlytDLtUdTXdbXLPCwk8BEV/+/QMlHpDJukYjv+FzflF3RhnDR47ta2hPX6sPWzTwjiFwjvuPncUbgOdo04FySFc4lQZM0dZ3gf7orizIgiN++J/UDOYOZk6Jx9d68NFMyhbNRzibk3mw5q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672900; c=relaxed/simple;
	bh=M3WcYYD7LnrQvTpeEMmAJyBDYGPnN0nKM240ijYqAck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odeTg2W/kWxUiiTLJT6IlRFMiU10NNhHB5wAlXt4M3Q4nooINPakPUfL19QkQJrVgDtSbtTz4inafbcHV5MAOhLyGnP+n+6eiIMa0fcTus15aTTJHjccq9k5POcvevOW38qrsE62hWER7mN/k+v1+aXDdfGDN/BXTjcMpoBYyaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DT25t9J2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DT25t9J2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso461219f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743672897; x=1744277697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMeCoN/RhZ8jOp+O4JDSy5qYra30WcgtCJQCPx5bS/E=;
        b=DT25t9J2zWEeb24GOEF4mQHkpeiP2ia2UYcQLlJE/ng2KwRvlAcUWOuYW1LKbPcj80
         In1N9a5rkr7/IV1FyGnmOYndY+RnZUZoeoYeRGieqXsOAIAzhvVTYXqV1KVosT/46o/G
         uYktUhFsdWSGRfwftS5rGw/pHsw9Di/vZbvy/09VOiZqimInxWTNJVo4q8O19uJyGe49
         SyvobBhLHn2mXUcqQkmBLDICU8w8H+PSfKeZrsCzn2TsWO8ZNuJ3AbOhm/4UwBRbJGif
         4hqv31qLswT51bBz5rd0G9VPXhLdRoI5bLBxnu/V4BHQ0jCiKt2mufzu9jCh0oAN+Zcj
         OsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672897; x=1744277697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMeCoN/RhZ8jOp+O4JDSy5qYra30WcgtCJQCPx5bS/E=;
        b=a4GfilBaCRGFqtx2vlWGbVe2MAAIzcFcxdaRqICvJqifpxRSIPnwNmap7UvHpdusjR
         M2gKnWUCfJg50cI3Z9N/AMKnwaIjV/+jGw2p5KHIb3j8zGscCRavpm/1eWMiY7wlglEI
         6Zs/hTBSK0XfZJT7DqqHtbTcsFzotlJgL6Ij7kBSSxPDjWnN1dJxXxL0DpH6WNQfNgXS
         MWmmPDFHIiXcAp/ib3KgePnztATts5ha0GXlzkp5X6kwK2tmkt5ZJBrbXpEprZZUSNHE
         HZmRQRA/RhGjO1Pjl4oB7uwbSP9ym/jLEMVnZKNIk48dX53PM6jV9fRwV6ngpPU/xhFk
         Dt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLH0aWpoXfD7wMJp9zzxD/RZJhmL1BxcEklrEBu2ddf5TxHBEUAAHlwjVRCMTzhlQkpzNZUhhMWAHcf9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9X++oAGVP1S84oMKbMMAKwV+gwsy/4Zb7J/bPEbK2nZwsbFw
	eIhjLe0BbtC6X5XwhRuWV2d7tzXAofZtasiLTzlqkAcAu4p43ZwZ50Pbh0B/d0U=
X-Gm-Gg: ASbGncsAJgQ0BHFIdAbvlPHdkgUdPXa5RzUoLkkG7WJZdMHcNCvvwgyuvpeUV98FxXZ
	9isRPxTCUemzb0sWkwj70P8U1GzFufl/iuJ+WbII3cAr9vOcBD11pCLrEVddowvPAM2hO8STQz+
	lj/CT8Oo7animoZ6A/TbwnMwp0V6lkIUcaJGTq/JLWro4jrbcnrUIer2QqR+q/I3YmAudpQg7Zg
	haVngEtvu7BzyG4EXEuLNmFdWfjllzJ2tPcY36mOM7BWfkX9zQUMQBMOicTHf/BGy3OVgs5AkjP
	apLkDQ7Ils0zHliWQvPp7EkVaZkOrVMbMxdrYGk5GTmO
X-Google-Smtp-Source: AGHT+IE8pgz/yuIBBRXF6pVidfIvRKUBHFYftHXpS3z4XbIu4Wq8I3K57nAdtcEmcMreVUqP4n80Vw==
X-Received: by 2002:a05:6000:1889:b0:39c:11a1:21d6 with SMTP id ffacd0b85a97d-39c2e62276amr2071416f8f.17.1743672896836;
        Thu, 03 Apr 2025 02:34:56 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d64dsm1288071f8f.70.2025.04.03.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 02:34:56 -0700 (PDT)
Date: Thu, 3 Apr 2025 11:34:54 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <Z-5VvJsjrRN_lFSt@pathway.suse.cz>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
 <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
 <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>

On Wed 2025-04-02 12:10:08, Linus Torvalds wrote:
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

I agree that links to the threads where the discussion
happened might be more useful.

I personally use the link (added by b4 am -l) when doing
a code archeology. It often points to a whole patchset with
a cover leter. And it sometimes help to understand
the missing context.

Google is a good alternative. But the link is faster
and reliable.

Of course, the best situation is when the commit message
is good enough and the link is not needed. Which reminds
me that anything which triggered a useful discussion should
be explained in the commit message. I need to care more
about this.

Best Regards,
Petr

PS: The #pragma was discussed in v1 thread, see
    https://lore.kernel.org/r/87iko2ear3.fsf@prevas.dk
    
