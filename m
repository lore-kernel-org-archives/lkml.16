Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83092571C6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748503332; cv=none; b=bCS9kNmdedEvnt0ifyN5vlQUDaKfhItR2sCy3kp6Ob/gpw5WKVlXlMOWm9DGxX/+NNvQgsTBtlwfqjfDmXUpjILvmA9wzLw76ogxiMO5I59swTOHZDMuK45bRN3VkMveZ/60izbTtitzN3K3x97ytTD/FR7jkk0c7NKblEpXGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748503332; c=relaxed/simple;
	bh=jfv+NTW0O3j/I++L+ykOCO1+n4We/JjtJonxd2ZQVMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YowbeohjW7bAqwl19e2sHFrdLeb0/G54jrxXUEtwnsrLJELNtx6C+OJ8X5CkHvYcbBqXPHhj166aerigM9h6aHGfKZksGpztxtVEEgsjWymZ+UBHLpGEtGCpVYApj6DPhkL8/YZ5dJGVFLEx4nL3aIe+PdGmG0Nqcl9Jd1tQSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-669ff7000002311f-b5-68380b1fab6c
Date: Thu, 29 May 2025 16:22:02 +0900
From: Byungchul Park <byungchul@sk.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: kernel_team@skhynix.com, linux-kernel@vger.kernel.org,
	gfs2 <gfs2@lists.linux.dev>
Subject: Re: [RFC] DEPT(DEPendency Tracker) with DLM(Distributed Lock Manager)
Message-ID: <20250529072202.GA13739@system.software.com>
References: <20250522052453.GA42746@system.software.com>
 <20250522052806.GB42746@system.software.com>
 <CAK-6q+hOCq8aksDp33utOGwfFngnTbJo-mY3+FiCJVPzwP-xsg@mail.gmail.com>
 <CAK-6q+j3QJCB6XERbJfEkvro=Kucq0PQHrCyrZ+LxDq5yHx+=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK-6q+j3QJCB6XERbJfEkvro=Kucq0PQHrCyrZ+LxDq5yHx+=g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsXC9ZZnoa48t0WGwf4uZYuv14Mtdk//x2px
	edccNgdmjxebZzJ6vN93lc3j8ya5AOYoLpuU1JzMstQifbsEroyO3mnsBQ9lK/bemsfYwPhL
	rIuRk0NCwESid+9ddhj7/KKzbCA2i4CqxIllT1lAbDYBdYkbN34yg9giApoSEy/1gNUzC0RI
	/P59gqmLkYNDWMBPontRAEiYV8BC4s7Bk6xdjFwcQgJfGSW+zZzGApEQlDg58wkLRK+6xJ95
	l5hBepkFpCWW/+OACMtLNG+dDbaKUyBQYs+CNrBVogLKEge2HWcCmSkhMIVNomkmRJGEgKTE
	wRU3WCYwCs5CsmIWkhWzEFbMQrJiASPLKkahzLyy3MTMHBO9jMq8zAq95PzcTYzAYF5W+yd6
	B+OnC8GHGAU4GJV4eE8wmmcIsSaWFVfmHmKU4GBWEuFtsjfLEOJNSaysSi3Kjy8qzUktPsQo
	zcGiJM5r9K08RUggPbEkNTs1tSC1CCbLxMEp1cDI53D20q3Ouk5TjtrolVP25H1gkb0pzGYp
	99toU83T7GYervUsxXWt15mYJ60yulla8iWvsfd1jdwvs29XLHJcEx9sfy/9Yn+u/ubZJ75F
	hTrX1X/7O4tx4uqg5LWNssp311snSE/Rez/zwLpT+aIVkhFyQqLflxjPu+hsHDp18YfASQdl
	F5gpsRRnJBpqMRcVJwIAT/AOvWICAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsXC5WfdrCvPbZFh8OyJmMXX68EWu6f/Y7U4
	PPckq8XlXXPYHFg8Xmyeyejxft9VNo/FLz4weXzeJBfAEsVlk5Kak1mWWqRvl8CV0dE7jb3g
	oWzF3lvzGBsYf4l1MXJySAiYSJxfdJYNxGYRUJU4sewpC4jNJqAucePGT2YQW0RAU2LipR52
	EJtZIELi9+8TTF2MHBzCAn4S3YsCQMK8AhYSdw6eZO1i5OIQEvjKKPFt5jQWiISgxMmZT1gg
	etUl/sy7xAzSyywgLbH8HwdEWF6ieetssFWcAoESexa0ga0SFVCWOLDtONMERr5ZSCbNQjJp
	FsKkWUgmLWBkWcUokplXlpuYmWOqV5ydUZmXWaGXnJ+7iREYmstq/0zcwfjlsvshRgEORiUe
	3hOM5hlCrIllxZW5hxglOJiVRHib7M0yhHhTEiurUovy44tKc1KLDzFKc7AoifN6hacmCAmk
	J5akZqemFqQWwWSZODilGhgjg/dPYJ3+8oKLc7PL8ivc3vu4gk97K3Da3vb1KrPiKl0tsyRK
	4+fCuo0tCkevSP79qf6M9eW++KY9SWs8bGY+9Ns9Z8k/g7+Hd2vUs0dFnP54+/WFxtv2h+++
	YhFu4nZJCfXP/HPj20TFcrY26xm1R4rfbeP9x3q10Ct+Q3LBpSNPnSfPqxJTYinOSDTUYi4q
	TgQA8R41ZkkCAAA=
