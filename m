Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC87DA73
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056488; cv=none; b=YlZkG0nToFDDFv5xUL8zMwiC4s0VFvm0aGFcp9ohrfLTcpRazGNl+UqQH09MNddtEwdWSfYkhL6QaW/Bbcm5cY7L1QSGMweTQl3YAPIuZ/ZrusCbyqSvOacLx3NJZEwK/MbmWwEdnPEvLCKy0uLjmhGiS/DS+kMBHWb2wFpMiSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056488; c=relaxed/simple;
	bh=gN/uTflVVU/EZB66rtR2lUnWDUxIT2FmHzXJVfnu9Bk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CGCvlhycz+LkJ6Cg1IhHTYPFuyisyANkIy8Huo7QJBgOTjeNUgF6bcACK/LXtxrDOSESSHuBgDjYliIlko/XguHzRjjBhekuJvInIEQz3qB0WlOv+nZ3XniKd9fmf8qyTfnsCX+VJ7BB7sn+nFDR1A9JP1hAJ7j/ATLGvBU9jEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=luCPXgFi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="luCPXgFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB675C4CEDD;
	Mon,  7 Apr 2025 20:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744056488;
	bh=gN/uTflVVU/EZB66rtR2lUnWDUxIT2FmHzXJVfnu9Bk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=luCPXgFiPrd/E62tavERiJU51C3lxxbpOYScc/+XmRTtcFd5bHqmDn33QdGF29Dx0
	 bztvBQH7pMvkkd92IuDiC92FE/KcxRXqKyewlLCGxKl47iSeW7CQyWl9omHG5ydOew
	 zTzsp587eZHPYVLwm/Ut+ujdT+y4/a5f4kwaEXpo=
Date: Mon, 7 Apr 2025 13:08:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 longman@redhat.com, mhiramat@kernel.org, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, kent.overstreet@linux.dev,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, amaindex@outlook.com,
 jstultz@google.com
Subject: Re: [PATCH v4 0/3] hung_task: extend blocking task stacktrace dump
 to semaphore
Message-Id: <20250407130807.9d9eae28cced953cdef8b0a1@linux-foundation.org>
In-Reply-To: <20250320064923.24000-1-ioworker0@gmail.com>
References: <20250320064923.24000-1-ioworker0@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Mar 2025 14:49:20 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> Inspired by mutex blocker tracking[1], this patch series extend the
> feature to not only dump the blocker task holding a mutex but also to
> support semaphores. Unlike mutexes, semaphores lack explicit ownership
> tracking, making it challenging to identify the root cause of hangs. To
> address this, we introduce a last_holder field to the semaphore structure,
> which is updated when a task successfully calls down() and cleared during
> up().
> 
> The assumption is that if a task is blocked on a semaphore, the holders
> must not have released it. While this does not guarantee that the last
> holder is one of the current blockers, it likely provides a practical hint
> for diagnosing semaphore-related stalls.
> 
> With this change, the hung task detector can now show blocker task's info
> like below:

Seems useful, but the semaphore code isn't really an akpm thing. 
Peter, could you please comment?

