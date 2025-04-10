Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D2A1AF0BB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744251601; cv=none; b=PgXXuQPuVjjelD+9X8NEQo+/7tp0Ko8oWS6FlkmOmuaOLDrfitLHYStMR8QapWQs03zcIAcr6Gw9kDhk2RUTBPAcQTZMcOwXjZoAb3BgyWHoGAOZ8ugszZMDxXqJrzh4hxZ7KEzHdsXxINxhevj8Sz3xCHjiytj3MgfWYcXRclg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744251601; c=relaxed/simple;
	bh=UUekSxE+tk+VwekK5jEZCtmL2RwRMomvGMlVVMnw82c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nTSuugYUsZfCqsWsAMfNiq5jGKyImOM2cmvi1Z7TiJXt3ui+8sqIRVYXFkfqOoZa94nFcFeSLZM8GTfNU9Hy44887H5QXJmy5FxV/Lvm2Jv0MWhGcl3aGWogNH2G5TzjzjehQwTSnhmA4KZtgi/fDdsjHfFiW4mpFFPWKSz8SXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C2ZwX9AG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C2ZwX9AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE021C4CEE2;
	Thu, 10 Apr 2025 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744251601;
	bh=UUekSxE+tk+VwekK5jEZCtmL2RwRMomvGMlVVMnw82c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C2ZwX9AGrh50LpzrQVm4+LSlDAH5fOQv+fimtEKv8OCHb1+QMkUkmSDDf42tUlPzx
	 SyzQm0+G3EcJUNb3IkqOrO0brdWKmBPWP8PVGAHYLc7gVcSlICcckHDrBwmq+1Z94g
	 F2buw12O1+roYa5yCIamZbkLzHPY8CBsuTqKP1Sw=
Date: Wed, 9 Apr 2025 19:20:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Ritesh Harjani
 <ritesh.list@gmail.com>, rafael@kernel.org, Danilo Krummrich
 <dakr@kernel.org>
Subject: Re: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check
 if the Current Node's Memblock Region Intersects with a Memory Block
Message-Id: <20250409192000.d8a630d2c10e902bcdf80973@linux-foundation.org>
In-Reply-To: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Apr 2025 10:57:56 +0530 Donet Tom <donettom@linux.ibm.com> wrote:

> A new function, curr_node_memblock_intersect_memory_block, has been

"intersects".

Because the name is too short ;)

> With this function, the boot time is reduced.
> 
> Boot time without this function - 32TB RAM
> ==========================================
> Startup finished in 1min 12.413s (kernel)
> 
> Boot time with this function -  32TB RAM
> ========================================
> Startup finished in 18.031s (kernel)

Impressive.  I'll assume this is rppt material.


