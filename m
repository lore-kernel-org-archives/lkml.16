Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04214B1E7F;
	Wed,  7 May 2025 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660161; cv=none; b=Ql761J1PI5Y13cjLt6hNf4C+7zA/c2K1PB1sGYJjdx7Y4qubHW699XYS3gPZyKx44/IG9i02gUCpAUgX2xGLw4PKPegqH0+nxxiJKpl42vMYpOSwxPNKD1Qs3QhZgg8yHRoJvetVi1QibzZM462xFkotK2v2nIVVx3h12as+mro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660161; c=relaxed/simple;
	bh=eTAAUq8Exiy5vFJmPSchOTFY2L1k+AdhhEOvimsEfho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBE/Wob8vl96ANF1Vb52wj6mQBOQFFekeORPSeybj8FhNwA555guUXf7aFUlYc1vWvtSFlcevPqKHDHxIFMxW3FhYH0lUafR08prtfz3JAoL/s5JMDWwTf5cmTNxIG9+j5uDZopOFbX3e1BEAl5ksKHQ0JCfzcIw4aEYEE52TiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKZ+QQMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKZ+QQMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63727C4CEE2;
	Wed,  7 May 2025 23:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746660160;
	bh=eTAAUq8Exiy5vFJmPSchOTFY2L1k+AdhhEOvimsEfho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKZ+QQMcX4h7eMeBtdwgUpTbevAakjLf5kGZc6IZtx7OtKBMmpOEU7cmkr8rL1mav
	 lxcSmxC4Z9AKz1dmT05t+EYy2U3+eIVJDtIpdO+1pgxZiCCqxj5gVdr54vdcbT28tD
	 l5F2b3nJ3FR+SVJdEX4NMb6tqaj9GZe3WtGQQfU9m3tX4DQhLBPAaZ6wS5B+invN6h
	 gJt+rK7Lwudk8rOP2lEA78pWFt8a1zJZ8JTjhyKjgJ5zDYI7nQ+RlZhp9JdtJJT1x5
	 /ly17PnImBJjEHQQmdP2D0VlGA0f+FRLBE0LGGVuNnAKIB3qpxuruBcRsfMY9+0yC2
	 iGS9470EEN2bA==
Date: Wed, 7 May 2025 16:22:37 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: tip-bot2 for Rong Xu <tip-bot2@linutronix.de>
Cc: linux-tip-commits@vger.kernel.org, Rong Xu <xur@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [tip: objtool/core] objtool: Fix up st_info in COMDAT group
 section
Message-ID: <jj4fu243l7ap4bza5imrgjk5f5dhsoloxezgphdjwo7sb5iqsq@wkt46abbt45r>
References: <20250425200541.113015-1-xur@google.com>
 <174601619410.22196.10353886760773998736.tip-bot2@tip-bot2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174601619410.22196.10353886760773998736.tip-bot2@tip-bot2>

On Wed, Apr 30, 2025 at 12:29:54PM +0000, tip-bot2 for Rong Xu wrote:
> The following commit has been merged into the objtool/core branch of tip:
> 
> Commit-ID:     2cb291596e2c1837238bc322ae3545dacb99d584
> Gitweb:        https://git.kernel.org/tip/2cb291596e2c1837238bc322ae3545dacb99d584
> Author:        Rong Xu <xur@google.com>
> AuthorDate:    Fri, 25 Apr 2025 13:05:41 -07:00
> Committer:     Peter Zijlstra <peterz@infradead.org>
> CommitterDate: Wed, 30 Apr 2025 13:58:34 +02:00
> 
> objtool: Fix up st_info in COMDAT group section
> 
> When __elf_create_symbol creates a local symbol, it relocates the first
> global symbol upwards to make space. Subsequently, elf_update_symbol()
> is called to refresh the symbol table section. However, this isn't
> sufficient, as other sections might have the reference to the old
> symbol index, for instance, the sh_info field of an SHT_GROUP section.
> 
> This patch updates the `sh_info` field when necessary. This field
> serves as the key for the COMDAT group. An incorrect key would prevent
> the linker's from deduplicating COMDAT symbols, leading to duplicate
> definitions in the final link.
> 
> Signed-off-by: Rong Xu <xur@google.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lkml.kernel.org/r/20250425200541.113015-1-xur@google.com

Unfortunately this patch completely destroys performance when adding a
bunch of symbols.  Which I'm doing in v2 of my klp-build patch set.

What was the use case for this?  I don't remember seeing any COMDAT
groups in the kernel.

-- 
Josh
