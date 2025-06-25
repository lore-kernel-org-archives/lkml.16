Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE7142E83;
	Wed, 25 Jun 2025 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750887292; cv=none; b=tYHn7epdqMiUNZxybRt3H76kvSji8qARB7zNCofNxFJXXRVPeY38UeAU7+8miTCk9VddLbdUL4a/XXRGv+38unmoTpEd6jjQ+lUOKRPYdQCiLEXDOECUUaQEtT3ET3IW03Eafcl8oy3x1yLR0Chj/RoSLPYgZxUnf9zqPrc3AUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750887292; c=relaxed/simple;
	bh=AKbRRA217dXT+/0MeW6FVybHo34WTAkN6L60MipkcoU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fzYA64yCVr34TLVPETTemojsRugWTZqdpq+ye6AvL5qh1Ddv07ATuHj5Jyevcr/L/aG747vOed9smnzD/uIfg1aY4FOWYKuWW73CtE+6kuqcuXT3ube7aiq/NiAkPY+Q4T1n8eWf+n+Iguw7G1iqybTlRB3DILutphfKLRw2CRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EpmT+5ml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EpmT+5ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F099C4CEEE;
	Wed, 25 Jun 2025 21:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750887291;
	bh=AKbRRA217dXT+/0MeW6FVybHo34WTAkN6L60MipkcoU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EpmT+5mlXKPVQqDAlfTJCoNQ1sp/c1SPQzlT6StVaquAaaQAKbntuQHtxHnuy5XVN
	 JiSbgmwWIIjqEr4QaUabDOZjsjT8dqzX8giikmgHbYmI9aQZ8ItKHdzv00tcEWUHN3
	 Caeze8Mfhu2YSJFQz3Mr7BRFN/e2UglLj8K058/Q=
Date: Wed, 25 Jun 2025 14:34:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Alice
 Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/2] support large align and nid in Rust allocators
Message-Id: <20250625143450.2afc473fc0e7124a5108c187@linux-foundation.org>
In-Reply-To: <aFxnAjUQ2n14D7Ya@cassiopeiae>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
	<20250625141022.e65e4a9b8377d4879ad7065e@linux-foundation.org>
	<aFxnAjUQ2n14D7Ya@cassiopeiae>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 23:15:46 +0200 Danilo Krummrich <dakr@kernel.org> wrote:

> > What is the preferred merge path for this series?
> 
> I can take it through my Rust alloc tree, but I think it would probably be
> better you take it through the mm tree, since I don't expect this to conflict
> with anything else in my tree anyways.

No probs.

> The Rust changes gonna need some more discussion though.

Great, I'll add a note-to-self that discussion is ongoing.
