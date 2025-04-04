Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E02E62C1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799423; cv=none; b=ufQeQ0PwCLBqYxxVL2cfaH1H4Aoqb7oIbZYbjyhkvi00ZYTNGvRAlTIyPd+3JMKouT26OkK2VWZRSsbZTrp7RY+/flErG9AWGQtlIcCm2X9BwkssY6lMG/kRe+d+Xcp3klwzsrQtzWUIe2zcdSF2RR7Fkwm/9lEvbAfZw25ZRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799423; c=relaxed/simple;
	bh=8APeV201Y+6vVCNaOQ6iDP/q+cDa6EvJsPDgwlQHwcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZMsz1wfYQVQNnQh6asYFaYVO6hosV2endLVwRmJ2v1TM5Cz2bcbu3kda1/9QBauBeqaaZtQYZv4AChA5aiXilUOcgh9QPlG5WvuA7nQpiWnH9Bpu53ArDr/2aAIEdHR1Dx3Xd56KKBocRzGIK0KgrM0CAttVTzKpPO4/3r3Alk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TB6GkaPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TB6GkaPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DCDC4CEDD;
	Fri,  4 Apr 2025 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799423;
	bh=8APeV201Y+6vVCNaOQ6iDP/q+cDa6EvJsPDgwlQHwcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TB6GkaPSCA0UORMW8Yndvw4HYO0SbJC6aJxE5WpJ6NseKXu1XoHLkUQeH5GmbpnO2
	 Mr8otCQ/3tjl7349vImmcke3be7mJh2UQdRUDEhmgEfHCfJmSKRqFM/tPSUBM26QMu
	 XGuEz0XwU2JKRr6A6uJ/n2SENExJiyrckgK0ajVFphcKq0HGrno1R6zt/mprqCANqy
	 LuyxqmVbrG7M6znHoWewyW1w4XcWqx1PWgIERotdVrgp2JZ01FO55PRUUJDVEoYDJG
	 +Mi7CF8KtLn5DUYXYzEhRCQV70iKkIlMBRikRJ6cv2dgilSv+Hy/wcHKY4nwsEaIad
	 RlEXs555YVG9w==
Date: Fri, 4 Apr 2025 13:43:40 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <dcnydqwrzh5yjbckuzjvh3aibm2j6xdvqwukqrudtenihi3iyc@ifqtntvhbwfb>
References: <b1c60a498c6146de0706572d3f47d3723ca91743.1743797052.git.jpoimboe@kernel.org>
 <n64kpy635gwplph5uyxzek5p73u7ubuspjtpegtssr74krjpw2@uhsaautjvu4b>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <n64kpy635gwplph5uyxzek5p73u7ubuspjtpegtssr74krjpw2@uhsaautjvu4b>

On Fri, Apr 04, 2025 at 01:23:43PM -0700, Josh Poimboeuf wrote:
> On Fri, Apr 04, 2025 at 01:06:26PM -0700, Josh Poimboeuf wrote:
> > With SYSCALL and SYSENTER removed, INSN_CONTEXT_SWITCH now has a sane
> > well-defined return semantic.
> 
> Argh, this last paragraph doesn't mention the rename of
> INSN_CONTEXT_SWITCH.  Changed to:
> 
> With SYSCALL and SYSENTER removed, INSN_CONTEXT_SWITCH now has a sane
> well-defined return semantic.  Rename it to INSN_EXCEPTION_RETURN to
> better reflect its meaning.
> 
> > v2:
> > - rename INSN_CONTEXT_SWITCH -> INSN_EXCEPTION_RETURN
> > - clarify that xen SYSCALL is a hypercall
> > - check for SYSEXIT

This version introduced a bug, please ignore.

-- 
Josh
