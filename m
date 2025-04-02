Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC19524C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573258; cv=none; b=UykvnZwDvY5bGxZDBRLqMINC0x4f2AD4aRt6qU+fy5/CLz3v8lz3uyoe/LJj2VHdiBYp7LyRJPUC+KeE8PHr2OAgXDWROrijw63Zp89cMjYfqd3q+iMjlpPLFHzBrtZv0mTNZIBekQl8J9ooPqGo37/X3kDQBv/qDb36s+AmZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573258; c=relaxed/simple;
	bh=xKtsK1Gzv7eBwRj8w+GLlG9DQFAmEcVSYHPgJmUUu1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWMIh0cbV987kkmyge27VBRHIFcII3EK3CKyXK1eLxcVtwYKlfMx+jO8N65POgec6wooP2+MUzTbJnWjZQpF0eYmyIYliPBv14URLSyTSUugc1SYjEA3w2FUcZ+4yDTjk+tWkQ6YMk3TOMu9k8lkUo5ji/omGwbUF44+OfxBup0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZx2LWQY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZx2LWQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03621C4CEE9;
	Wed,  2 Apr 2025 05:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743573254;
	bh=xKtsK1Gzv7eBwRj8w+GLlG9DQFAmEcVSYHPgJmUUu1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZx2LWQYaC/nL/EJPNh3Gbm+dJL8xMXHKlJ5A3CpnMiny+c1aC52EU+d/ae7SLFPU
	 JfOfIus9VAwYrEE5Espq5M6eoJ+COZRaGvEKkta36GkE2F6w9dn3h5tyTcxcSiwGbv
	 iEv6LFiVt8UeOhleFh4LexHKmDu5BAe5WPgkVdjrinRi+qpTk5xnGHEoBlx3v3LXSI
	 wCnQyIf/Xj7fSpvJqnoD1tj50VBsSHQFY1mBJdSPl/xf4xHEkxKGeXpYXknVc1MxuQ
	 WKvPLUcHEQkBjp3uguOkZ9fqPrh75hZT4z/T9bGGe4wABTR9US/mp3lauA7r+IcfIG
	 3TUcEwjfWrW+w==
Date: Wed, 2 Apr 2025 08:54:09 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Loehle <Christian.Loehle@arm.com>
Subject: Re: [for-linus][PATCH 1/4] ftrace: Have tracing function args depend
 on PROBE_EVENTS_BTF_ARGS
Message-ID: <20250402055409.GB84568@unreal>
References: <20250402022308.372786127@goodmis.org>
 <20250402022334.683869963@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402022334.683869963@goodmis.org>

On Tue, Apr 01, 2025 at 10:23:09PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The option PROBE_EVENTS_BTF_ARGS enables the functions
> btf_find_func_proto() and btf_get_func_param() which are used by the
> function argument tracing code. The option FUNCTION_TRACE_ARGS was
> dependent on the same configs that PROBE_EVENTS_BTF_ARGS was dependent on,
> but it was also dependent on PROBE_EVENTS_BTF_ARGS. In fact, if
> PROBE_EVENTS_BTF_ARGS is supported then FUNCTION_TRACE_ARGS is supported.
> 
> Just make FUNCTION_TRACE_ARGS depend on PROBE_EVENTS_BTF_ARGS.
> 
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Link: https://lore.kernel.org/20250401113601.17fa1129@gandalf.local.home
> Fixes: 533c20b062d7c ("ftrace: Add print_function_args()")
> Closes: https://lore.kernel.org/all/DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com/
> Reported-by: Christian Loehle <Christian.Loehle@arm.com>
> Tested-by: Christian Loehle <Christian.Loehle@arm.com>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  kernel/trace/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Tested-by: Leon Romanovsky <leon@kernel.org>

Thanks
