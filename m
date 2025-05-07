Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788C28C5A9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641223; cv=none; b=tJ8w2YpAd6j7ROBc2WPLfZk9f7tQGFJUanZ8zQuJktC4nfPfFwcqlOvFZOWXk55ePjiK7Auj/yx17dNNu/dylKwZnt2p+RbgE+TL0hxXYJq5GFInsG0qd0glyEq1CMlIxP6QmsMQlw+7B93P1A+p7sJaPFGmjc/poOBST21t/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641223; c=relaxed/simple;
	bh=2fwDTg28OBa5HILWrLkhDJBJgNj50Lks4JnCyofJpQs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BDajKz/a/+78iBmybS+0XyhCo2cVudVWPNEj+nK+mL0GxVmVtk/PKvSbckU4JTz4TlJbUq1J/Btg19nEMcdT39WMW2n5CZrRRTDda3MeFFG6IDBXtds4pmPB1emm+qhzoYK2gmFOFHVBPPdULmST0K4hk39uad1gClVLy3zx+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K5++BXeN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K5++BXeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D44C4CEE9;
	Wed,  7 May 2025 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746641222;
	bh=2fwDTg28OBa5HILWrLkhDJBJgNj50Lks4JnCyofJpQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K5++BXeNwBIxl6SqvLgcDZwWslvdJ+7LLzUX68Oh+vyPz3totxw5WkLXqFNR4joeV
	 iLF1WFoiI958lAWRjyHlKXUcqWWFE2SI3Gj5DxamfgzxByUSd3LVFsrrN38PDC+ThK
	 SOZ/zGaIT0XzVRi7s2m58ahiBrouHzHLo6XdmxZ0=
Date: Wed, 7 May 2025 11:07:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-Id: <20250507110701.c2c135d3f4ed594b914da41b@linux-foundation.org>
In-Reply-To: <74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
	<20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
	<74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 12:06:11 +0800 WangYuli <wangyuli@uniontech.com> wrote:

> Perhaps a possible approach for now could be to change this line to for 
> (i = tier % MAX_NR_TIERS; i <= min_t(int, tier, MAX_NR_TIERS - 1); i++) 
> {, which would allow us to keep the signed int type for the tier 
> variable itself.

Sure.

> Regarding the potential for a more comprehensive change in the future to 
> redefine all these "tier" variables and related ones as unsigned int, I 
> would be very grateful for your guidance on whether that's a direction 
> we should consider.

`int' is a curse.  Yes, we do this very frequently - we unthinkingly
use a signed type for a naturally unsigned concept.  Ths signed type
spreads and spreads and the incorrect signage causes (small) problems
in various places.  By then it's a big mess trying to switch to an
unsigned type.

Oh well, we just battle on.  We should at least be more vigilant about
this when adding new things.


hp2:/usr/src/25> grep "int nid" mm/*.c | wc -l
316

argh.