X-CFilter-Loop: Reflected

On Wed, May 28, 2025 at 08:00:02AM -0400, Alexander Aring wrote:
> Hi,
> 
> On Sun, May 25, 2025 at 8:13 PM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > Hi,
> >
> > On Thu, May 22, 2025 at 1:28 AM Byungchul Park <byungchul@sk.com> wrote:
> > >
> > > On Thu, May 22, 2025 at 02:24:53PM +0900, Byungchul Park wrote:
> > > > Hi Alexander,
> > > >
> > > > We briefly talked about dept with DLM in an external channel.  However,
> > > > it'd be great to discuss what to aim and how to make it in more detail,
> > > > in this mailing list.
> > > >
> > > > It's worth noting that dept doesn't track dependencies beyond different
> > > > contexts to avoid adding false dependencies by any chance, which means
> > > > though dept checks the dependency sanity *globally*, when it comes to
> > > > creating dependencies, it happens only within e.g. each single system
> > > > call context, each single irq context, each worker context, and so on,
> > > > with its unique context id assigned to each independent context.
> > > >
> > > > In order for dept to work on DLM, we need a way to assign a unique
> > > > context id to each interesting context in DLM's point of view, and let
> > > > dept know the id.  Once making it done, I think dept can work on DLM
> > > > perfectly.
> > >
> > > Plus, we need a way to share the global dependency graph used by dept
> > > between nodes too.
> > >
> >
> > Having everything simulated and having nodes separated as
> > net-namespaces in one Linux kernel instance is I think at first
> > simpler to do and will show the "proof of concepts".
> > Sharing data between nodes is then just some memory area that is not
> > separated by per "struct net" context.
> 
> Alternatively the master node of the lock (this node knows everything
> about the lock operations being done including the nodes that are
> waiting to get the lock granted) can be used to detect cycles, we

Sounds good.

> already do that for some simple cases when converting locks directly
> [0]. Maybe this is already enough to have all the information, but it

It seems that DLM already tries to detect a deadlock.  Can you provide
an example scenario where the current detection logic doesn't work?
It'd help me define what to do for better DLM and dept.

> is not just a "wait_event()" mechanism, there needs to be some other
> API to use DEPT for this case?

It'd be required to modify dept to work with isolated context ids - each
id corresponding to each node, not simple kernel contexts e.g. system
call or irq context.  Which is not that hard to implement I think.

Answering to your question, We might need to add a few dept annotations.
Even though I'm afraid I don't understand how DLM works enough, for
example:

   1. when recieving a lock(L1) request from a node(N1), that might wait,
   
      annotate dept_wait(L1, events that can wake up N1) for N1 context,
      where events are all the events that can wake up N1 from waiting.

   2. when recieving a lock(L1) request from a node(N1), that does not
      involve wait but just tries,

      no need to annotate.

   3. when the request is granted,

      annotate dept_request_event(L1) which means there might be waiters
      for L1 to be released from now on.

   4. when releasing the lock(L1) no matter who releases the lock - the
      releaser doesn't have to be N1,

      annotate dept_event(L1) for the releaser.

Roughly, these annotations are needed, but again, it'd be helpful if you
provide an example scenario where the current detection logic you have
doesn't work, for better discussion.

	Byungchul

> 
> - Alex
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/dlm/lock.c?h=v6.15#n2163
