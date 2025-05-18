Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A0469D
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747549523; cv=none; b=BENrQcwb70scv3JwfTFg8P1cTBk3WdyIOIkoXre3tLPQFQ37lSvUQgXEYSkcO9huWK5AcE2sb5sCPNMrLwCaumxaxw93JvUVBXVbfY8qXswh6b7vy96uOjk7Rm0jZsLQYlTSlOAqPuveFFGZMdBtfOz32Z5fKT/sjR02rkvLXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747549523; c=relaxed/simple;
	bh=weqH1BPSyYH4kCNYEEnFs/7D4liVfWYB/hT/1v9DJG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLFNXfl4JGY3DBbDE0N+9nob31Qig3thLuyN+nAugk21gRifrpNbaV30u8NOnh0GPghek41ezCNqz6NpzdGu7RUxz4jjbxQFJ41IaKNH4FkU3K4ENWy7tOIzCqCxbV3shdcRyyMwwYTGIwRzA2QY5Bwlq+D8jWjuxlsmYrPkF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv96UE42; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv96UE42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75084C4CEE7;
	Sun, 18 May 2025 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747549522;
	bh=weqH1BPSyYH4kCNYEEnFs/7D4liVfWYB/hT/1v9DJG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nv96UE42motK00F58D3temZ3+P6wlADBepODdks3AIhPXgkInkfWK5aZuclKD0vjD
	 DaFFHQlJS6yaHBsanPaKLkzd7BRipAqC5PcjlT9Ko/as+SmqWRpU3OeTd0IoRHNOm6
	 4fpTzknkPdIIhFkxyf4xNldKdLuoR5LGlacJ0AaJGqwcVRSCsqQvzOGXAqSdZ5ua2c
	 JaCoiR1TPHa8yGkVKwiGmtEFUcIiJFVm4Da346qOHxQE0EZo1HIZURFGUVXQqtd5BS
	 RMcdutHiiH38ETbYRypbl8GenINPHzbbPZhEWVo1321kUZCHpHeR5nZTnvQskI4YFQ
	 z/9K1dwtnXaEg==
Date: Sun, 18 May 2025 08:25:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/mm: resize user_pcid_flush_mask for PTI /
 broadcast TLB flush combination
Message-ID: <aCl9TUnOuWivv6Ze@gmail.com>
References: <20250516123317.70506358@fangorn>
 <aChB9ORFxaL8VfyD@gmail.com>
 <20250517201255.1bc4e61b@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517201255.1bc4e61b@fangorn>


* Rik van Riel <riel@surriel.com> wrote:

> But it is perfectly happy with getting the address of the first long 
> in that array, which works for both array size 1 and array size 32.

Yeah. Testing is still a question: does this boot on a system with PCID 
&& INVLPGB features, with PTI force-enabled ("pti=on" boot option)?

Thanks,

	Ingo
