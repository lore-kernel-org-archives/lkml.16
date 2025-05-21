Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DDA1E98F8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747849208; cv=none; b=DxWPb92KB9OkkklqHpTRS8yMuGJZ4mFsLxrIveKoU1G2ArBLIvbCl85yJLBec3vGr0FvEitUmedfRfVDx23Ipo02SpnR9ijq/jhUsmiDRTYb5N6LGFdmvEC+tsLXQn+FORRwql70LEqX/Spgc/x1WROP0t10U+yPU0tbtu+lEZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747849208; c=relaxed/simple;
	bh=8Nd4rxZUFjouRu5aEXckFSrnOMdk/XI8KoUHqC1c5zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdKalquNixrhpyoLp8oifupcVxBi7u/UlCHfdJxnUhLIQBy29Ogx8E0aaJsdigHqyYUai7UbEVznYaMO6RKcOogXzRg1Lz2PCi+744rMX/vzZmvqdQ2ffCls6WicpLqTs5zc4mQIxPrNWjVlXn90+8kTxZYwsm5qeWSMHUnQY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ooIkRD++; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ooIkRD++"
Date: Wed, 21 May 2025 10:39:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747849193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxNZet+UTdyvvs1BLJyKKteNhJD7ve7hysUoAtdDQ3c=;
	b=ooIkRD++iu8hfBXZyJEPGFXwzbNgNPP20OQiRqDP7dISqZvXteObwI6qZtHDatcjfs4nI5
	OANbba1Qhny27sGrtCXn3XPUaohB6DixNLhOO8r4mpuhsSCctUuBIjl4KBnRtRyc5zmyQH
	OhV/FRDTLTpWgbMlTyBf0yRnUzlTo9E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>, 
	Usama Arif <usamaarif642@gmail.com>
Subject: Re: [RFC PATCH 0/5] add process_madvise() flags to modify behaviour
Message-ID: <x6uzxhwrgamet2ftqtgzxcg7osnw62rcv4eym52nr4l6awsqgt@qivrdfpguaop>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <7tzfy4mmbo2utodqr5clk24mcawef5l2gwrgmnp5jmqxmhkpav@jpzaaoys6jro>
 <5604190c-3309-4cb8-b746-2301615d933c@lucifer.local>
 <uxhvhja5igs5cau7tomk56wit65lh7ooq7i5xsdzyqsv5ikavm@kiwe26ioxl3t>
 <e8c459cb-c8b8-4c34-8f94-c8918bef582f@lucifer.local>
 <226owobtknee4iirb7sdm3hs26u4nvytdugxgxtz23kcrx6tzg@nryescaj266u>
 <7a214bee-d184-460f-88d6-2249b9d513ba@lucifer.local>
 <djdcvn3flljlbl7pwyurpdplqxikxy6j2obj6cwcjd4znr6hwj@w3lzlvdibi2i>
 <e4d9dd63-5000-4939-b09c-c322d41a9d70@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4d9dd63-5000-4939-b09c-c322d41a9d70@lucifer.local>
X-Migadu-Flow: FLOW_OUT

On Wed, May 21, 2025 at 05:49:15PM +0100, Lorenzo Stoakes wrote:
[...]
> >
> > Please let's first get consensus on this before starting the work.
> 
> With respect Shakeel, I'll work on whatever I want, whenever I want.

I fail to understand why you would respond like that.
