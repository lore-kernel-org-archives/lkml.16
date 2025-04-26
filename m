Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD110F9;
	Sat, 26 Apr 2025 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633518; cv=none; b=ivEvJDhGkZkJ+c9XLFtiTrc0nwdE1HP66qQIlZvUhFfIqS1iYaHBuG+drGn5sTNP/+wvNmieyz2NPaHZo36P8Laq5COfoD0bgXc1zhY5QIbpTYLTufWuk6DfTHfAwb8yM3FvgzRtJzX3T1EZ1vjTyjGE1pgdGG3A/wb7ufvxwKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633518; c=relaxed/simple;
	bh=fINprzh/TtN1ZLojNEawV4dlHAuKXAlsctSeK/3zSSc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=J2gj7wR9DSD16FHccJ/SazaABrpp/xFUUxvr34TBPIfA+b0EsdkddHO+Fqf9nJLjZbFmEPGowXCEBAkq0YCvbE7kvl8CEVGl2RfqEeVw2Inu8jcaw+Ibx0gIOEF8hRpZh16Y7XhMi/UE6DhRKVwgU4ZbK4a18oaDIpb7fj7dH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V5UEZnSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V5UEZnSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC1AC4CEE4;
	Sat, 26 Apr 2025 02:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745633517;
	bh=fINprzh/TtN1ZLojNEawV4dlHAuKXAlsctSeK/3zSSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V5UEZnSfXFUZUOdR3IhLqvYRj1ojiBIiVmSIlpsHuDQbavYCshW1iY76vfyulhXk0
	 LwcVZV84WXBumvLKOynLmkYNaEiAyaUUbUAoYBK19FU8B+aQYvZwCzbddrwnt2MOhC
	 X7FI7mgxWFyk2u7T2VrUHm89hHEPOQLrkkrKy9H8=
Date: Fri, 25 Apr 2025 19:11:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Raghavendra K T <raghavendra.kt@amd.com>, Nikhil Dhama
 <nikhil.dhama@amd.com>, bharata@amd.com,
 raghavendra.kodsarathimmappa@amd.com, oe-lkp@lists.linux.dev,
 lkp@intel.com, Huang Ying <huang.ying.caritas@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Mel Gorman
 <mgorman@techsingularity.net>
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to
 trigger free_high
Message-Id: <20250425191156.c83d082b1c15e46f77c122b3@linux-foundation.org>
In-Reply-To: <87mscn5ilt.fsf@DESKTOP-5N7EMDA>
References: <20250407105219.55351-1-nikhil.dhama@amd.com>
	<87mscn8msp.fsf@DESKTOP-5N7EMDA>
	<c8b2a3c9-2252-4c0a-85a9-26fa6b519757@amd.com>
	<87mscn5ilt.fsf@DESKTOP-5N7EMDA>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Apr 2025 14:15:42 +0800 "Huang, Ying" <ying.huang@linux.alibaba.com> wrote:

> >> in my analysis in
> >> https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/
> >> If you think my analysis is correct, can you add that in patch
> >> description too?  This makes it easier for people to know why the code
> >> looks this way.
> >> 
> >
> > Yes. This makes sense. Andrew has already included the patch in mm tree.
> >
> > Nikhil,
> >
> > Could you please help with the updated write up based on Ying's
> > suggestion assuming it works for Andrew?
> 
> Thanks!
> 
> Just send a updated version, Andrew will update the patch in mm tree
> unless it has been merged by mm-stable.

[ two weeks pass ]

Nikhil's attentions are presumably elsewhere.  Could someone (Ying or
Raghavendra?) please send along altered changelog text which I can
paste in there?
