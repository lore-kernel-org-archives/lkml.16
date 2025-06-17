Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1224315C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148671; cv=none; b=TautEKKMT8iXS2Uoj6po8tkmLm5HDJ+eOrMJTETi40bVYInTE6YaFC0yq3Viz3r/IRZqgip1GmuEvtkyhZyAq6HZi4yYjpOkTNsWkhHGzGP7XEwSSGlD5Q7893hmpLPkUyA0NR7j3tVrj9GUhcU/Nf5MgRIrvHt1f7x6qCtDQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148671; c=relaxed/simple;
	bh=rIxgIqmZzk1165IPdk+b22pi4Z8gUU6CHw+KKu5i8oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQ4BPbqKqlKn6wu3pB0E6B5jMA5mvxayeF2AqhxCebJwzLws+jFoT2dYHq6DeXiZN9+ePfPwH9tG1XTGvFEhT+WmhNZ/Qns9h+23Mfn9SqTJw8aAd663aJ+uOZt+Q8oMqzSLtgI7x3Bx1FuPcHM5VJrw+wbxPO8QKKUR41tO4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hrlmDXag; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hrlmDXag"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z9osCeTNzmjjI9BwY975ojCKQfyswoPonw1qcry7CTs=; b=hrlmDXagpboR6JwdjtknyCATRT
	vT5QR1yKinL7GR3pwwz2hCYeIlAUqO7CHJ5nE562afMAJgPAdiDyKInbpoeljoJ8xGWymwWQVMVUn
	anWFhhxYYru7BW29kmCEzjGuKZfWcfbfeGirdGMHaJeMtS3kIDpft2YmUuQk0um3ZU1Wq+4OjaDm7
	teL5D+UNJFHJLkfrrWfqfaZMHi9KVGyECjiLgNnoCihHKIG7Jk9f0eq6rewXcdIcNEc8U+eASuHok
	bH3lJKHyw+MuAtnnRig6Qnf/lZh6cJhPLzEpfR2Isqy6W8aTSZgQQIZ9cCxjW5NLoepzBz6ZuRHoY
	j45iSpcg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRcG-00000003kFu-2EAI;
	Tue, 17 Jun 2025 08:24:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 31A4C308523; Tue, 17 Jun 2025 10:24:23 +0200 (CEST)
Date: Tue, 17 Jun 2025 10:24:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
Message-ID: <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134943.3186517-1-kan.liang@linux.intel.com>

On Fri, Jun 13, 2025 at 06:49:31AM -0700, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> Starting from the Intel Ice Lake, the XMM registers can be collected in
> a PEBS record. More registers, e.g., YMM, ZMM, OPMASK, SPP and APX, will
> be added in the upcoming Architecture PEBS as well. But it requires the
> hardware support.
> 
> The patch set provides a software solution to mitigate the hardware
> requirement. It utilizes the XSAVES command to retrieve the requested
> registers in the overflow handler. The feature isn't limited to the PEBS
> event or specific platforms anymore.
> The hardware solution (if available) is still preferred, since it has
> low overhead (especially with the large PEBS) and is more accurate.
> 
> In theory, the solution should work for all X86 platforms. But I only
> have newer Inter platforms to test. The patch set only enable the
> feature for Intel Ice Lake and later platforms.
> 
> Open:
> The new registers include YMM, ZMM, OPMASK, SSP, and APX.
> The sample_regs_user/intr has run out. A new field in the
> struct perf_event_attr is required for the registers.
> There could be several options as below for the new field.
> 
> - Follow a similar format to XSAVES. Introduce the below fields to store
>   the bitmap of the registers.
>   struct perf_event_attr {
>         ...
>         __u64   sample_ext_regs_intr[2];
>         __u64   sample_ext_regs_user[2];
>         ...
>   }
>   Includes YMMH (16 bits), APX (16 bits), OPMASK (8 bits),
>            ZMMH0-15 (16 bits), H16ZMM (16 bits), SSP
>   For example, if a user wants YMM8, the perf tool needs to set the
>   corresponding bits of XMM8 and YMMH8, and reconstruct the result.
>   The method is similar to the existing method for
>   sample_regs_user/intr, and match the XSAVES format.
>   The kernel doesn't need to do extra configuration and reconstruction.
>   It's implemented in the patch set.
> 
> - Similar to the above method. But the fields are the bitmap of the
>   complete registers, E.g., YMM (16 bits), APX (16 bits),
>   OPMASK (8 bits), ZMM (32 bits), SSP.
>   The kernel needs to do extra configuration and reconstruction,
>   which may brings extra overhead.
> 
> - Combine the XMM, YMM, and ZMM. So all the registers can be put into
>   one u64 field.
>         ...
>         union {
>                 __u64 sample_ext_regs_intr;   //sample_ext_regs_user is simiar
>                 struct {
>                         __u32 vector_bitmap;
>                         __u32 vector_type   : 3, //0b001 XMM 0b010 YMM 0b100 ZMM
>                               apx_bitmap    : 16,
>                               opmask_bitmap : 8,
>                               ssp_bitmap    : 1,
>                               reserved      : 4,
> 
>                 };
>         ...
>   For example, if the YMM8-15 is required,
>   vector_bitmap: 0x0000ff00
>   vector_type: 0x2
>   This method can save two __u64 in the struct perf_event_attr.
>   But it's not straightforward since it mixes the type and bitmap.
>   The kernel also needs to do extra configuration and reconstruction.
> 
> Please let me know if there are more ideas.

https://lkml.kernel.org/r/20250416155327.GD17910@noisy.programming.kicks-ass.net

comes to mind. Combine that with a rule that reclaims the XMM register
space from perf_event_x86_regs when sample_simd_reg_words != 0, and then
we can put APX and SPP there.


