Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D392745E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958383; cv=none; b=ckl9dFGrQgVf+CVdZjWCuN5T/+PZKba5nTgyH3FtIMC+qq9imANnsnNCQ1KbYF8WrXiy4L6bVscH0LnOJJ7kKUBWJWF/1MMRMoCgvZvFBNep3LpJyOJUOB6xBL8UXUPt0n5TEsOB/2zkc+jSiWPb+RfpLlpwVn4cU4xU4F71KZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958383; c=relaxed/simple;
	bh=WywppakKA+fzjJMvq7vFPGshhnpNlpCXWxJ/G7TRu/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlrEEMubvq2JJ+meCLp+UdCD6fUPfQDQrG54OViEzoyhHJe8lgPU+yHl/h9uC9OSdNqhf3X25qwcrrL4BWO0oi4stoBe9YXb4lRHMviOoHhH2sL38SRUkF+U1UISgt3W7nxVaK3fkcuH9Y0V73PkMOqUhUc0SDsvdr1Snmk6MIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43D0512FC;
	Tue,  3 Jun 2025 06:46:00 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 078913F59E;
	Tue,  3 Jun 2025 06:46:14 -0700 (PDT)
Date: Tue, 3 Jun 2025 14:46:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
	geert@linux-m68k.org, broonie@kernel.org, mcgrof@kernel.org,
	joey.gouly@arm.com, kristina.martsenko@arm.com, rppt@kernel.org,
	pcc@google.com, bigeasy@linutronix.de, ptosi@google.com,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD78oNHA5SlaH50z@J2N7QTR9R3.cambridge.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
 <aD3kfTx8sF8/Yar/@e129823.arm.com>
 <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
 <aD7ZCnNUqxb9XWNh@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7ZCnNUqxb9XWNh@e129823.arm.com>

On Tue, Jun 03, 2025 at 12:14:18PM +0100, Yeoreum Yun wrote:
> > On Mon, Jun 02, 2025 at 06:50:53PM +0100, Yeoreum Yun wrote:
> > > So, what I think:
> > >   1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
> > >   2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
> > >      conditional call.
> > >   3. DAIF.D and DAIF.A handling.
> >
> > No, that is not safe. In step 2, calling ct_nmi_exit() would undo *all*
> > of the ct_nmi_enter() logic, and may stop RCU from watching if the
> > exception was entered from some intermediate/inconsistent state.
> 
> Yes if call ct_nmi_enter() without condition.
> But I imply with the condition check what I posted.
> if CT_NESTING_IRQ_NONIDLE,
> it wouldn't need call and that cpu can be watched by RCU.

I am not keen on conditionally calling ct_nmi_exit(), and would strongly
prefer to avoid that, regardless of where that lives in the flow.

I suspect that it would be bettter to triage the interrupted context
earlier, and rethink the way entry/exit works, but that's a much larger
bit of work and will take more thinking.

Mark.
