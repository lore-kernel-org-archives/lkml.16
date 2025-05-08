Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923FE4C76
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 00:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746662529; cv=none; b=mVC/iIbdXhXLb09fjL/lGreF1bKtiibrYmT2PJKdBWofGGEOdb7QOrLd49pnhuIodaKdbzH13mtbiIsFkonLjLz/y/A7/0vS/Z1yLMQ7o+XoqdUIYeTDUMZFoQDyUPEdsxAvwBpXNhx8SwK15sfofD9PUnE1nZm1uQMIsghODNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746662529; c=relaxed/simple;
	bh=kGwI1OXkSDBccQxawDbhO6ZxDpa5aIc51NK9HIUzfw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxaZcQNc5tL2c0r7MsCM63MAIStmpsMniGKX55kBuchI63LWCi8/OxHs1dqi9k1MkrHnlVIMnpXrLuoLe+Wi+i6of4eWpAxdJ2nUpTctbD6cMIBveT1q1kCp/Bou5YPWZ32tN/cr7GAgzxH1PmV47oTjzNkyZp7HJiN49pqA5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k6ccbOhD; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k6ccbOhD"
Date: Wed, 7 May 2025 20:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746662521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKAtqXzVTLH8wPvJLES2aUCAeeyN4Lo1bqm+iZNm+TQ=;
	b=k6ccbOhDSului3wVk45CKX2d5nPbGxOU/HxjeZ2RAG6ZVtQqJoxdMFrLGJ2fF/5BI+U6dv
	/e5fM1gToFZZtWdIfkHiJRE8YN9Ro6vnocB7YgBl75BNyBt0CfJPGjLJYrUF8Tf1H9BHcQ
	llMjvJjUdbrGWQ5OAaNeMt6EnNWyKrM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: David Wang <00107082@163.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
Message-ID: <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
References: <20250507175500.204569-1-00107082@163.com>
 <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, May 07, 2025 at 11:42:56PM +0000, Suren Baghdasaryan wrote:
> On Wed, May 7, 2025 at 6:19 PM David Wang <00107082@163.com> wrote:
> >
> > Hi,
> > Just want to share how I notice those memory allocation behaivors: the cumulative counters~!
> >
> > With cumulative counters, I can identify which module keeps alloc/free memory, by the ratio between
> >  cumulative calls and remaining calls, and maybe an optimization could be applied.
> > Following is top16 I got on my system:
> >
> > +-----------------------------------------+-------+------------------+--------------------+
> > |                  alloc                  | calls | cumulative calls |       ratio        |
> > +-----------------------------------------+-------+------------------+--------------------+
> > |            fs/seq_file.c:584            |   2   |     18064825     |     9032412.5      |
> > |             fs/seq_file.c:38            |   5   |     18148288     |     3629657.6      |
> > |             fs/seq_file.c:63            |   15  |     18153271     | 1210218.0666666667 |
> > |          net/core/skbuff.c:577          |   9   |     10679975     | 1186663.888888889  |
> > |          net/core/skbuff.c:658          |   21  |     11013437     |  524449.380952381  |
> > |             fs/select.c:168             |   7   |     2831226      | 404460.85714285716 |
> > |            lib/alloc_tag.c:51           |   1   |      340649      |      340649.0      |  <--- Here I started
> > |           kernel/signal.c:455           |   1   |      300730      |      300730.0      |
> > | fs/notify/inotify/inotify_fsnotify.c:96 |   1   |      249831      |      249831.0      |
> > |            fs/ext4/dir.c:675            |   3   |      519734      | 173244.66666666666 |
> > |       drivers/usb/host/xhci.c:1555      |   4   |      126402      |      31600.5       |
> > |              fs/locks.c:275             |   36  |      986957      | 27415.472222222223 |
> > |           fs/proc/inode.c:502           |   3   |      63753       |      21251.0       |
> > |              fs/pipe.c:125              |  123  |     2143378      | 17425.837398373984 |
> > |            net/core/scm.c:84            |   3   |      43267       | 14422.333333333334 |
> > |         fs/kernel_read_file.c:80        |   2   |      26910       |      13455.0       |
> > +-----------------------------------------+-------+------------------+--------------------+
> >
> > I think this is another "good" usage for cumulative counters: if a module just keeps alloc/free memory,
> > maybe it is good to move the memory alloc/free to somewhere less frequent.
> >
> > In the case of this patch, a memory allocation for each read-calls, can be moved to opan-calls.
> >
> > If interested, I can re-send the patch for cumulative counters for further discussions.
> 
> Yeah, my issue with cumulative counters is that while they might be
> useful for some analyses, most usecases would probably not benefit
> from them while sharing the performance overhead. OTOH making it
> optional with a separate CONFIG that affects the content of the
> /proc/allocinfo seems like a bad idea to me. Userspace parsers now
> would have to check not only the file version but also whether this
> kernel config is enabled, or handle a possibility of an additional
> column in the output. Does not seem like a good solution to me.

Yeah, I don't see much benefit for cumulative counters over just running
a profiler.

Running a profiler is always the first thing you should do when you care
about CPU usage, that's always the thing that will give you the best
overall picture. If memory allocations are an issue, they'll show up
there.

But generally they're not, because slub is _really damn fast_. People
generally worry about memory allocation overhead a bit too much.

(Memory _layout_, otoh, avoid pointer chasing - that's always worth
worrying about, but cumulative counters won't show you that).
