Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC732DFA4B;
	Wed, 16 Apr 2025 04:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744776133; cv=none; b=SCTWOiinomo2ZGeWrOfnnPmBOj9/92p72hpJBRFOhQqOBd7qs9mv9bX1rfYU2kW3I0FkWlW6/XuFxYwrL5LUsNDa8B9F4X1pwfA3g/jJy/efZvUG96HZAaUf0IY7tsEuKI9cwuLCUH6CtqQ6eZWekvLoLnrTqZ/c0/QTX27zygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744776133; c=relaxed/simple;
	bh=yKu3+0W5p/giE32i5CggvyTCCB+2AuwXMDnAiewOH40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9K++vjciu9VqGStrvHEq1e4F4XtQq01kcAW3ceMZhW1dXUBffqCbSj18ZfOG7BtRfrmjo1K2gPWZJn8Sg4R367dxnIw/Ha0GTK2OzQUQ5kHAmet2R8G07YiBQcGb9T90n3hdFTYeWSeyMhz6ht6Yd21h+EkvrSwYIf91a9gDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAvaujJG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAvaujJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE22EC4CEE2;
	Wed, 16 Apr 2025 04:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744776132;
	bh=yKu3+0W5p/giE32i5CggvyTCCB+2AuwXMDnAiewOH40=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=fAvaujJGwORcwP7R6qBeHYKxI0ASWsvESDJuXp04DKyftuObqkCRUd51LEJBRL/rm
	 kPS7zO6IQe7M5Yj6AzY4fz9ShSN7jfkoFs3JGVT0/9iO3BL0Q7PHq3wPdJZ510CuKd
	 NhWXuo4YpPzvKT2gAqn2ogS9KKmjmQVO0Rmm+XHkQ1t3bIOBaUlHYBxyhnUyW51FMq
	 xZjq9toDxXpkes6r/ITlEPZeZrA1pPs3hlGHpnbBT70A3lS9Nvv2KXcH9ulkv9rRjq
	 crqS8wgHZ78toHrWG7HVuC8kaS6yuMLNIywQEf/SldSpxdXR0BwfN84VAvycDqJ7Vo
	 iUYV9qqTfdK2A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7A5B3CE06FE; Tue, 15 Apr 2025 21:02:12 -0700 (PDT)
Date: Tue, 15 Apr 2025 21:02:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	linux-mm@kvack.org, Ye Liu <liuye@kylinos.cn>,
	Omar Sandoval <osandov@osandov.com>
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a given
 PID and VADDR
Message-ID: <7e45afc8-dde0-481a-b0bf-0237f551ebe0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250415075024.248232-1-ye.liu@linux.dev>
 <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
 <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
 <098e977c-55cd-498b-bd36-725333c06210@dorminy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <098e977c-55cd-498b-bd36-725333c06210@dorminy.me>

On Tue, Apr 15, 2025 at 11:28:41PM -0400, Sweet Tea Dorminy wrote:
> 
> 
> On 4/15/25 10:46 PM, Ye Liu wrote:
> > 
> > 在 2025/4/16 10:14, Andrew Morton 写道:
> > > On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> > > 
> > > > From: Ye Liu <liuye@kylinos.cn>
> > > > 
> > > > Introduces a new drgn script, `show_page_info.py`, which allows users
> > > > to analyze the state of a page given a process ID (PID) and a virtual
> > > > address (VADDR). This can help kernel developers or debuggers easily
> > > > inspect page-related information in a live kernel or vmcore.
> > > > 
> > > > The script extracts information such as the page flags, mapping, and
> > > > other metadata relevant to diagnosing memory issues.
> > > > 
> > > > Currently, there is no specific maintainer entry for `tools/drgn/` in the
> > > > MAINTAINERS file. Therefore, this patch is sent to the general kernel and
> > > > tools mailing lists for review.
> > > Help.  My copy of linux has no tools/drgn/
> > I noticed that the current upstream Linux tree doesn't contain a
> > `tools/drgn/` directory.
> > 
> > I'm interested in contributing a drgn script tool as well.
> > Given that this directory does not yet exist in mainline, where would
> > be the appropriate place to add new drgn scripts? Would it make sense
> > to create a new `tools/drgn/` directory, or is there a preferred
> > location for such debugging scripts?
> > 
> > Thanks,
> > Ye
> 
> I believe the traditional thing to do with new drgn scripts is to add them
> to the contrib directory in drgn via pull request:
> https://github.com/osandov/drgn/blob/main/contrib/README.rst

I have an RCU-related drgn script in tools/rcu, so maybe this one should
go in tools/mm.

							Thanx, Paul
