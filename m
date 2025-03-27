Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01782080F3;
	Thu, 27 Mar 2025 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074275; cv=none; b=ty7V119dD1z44NvgXFTiaGiKO8vWUWTM3X2ILSTn0OkF5XuVrth2OslkzByANPa0Dbz6UObI00VxSGKVnTSfgFIPFUTSlCD+0NR95pGzsnj1cYu49BvUEVxbFwYKzw0CfDX/NsBwxUT8V6ZfSXWnb6hZ8CdOpLXPopZbWehvRnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074275; c=relaxed/simple;
	bh=JnSs4sc0uuHhM9WvIJBG49Qli884j11EWv32ehF08h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpQo8rsfyR6fvZ4t/gbv5Fk8jLF2Gs3bz+CDp9LcivoIsVr/23VvfyW88DS0ObQRL7Pltq0I1PDvx4ovdr6uKf8xQY+1WZrExzRvLSY8CkxO0pE0Sp6QJx0FWyClCaB7PY8R08FBLQ7uSEa3aT/VQ7CRDHrJGgmPWmVP9Ssv3Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvAYikIZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvAYikIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743074274; x=1774610274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JnSs4sc0uuHhM9WvIJBG49Qli884j11EWv32ehF08h0=;
  b=EvAYikIZrzsh6XLpdRYoN5x7QgNLsGUirn5RE+7cXqZTuKNwgYiAixLh
   7a8JzfNUhQ+UFjew+ByQwgic/jYRk991aBM+bCf0Z2ontxy1KAuFunTY+
   VbPMGdrdYEQfKgtj+0pU6xCRfaNJGWIN/jbpYkCSSZWzBDasJOd7f8RMF
   QMSIbXVGZVN9gQX7aabrwv0TWtow7KovQlranwUQhaIDR8ABWUiP6ajow
   aXg/LyKNnMNqa/+EAbGZXMrfgG9KRJ7zdTXqKwKngEw0T1fxtbptupmpD
   JojiYzTm9j66uDB8zxfRd3bB9vfg7tqhPzmfUJjiqr1QsLbcu+OdnUy9O
   w==;
X-CSE-ConnectionGUID: 149IYMTpSPyajAGT11si8g==
X-CSE-MsgGUID: mNAwmU/oSlGgZ1kTA93y5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55766548"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="55766548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:17:53 -0700
X-CSE-ConnectionGUID: 0VytSBTOQ6C6bDBbt83yjw==
X-CSE-MsgGUID: 5PhZPsMyQbqxh+PhQmQhaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125126765"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 27 Mar 2025 04:17:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DA28E1AE; Thu, 27 Mar 2025 13:17:49 +0200 (EET)
Date: Thu, 27 Mar 2025 13:17:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] thunderbolt: do not double dequeue a request
Message-ID: <20250327111749.GW3713119@black.fi.intel.com>
References: <20250327055314.8679-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327055314.8679-1-senozhatsky@chromium.org>

Hi,

On Thu, Mar 27, 2025 at 02:52:54PM +0900, Sergey Senozhatsky wrote:
> Some of our devices crash in tb_cfg_request_dequeue():
> 
>  general protection fault, probably for non-canonical address 0xdead000000000122: 0000 [#1] PREEMPT SMP NOPTI
> 
>  CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65-06391-gbdec63d10750 #1 (HASH:cf42 1)
>  RIP: 0010:tb_cfg_request_dequeue+0x2d/0xa0
>  Call Trace:
>  <TASK>
>  ? tb_cfg_request_dequeue+0x2d/0xa0
>  tb_cfg_request_work+0x33/0x80
>  worker_thread+0x386/0x8f0
>  kthread+0xed/0x110
>  ret_from_fork+0x38/0x50
>  ret_from_fork_asm+0x1b/0x30
> 
> The circumstances are unclear, however, the theory is that
> tb_cfg_request_work() can be scheduled twice for a request:
> first time via frame.callback from ring_work() and second
> time from tb_cfg_request().  Both times kworkers will execute
> tb_cfg_request_dequeue(), which results in double list_del()
> from the ctl->request_queue (the list poison deference hints
> at it: 0xdead000000000122).

I remember seeing similar but it was long time ago.

> Do not dequeue requests that don't have TB_CFG_REQUEST_ACTIVE
> bit set.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/thunderbolt/ctl.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index cd15e84c47f4..3ad15febc7df 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -151,7 +151,12 @@ static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
>  	struct tb_ctl *ctl = req->ctl;
>  
>  	mutex_lock(&ctl->request_queue_lock);
> -	list_del(&req->list);
> +	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
> +		mutex_unlock(&ctl->request_queue_lock);
> +		return;
> +	}
> +
> +	list_del_init(&req->list);

Why this change? We are not putting the req back to the list anymore.
Otherwise this looks good to me.

> 
>  	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
>  	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
>  		wake_up(&tb_cfg_request_cancel_queue);
> -- 
> 2.49.0.395.g12beb8f557-goog
