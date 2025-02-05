Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D08214807;
	Wed,  5 Feb 2025 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788387; cv=none; b=SwPflNqt3epv05Q9ASx2lR1I4Np3IK0MVoRnHPovqiYa4HQTdUG2KWKTc5U5YGd5L5dR9sUr2sxtUwkTmpjCibXY0oipPhrxljiI/Jr9nk7losB2uWNeQDH2U2M3Av8O8LouQl+q9O172Nu5oJuzRX+E3iIexWOkYK3HWzFPFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788387; c=relaxed/simple;
	bh=33IQOomqEyLTQbaYoSoQ2PJ57XbkscwA0pHsfJIANsE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ezjJrrye52ahzJRlpeQzfqBp57zei4ufUPWZGUUvCk9ltXkeV3vpM1hTv+WEl4fS3l2QGHC/DtPlWV1B4QOISVUpG+o1ev4spRMkKfacq9mMgKglpoxjZY6tNe+zomjyoFDoK5XAt+ccC9PBfDrTSXYpEbirUEIHkB63ByHVGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=hAl/xLVS; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="hAl/xLVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738781507;
	bh=33IQOomqEyLTQbaYoSoQ2PJ57XbkscwA0pHsfJIANsE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hAl/xLVS2r7Z4b6dKCNGQj1YxU7mBAFZLxa0QFxRcOfg9/MMOpCcpPaUILVgfMiCD
	 2Xzh/SDNcO2OkjjW/9VtrMp95w0TNdf6eYPrtPnCGFvHDmq2AGyBc7FSCpF2aiSDIy
	 PXbvCiMuZZA0WsQlqrDQ4EI9w2tceEb6ut8EvkwE=
Received: by gentwo.org (Postfix, from userid 1003)
	id 6887F401F1; Wed,  5 Feb 2025 10:51:47 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 6476D401E1;
	Wed,  5 Feb 2025 10:51:47 -0800 (PST)
Date: Wed, 5 Feb 2025 10:51:47 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, 
    xin@zytor.com, kirill.shutemov@linux.intel.com, palmer@dabbelt.com, 
    tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, ardb@kernel.org, 
    dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
    akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
Message-ID: <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1508829946-1738781507=:2407083"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1508829946-1738781507=:2407083
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Feb 2025, Jessica Clarke wrote:

> It’s not “no performance penalty”, there is a cost to tracking the MTE
> tags for checking. In asynchronous (or asymmetric) mode that’s not too


On Ampere Processor hardware there is no penalty since the logic is build
into the usual read/write paths. This is by design. There may be on other
platforms that cannot do this.


--8323329-1508829946-1738781507=:2407083--
