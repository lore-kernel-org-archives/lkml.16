Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372FEF510
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744244995; cv=none; b=I8i1YO3FMWc2XQZnUugVq6UjTOAszGNVyD7ATE+QUZ6CTj4+nQ2eNprxzHIsirjF8Qy+Q1o+CWjh2kItUxJUw4xTrUyHTwr3ROJ+/t83KRZVGFriacK5IF0KOSY20kX85sUao+xH2alLjq1OXMTGvmTxeXwLY//N4DjvoJN//Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744244995; c=relaxed/simple;
	bh=33ON1ERBYPgrXnV5bSI759t6YNFtUk0885EAiuewKqY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LavWPvKZ89891byWuUqjpircuE0m3XYUrbApy5pAzlDZx6yj9em1j9vv4cJbxGakJEBF8kU8jLTfs5lzc43/OAodI43DI98xDlHNXNP3c/2VAfW03Z/6VMyYFHK+d/6TsO9Ux7T6Joglycdkn2KT9b9ycjqhZl5Yo6OXO74AVI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TrrKjjh9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TrrKjjh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2B6C4CEE2;
	Thu, 10 Apr 2025 00:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744244994;
	bh=33ON1ERBYPgrXnV5bSI759t6YNFtUk0885EAiuewKqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TrrKjjh90HMHsGdd4+Y8ilKRcjv6Lc0EA9YC3OGhvE+x3vp+siCgOHYBrD58wIO5r
	 fu/omkdhtQXGRWPEbGbcW8CyzvkTvyeWy/RtAswCtkgDqC8UaALINkOmByodJ4ko4+
	 4uACPmBO5xlAURZ1JGq5+dVbJLF+0IuVAsbUHP8M=
Date: Wed, 9 Apr 2025 17:29:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, liam.howlett@oracle.com, willy@infradead.org
Subject: Re: [PATCH v4 0/6] Track node vacancy to reduce worst case
 allocation counts
Message-Id: <20250409172954.7e17e083ac8f061ea829663c@linux-foundation.org>
In-Reply-To: <d25b3d0d-ebc3-4cf8-bf87-7d42dd23dc36@oracle.com>
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
	<d25b3d0d-ebc3-4cf8-bf87-7d42dd23dc36@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 13:51:29 -0400 Sidhartha Kumar <sidhartha.kumar@oracle.com> wrote:

> On 4/7/25 2:40 PM, Sidhartha Kumar wrote:
> > v3[3] -> v4:
> >    - fix bug reported by Vasily Gorbik by fixing condition for
> >      mast_overflow() and add test case for this condition. This fix
> >      was also tested on s390 by Vasily.
> > 
> >    - cleanup new_height variable usage in mas_spanning_rebalance()
> >      and add an additional test to make sure mt_height() is correct
> >      after a rebalance causes a tree's height to decrease per Liam.
> > 
> Hi Andrew,
> 
> Could the following fixup patch be applied to the end of this series? If 
> you'd prefer a new version of the series I can do that as well.

Liam mentioned a couple of "nits" so I think a V5 would be appropriate,
thanks.

