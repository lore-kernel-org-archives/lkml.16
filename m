Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503BF156677
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518189; cv=none; b=hXH85/u1FlHWxBdKK6Ktmj/vru6HaIR80a+2/0tV0BNhHDN3AJApQ0ci3sWH9lPv/+d1NoGwizLmxOiht00aV02s5IrE8JuznxTXzk9ZERNexctadg1fUb/ASU694PjsUNuzVmXf+BU56nA+n1d3/E3aBFzdEVuawShYmlm2GUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518189; c=relaxed/simple;
	bh=4JEA8eMt9kk+dVH69DFHzTsA7uuftqyjO+g5kiV/1S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiTTsn573uSK1gIcyrDTYYS7nnoDY5jCinudhLOPkuKsfXvH9zOFUDo1zEnjDaZZGt9yyANgjhVe+AAhUT2gYPyBoAAnMvmU3cj1Izb+1+cqxsuLBJ9Feg9XbZrDdYakAMT6vpsopDD7rwDzyxY912HTDrY20P4XxwZZYhw/IAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tc5w9kYZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tc5w9kYZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rKQHqNA0aHvOavHoKJOw72GZ342RW2H3i3/P6T7lZ2k=; b=Tc5w9kYZqtFyaAFpHep0tVWFpv
	FexGMMgjL3t0wy8Fkqx976Fl6fzWqmBdVsjvOrSpoXpwonMujc5w9F/KBYweyaCSJDgG+YjpXjH6e
	KaJquTEPvKIuteiBnPuRKA4kjjU3eKbT3SmspaE6uWgD5kdbULW2AwAVhREbOYaLV7BINtZ1hjSZu
	4kzfac5b/Nr0NYt5XGLhu7g7qY6H7iRf7mYGikLhOmi9eTkcBJ1JIeUJ6g/C16ZWCnaaWqqGb2Nth
	fN6QK7Fo0m6uvRoiOzSaJHUKij7ZSg4nbkdj2eRAeHKnGCW0jaaxYnseMDHZUG7X/2z31/gKBPx19
	qYposuyQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcj3-00000006pcT-0L0k;
	Tue, 01 Apr 2025 14:36:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B195D30049D; Tue,  1 Apr 2025 16:36:24 +0200 (CEST)
Date: Tue, 1 Apr 2025 16:36:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 11/49] x86/alternatives: Remove the confusing, inaccurate
 & unnecessary 'temp_mm_state_t' abstraction
Message-ID: <20250401143624.GI5880@noisy.programming.kicks-ass.net>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-12-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328132704.1901674-12-mingo@kernel.org>

On Fri, Mar 28, 2025 at 02:26:26PM +0100, Ingo Molnar wrote:
> So the temp_mm_state_t abstraction used by use_temporary_mm() and
> unuse_temporary_mm() is super confusing:

I thing I see what you're saying, but we also still have these patches
pending:

  https://lkml.kernel.org/r/20241119162527.952745944@infradead.org

:-(
