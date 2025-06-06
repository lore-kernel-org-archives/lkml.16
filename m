Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5F1A38F9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225502; cv=none; b=uMap9M9pq7y9dNXSXj+34UsHDdtKNuviDeCUuE1G+GQj/uE8e5RV0BYk9vQEyfCdVjs7IUzZ69twpLbUnpxohhuaRNJ8XQ/PRoIH2zPJ+4Qf2fr2J6bzXgZSshslktRBTA3Sdl96nJKK21bsYvMHhiLrAMPrgYrB9YwNTuHi4Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225502; c=relaxed/simple;
	bh=i6VgH1PkSyX6JYvtRIoBdYOXYjwcPe1MsZt/6jpKVu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psUZDbDmJAa9EABmGOrzmMeuooBpu0rK3RZdnMjstFQb3q8Nskpw8oEaBM5GRyLps9gCttwI02ikWupYhZgxR0iUWZDBKC2jewSPTz+tgNSB2B5GuwvIKC4UKvt8DCZOO/VM7JgHooR6lJaVnnHltTFsNtmxMv9mHvdJkOgbcp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwDQfOsu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwDQfOsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749225501; x=1780761501;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i6VgH1PkSyX6JYvtRIoBdYOXYjwcPe1MsZt/6jpKVu0=;
  b=bwDQfOsuspI43oyaeDKBH5SRp80Mkmc7TKIuAdEzliWyO5qvK3tYkqoa
   QY8ETJJYkNnwLIf5naKC6ntvajM1oWkIdCuHJgDPVrC691gT0SIBtg1tK
   PhqRwPPRrbY9YI0k7xT4DMBTDpxBO6FIoJIsWTx4VTrMyIgQLwEXZoQpu
   scAOD1qWiwiq2aouFev/LTwci4OsY2j2P2XC+cQUwMDBaomB2U/bYX//S
   h1WnNZeoPCdcLYVIOPCSq5goqRlIH3TQT+SiVbKhwr6G/Ofk70ym1SFFr
   Mflo2l9LV8tpa6L9ACQXSesQfM+UH/2LJZwpuJ/nHh6RFne2AhEnIgseI
   A==;
X-CSE-ConnectionGUID: UyneHoKtQjusMm0MnPp++w==
X-CSE-MsgGUID: GKc+VJLvRVaLOKMNLRdCzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68821241"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="68821241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 08:58:21 -0700
X-CSE-ConnectionGUID: 1M6ojOgnSJ223/q1IXO8ng==
X-CSE-MsgGUID: OSpIJxdjTMaQi4oha9s2dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="176811066"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.111.31]) ([10.125.111.31])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 08:58:20 -0700
Message-ID: <ade8a82a-23c6-4a7e-968c-e4b0d4bcbc46@intel.com>
Date: Fri, 6 Jun 2025 08:58:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/virt/tdx: Enforce no indirect calls of TDX
 assembly
To: Kai Huang <kai.huang@intel.com>, peterz@infradead.org,
 tglx@linutronix.de, bp@alien8.de, mingo@redhat.com, hpa@zytor.com,
 kirill.shutemov@linux.intel.com
Cc: rick.p.edgecombe@intel.com, x86@kernel.org, samitolvanen@google.com,
 linux-kernel@vger.kernel.org
References: <20250606130737.30713-1-kai.huang@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250606130737.30713-1-kai.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It doesn't really "enforce" anything. But, oh well, I'll just fix it up
when I apply it early next week. Here's what I'll probably apply:

x86/virt/tdx: Avoid indirect calls to TDX assembly functions

Two 'static inline' TDX helper functions (sc_retry() and
sc_retry_prerr()) take function pointer arguments which refer to
assembly functions.  Normally, the compiler inlines the TDX helper,
realizes that the function pointer targets are completely static -- thus
can be resolved at compile time -- and generates direct call instructions.

But, other times (like when CONFIG_CC_OPTIMIZE_FOR_SIZE=y), the compiler
declines to inline the helpers and will instead generate indirect call
instructions.

Indirect calls to assembly functions require special annotation (for
various Control Flow Integrity mechanisms).  But TDX assembly functions
lack the special annotations and can only be called directly.

Annotate both the helpers as '__always_inline' to prod the compiler into
maintaining the direct calls. There is no guarantee here, but Peter has
volunteered to report the compiler bug if this assumption ever breaks[1].

...

> This was found through randconfig testing, presumably setting
> CONFIG_CC_OPTIMIZE_FOR_SIZE=1 when objtool spewed a bunch of these:
> 
> vmlinux.o: warning: objtool: tdh_mem_range_block+0x7e: relocation to
> !ENDBR: __seamcall_ret+0x0
> 
> Link: https://lore.kernel.org/lkml/20250605145914.GW39944@noisy.programming.kicks-ass.net/ [1]
