Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CFC28DB79
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750038385; cv=none; b=G49D//giFVVYTBM9zr/f7qSMVWFYjGioXnfEnirYfOCS+ChQI4TxRDhdInDwGg0pAUW4mo8ccAyBBNNbXa4UNCA7+LqlJPFmCNtJ4w5ZAhXZHjcl8hfW62PRdyc3bI8mBco3VQfglXnB4mLoe/54ePCa29btBz+YbL45e3Vyy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750038385; c=relaxed/simple;
	bh=zfXXWvtSY25CDJo7poZTI18g/+muR+1XHKAwXJvTeuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5zKCVwLTIww8B82ne5lKooeeRwpVm+w24ICUu8iM4+lRxnMeRmfEOD4sdI5Y2OvWdHsoRAgZhui1eulK9Ixomz6CMuAhPc7sL1FgcY0h8mbRc3D5MzWn3vUdTa6vm63lCuEh/iedsfYGdvVYAiM35W6k7DtGRDGPagPGOkcSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g4zyowvb; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g4zyowvb"
Message-ID: <0088c3f5-d2a0-48c4-b69a-fb385c527b32@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750038380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQID4R1l8E6t4KIIm+Vv+WlcdIJyxmkR1XLJ4BDsS/k=;
	b=g4zyowvb0HNyYNOMCntH7O7GXK7JliwyWLsFsBH403pZoUY25t1ScsHwu1nL4oUyr/yanP
	G5Hzl2zOeRsAuifFaR59it8yeEvj4iEmk406q0h0SoxfZMCLQnUT4WOpvoJ/2rrhwhUjft
	l5UYU/vhzkh8goCRVfy9vlk5r+5l2nQ=
Date: Mon, 16 Jun 2025 09:45:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2 5/5] panic: add note that panic_print interface is
 deprecated
Content-Language: en-US
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: paulmck@kernel.org, john.ogness@linutronix.de,
 Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-6-feng.tang@linux.alibaba.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250616010840.38258-6-feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/16 09:08, Feng Tang wrote:
> Long term wise, the 'panic_sys_info' should be the only controlling
> interface, which can be referred by other modules.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>   kernel/panic.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index ea238f7d4b54..e8a05fc6b733 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -76,6 +76,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
>   EXPORT_SYMBOL(panic_notifier_list);
>   
>   #ifdef CONFIG_SYSCTL
> +static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
> +			   void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	printk_once("panic: 'panic_print' sysctl interface will be obsoleted by 'panic_sys_info' interface.\n");

Hmm... I would get scared for a second when I read messages prefixed 
with "panic:"
from dmesg. That prefix should have a very specific meaning ;)

Well, we can just change the prefix to something more neutral:

printk_once("Kernel: 'panic_print' sysctl interface will be obsoleted by 
'panic_sys_info' interface.\n");

Thanks,
Lance

> +	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
> +}
> +
>   static const struct ctl_table kern_panic_table[] = {
>   #ifdef CONFIG_SMP
>   	{
> @@ -107,7 +114,7 @@ static const struct ctl_table kern_panic_table[] = {
>   		.data		= &panic_print,
>   		.maxlen		= sizeof(unsigned long),
>   		.mode		= 0644,
> -		.proc_handler	= proc_doulongvec_minmax,
> +		.proc_handler	= sysctl_panic_print_handler,
>   	},
>   	{
>   		.procname	= "panic_on_warn",

