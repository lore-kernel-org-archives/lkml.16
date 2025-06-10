Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87150242D87
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592543; cv=none; b=E/04aSWhQqjMY83ACUtZH6Kozs8cGgKoc9l6gJo/HUfctqB2o5hApOvT3bCIhjmqCwc54hEkMBUw8DHp4JgMkAwQ5q1eOP0q2+3tHD6chi3NDb21tqFFeAHgjnYS3++QtNq7c5wUaO3VXH1jFsyEJykFgfigUsLBqNoICqJgMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592543; c=relaxed/simple;
	bh=Xj16gTv8cQHRdBoxI9kpIb15KESwupG+0rtgQJhUg+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6EPFIrYbKPIdBJhcJQbT4Pl6ngfiQLyGCHT+PJ9BJjBz/tugZGMB0re8P9x01nekEVte9xVJtq7GxGMGvWGrvWkp2CPh/RTsuv31nxILsGBjXksmRzN4AEIabxgdfGMhlPo421OTztcftcbP9UjaQH4FdSlTd0V2q/9kfO35FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqecH81Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqecH81Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55650C4CEED;
	Tue, 10 Jun 2025 21:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749592542;
	bh=Xj16gTv8cQHRdBoxI9kpIb15KESwupG+0rtgQJhUg+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqecH81QZoQY3nYT+HZ17/hZALUa6rJ1dxLtvJ4jdzZ4mpZJYtmHBb/YPCQ4TPx/T
	 3msAjNVPrFPYx573s4hshpdNENw9My6KoVa+N0lhVmMJ+7vU8A6lfeINY3+DFjl2Tk
	 +N2hew6lOdpjEObRV7DnZAvhPdImYKhG9LKpi/gMkv5asvCbmytBueKexFuJgDUwvq
	 ZgGbpVl3uSi84QaTtJ0p8XZQO1tsRY6v5VlhCOm7MyLuEihB+9Asq11+tKV2kh2CHD
	 o0wD77mwS0Subgmr8h3yAd1Uy1FBzIRJn6j0oiEwtuzHOAoAJcB9jhki3aM7snNY2E
	 A2wr1IRfVfWUA==
Date: Tue, 10 Jun 2025 14:55:39 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 04/13] objtool: Print symbol during disassembly
Message-ID: <hnumdfr5kr2lxtkusiusfvjcz3j67jq5y43taadjuxn6xvmupp@c54u654r7ta3>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-5-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-5-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:31PM +0200, Alexandre Chartre wrote:
> +static void disas_print_address(bfd_vma addr, struct disassemble_info *dinfo)
> +{
> +	struct disas_context *dctx = dinfo->application_data;
> +	struct instruction *insn = dctx->insn;
> +	struct objtool_file *file = dctx->file;
> +	struct symbol *call_dest, *sym;
> +	struct instruction *jump_dest;
> +	struct section *sec;
> +	struct reloc *reloc;
> +	bool is_reloc;
> +	s64 offset;
> +
> +	/*
> +	 * If the instruction is a call/jump and it references a
> +	 * destination then this is likely the address we are looking
> +	 * up. So check it first.
> +	 */
> +	jump_dest = insn->jump_dest;
> +	if (jump_dest && jump_dest->offset == addr) {
> +		DINFO_FPRINTF(dinfo, "%lx <%s+0x%lx>", addr,
> +			      jump_dest->sym->name,
> +			      jump_dest->offset - jump_dest->sym->offset);
> +		return;
> +	}

IIRC, there may be a few cases where an instruction's 'sym' field can be
NULL, might want to check for !jump_dest->sym here.

> +	/*
> +	 * If this is a relocation, check if we have relocation information
> +	 * for this instruction.
> +	 */
> +	reloc = find_reloc_by_dest_range(file->elf, insn->sec,
> +					 insn->offset, insn->len);
> +	if (!reloc) {
> +		DINFO_FPRINTF(dinfo, "0x%lx", addr);
> +		return;
> +	}
> +
> +	if (reloc_type(reloc) == R_X86_64_PC32 ||
> +	    reloc_type(reloc) == R_X86_64_PLT32)

Can use arch_pc_relative_reloc() here.

> +		offset = arch_dest_reloc_offset(reloc_addend(reloc));
> +	else
> +		offset = reloc_addend(reloc);
> +
> +	/*
> +	 * If the relocation symbol is a section name (for example ".bss")
> +	 * then we try to further resolve the name.
> +	 */

This can be checked with reloc->sym->type == STT_SECTION.

> +	sec = find_section_by_name(file->elf, reloc->sym->name);
> +	if (sec) {
> +		sym = find_symbol_containing(sec, offset);
> +		if (sym) {
> +			if (sym->offset == offset)
> +				DINFO_FPRINTF(dinfo, "%s+0x%lx = %s",
> +					     reloc->sym->name, offset, sym->name);
> +			else
> +				DINFO_FPRINTF(dinfo, "%s+0x%lx = %s+0x%lx",
> +					      reloc->sym->name, offset,
> +					      sym->name, offset - sym->offset);
> +			return;
> +		}
> +	}
> +
> +	if (offset)
> +		DINFO_FPRINTF(dinfo, "%s+0x%lx", reloc->sym->name, offset);
> +	else
> +		DINFO_FPRINTF(dinfo, "%s", reloc->sym->name);

We have offstr() which does similar things.  You might be able to get
away with replacing the above hunk with something like:

	DINFO_FPRINTF(dinfo, "%s", offstr(reloc->sym->sec, sym->offset + offset));

-- 
Josh
