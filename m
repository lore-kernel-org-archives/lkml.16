Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967C2147FE;
	Mon, 31 Mar 2025 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439138; cv=none; b=J60OJXGzzZzvmdoP11JYD9UX7IThRd7bf7Opnu0EGLP42dqsX3G/jjXoIwkrk61X6qvlnzIYa0X8yipprR5hC4A9L3qLZVeJtw1FfoyLcHo7vTTOT8wqMCc2IpmXM6UGzmR8upt5D4dMHGjcpyOACz2BOUp+sdqu6DjqSjLNdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439138; c=relaxed/simple;
	bh=xHN+i9yatPAWd3liQpkEH5aaibD0Z4p+P4ei0M7bKgs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIv4mV2/BC46CEzPv7M91OygYxjBvFYTxWkWswFMl4edCa4QlXMFubFQk/vfopCglFH4C07SPy25+wtGaYe745oYtzy5wyPsBuPYzZGP6v6hNXzl+BoTbY591zdgtPdpjbTJMOELF+/OeCLifuJzqDaW9o4ucMuwIEd4Ow44YKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF565C4CEE3;
	Mon, 31 Mar 2025 16:38:56 +0000 (UTC)
Date: Mon, 31 Mar 2025 12:39:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>
Subject: Re: kernel/trace/rv/rv.c:838 rv_register_monitor() warn:
 inconsistent returns 'global &rv_interface_lock'.
Message-ID: <20250331123955.4a3d261c@gandalf.local.home>
In-Reply-To: <bc1fe7c1-a042-42b2-8d40-7621ef0087b9@stanley.mountain>
References: <bc1fe7c1-a042-42b2-8d40-7621ef0087b9@stanley.mountain>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Mar 2025 12:43:54 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> cb85c660fcd4b3a Gabriele Monaco            2025-03-05  809  	if (p && rv_is_nested_monitor(p)) {
> cb85c660fcd4b3a Gabriele Monaco            2025-03-05  810  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
> cb85c660fcd4b3a Gabriele Monaco            2025-03-05  811  			parent->name);
> cb85c660fcd4b3a Gabriele Monaco            2025-03-05  812  		return -EINVAL;
> 
> mutex_unlock(&rv_interface_lock);

Julia beat you to it ;-)

  https://lore.kernel.org/all/alpine.DEB.2.22.394.2503302037080.23941@hadrien/

-- Steve
