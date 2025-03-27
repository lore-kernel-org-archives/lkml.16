Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EE01805B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743041136; cv=none; b=JMe4ApzHrlBa1paKyd1zklLOZbeEcvR3tqCp7QqI2YZ52oBhgScSt4YRvSHwdHgjB+7nso8yYVIRjbQ3/eBox1om6QqCcPxVU17ZwpgWDa5E2g+TL2lRJcoTl5LHQWnIXgqCFuSg9+NPBAKd4A/h8KrX0ab2HZ65UM+q0gsMjPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743041136; c=relaxed/simple;
	bh=AgWbwmnNSHA6/qtWXnAjlGW46+t0HUkZWYTOV9v5bcs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZZgaGNwt0eRJJSP9LeyHzvuyJYvErpGsseZgxOzzE6NE6x7aCMkFI4SyL1BSL6lAX9tpsoXB8/qWRcfVXZdydGnILrFICvWkEFqFFOQRxQeOt1sIpgpPHTleLEq/O0qJDhg9CCKFjmH6B4pYoEW4eAznG9qVfkbkj/9HeveXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AB6C4CEE2;
	Thu, 27 Mar 2025 02:05:33 +0000 (UTC)
Date: Wed, 26 Mar 2025 22:06:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Libo Chen <libo.chen@oracle.com>
Cc: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
Subject: Re: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the
 skipping of numa balancing due to cpuset memory pinning
Message-ID: <20250326220620.60cec3b6@gandalf.local.home>
In-Reply-To: <bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
References: <20250327002352.203332-1-libo.chen@oracle.com>
	<20250327002352.203332-3-libo.chen@oracle.com>
	<bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Mar 2025 17:40:02 -0700
Libo Chen <libo.chen@oracle.com> wrote:

> > +	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",  
> 
> 
> I cannot find a way to print out nodemask_t nicely here with %*pbl.
> So I fall back to just raw hex value. Will be grateful if someone
> knows a better way to print nodemask nicely in a tracepoint  

Ug.

I guess I need to add support for that. Both in the boot verifier as well
as in libtraceevent.

-- Steve
