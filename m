Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870317A2F0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172423; cv=none; b=YE3car5VdYj2WWunAib7wvpWQ7pd4KykZPyFuM2o+3vDvGpSVKFA4fPPbe4IbKX84RMwyOLGkwL77Tt3HZFer2nz0hpUXZXPEcKpE+KYbXURvt6cLQoiJOo2kecYaz599O917oPG0VeeQ2KMW2wpX3osSr0ZKUMBxqmjRveYepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172423; c=relaxed/simple;
	bh=hEinp4LFQ7gF4K7OE0+OanuLdv5e43+pLjjFO7D7v4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8TaCdZOUviUoEHsWkMrt/TSZWE7GWtVx10+6HderYsDhzLjylMK3IX8WU0RXoDM2gffxCL2BWcV/JIhWvAUGRiYGydFs+vnXndkVh0qh2RN20/u6Lyxe1W97da5p4DWSrwD7ZI6kmN0G6S83nsJ3DUlPTbWiADsQEgj1iJRT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 861BB1A023F;
	Tue, 17 Jun 2025 15:00:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id CCC4C20028;
	Tue, 17 Jun 2025 15:00:11 +0000 (UTC)
Date: Tue, 17 Jun 2025 11:00:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Artem Sadovnikov <a.sadovnikov@ispras.ru>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] function_graph: Fix off-by-one error in buffer size
Message-ID: <20250617110017.2883cba3@gandalf.local.home>
In-Reply-To: <20250617111907.1579-1-a.sadovnikov@ispras.ru>
References: <20250617111907.1579-1-a.sadovnikov@ispras.ru>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: CCC4C20028
X-Stat-Signature: spoxfapm1wb9rjkzbd3mqm7ufegkz4wi
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18PpaqiQoYhW/WMfPi87LB1d6NiBW+B/Dg=
X-HE-Tag: 1750172411-588953
X-HE-Meta: U2FsdGVkX197pAXjfr7FsTBl5I6Dt8odB/MOZvRIp9rrGEdfNJvpMie4oE4ZY5Z6bvh7YgSAP8jiy+AjJaj8XHQq5qoq4NqYqwgjOSr9ZyUd7BT8Gqri0Kyf5yXd1AB2lbcGdspHYth2AwITHWc/lLpqwFk+0A3+inRwXKLSykryo2wcW0hks8XownN89ibs/FydqWMvj75FEcIjHuZcbaE4l3soDT4NyyNtXJcSGfAmo4HQDjwb+Lo2E3GdRWT1KcxNoLc7gb/NYF6BTaYM6QjvLZhFC8LUUhcI9oR5zb3Jz+14PD8JLmHTGpMiJgKp56+8ItURQJKuDPowB+E1bPk6Y2zV2dzkwJsuaKiXRNGC/a8nUic/JUVofHf+74ynVYg9RKjbamtEM77FacG+KqOwtplUckTnk8eTYDMVi9jwUBcSdpYGSDC55F60Sw8l

On Tue, 17 Jun 2025 11:19:06 +0000
Artem Sadovnikov <a.sadovnikov@ispras.ru> wrote:

> The comment above buffer mentions sign, 10 bytes width for number and null
> terminator, but buffer itself isn't large enough to hold that much data.
> 
> This is a cosmetic change, since PID cannot be negative, other than -1.

Right, where I'll change the subject as that makes it look like this is a
real bug.

And it is likely that "pid_str" will be allocated as 12 anyway, just for
alignment reasons. But I'll take your patch.

-- Steve


> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Artem Sadovnikov <a.sadovnikov@ispras.ru>
> ---
>  kernel/trace/trace_functions_graph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
> index a8c1f56340680..d789d308ab1de 100644
> --- a/kernel/trace/trace_functions_graph.c
> +++ b/kernel/trace/trace_functions_graph.c
> @@ -344,7 +344,7 @@ static void print_graph_proc(struct trace_seq *s, pid_t pid)
>  {
>  	char comm[TASK_COMM_LEN];
>  	/* sign + log10(MAX_INT) + '\0' */
> -	char pid_str[11];
> +	char pid_str[12];
>  	int spaces = 0;
>  	int len;
>  	int i;

