Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B529827C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598322; cv=none; b=UhvHL1YHHzvrFMvjpTqIfihcS1IDod4D1Lv+PlLmaakxDcU4RBRsInrIVuI1cQqnx7CYAQUh4r3LKkgWpBTOZcRDB49N7fbK0A1DcQ297zMmOGYoVO4nCh8Enn8yCPN4OAbqD/MN1/8i/jCS/ScR0Np+usKDXDdqIa6ZJleljEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598322; c=relaxed/simple;
	bh=uBUPZlX51+Ygzet4oFDIVA/CazjT+LyaA4YD2n1o1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTm8c3KKPhsYwzB9JGGJ1Hai7RF6x03Zl7uJNmDBItMcfhUx4su5Cl2XHDJjkHM517sePNAKDuMcMtWbVUf4XimVJx3BSBN5pm5U5kpDGg01h/X3QFqGaPsm9KRTNK9BqrfisrQUALBQWdEDNA0vEZu+Gd600Be64cIRwy1enWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I77ejhIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I77ejhIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E31BC4CEF1;
	Tue, 10 Jun 2025 23:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749598322;
	bh=uBUPZlX51+Ygzet4oFDIVA/CazjT+LyaA4YD2n1o1EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I77ejhIhNQMxg57L16GC373gTJVvz0FMTibCD650u9TjWq1Vkw/8KhUCij0bbT23I
	 92wjn7na07009N/E92RdrjOfT0/t4RQ9+VHssm9nO2rRsta/WkOni8inMjqVszrdIJ
	 iJ0d+dMu1ZIo3HPRSlVK3BvfrpST/rMwa65v8g5BSKQYmqx8u2Hu7O4h+c5t1u+7kj
	 fcPsznw5TTGQxhq1iGg5KDNNzFqO5T9HRXuPUdBlSsQaP9n3I4XVKwaIqWCLB5g7Wm
	 eAzqKyVF2V6lORx9V5bQVnVsNXHqEl1X1eZapPCRjoIrKk4Nb9bNk0Bpvq5yw8ylPF
	 LHHzynkNkFGdA==
Date: Tue, 10 Jun 2025 16:31:59 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 07/13] objtool: Extract code to validate instruction from
 the validate branch loop
Message-ID: <op34sueobpwyzrxm4gmxrkzauhfzcg2wqktbjzrzg2n3gq4uiy@4zlau7mwrycm>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-8-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-8-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:34PM +0200, Alexandre Chartre wrote:
> The code to validate a branch loops through all instructions of the
> branch and validate each instruction. Move the code to validate an
> instruction to a separated function.
> 
> Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> ---
>  tools/objtool/check.c | 375 +++++++++++++++++++++++-------------------
>  1 file changed, 208 insertions(+), 167 deletions(-)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 2c73c8d3515d..36ec08b8d654 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -3527,6 +3527,11 @@ static bool skip_alt_group(struct instruction *insn)
>  	return alt_insn->type == INSN_CLAC || alt_insn->type == INSN_STAC;
>  }
>  
> +static int validate_insn(struct objtool_file *file, struct symbol *func,
> +			 struct instruction *insn, struct insn_state *statep,
> +			 struct instruction *prev_insn, struct instruction *next_insn,
> +			 bool *validate_nextp);

Since validate_insn() is always called by validate_branch(), put the
validate_insn() implementation here above validate_branch().

>  /*
>   * Follow the branch starting at the given instruction, and recursively follow
>   * any other branches (jumps).  Meanwhile, track the frame pointer state at
> @@ -3536,10 +3541,9 @@ static bool skip_alt_group(struct instruction *insn)
>  static int validate_branch(struct objtool_file *file, struct symbol *func,
>  			   struct instruction *insn, struct insn_state state)
>  {
> -	struct alternative *alt;
>  	struct instruction *next_insn, *prev_insn = NULL;
>  	struct section *sec;
> -	u8 visited;
> +	bool validate_next;

I think it's clearer if we reverse the polarity and call it "dead_end".

> @@ -3566,232 +3570,269 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
>  			return 1;
>  		}
>  
> -		visited = VISITED_BRANCH << state.uaccess;
> -		if (insn->visited & VISITED_BRANCH_MASK) {
> -			if (!insn->hint && !insn_cfi_match(insn, &state.cfi))
> -				return 1;
> +		ret = validate_insn(file, func, insn, &state,
> +				    prev_insn, next_insn,
> +				    &validate_next);

This can fit in two lines:

		ret = validate_insn(file, func, insn, &state, prev_insn,
				    next_insn, &dead_end);

> +static int validate_insn(struct objtool_file *file, struct symbol *func,
> +			 struct instruction *insn, struct insn_state *statep,
> +			 struct instruction *prev_insn, struct instruction *next_insn,
> +			 bool *validate_nextp)
> +{
> +	struct alternative *alt;
> +	u8 visited;
> +	int ret;
>  
> -				sym_for_each_insn_continue_reverse(file, func, i) {
> -					if (i->save) {
> -						save_insn = i;
> -						break;
> -					}
> -				}
> +	/*
> +	 * Indicate that, by default, the calling function should not
> +	 * validate the next instruction and validation should be
> +	 * stopped. That way this function can stop validation by just
> +	 * returning at any point before reaching the end of the function.
> +	 *
> +	 * If the end of this function is reached then that means that the
> +	 * validation should continue and the caller should validate the
> +	 * next instruction, so *validate_nextp will be set to true at
> +	 * that point.
> +	 */
> +	*validate_nextp = false;

This can be much more succinct:

	/*
	 * Any returns before the end of this function are effectively dead
	 * ends, i.e. validate_branch() has reached the end of the branch.
	 */
	*dead_end = true;


> +	default:
> +		break;
>  	}
>  
> +	if (insn->dead_end)
> +		return 0;
> +
> +	/*
> +	 * Indicate that the caller should validate the next
> +	 * instruction and continue the validation.
> +	 */
> +	*validate_nextp = true;
> +
>  	return 0;

No comment needed here.  Also this can be condensed:

	*dead_end = insn->dead_end;
	return 0;

-- 
Josh
