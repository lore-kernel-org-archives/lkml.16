Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288C275B1D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816956; cv=none; b=hrg06jRXOpPo81hpLVh/Q5Kfs+NQKDiOV9HEPTuuEonkcLz8q/rZPr+3BqCnhGHgAHH9vPXnvBAgfZDdUTQITQ9ur47I1J9QI6/rvgfLZIM1/kXw3w36VoYvS7TIr9ZJkX6TCKY4dVeD1ZaFxC4v6KbzHBDv+XFMREDQWNeul74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816956; c=relaxed/simple;
	bh=BJ11s9pRdhe85oZrgviwyD/bBqyGZbl5ISnhBqENcvY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VqXrZhMOskD6rqQUzOcGAfCyCsc+Z625ijfGTKlq7UxTn2kiBsM4F0X9QvmirkPVL/Ot3oXRII/+4C8VNrMxeiwYc+AaFxdVI/Ipz1hddl7eM/oLTly+rwnh3MgtWADW5i/Loi+a9wNBTqDew5hE/kg+veRugXS0q7mFYUQFV98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 6AC841D3317;
	Fri, 13 Jun 2025 12:15:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 97F7B2000E;
	Fri, 13 Jun 2025 12:15:51 +0000 (UTC)
Date: Fri, 13 Jun 2025 08:17:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-erofs@lists.ozlabs.org, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Subject: Re: Unused trace event in erofs
Message-ID: <20250613081728.6212a554@gandalf.local.home>
In-Reply-To: <0baf3fa2-ed77-4748-b5ee-286ce798c959@linux.alibaba.com>
References: <20250612224906.15000244@batman.local.home>
	<0baf3fa2-ed77-4748-b5ee-286ce798c959@linux.alibaba.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 97F7B2000E
X-Stat-Signature: infzwy15dda57cgcg4d9ditmeebzkrft
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18BtDgKuXNZPoYBnFNGThqX5YGBtgfzf9o=
X-HE-Tag: 1749816951-862733
X-HE-Meta: U2FsdGVkX195zLSu+DbhYIomwGRc115YpbM2ycknmYQf2F2pGL3U8iMbkxESzO1a7e1SbWMLyeZUWsDn0+MwpfMm1VYAGVFkOGA5/0F+ZULmLOgJg6at3Pq9PTU+6HoN6Oex5p2OqUhC6tN5pyzbr5wJ8FHCNQVZQwhecbTK/s4NCZOHHD0Ya+pRdqKyIIPbYa/ojOfUFsIDt1UTwygssTgnXqGnOotPzYKO6urya1NQm4hSerex9xZqz2cCXu3Z6qygVLplU0VspUcQCoojYiWXlkM0hXc+tDg/ke4KyWpJL1U7tn9o1nOoH6kEbH/rjPoY/QCgz5/6QTutImtz/gPwSEx2bAuX

On Fri, 13 Jun 2025 14:08:32 +0800
Gao Xiang <hsiangkao@linux.alibaba.com> wrote:

> Hi Steven,
> 
> On 2025/6/13 10:49, Steven Rostedt wrote:
> > I have code that will trigger a warning if a trace event is defined but
> > not used[1]. It gives a list of unused events. Here's what I have for
> > erofs:
> > 
> > warning: tracepoint 'erofs_destroy_inode' is unused.  
> 
> I'm fine to remove it, also I wonder if it's possible to disable
> erofs tracepoints (rather than disable all tracepoints) in some
> embedded use cases because erofs tracepoints might not be useful for
> them and it can save memory (and .ko size) as you said below.

You can add #ifdef around them.

Note, the "up to around 5K" means it can add up to that much depending on
what you have configured. The TRACE_EVENT() macro (and more specifically
the DECLARE_EVENT_CLASS() which TRACE_EVENT() has), is where all the bloat
is. I generates unique code for each trace event that prints it, parses it,
records it, the event fields, and has code specific for perf, ftrace and BPF.

The DEFINE_EVENT() which can be used to make several events that are
similar use the same DECLARE_EVENT_CLASS() only takes up around 250 bytes.
One reason I tell people to use DECLARE_EVENT_CLASS() when you have similar events.

There's also a DEFINE_EVENT_PRINT() that can use an existing
DECLARE_EVENT_CLASS() but update the "printk" section. That adds some more
code (the creation of the print function) but still much smaller than the
DECLARE_EVENT_CLASS(). But this requires the tracepoint function (what the
code calls) must have the same prototype.

> 
> > 
> > Each trace event can take up to around 5K in memory regardless if they
> > are used or not. Soon there will be warnings when they are defined but
> > not used. Please remove any unused trace event or at least hide it
> > under an #ifdef if they are used within configs. I'm planning on adding
> > these warning in the next merge window.  
> 
> If you don't have some interest to submit a removal patch, I will post
> a patch later.

Please make the patch. There's too many for me to do them all.

Thanks!

-- Steve
