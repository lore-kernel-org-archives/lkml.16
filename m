Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E809261593;
	Tue, 11 Feb 2025 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297687; cv=none; b=C2SIxLv5J3gHQnV5d5csKJJT4pLYjQUV+fT1k+cq/rXYAs4zUMJ0HziVh5pkgoat6XmQvW3m6H9ozFMWGE8/nL1FRz+kzplmw8Zl6htcy2aOpbdKy/UZJzFRb5fb0oWb2cWRiMu/j/x1jMsPIABn/33BlyqN44xLb9JaTi2VI3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297687; c=relaxed/simple;
	bh=Ve6Af31qmgFow5yWu9XZl78uh+gkqQq/z95zUFpfo0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CopOSQikZF4eZnKAGBXHoTEvaG9NTT2rKbxQ6DnYMonTz5fnJqDgU4FZSM3pTAL0yI8ze4l5bRhGt57IBlrJZ56wvhRHA9FhhC8UB4QNqH3CV5lwzoHiyC0TrdGoJ7c915RmguqwBFmWPQn+Ou/C363VI579CeEe+oxshbOZNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMgKSxUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMgKSxUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52123C4CEDD;
	Tue, 11 Feb 2025 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739297686;
	bh=Ve6Af31qmgFow5yWu9XZl78uh+gkqQq/z95zUFpfo0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMgKSxUogK2H1FSBMQ51ou31Jk5hswCYGucsK3uPcbmv/blZU1JKsYfEWw9poJ9qF
	 bgQTrbgTDzKFHZyJHxtPJVfiUKWVBBTipuMlZhG40HO5nsFoPBgJ+eWKHrHnyOmvuK
	 xlE2XfSg+2SrPVS8gCx/MavcUvMhRJlNRrwq+Hn8b6N5S8wK1BCqsrZU8XSqXn2GEz
	 NXU+HLkKqS0BOFgUgJMy7386QoHbZmakXH5msqfx0pWB4sFSYJdg+4wYEM13uwu6XV
	 vubwdPSgyVhFI5jI94d0Sy8NqDROr7toh5+zjfnkGY+XPOIuL7oWLUxroYJisDKk4e
	 +X3BxePQI4Sgw==
Date: Tue, 11 Feb 2025 13:14:42 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] clang-format: align consecutive macros
Message-ID: <20250211181442.GB2995885@ax162>
References: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
 <20250210-clang-format-fixes-v1-2-9bcf43a4b4b2@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-clang-format-fixes-v1-2-9bcf43a4b4b2@wolfvision.net>

On Mon, Feb 10, 2025 at 09:21:01AM +0100, Michael Riesch wrote:
> clang-format 9 introduced the option "AlignConsecutiveMacros".
> Set it to "AcrossEmptyLinesAndComments" in order to avoid macro
> definitions of the form:
> 
>     #define MAGIC_REGISTER_1 0x42
>     #define MAGIC_REGISTER_BIT_FLIP BIT(2)
>     /* important comment */
>     #define MAGIC_REGISTER_BIT_ENABLE BIT(12)
> 
>     #define MAGIC_REGISTER_2 0x43
> 
> With the option set to "AcrossEmptyLinesAndComments", they will
> be converted to
> 
>     #define MAGIC_REGISTER_1	      0x42
>     #define MAGIC_REGISTER_BIT_FLIP   BIT(2)
>     /* important comment */
>     #define MAGIC_REGISTER_BIT_ENABLE BIT(12)
> 
>     #define MAGIC_REGISTER_2	      0x43
> 
> which seems to be the convention in the kernel code base.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

I could see this being controversial in some cases but let's see what
happens.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  .clang-format | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.clang-format b/.clang-format
> index 8040b516185b..30d09cb88170 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -13,6 +13,7 @@ AccessModifierOffset: -4
>  AlignAfterOpenBracket: Align
>  AlignConsecutiveAssignments: false
>  AlignConsecutiveDeclarations: false
> +AlignConsecutiveMacros: AcrossEmptyLinesAndComments
>  AlignEscapedNewlines: Left
>  AlignOperands: true
>  AlignTrailingComments: false
> 
> -- 
> 2.34.1
> 
