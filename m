Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F3BA27
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746932862; cv=none; b=EMS9R1/bQzb+VJMSLAImk5PP4svBuSRX6QrAILhNg/aqfNvkZfECf4NMX4lDYf2hiyaqtZjN4D/eLc1yduXbHpBXN4qbZcIYIWCRZdBTaJQwb3z0j3i+ZLi96CFf7eJpP7r7GQfm2XM6Be5TKip4TPRFZ0ylGDBaHuGWmvx82zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746932862; c=relaxed/simple;
	bh=ZNkiyzbnYjCmJ7Q8aldKqzDsIc/xK+QlpyxxtNeuBjY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ymz7tG395XEn+eBGP+ptIeBo0Hl267v6hlSKhu3z9WQH+rF23B0cjnHF6ZWKzPSy9pRasMjCw4KP2ravLBmn5Ko/SzmvNI1IFj75+OlLFLb6Fd+veh7eGSYrZWhFVPmp2PMLAhlAHLz2mrps0BauJ9MEW28eiNyX1qNbCD8qPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2qlqS6EM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2qlqS6EM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB7CC4CEE4;
	Sun, 11 May 2025 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746932861;
	bh=ZNkiyzbnYjCmJ7Q8aldKqzDsIc/xK+QlpyxxtNeuBjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2qlqS6EMafUTp6lwh89oblzRV4jkgWldegyTw1GfvzoDsGhEEmRzCHA+pOsRpEkXf
	 UfbQBePz9kd/IpeRF2UXtOsq/jcg5pkj3R5iZ4m2bZ2WDBV6F2Urz7lXx1l0FTDjDm
	 syU3c0BJditxlFsK/eOTS0IqzlVzso12fz3eMh5k=
Date: Sat, 10 May 2025 20:07:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, Harry Yoo
 <harry.yoo@oracle.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, Brendan
 Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan
 <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by
 cpuset race
Message-Id: <20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
In-Reply-To: <CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
	<aAYXP4f417_bx6Is@harry>
	<025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
	<20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
	<CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 22 Apr 2025 17:22:04 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> On Tue, Apr 22, 2025 at 5:11 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 22 Apr 2025 20:10:06 +0800 Tianyang Zhang <zhangtianyang@loongson.cn> wrote:
> >
> > >
> > > ...
> > >
> > > >>
> > > >> Simultaneously starting multiple cpuset01 from LTP can quickly
> > > >> reproduce this issue on a multi node server when the maximum
> > > >> memory pressure is reached and the swap is enabled
> > > >>
> > > >> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> > > >> ---
> > > > What commit does it fix and should it be backported to -stable?
> > > >
> > > > There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> > > > Andrew's mm.git repository now).
> > > >
> > > > Let's Cc the page allocator folks here!
> > >
> > > We first identified this issue in 6.6.52-stable , and through root cause
> > > analysis,
> > >
> > > it appears the problem may have existed for a significant period.
> > >
> > > However It is recommended that the fix should be backported to at least
> > > Linux kernel versions after 6.6-stable
> >
> > OK, thanks,
> >
> > This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
> > see some review activity soon (please).
> 
> I reviewed and provided my feedback but saw neither a reply nor a
> respin with proposed changes.

OK, thanks.  Do you have time to put together a modified version of this?
