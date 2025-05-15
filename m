Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6F289E03
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299721; cv=none; b=t/+eA4VlGVaCUCLqhtJh2nnjs0Ul9JuUNYTqME7n+3XWR+4mHXQ3bqsetioh8goOSto6cQ1BsAtNeJSktvs6gJmws0/seGLr8nrnP178rBaXi9gbu9XlSZLblec/IXWXkcU1BB8C7eE13HCOSS8oU7/lzky6cpMxctgPXILtDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299721; c=relaxed/simple;
	bh=00LKte4tAlrp4T3ak+XQYec9OjF+E7uT7Nug0Cu4ZA0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/A/IYwW4inX+3e0NsoGP7NjlfRYjqFbY9x5VkR6aLqgNQ9v9EDSCUJ2hCSEwBfMAQt+CkM1W0yBY92jYu7fQektj42+BbbqnJRLHbw5vpi9Qt0e+AX1U+DXkf5La/dosaA2a0KK3ALNSN5QuAQ+W6kfeJTN5h5FmMdXEfZQkmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20532C4CEE9;
	Thu, 15 May 2025 09:02:00 +0000 (UTC)
Date: Thu, 15 May 2025 05:01:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Madadi Vineeth Reddy <vineethr@linux.ibm.com>, "peterz@infradead.org"
 <peterz@infradead.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
Message-ID: <20250515050159.3dbba5f5@batman.local.home>
In-Reply-To: <E2C65493-D9C0-42E5-A8C5-091FE2394216@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
	<20250513214554.4160454-2-prakash.sangappa@oracle.com>
	<ddc80d60-0cea-4e07-a4ef-fb21d5f5a0fa@linux.ibm.com>
	<E2C65493-D9C0-42E5-A8C5-091FE2394216@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 May 2025 23:12:26 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> > As mentioned in previous versions, does this not change the semantics for
> > sched_yield()? Why is this necessary to immediately call schedule() and skip
> > going through do_sched_yield()?  
> 
> Expectation is that the user thread/application yield the cpu once it is done executing
> any critical section in the extra time granted. Question was which system
> call should it call, and yield seems appropriate.  It could call any system call actually.
> 
> Since thread is just yielding the cpu it should retain its position in the queue. So it does 
> not have to go thru do_sched_yield() as that would put the task at and of the queue.

If it was granted an extension, from the POV of user space, it actually
shouldn't keep it's place in the queue, because it's place is currently
"promoted" and according to the scheduler, it shouldn't be running in
the first place. But in the kernel, we are just dealing with
implementation details. Going back to user space should cause it to be
scheduled out otherwise it shouldn't be extended in the first place.

-- Steve
