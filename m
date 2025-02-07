Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B692502BE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967681; cv=none; b=A4F+q4nIFF9Z2Gi0/uKkOTmGiv1ljkj52pHzImnnYIgO4Ei7ZlUmRlsPeVOM3T9P61i8mWaWgDX/+hXTH2YmzcpgK8GQ6cSbkeLOMp+BMfeQQAIuv8t2dfcA3MzcRA+U3Ft7lNtCHFrKGl4n7BhiHqp3VUD3z+OByZ36TT4v1HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967681; c=relaxed/simple;
	bh=e6c+prYLEKBGCmLdq/1vnI985NBU/nHj3qc6cktoqfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKhw01k4TWCIJABCYjNigsfH8sIxTAsfQNfeu63CCVDIp/gGvX9P+KJ2LNZtZuo5C8v5mglGd8Zni6APwIK6EDpkDT8JmeTcYC/n4C85OufRISc7j/oeXCWwmkfMzpahxyE/sj4RXpXTtslVNE1jfKCZd5ZZ5KMuG8baEb/oqcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=FAamZl/n; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="FAamZl/n"
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YqTL63wm6z6CmQyb;
	Fri,  7 Feb 2025 22:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738967668; x=1741559669; bh=31wbb2SNMv9ArpQRwzJYdSjY
	W+hGPcQzILAGRWOIvDU=; b=FAamZl/nGXu4ZDEUtXTf8/pELaUQwVe0BIPNURVS
	/Kyu27pvFCVtSYlWrnsoVUCu8DkmGtZ6LvSdMjK9gw+uyCnTqiczJt08BivSUE9U
	OqGXAFWF5Kd+/z+5FzdvjP3lo41Ax4r27wENUBFMx+zSejSOLERduiF4qVKss6eY
	Yro3Q4GJ2HWZgwNt8ZwzPAi0bLQECpHs2pU9R3puus/P/yB2w0cxdzP+BvtXiUyq
	QLlt46U35x0pMg7zmk8UPtwenIF7LVdl193N8LCIUtjuIXn2TIO77onPyvV0Tqtu
	U1oI+619/0zkfTBxroZlvp/PNmYOxqUreJPybYXw/0ptHw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LSO_tKtcRKLy; Fri,  7 Feb 2025 22:34:28 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YqTKt21lqz6CmQyW;
	Fri,  7 Feb 2025 22:34:26 +0000 (UTC)
Message-ID: <567ceff3-bbd9-4724-a80d-3db46ee40c98@acm.org>
Date: Fri, 7 Feb 2025 14:34:25 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/33] locking: Introduce <linux/thread_safety.h>
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-4-bvanassche@acm.org> <20250207035345.GA4920@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250207035345.GA4920@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 7:53 PM, Christoph Hellwig wrote:
>> - a struct that represents a synchronization object is annotated with the
>>    CAPABILITY() attribute,
>> - the operations on that synchronization object are annotated with the
>>    ACQUIRE() and RELEASE() attributes,
>> - if variables or members that should be guarded by a synchronization
>>    object are annotated with GUARDED_BY(),
> 
> Those are all nasty shouting names, without and good prefixing.
> 
> But more importantly ACQUIRE() and RELEASE() seems to duplicate the
> existing __acquires/__releases annotations from sparse.  We really need
> to find away to unify them instead of duplicating the annotations.

I think that we are better off to drop support for the sparse locking
annotations. Linus added the macro __cond_acquires() two years ago in
the Linux kernel but support for that macro has never been implemented
in sparse. In the description of commit 4a557a5d1a61 ("sparse: introduce
conditional lock acquire function attribute") I found the following URL:
https://lore.kernel.org/all/CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com/

That URL points to an e-mail from Linus Torvalds with a patch for sparse
that implements support for __cond_acquires(). It seems to me that the
sparse patch has never been applied to the sparse code base (the git URL
for sparse is available at https://sparse.docs.kernel.org/en/latest/).

So while __cond_acquires() can be translated into a Clang annotation,
__cond_acquires() is not supported by sparse. There are other
challenges:
* The argument of __acquire() and __release() can be a "capability" or
   the address of a synchronization object. A few examples where the
   argument represents a capability:

   __acquire(RCU);
   __acquire(RCU_BH);
   __acquire(RCU_SCHED);
   __acquire(bitlock);

   An example where the argument represents the address of a
   synchronization object:

   static inline void do_raw_spin_lock(raw_spinlock_t *lock)
         __acquires(lock)
   {
	__acquire(lock);
	arch_spin_lock(&lock->raw_lock);
	mmiowb_spin_lock();
   }

   If __acquire() and __release() would have to be supported for both
   sparse and Clang, that would probably involve modifying all instances
   of these two macros across the entire kernel tree and making it
   explicit whether the argument is a capability or the address of a
   synchronization object.

* Clang verifies the thread-safety attribute arguments at compile time
   while sparse does not. An example from the scheduler:

extern
struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
	__acquires(rq->lock);

   An example from the workqueue implementation:

static void maybe_create_worker(struct worker_pool *pool)
__releases(&pool->lock)
__acquires(&pool->lock)
{
[ ... ]
}

   If __acquires() and __releases() are converted into Clang function
   attributes then compilation fails because Clang verifies the
   expressions passed to function attributes before the function body is
   compiled.

The team that is maintaining sparse is small (a single person?) and the
rate of change of sparse is low (the latest commit was published more
than a year ago). If we support both sparse locking annotations and the
Clang thread-safety annotations then we will end up fixing bugs in both
compilers. I propose to focus the maintenance effort on the project with
the highest velocity (Clang) and to drop support for the sparse locking
annotations.

Thanks,

Bart.


