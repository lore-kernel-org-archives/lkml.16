Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8D2D5417
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750871315; cv=none; b=KAKhrcy63X7g8ox0n4gE2FbzuV6PSAYvn3Uy2nBswJaaMMQNhzbDLZGHMazEvcfY/2tvb9t+zQwGe/ELyfUlzEE6vfbzjHICsLydjskB75v8UAc/w8nx+SYNZwsaMvA5SB49pjQ3xhbNKbOF6X7uegV0rXi24eDcO+1YnTWT2qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750871315; c=relaxed/simple;
	bh=Ifg3s0Ekc2O9cmUWs8MA9+JD0nxg5R0LvYm72h88ToA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMZKeU7k/+SSe4KTvDbmXhPnPs+554tF5w6p4feNMtn1vUsRz2ItTqXAtNbwsTvC3ov8jwCpqEk13wr2865ZbMr1wBsSKoJtwXXUZ91pVSZUD51yi0srZPPXD/bDPQfqjMm1Db14LmFgk4yFlepvYo11hmbKcl2AMSLyoNrRalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qFTMn8Ze; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qFTMn8Ze"
Date: Wed, 25 Jun 2025 10:08:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750871310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FgDm0yhuHvkfnVpQwvSabLkcT19X7xiAMoVYaiteC6A=;
	b=qFTMn8ZeI7I6WT4oeYx2DX3vV8EBQvt1kC82eA0rMY0chpvSzo0X4U+mqyqcL/9RWzuj9c
	VcyJ42cpmBoEFqzRj6JQpHWATFYU8B33NqKrfGHKBBgt8C+Hih5co/uUzMXncDEpXlLKwJ
	4L/Ei/kOf7HHfbw1VoWBw29Cv0Y2Sc4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: akpm@linux-foundation.org, mhocko@kernel.org, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, yosryahmed@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mm/vmscan: respect psi_memstall region in node
 reclaim
Message-ID: <dp4euolry7y3g66xu5ponmag5hx74q74yh7264dj5hlrehm2vp@xphyozavqzme>
References: <20250623185851.830632-1-dave@stgolabs.net>
 <20250623185851.830632-2-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623185851.830632-2-dave@stgolabs.net>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 23, 2025 at 11:58:48AM -0700, Davidlohr Bueso wrote:
> ... rather benign but keep proper ending order.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>

Nit: in next version, please have a more clear commit message.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
