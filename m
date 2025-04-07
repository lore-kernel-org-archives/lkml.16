Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8AE221F0A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056526; cv=none; b=F7y3KagVOcEujeuIToq4UEs9NSP74Ythcx9hXznjROFpvScfOWCyfCo5RcTUA3AR9kz1Tp9CitdpSQJCMd445PKE2d/synOOGP/okVDXlz8Wi+9Zf5KVkc5vZD52BGeFDOxo/JUpZq4nyQF3fz5vdeNEc8sqrhDD65qnw2ebQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056526; c=relaxed/simple;
	bh=HZIZaVl2bEe53GZHe8WBcxpNZcp4LZRz27De2uC9pfk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z3un2Tf2mk7vk7qXmcamCcq1gi2w6GBwCAYYLd9JYQdd7zYNHdMWIRe88GSXt619EK0ByCATQ/Sld57nRR0chBTq7F54R73M7hPx4K1vhsg8MZe4eoVrFCtVOjiIUl45G9qWMuG7MMpPYuTZM3332teWT2G4mGHzj0CmEwwxPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Pf8JAjbv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pf8JAjbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DE5C4CEDD;
	Mon,  7 Apr 2025 20:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744056526;
	bh=HZIZaVl2bEe53GZHe8WBcxpNZcp4LZRz27De2uC9pfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pf8JAjbvk4W2rB1P0Gd//vzbTgFSpDW4jLiXl+Z8XsBG23sg4bSIWCFX8YKpcFecp
	 HpOM38aQQXkGp+cr/Mx6NZOtUWKu74TxywKIEZcSHLmaL6+jkxLi+sKy6nLI1t30WE
	 WSSz5tplSPyjFg0Ngog4qTNrKpY26XJOjeOIv/ms=
Date: Mon, 7 Apr 2025 13:08:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 longman@redhat.com, mhiramat@kernel.org, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, kent.overstreet@linux.dev,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, amaindex@outlook.com,
 jstultz@google.com, Mingzhe Yang <mingzhe.yang@ly.com>
Subject: Re: [PATCH v4 2/3] hung_task: show the blocker task if the task is
 hung on semaphore
Message-Id: <20250407130845.3c3501a03963f1d44835c755@linux-foundation.org>
In-Reply-To: <20250320064923.24000-3-ioworker0@gmail.com>
References: <20250320064923.24000-1-ioworker0@gmail.com>
	<20250320064923.24000-3-ioworker0@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Mar 2025 14:49:22 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> --- a/kernel/locking/semaphore.c
> +++ b/kernel/locking/semaphore.c
> @@ -33,12 +33,14 @@
>  #include <linux/spinlock.h>
>  #include <linux/ftrace.h>
>  #include <trace/events/lock.h>
> +#include <linux/hung_task.h>
>  
>  static noinline void __down(struct semaphore *sem);
>  static noinline int __down_interruptible(struct semaphore *sem);
>  static noinline int __down_killable(struct semaphore *sem);
>  static noinline int __down_timeout(struct semaphore *sem, long timeout);
>  static noinline void __up(struct semaphore *sem);
> +static inline void __sem_acquire(struct semaphore *sem);

It feels Just Weird to forward declare a static inline.  Is there a
special reason for doing this?
