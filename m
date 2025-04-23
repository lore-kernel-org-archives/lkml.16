Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F10B1F2B99
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444212; cv=none; b=YI+ELI8TiutqC4JyEXE/Vm66QTOZPw1vjloaFf0hdY88woZmMuj2tUQLWkp7SGKs3qbJPdeHzDWrFWru1N1w6Q/jBsR6AgTn7QwpVxRcvlivgxG2IJxbUeuEt/8RUDTbFrWv2dKEVwYiCdYZe/OKRKDx29NuFLWYRWdWtP3Api8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444212; c=relaxed/simple;
	bh=IB7QAxeN++hoha3WK4pNByy5KVzecNNyrm3ulLjQnbk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MBx4Qz2ZUzeOEQT3aiiWi2a4QoBkdU2KGsCJyoJpMhvCUKf/gZh71ElL5X+xqg/qOofoM/LSoqUipVXl8AC1tsK9mCbK3OO17gB0Qz2Zfvyy0QsyPCSmUcVv7MHAuQWKwt2NAFo2Y9V2vKpRFdEhe6hkU4H+cxevVLIM9jpldsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=R5vwbmrZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="R5vwbmrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281C2C4CEEF;
	Wed, 23 Apr 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745444211;
	bh=IB7QAxeN++hoha3WK4pNByy5KVzecNNyrm3ulLjQnbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R5vwbmrZUe0LniCicXYSr4oILDOhr2COx4MMqlARXp/nZr3HN/p7Sant5bJjmoNFZ
	 3yn3NPm6PdP6PlRZd4JTvr2wafHMN63KNO9TnfYowyzpnNYKkYQNlqQDMowIIXqXqa
	 nwaq7TEeGCWzJQAty/8y99MpMFD4UEiaNkUm185g=
Date: Wed, 23 Apr 2025 14:36:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] execmem: enforce allocation size aligment to PAGE_SIZE
Message-Id: <20250423143650.6595dcc7178351b62c31782c@linux-foundation.org>
In-Reply-To: <20250423144808.1619863-1-rppt@kernel.org>
References: <20250423144808.1619863-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 17:48:07 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> Before introduction of ROX cache execmem allocation size was always
> implicitly aligned to PAGE_SIZE inside vmalloc.
> 
> However, when allocation happens from the ROX cache, this is not
> enforced.
> 
> Make sure that the allocation size is always consistently aligned to
> PAGE_SIZE.

Does this have any known runtime effect?
