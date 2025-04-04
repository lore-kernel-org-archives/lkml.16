Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D2A7485
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763784; cv=none; b=p4/OOjyvirDUrX4UMvUG/PGYmq/bURB8pYuVCkJrVl/pe/4h2UK5Yfkyf4nbpyAH27wuM8oFW18FxZu0HHWkXZpd9b5TTxycKe5v1UFxPb5lJxFC7nwm0ior5/U+YMq0swG2E272D2qo0dRkqoImoFMteka3lhfmp3WmeGhDaME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763784; c=relaxed/simple;
	bh=v6CyinWY6qwFHTRTg/cRXpv+/CBlp8Mnw5dTxOylzqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/JESSFNr5jHnpeXAIbGj66wL57Wwn8nk4OJyf0xx9zK0Q/N5hrusRYQK9wLi2mpFSvEiGNi9Fx4xg9dza2aDzKJLgt6VVQoGwh+RLqjZEAxZz/bC0ynlajVadPhWasZ5mFUwWluSLT84+8J0BLF66i752e2vw5cfiJv/m4OqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gdlfC51W; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gdlfC51W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AxV+7ISkIo3re5bUgy2lpjJUCDxoOLEzySs9RxQYKNs=; b=gdlfC51Wovv4a4Rwnwd2CtTIiV
	AWmxQRt2RFs4Fzdt/wEmbaAqICSfWks5Ba+pGOLVWovI9v9yg8rCH5fAeoD2Gf3IIM897i81qK1vv
	y/vCTz/WNYHI18rmpSwdK3ogkc4DH0TIfGsVyjV7nnXtP7+5fHOYWfA4zgTmn5o43f4+o162c1J0g
	VxDaJAm4d2smzh3gLCLZHmUD0ZMbXrMB+O4etWsQEBZpMKfhZteIFXdlQCpaMdeewS8SshZukBc00
	PiLFZvKXbLgym2K8NZdtzxRbc5QBIigmCqxN+b465mdiiaMkw/vMXFsH29lpq3DjBRKewYhqANNZb
	AIAseviA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ecF-0000000F9zp-0qiE;
	Fri, 04 Apr 2025 10:49:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C14C13003FA; Fri,  4 Apr 2025 12:49:38 +0200 (CEST)
Date: Fri, 4 Apr 2025 12:49:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <20250404104938.GO25239@noisy.programming.kicks-ass.net>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>

On Thu, Apr 03, 2025 at 11:48:13AM -0700, Josh Poimboeuf wrote:

> The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> represent both call semantics (SYSCALL, SYSENTER) and return semantics
> (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> control flow whereas returns terminate it.

Does that not rather suggest we should perhaps have INSN_SYSCALL /
INSN_SYSRET to replace the single ambiguous thing?


