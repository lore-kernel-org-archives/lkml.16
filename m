Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1C22539D;
	Tue, 29 Apr 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944368; cv=none; b=LyhvopFmnlbUA2m+4a2SNysb5cAPygC3AA+2OweOiRVhhN27CRa4LX/DNf3qkPeNKm1l4It+WgXFpJ44WnAs079XAKy7bRlpswCa06qyj7Al/MGhc+/AKEhOz6lwg4YRCEU5suuniGy97boswLrOF8iLlE+QwA0HAYfeOWIWqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944368; c=relaxed/simple;
	bh=feUIYWjgsatR0wsDBnR320zo35FzttrKF/ike0EndGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWBSxcAhV9ytSHIaFGohhOjjCnsqqjOJ4hRqPu2tlYanG1u8MnA3sBb19gbZlwvtsrNWqbj104rxyvAEF1MwnybCOlylbCGbrCFkEyf0XPXSELU9Bq53lGP+HUlIZ8+oPpSumOSmmaOfvG4C2bLgN6TiXn6zEioWnZld0q0l80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGIHmtRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGIHmtRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54235C4CEE3;
	Tue, 29 Apr 2025 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745944368;
	bh=feUIYWjgsatR0wsDBnR320zo35FzttrKF/ike0EndGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGIHmtRoeMc5skK+Uret9+sNF7RFNy3BEWPrbyWSDJ+5SRrf7mtw1bAaMaUc6Xpj8
	 cYPvdk+7/ciq2q8+VgFYyN7TT6ImhpLntVfyBRLNgAZjSDnD9Id6MvYJbX/7QMkwCm
	 OActXunbzjeRJyiT8rrBVDY9bRcxWjIjlkS79dq1HDDVQSGzoyxM2WU1eGEaBF3nEo
	 Ov0OcO8fHJCJgb5p86Z9lkWvoV9LqaeYYsDCuW1pKfMqxL2G7G7BdHP0mkU+FKXbR4
	 cOVOWOMT+9kujdP/3J71kDyjtlIDIzSdgSPSHd7D6d+NXNL58zUquXaMgCAakyuoel
	 J6QVYo/6Endyw==
Date: Tue, 29 Apr 2025 19:32:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net,
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com,
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com,
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de,
	robh@kernel.org, rostedt@goodmis.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, tglx@linutronix.de,
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 11/14] x86: add KHO support
Message-ID: <aBD_IUE6xmbphB5R@kernel.org>
References: <20250411053745.1817356-1-changyuanl@google.com>
 <20250411053745.1817356-12-changyuanl@google.com>
 <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>
 <aBCIhQjKKyaAuvC9@kernel.org>
 <d64a4593-c9bd-42c7-81f6-137a22ff5caa@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d64a4593-c9bd-42c7-81f6-137a22ff5caa@intel.com>

On Tue, Apr 29, 2025 at 09:06:19AM -0700, Dave Hansen wrote:
> On 4/29/25 01:06, Mike Rapoport wrote:
> > On Mon, Apr 28, 2025 at 03:05:55PM -0700, Dave Hansen wrote:
> >> On 4/10/25 22:37, Changyuan Lyu wrote:
> >>> From: Alexander Graf <graf@amazon.com>
> >>>
> >>> @@ -1300,6 +1300,24 @@ void __init e820__memblock_setup(void)
> >>>  		memblock_add(entry->addr, entry->size);
> >>>  	}
> >>>  
> >>> +	/*
> >>> +	 * At this point with KHO we only allocate from scratch memory.
> >>> +	 * At the same time, we configure memblock to only allow
> >>> +	 * allocations from memory below ISA_END_ADDRESS which is not
> >>> +	 * a natural scratch region, because Linux ignores memory below
> >>> +	 * ISA_END_ADDRESS at runtime. Beside very few (if any) early
> >>> +	 * allocations, we must allocate real-mode trapoline below
> >>
> >> 						trampoline ^
> >>
> >>> +	 * ISA_END_ADDRESS.
> >>> +	 *
> >>> +	 * To make sure that we can actually perform allocations during
> >>> +	 * this phase, let's mark memory below ISA_END_ADDRESS as scratch
> >>> +	 * so we can allocate from there in a scratch-only world.
> >>> +	 *
> >>> +	 * After real mode trampoline is allocated, we clear scratch
> >>> +	 * marking from the memory below ISA_END_ADDRESS
> >>> +	 */
> >>> +	memblock_mark_kho_scratch(0, ISA_END_ADDRESS);
> >>
> >> This isn't making a whole ton of sense to me.
> >>
> >> Is this *only* to facilitate possible users that need <ISA_END_ADDRESS
> >> allocations? If so, please say that.
> >>
> >> I _think_ this is trying to say that KHO kernels are special and are
> >> trying to only allocate from scratch areas. But <ISA_END_ADDRESS
> >> allocations are both necessary and not marked by KHO _as_ a scratch area
> >> which causes a problem.
> > 
> > Yes :)
> 
> So, on both of these, could the submitters please add or revise the
> comments to make it more clear?

Is this one clearer?

	/*
	 * At this point memblock is only allowed to allocate from memory
	 * below 1M (aka ISA_END_ADDRESS) up until direct map is completely set
	 * up in init_mem_mapping().
	 *
	 * KHO kernels are special and use only scratch memory for memblock
	 * allocations, but memory below 1M is ignored by kernel after early
	 * boot and cannot be naturally marked as scratch.
	 *
	 * To allow allocation of the real-mode trampoline and a few (if any)
	 * other very early allocations from below 1M forcibly mark the memory
	 * below 1M as scratch.
	 *
	 * After real mode trampoline is allocated, we clear that scratch
	 * marking.
	 */
	memblock_mark_kho_scratch(0, SZ_1M);

-- 
Sincerely yours,
Mike.
