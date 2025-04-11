Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C907627D764;
	Fri, 11 Apr 2025 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353903; cv=none; b=sXv4vv2UBUV9fwfdintS+Gj/nRZvm23fWlyMCakYTB2j6AYcFSOKxpYawzQadxgxPJER/mJjBzouOQPzThoOrG843Keoixoc6dj/ahAD0zQOoPyoXtyI2wLkFryARjFtnH0JGAf9n/GJ1J2NMZTp8xwAOiYglL9dkxU2O2HUgCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353903; c=relaxed/simple;
	bh=+UDnkBpoCM7h5SqTNKdoMbsuALTg9y0wWF6k8tS4PGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoZhlLyq1tJLtDNi2ixCy3neGXamh/LzK7DCtG9ldHtTP/MIo5sf8JEmFSkqA2SXraugeTyVfENj/QwEWRrwbSHq3mSpB95p+zbn3Js8j49cVJBC/ja0YF3qhhjn7lWUqkhqI60sgX6sI+lnX/v+qt6+NNVkehE3ntIMCwwb5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cs+75EvF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cs+75EvF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+UDnkBpoCM7h5SqTNKdoMbsuALTg9y0wWF6k8tS4PGo=; b=cs+75EvFKSUWRO54eAAvLLy6ux
	Ke6Lzmo2ddgjCpSTDzroRSMvUe7GLLRku97nh4pBnKfAI3wMBrAQ0EZGr4lz9jY7D8oaKXTJNAoJK
	+KXyDwNLS1nUDN6pbGAAk/3NledNSwE5lY5ZSHiZiAiDZhNIzTpDJdOSIDaOP26sfRZLPnsbn2GB6
	GzUcUClJFycY0gg8w3q4X/SaACLWAPm3aRbATHz2m0aVmSTZbjVOf36RT7kBHh2CciLDGzvUlU6xm
	qj+NMVkLz627SvY94D+ee/xKdMAtI5d68fs089hQ9se4k/upqRZ3UYpQU9hdijgyWiwDNdR4DWeLa
	r1NddhlQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u388A-00000008x5E-1NTO;
	Fri, 11 Apr 2025 06:44:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6CDF3003C4; Fri, 11 Apr 2025 08:44:49 +0200 (CEST)
Date: Fri, 11 Apr 2025 08:44:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: Detect __nocfi calls
Message-ID: <20250411064449.GK9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net>
 <20250410154556.GB9003@noisy.programming.kicks-ass.net>
 <20250410194334.GA3248459@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410194334.GA3248459@google.com>

On Thu, Apr 10, 2025 at 07:43:34PM +0000, Sami Tolvanen wrote:

> But an allmodconfig build reveals a few more warnings:

Sigh, let me go look at all that and address Josh's feedback.

Thanks!
