Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3F1D8A0A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127177; cv=none; b=cwQgzNaLlhBcIwLB6GffwL7CiqGboLcJwmXRKpASrrwS0B8a6JSTk+ZU8DU6dvuR2gBatqnrjaaBLyGOEvXieNA9DQ3PScdfEU7fQPS1Gvam6gttoO11g2Y00zM9JnXr17OPOR0cKQX71H/9Kyhff3ZkPt+4x3jtG8+DsxqwUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127177; c=relaxed/simple;
	bh=KkVqRl7kNIscnV92hznnT5Eju0cYVXu90jpfBstwsNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obbdRZkM3s4Xqejskjw6O/Pcni3MoIGsSdf6ESPKD5OE8rUwTGebanWAOk4aNrDOJ/zR6ImkB/WoJtDUF2JdSZYnxR+naahe+l+4HEAyZeshGM8WpX66yiq3rfMLBFSRp0L+y3gD7GpRSWdZGkyqqaMbjT8b+5B/M4iQGoXOvAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7BF61691;
	Thu,  5 Jun 2025 05:39:10 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CDFE3F673;
	Thu,  5 Jun 2025 05:39:26 -0700 (PDT)
Date: Thu, 5 Jun 2025 13:39:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>
Subject: Re: [PATCH] optee: ffa: fix sleep in atomic context
Message-ID: <20250605-spicy-mackerel-of-poetry-9948b8@sudeepholla>
References: <20250602120452.2507084-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602120452.2507084-1-jens.wiklander@linaro.org>

On Mon, Jun 02, 2025 at 02:04:35PM +0200, Jens Wiklander wrote:
> The OP-TEE driver registers the function notif_callback() for FF-A
> notifications. However, this function is called in an atomic context
> leading to errors like this when processing asynchronous notifications:
> 
>  | BUG: sleeping function called from invalid context at kernel/locking/mutex.c:258
>  | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kworker/0:0
>  | preempt_count: 1, expected: 0
>  | RCU nest depth: 0, expected: 0
>  | CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0-00019-g657536ebe0aa #13
>  | Hardware name: linux,dummy-virt (DT)
>  | Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
>  | Call trace:
>  |  show_stack+0x18/0x24 (C)
>  |  dump_stack_lvl+0x78/0x90
>  |  dump_stack+0x18/0x24
>  |  __might_resched+0x114/0x170
>  |  __might_sleep+0x48/0x98
>  |  mutex_lock+0x24/0x80
>  |  optee_get_msg_arg+0x7c/0x21c
>  |  simple_call_with_arg+0x50/0xc0
>  |  optee_do_bottom_half+0x14/0x20
>  |  notif_callback+0x3c/0x48
>  |  handle_notif_callbacks+0x9c/0xe0
>  |  notif_get_and_handle+0x40/0x88
>  |  generic_exec_single+0x80/0xc0
>  |  smp_call_function_single+0xfc/0x1a0
>  |  notif_pcpu_irq_work_fn+0x2c/0x38
>  |  process_one_work+0x14c/0x2b4
>  |  worker_thread+0x2e4/0x3e0
>  |  kthread+0x13c/0x210
>  |  ret_from_fork+0x10/0x20
> 
> Fix this by adding work queue to process the notification in a
> non-atomic context.

Tested-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
