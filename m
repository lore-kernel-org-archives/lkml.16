Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18D235341
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806259; cv=none; b=j8o3oM5lqcSL3nYsfq4yhpOdYi13QvEW8Eu3zIfaIiezybCRr4x4umpYkNYGaDzcAehIWn5XbupizD3A75zdRraELtH+g0lzLd2JrMRtekiiWrgCQBeiXfkaiRwSP0F7kGMWGMuXixEZRP/u69h19LNQb9mWlctLXE07L+FLKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806259; c=relaxed/simple;
	bh=JNSvhZJphzb2R3JWKQWWXPPPC9qzcx+bVMWfDpNlpHM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEACYkgcabBy2Z5DbVOXMqEWxl+rJLuxSHIT6RvJj4cfHsr6WF0lyi2A8OCP78ptQgV+iD1OsrgpICvPHqsZ80OdSVV9KDZ+eTO25hn59DYoAQ3C+pqLiTk3hUxEONt6+NZh2s4YFZwAHzT+Vc8TDXucSdBMNY5KZtFXIfQgWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD8DC4CEE4;
	Fri,  9 May 2025 15:57:37 +0000 (UTC)
Date: Fri, 9 May 2025 11:57:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>
Subject: Re: [for-next][PATCH 18/31] tracing: kdb: Use
 tracer_tracing_on/off() instead of setting per CPU disabled
Message-ID: <20250509115752.029b1b7d@gandalf.local.home>
In-Reply-To: <CAD=FV=W_xhfT=oVq9qXvRqUuhG5_Wvi9=mtV+GAh+Nwvp6a7Pg@mail.gmail.com>
References: <20250509131249.340302366@goodmis.org>
	<20250509131316.483054226@goodmis.org>
	<CAD=FV=W_xhfT=oVq9qXvRqUuhG5_Wvi9=mtV+GAh+Nwvp6a7Pg@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 May 2025 08:49:06 -0700
Doug Anderson <dianders@chromium.org> wrote:

> I'm not deeply familiar with the tracing system internals, but it
> seems reasonable to me.
> 
> I did a quick sanity check and nothing went boom, too.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks for testing and reviewing!

-- Steve
