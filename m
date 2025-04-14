Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC991E51E2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666599; cv=none; b=LayQk5N1ZiWwaRlIsvAsElTfblqeJYj0FPxg82p607hEgrKfTq0IFJkA5cWGQVsVDK8n9xCg4gMHjyzY0nXomreY9TOUmbPG3Vdm7jEbwEPvNvejP6dsUWEHrdh0dsK4Se7scNIzkOEb0uKz0j7dMZy7tUSdbbigK7TScj8ipCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666599; c=relaxed/simple;
	bh=8uAuv9NlZHGvIdYyvNCHeiFcxTeM2p0MUfEWEenQfqY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ayipXsNa1GPOIC5iUSzmsPTQxwr2EB2H3ujTzYXH6rY5nNlZEorce0BPJ9JduEVlQj6sPdr08GdsUqrvekv2WoZZ83kTj8l96uhpmcAo1nUQTZY/nwEgY8w2hyYhzY8NZYcs+rU5kAlE0Oh7ugeDdLbeLe3aGLcROu38/Ws19RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jAkY9ro9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jAkY9ro9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22629C4CEE2;
	Mon, 14 Apr 2025 21:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744666598;
	bh=8uAuv9NlZHGvIdYyvNCHeiFcxTeM2p0MUfEWEenQfqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jAkY9ro9MWjFn025ExiKbtnAEDjbnLMXayEpl2Yvb1OkLJsvHPDJcS8FO3KW0x72B
	 H0sItrd4wSk4E+3gJbVCZFVgmtY0fXIbF6SUYrHRra/LG1PiUVVyZzeEn54N+YOPnN
	 T7wAEXlUwQMpic+CvQuEoM5vBCHUWZF0FC1QgdR8=
Date: Mon, 14 Apr 2025 14:36:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 longman@redhat.com, mhiramat@kernel.org, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, kent.overstreet@linux.dev,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, amaindex@outlook.com,
 jstultz@google.com, Mingzhe Yang <mingzhe.yang@ly.com>
Subject: Re: [PATCH v5 1/3] hung_task: replace blocker_mutex with encoded
 blocker
Message-Id: <20250414143637.a1ae89d6b46c13f195e9210e@linux-foundation.org>
In-Reply-To: <20250414145945.84916-2-ioworker0@gmail.com>
References: <20250414145945.84916-1-ioworker0@gmail.com>
	<20250414145945.84916-2-ioworker0@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 22:59:43 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> This patch replaces 'struct mutex *blocker_mutex' with 'unsigned long
> blocker', as only one blocker is active at a time.
> 
> The blocker filed can store both the lock addrees and the lock type, with
> LSB used to encode the type as Masami suggested, making it easier to extend
> the feature to cover other types of locks.
> 
> Also, once the lock type is determined, we can directly extract the address
> and cast it to a lock pointer ;)
> 
> ...
>
>  static void debug_show_blocker(struct task_struct *task)
>  {
>  	struct task_struct *g, *t;
> -	unsigned long owner;
> -	struct mutex *lock;
> +	unsigned long owner, blocker;
>  
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
>  
> -	lock = READ_ONCE(task->blocker_mutex);
> -	if (!lock)
> +	blocker = READ_ONCE(task->blocker);
> +	if (!blocker ||
> +	    hung_task_get_blocker_type(blocker) != BLOCKER_TYPE_MUTEX)
>  		return;
>  
> -	owner = mutex_get_owner(lock);
> +	owner = mutex_get_owner(
> +		(struct mutex *)hung_task_blocker_to_lock(blocker));

typecast is unneeded?


