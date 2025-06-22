Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD586349;
	Sun, 22 Jun 2025 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632528; cv=none; b=fi6bpvyAs4AGUnwIn4Pp1UgbxdwGmvCBrnnCwTOhO1it7VtTMY9wB/14U2LP8nKF7xhiWRlq3N5n3QOp0Ll02sTj7PFwCDdiyj8MaZalUj9qHJkLgz5guo6LvYcEqx0a7LeoknAi2izeAsooHs7072r8p3h+8H6Adiw+j6EG+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632528; c=relaxed/simple;
	bh=T5+Prpht3oUvEsd/DGDLvYFZkGwgGKSbQdhp2/015Qo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ecTV+nhK18m1dXZ/38qzDwoMSyDNuwBMT7SjBRqhFFl1Po/ryGKR8Rs3A+HNwyQo4r9Fith+/4eAjR+wmZiaL90BQqSlKaPk/DqcRXXWKgTZlLHF/5V/HvVPkta2BUgTBJ7XiTPQP1qLUQ3SAdtZzrOAwRhjncsKZ42ofWfbYYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=v/rlhubF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="v/rlhubF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C218FC4CEE3;
	Sun, 22 Jun 2025 22:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750632528;
	bh=T5+Prpht3oUvEsd/DGDLvYFZkGwgGKSbQdhp2/015Qo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=v/rlhubFFaG3l6cMyZwfDk6KrVEWd4cTEInXO1IL+xCdsCzCNA3mM5gfQ2JuTjAHz
	 vBdRWrdJkcyLvJIX1z0dR7NoZxeaiKY1/lis5Wm6jGigeDststZSSkgGqSJIdTUlYf
	 9ykFRgsyhVNIyZYr1arpcza25KWiYSLe+ih6MCyM=
Date: Sun, 22 Jun 2025 15:48:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <jiang.kun2@zte.com.cn>
Cc: <bsingharora@gmail.com>, <david@redhat.com>, <yang.yang29@zte.com.cn>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-doc@vger.kernel.org>, <wang.yong12@zte.com.cn>,
 <wang.yaxin@zte.com.cn>, <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>,
 <tu.qiang35@zte.com.cn>, <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
 <ye.xingchen@zte.com.cn>, <xu.xin16@zte.com.cn>
Subject: Re: [PATCH linux next] tools/accounting/delaytop: add delaytop  to
 record top-n task delay
Message-Id: <20250622154847.f7ea3c8c5b2c1193bf9bcbcf@linux-foundation.org>
In-Reply-To: <20250619211843633h05gWrBDMFkEH6xAVm_5y@zte.com.cn>
References: <20250619211843633h05gWrBDMFkEH6xAVm_5y@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 21:18:43 +0800 (CST) <jiang.kun2@zte.com.cn> wrote:

> From: Yaxin Wang <wang.yaxin@zte.com.cn>
> 
> Problem
> =======
> The "getdelays" can only display the latency of a single task
> by specifying a PID, but it has the following limitations:
> 1. single-task perspective: only supports querying the
> latency (CPU, I/O, memory, etc.) of an individual task via
> PID and cannot provide a global analysis of high-latency
> processes across the system.
> 2. lack of High-Latency process awareness: when the overall
> system latency is high (e.g., a spike in CPU latency), there
> is no way to quickly identify the top N processes contributing
> to the highest latency.
> 3. poor interactivity: It lacks dynamic sorting and refresh
> capabilities (similar to top), making it difficult to monitor
> latency changes in real time.
> 
> Solution
> ========
> To address these limitations, we introduce the "delaytop" with
> the following capabilities:
> 1. system view: monitors latency metrics (CPU, I/O, memory, IRQ,
> etc.) for all system processes
> 2. supports field-based sorting (e.g., default sort by CPU latency
> in descending order)
> 3. dynamic interactive interface:
> focus on specific processes with --pid;
> limit displayed entries with --processes 20;
> control monitoring duration with --iterations;
> 
> Use case
> ========
> bash# ./delaytop

Looks nice, thanks.

>  tools/accounting/Makefile   |   2 +-
>  tools/accounting/delaytop.c | 673 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 674 insertions(+), 1 deletion(-)
>  create mode 100644 tools/accounting/delaytop.c

Some documentation would be nicer ;)

hp2:/usr/src/25> grep -rli getdelays Documentation 
Documentation/translations/zh_CN/accounting/delay-accounting.rst
Documentation/translations/zh_CN/accounting/taskstats.rst
Documentation/accounting/delay-accounting.rst
Documentation/accounting/cgroupstats.rst
Documentation/accounting/taskstats.rst

