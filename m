Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494518E3F;
	Fri,  2 May 2025 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196270; cv=none; b=ldBO2DC5ec2TTnH1LSABcWabIxCm/7ZFde0Tnv6cniHmT5IG5Aojen8g293RR8TzaM9NyRGa4ltk6YZ4fFMfB5IHa1bF5luw0hF9lObaBpnVztQlhKQcugiVIEzK/XxuGLOtYU2I++rYlD3RcVm2a567BDk8WN5J8ZnchCa7DZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196270; c=relaxed/simple;
	bh=mf8XsoB1aBck5+SO7c7/AHeQPBhCUYYifaR1NSzuvH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/+GZUrLRepXgCwEnsHNdM+rD4A65lZPKppWfpjh38Dhw2TQrUjDWxRp3gVhK3Tae87iKD35QSAvcwvOjeYfNmPmuQUmjQ+4ZPo8OOiANCONIA9kVa7hMonbHMZmt0DckBNbYioGIMw2PIyml789RsJ2F8o9d9u/v3nrN+EnyvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E5iEluk6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E5iEluk6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eaJRhq/LPWLeRV5AAUAremjdu0Wx7433M8VtPQ7w/9s=; b=E5iEluk6H0WmxRNwWdAC1xnKq5
	nR1JWqWonmSreVtsOdrEBqSanhpaGILnf8nAEW0w7uT4OSjElNq//ut1RHHU/dHZ233kIgSg5hIR9
	UsZXcVd1hbKY/cgwy/5HW2lPvZzVkfO5+dbUpt7dLL7HJ9OMZR0/BUKwnbwKLDsBzblQzGt15G2vn
	SdkkFRWNvIqoF7czceiaqZT+ZdN/lccPUfXz+SN77w/rez6Bhxtuhp54H9CHQxZRf/G9wtm/QVEaO
	2hJfmzI1pinUeTsAb0TxyJ6QwvQZsSp5nmfrxAJ4ZVaRJPC5JlNBFc0I8WT9Vctan0jFaejPLdd1J
	I314kHMg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uArPm-0000000EzXZ-2mbl;
	Fri, 02 May 2025 14:30:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3706330035E; Fri,  2 May 2025 16:30:58 +0200 (CEST)
Date: Fri, 2 May 2025 16:30:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] x86/reboot: KVM: Guard
 nmi_shootdown_cpus_on_restart() with ifdeffery
Message-ID: <20250502143058.GV4439@noisy.programming.kicks-ass.net>
References: <20241008191555.2336659-1-andriy.shevchenko@linux.intel.com>
 <ZwbazZpTSAn9aAC7@google.com>
 <ZwcT149jx-iOmEfl@surfacebook.localdomain>
 <ZykbvVZ32FKCRT_q@smile.fi.intel.com>
 <Z_UUXOe61BwVkGob@smile.fi.intel.com>
 <f670905f-f14b-4482-83ee-568234647f46@intel.com>
 <Z_U0Vn0V18KYGjkP@smile.fi.intel.com>
 <d40efb68-eb4e-4158-9dc6-5de101adefd1@intel.com>
 <aBTQ7-L-bUwzYbKM@smile.fi.intel.com>
 <ba00197d-dc21-47bd-b183-4971038d9a8d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba00197d-dc21-47bd-b183-4971038d9a8d@intel.com>

On Fri, May 02, 2025 at 07:24:37AM -0700, Dave Hansen wrote:
> On 5/2/25 07:04, Andy Shevchenko wrote:
> > Can it be applied, please? The problem still persists as of today (v6.15-rc4).
> 
> I fundamentally disagree with the idea that the kernel programmer should
> be doing the work of telling the compiler *exactly* when a static inline
> function is unused. Compilers are good at that, humans are not.
> 
> The "fixes" for these issues generally make the code worse, not better.
> 
> I'd frankly rather have a kernel with some unused 'static inline'
> functions in .c files than one filled with #ifdefs to shut up the compiler.

Yeah, this unused function warning nonsense is terribly annoying :/
