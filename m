Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133E2BD59F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Mar 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102379; cv=none; b=nJgf4Yx8LRaAYeWwWQ47pHIAyut5P+LDJi8BAwB0Q8X9UWdaRxUj9xACCLLT+5eSWqzHBSYAfgnu40h/r+2rZ0KgwrNuyb3Hou6KREhT/zHXz/OGKoPBMKUrSh+1KCHVsWvpO9U04CZbRIovgjxLm7yaywqLaRHN+6nGdMTgbvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102379; c=relaxed/simple;
	bh=Q60ZR+PlU1aiSI/tGLEZB+CnkxFHkftzpFsNbG5PP8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfVP5++3ZT1XlTHgLNtChgmZiN/QqpP2AyslQa53zpnxvwRfV5OGEfqRpxcNjT+lcqUVB6kriiFUBJh5ra5dp9+z+FvcQJYTg40Aar2KDemWo8znw0SWPdbz8+AahthN/RYbV9/cfQq9SNIazCMgo/N0cGI2ehmRFvetBPJe3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E53C4CEE9;
	Tue,  4 Mar 2025 15:32:58 +0000 (UTC)
Date: Tue, 4 Mar 2025 10:33:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: patches@amperecomputing.com, cl@linux.com, yang@os.amperecomputing.com,
 mathieu.desnoyers@efficios.com, peterz@infradead.org, jpoimboe@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracepoint: Print the function symbol when
 tracepoint_debug is set
Message-ID: <20250304103352.0d2b6f71@gandalf.local.home>
In-Reply-To: <20250304101843.12562-1-shijie@os.amperecomputing.com>
References: <20250304101843.12562-1-shijie@os.amperecomputing.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Can you resend this with linux-trace-kernel@vger.kernel.org please.

I probably should update the MAINTAINERS file and place this and
include/linux/tracepoint.h under TRACING.

-- Steve


On Tue,  4 Mar 2025 18:18:43 +0800
Huang Shijie <shijie@os.amperecomputing.com> wrote:

> When tracepoint_debug is set, we may get the output in kernel log:
>      [  380.013843] Probe 0 : 00000000f0d68cda
> 
> It is not readable, so change to print the function symbol.
> After this patch, the output may becomes:
>      [   54.930567] Probe 0 : perf_trace_sched_wakeup_template
> 
> Reviewed-by: Christoph Lameter <cl@linux.com>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  kernel/tracepoint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/tracepoint.c b/kernel/tracepoint.c
> index 1848ce7e2976..82bef4b9400a 100644
> --- a/kernel/tracepoint.c
> +++ b/kernel/tracepoint.c
> @@ -127,7 +127,7 @@ static void debug_print_probes(struct tracepoint_func *funcs)
>  		return;
>  
>  	for (i = 0; funcs[i].func; i++)
> -		printk(KERN_DEBUG "Probe %d : %p\n", i, funcs[i].func);
> +		printk(KERN_DEBUG "Probe %d : %ps\n", i, funcs[i].func);
>  }
>  
>  static struct tracepoint_func *

