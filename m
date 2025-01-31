Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171C19AD89
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738364137; cv=none; b=doGDsE5F+f1T14GsRepTi6sfRuZ2VCbrfv33vRng2rBxMc37SLRDtqboqwZMxxv4QrsK/WCzL5m7Gjarr7n4elcY62Huj37WW3mhwDiAcyJ+FAQPKjPHIsjhSQunTLXRDKI/CrG1VY7+j3Vc4vwNBQJ7k2sZ1f2bdU9Q7wJYD+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738364137; c=relaxed/simple;
	bh=ie8qQTfqIv9p98IaIizAPEh9eDCtQEW/CYXeINasM4E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z5MIS5Tbc1m72i9GYk2cZtygxqq/i4AHNsAbb1ENcAt4pgPvTnj9hSHRMZ6LYRinQ0rZ0y2GFGBRP4zOPsC4b0R2FyLzkCKxEG1jFbNZWfhswXUGtKXi/POBOVp5svBbxPix30rTAdn0uSc+XUb4iVbeQB4ZTPAbcLd6Fpqv8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qwyrc54d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qwyrc54d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97ABC4CED1;
	Fri, 31 Jan 2025 22:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738364137;
	bh=ie8qQTfqIv9p98IaIizAPEh9eDCtQEW/CYXeINasM4E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qwyrc54dshDJgYqS+9b2LRCAvATgUSAfT6KUYch4Gze9MmWIw15nZnx/FKtG7hKpJ
	 SIL/M/7tFvAGwf63lmyRy2+bVm+JcG4VXFYGkzTjHaInwsdDPj7CfhJXrYULMOsYmj
	 oRF7MddNpBvlJEhd3ut79e8RdTpRvtfadB3AeKNk=
Date: Fri, 31 Jan 2025 14:55:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-Id: <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
In-Reply-To: <20250131090658.3386285-2-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
	<20250131090658.3386285-2-senozhatsky@chromium.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jan 2025 18:06:00 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> +static void zram_slot_write_lock(struct zram *zram, u32 index)
> +{
> +	atomic_t *lock = &zram->table[index].lock;
> +	int old = atomic_read(lock);
> +
> +	do {
> +		if (old != ZRAM_ENTRY_UNLOCKED) {
> +			cond_resched();
> +			old = atomic_read(lock);
> +			continue;
> +		}
> +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> +}

I expect that if the calling userspace process has realtime policy (eg
SCHED_FIFO) then the cond_resched() won't schedule SCHED_NORMAL tasks
and this becomes a busy loop.  And if the machine is single-CPU, the
loop is infinite.

I do agree that for inventing new locking schemes, the bar is set
really high.

