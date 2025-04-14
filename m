Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD61D63E4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666685; cv=none; b=gcZ1JbQla4tqeqyhos4RyVG9PFD4BVZlt3vPtV3t8iOW+9MvvKZrQzYzi1AV9oICrJ8jngLrWtBtqwOpJyaU9ljGCodXQK8PpUOMjl8w6/jK8gjA7voGtlootkWuYo+kyTuNz9Evg+eoPMAzg9Am20Nbl3X0YgRqdQfSv6+udgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666685; c=relaxed/simple;
	bh=2k+Q2bMsVBsXMNJejuMjGWROLDWcuJlkfU2MZPNYr40=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cFXpwzNbC1Y5tXus9oMOeQIWU6POK2kjVmsgiWFFRakhoqF494W1rNg4o0SeDlCOkM4AiZq6gMbxe5/lyokVj8qbw81rw9CAa8b6QeXtWK9ldVOJpTcjdf99hbqrL9OBav6HT+Nlh7Svq5SHWM9N0Es0d9XtB+wcyXiYWlakJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RlqmTAZj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RlqmTAZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1604C4CEE2;
	Mon, 14 Apr 2025 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744666685;
	bh=2k+Q2bMsVBsXMNJejuMjGWROLDWcuJlkfU2MZPNYr40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RlqmTAZju2gzfQ42x65PYqWCFH7DqOHgMHTUQ+TqlWMEFdgqe3KnM57ceYVWbs+Kj
	 BAR03j9Ah57/HfDAVBjFiTl3uy2O9bXkEXhk2crr2SiVOv2Asin2uQvCYqciZizm5f
	 NpzZcXpHGhcNYH/K8Mo3I9BWLni4j9gQYEOjADX8=
Date: Mon, 14 Apr 2025 14:38:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 longman@redhat.com, mhiramat@kernel.org, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, kent.overstreet@linux.dev,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, amaindex@outlook.com,
 jstultz@google.com
Subject: Re: [PATCH v5 0/3] hung_task: extend blocking task stacktrace dump
 to semaphore
Message-Id: <20250414143804.e05de499b378f4da4cdc5f59@linux-foundation.org>
In-Reply-To: <20250414145945.84916-1-ioworker0@gmail.com>
References: <20250414145945.84916-1-ioworker0@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 22:59:42 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> Inspired by mutex blocker tracking[1], this patch series extend the
> feature to not only dump the blocker task holding a mutex but also to
> support semaphores. Unlike mutexes, semaphores lack explicit ownership
> tracking, making it challenging to identify the root cause of hangs. To
> address this, we introduce a last_holder field to the semaphore structure,
> which is updated when a task successfully calls down() and cleared during
> up().

Thanks, I'll queue this series in mm.git's mm-nonmm-unstable branch for
some test and exposure.
