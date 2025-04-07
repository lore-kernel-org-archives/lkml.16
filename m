Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907519995B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056507; cv=none; b=csFZTFk26snlMd/aEcizuWOzW4t6mgSxfZw6VTmVMcm1Lmt/tiLDv8Z4t/ZEJ0rnpTBiv3It8DWHawsDnbwonlZEeWvbD2WT3uDLerKSadf2B3CIf57AfS05HQU2WBljV65db7t9rB2+EnN5sopmgGCT99qEi8LqHaVdoKW8ohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056507; c=relaxed/simple;
	bh=vG1FN+joG2q+cwQUNCYmqD7G520yUarklcveE40YtUk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kaY0eyN30pWt6HyeUItQnffcxI64jN8NvUqFm/zM9uiOSsYX87WVulhbym+vEGD+TGVn2l8E5zeX8N1MaoDtRLwG0zqA9tgYf7B58coNGQ25Y+yjvRswqdU7zZ8fAFM9vIZO1arvBbLHWAqadi3A/k5ebrDJwE6iGDdDZQbL/fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uvbZEYTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uvbZEYTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAEEC4CEDD;
	Mon,  7 Apr 2025 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744056506;
	bh=vG1FN+joG2q+cwQUNCYmqD7G520yUarklcveE40YtUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uvbZEYTmWJOljcV8eL6lmIn0DzSjIByrcbubqYtPWROg4O6lmGIYXJCq95ZwhpL//
	 WY791VVfEW1F6Tl6JLz4VFblOlYI+ix6KkWbdVShI1/acnp2IC6fzdh2ESj4KSjLaI
	 orGeA2+DYXnXnhMpP4XOH2BdK7LHSqHz0mVIMSxY=
Date: Mon, 7 Apr 2025 13:08:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 longman@redhat.com, mhiramat@kernel.org, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, kent.overstreet@linux.dev,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, amaindex@outlook.com,
 jstultz@google.com, Mingzhe Yang <mingzhe.yang@ly.com>
Subject: Re: [PATCH v4 1/3] hung_task: replace blocker_mutex with encoded
 blocker
Message-Id: <20250407130825.69b4c879b242df4caaf426cf@linux-foundation.org>
In-Reply-To: <20250320064923.24000-2-ioworker0@gmail.com>
References: <20250320064923.24000-1-ioworker0@gmail.com>
	<20250320064923.24000-2-ioworker0@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Mar 2025 14:49:21 +0800 Lance Yang <ioworker0@gmail.com> wrote:

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
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1218,7 +1218,7 @@ struct task_struct {
>  #endif
>  
>  #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> -	struct mutex			*blocker_mutex;
> +	unsigned long			blocker;

-ENOCOMMENT


