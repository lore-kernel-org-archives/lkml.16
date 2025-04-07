Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343C19995B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056517; cv=none; b=j/4S862oyGi2EgJm3+MplO25CKb4Jw6ppfjXwinb7oL2d5LD9cX0yx5GK7Df4fixUhkDWEhwkW7wc/OdnYEh7NyK2iVXsMBgscJyy3ogxVwiv/EKtw6NSIG9CDVhxopHpuKlNEtRHUD7WAOamyh24KnjRCIJaPivlAKa7VQfPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056517; c=relaxed/simple;
	bh=YFkv2xrGf8QvVfd/cTf69ZsNoNo3ocUwPEXvSbzUklg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=reQoIyteZoHQKLfYPbAwJVxW/Dhc4Noc2s0bkkq1wJaTnUa150AwNNzWzrWiAeLjyFuaYMM0KvGuigmuJRBke9MQaIdXjU6Y3aodWq5M5nLrH+N61z7oA0MZpqCQGYNzGe2WLu/BrHZiTNzhvnVZ7ViVmezlkiOlt97tL2C433I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OvpjEnsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OvpjEnsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A52C4CEDD;
	Mon,  7 Apr 2025 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744056517;
	bh=YFkv2xrGf8QvVfd/cTf69ZsNoNo3ocUwPEXvSbzUklg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OvpjEnsrsDS0fai5lh82ccGbdb9k2glmYLy9bJfLMuuASpTn33hX7nx6PGsH7DaJh
	 yQcJGizpxC2g9Zb+DkxolzKnUCHIw9F40ytzoXn/2bFoBUdq20dYA1Rb+K+YyPs2T2
	 3MChtUfmWenelSIUO+DXyyBCNBgguVPATFEa7bJs=
Date: Mon, 7 Apr 2025 13:08:36 -0700
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
Message-Id: <20250407130836.5e52ab2aa2e77c67f890637b@linux-foundation.org>
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

> Inspired by mutex blocker tracking[1], this patch makes a trade-off to
> balance the overhead and utility of the hung task detector.
> 
> Unlike mutexes, semaphores lack explicit ownership tracking, making it
> challenging to identify the root cause of hangs. To address this, we
> introduce a last_holder field to the semaphore structure, which is
> updated when a task successfully calls down() and cleared during up().
> 
> The assumption is that if a task is blocked on a semaphore, the holders
> must not have released it. While this does not guarantee that the last
> holder is one of the current blockers, it likely provides a practical hint
> for diagnosing semaphore-related stalls.
> 
> With this change, the hung task detector can now show blocker task's info
> like below:

+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER

It looks pretty simple to reduce the amount of ifdeffery which this
patch adds.
