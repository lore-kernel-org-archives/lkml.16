Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699912EF650
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170251; cv=none; b=kP66xaV51D5bUbAsn9SXub1ACh3ObdStkQOvCMyqn2NkNRwFFXGMGX9IIh5UR2cGiTRNJmvcb2j5Zv/YvVTvpLAvhwbYTGh/swUwVkZgEAo9YbN/JP1P+/vrfriDH0LzjYqqzN+w76cwFr+0xMqNY6YOlXC7WPXYpepJF7sZFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170251; c=relaxed/simple;
	bh=AfSSBCbzNEHA3fSyatmunRlwiz1/KayAefG3kq0T2as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uz5c0Yvi6IbsjJm4JExyN6q/tcUU33Vql56610+sUhfZi9E+R2LZZJoqRDvpv9+y/51Le2XmOx4eznAlNESb3WXnvGtZf0v4I6g3EC5MPY7m4Xe5e4lx0Jpi2RLU2NWkWPDGOSoTK0E5bd4AnNuy2CZ6cKCmsSWq1ZiZNzH+2OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85228150C;
	Tue, 17 Jun 2025 07:23:47 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A45E3F58B;
	Tue, 17 Jun 2025 07:24:06 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:24:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, kan.liang@linux.intel.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <aFF6gdxVyp36ADOi@J2N7QTR9R3>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617140617.GC1613633@noisy.programming.kicks-ass.net>

On Tue, Jun 17, 2025 at 04:06:17PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 03:33:33PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 17, 2025 at 08:14:36PM +0800, Mi, Dapeng wrote:
> > 
> > > > We're going to do a sane SIMD register set with variable width, and
> > > > reclaim the XMM regs from the normal set.
> > > 
> > > Ok, so we need to add two width variables like
> > > sample_ext_regs_words_intr/user,
> > 
> > s/ext/simd/
> > 
> > Not sure it makes sense to have separate vector widths for kernel and
> > user regs, but sure.
> > 
> > > then reuse the XMM regs bitmap to represent the extend regs bitmap.
> > 
> > But its not extended; its the normal bitmap.
> > 
> > > Considering the OPMASK regs and APX
> > > extended GPRs have same bit-width (64 bits), we may have to combine them
> > > into a single bitmap, e.g. bits[15:0] represents R31~R16 and bits[23:16]
> > > represents OPMASK7 ~ OPMASK0. 
> > 
> > Again confused, bits 0:23 are the normal registers (in a lunatic
> > order). The XMM regs are in 32:63 and will be free if the SIMD thing is
> > present.
> > 
> > SPP+APX should definitely go there.
> > 
> > Not sure about OPMASK; those really do belong with the SIMD state. Let
> > me go figure out what ARM and Risc-V look like in more detail.
> 
> So ARM-SVE has 32 vector registers with 16 predicate registers.
> 
> Risc-V Zv seems to only have 32 vector registers; no special purpose
> predicate registers, instead a regular vector register can be used as a
> predicate register.
> 
> PowerPC VSX has 64 vector registers and no predicate registers afaict.
> 
> While reading this, I came across the useful note that predicate
> registers are 1/8-th the length of the vector registers (because the
> minimal element is a byte). So while the current AVX-512 predicate
> registers are indeed 64bits, this would no longer be true for the
> hypothetical AVX-1024 (or even AVX-512 if we allow 4bit elements).
> 
> As such, I don't think we should stick the predicate registers in the
> normal group -- they really are not normal registers and won't fit for
> future extensions.
> 
> This then leaves us two options:
> 
>  - stick the predicate registers in the high bits of the vector register
>    word, or
> 
>  - add an explicit predicate register word.

TBH, I don't think we can handle extended state in a generic way unless
we treat this like a ptrace regset, and delegate the format of each
specific register set to the architecture code.

On arm64, the behaviour is modal (with two different vector lengths for
streaming/non-streaming SVE when SME is implemented), per-task
configurable (with different vector lengths), can differ between
host/guest for KVM, and some of the registers only exist in some
configurations (e.g. the FFR only exists for SME if FA64 is
implemented).

Mark.
