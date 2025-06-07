Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A702192F5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 22:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749337160; cv=none; b=ouXxakwYSpBkXayUHn4rBc3YRDZRu6la5WabSUruixraja1pXRiKpbaABwnWmXYRVXKi2S564zqBfrxbuUqSXF/uJGL451ugt4hmkGfOTRvNrxT5/BC2hrBQErutJRLJbmEk6wOMg2NEiuKC8ygr+pPKe9vpb+snAn+HFMUeDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749337160; c=relaxed/simple;
	bh=u5czIPAnDfyr9jbB7FRNS3EdRUrdIkbxt4pENr2X0pU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WFDeIPEKeHTTn6IEcqvQ6GPhyUD8+FIRECQc4H+NK0Rn1ng/xmdx0xGyLc/cib5YckNl5zra/ZvWJwCjRhX+wm5WgibxGd51lYsQByS0hEmpBf9ePouYVY265t/wW7p2GCaaF9813TRs3PPWzRtvuQ3yxGG2gdfKb3YcI2Yom+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QKCWYWB/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QKCWYWB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AC6C4CEE4;
	Sat,  7 Jun 2025 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749337158;
	bh=u5czIPAnDfyr9jbB7FRNS3EdRUrdIkbxt4pENr2X0pU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QKCWYWB/PVFQGlumNcK6p4O6AeDd9ZxdFoNQWmOOHJonw+1KHFl+oNBqQDcuE4opw
	 q3JONysiOXf4AkElzuwOrYOqQmiAOEvpzieQ8DjPCRob/CL2beSzTLCe1fythazekM
	 yU1KKOoIiK+wWcuUvlNV/EJmpiTpmdBxSDyDL7xg=
Date: Sat, 7 Jun 2025 15:59:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Harry Yoo
 <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>, Hyeonggon Yoo
 <42.hyeyoo@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/10] drivers,hmat: Use node-notifier instead of
 memory-notifier
Message-Id: <20250607155917.a61b35e8bf39eed12da3da99@linux-foundation.org>
In-Reply-To: <3051c206-9a1c-47b9-a5c4-18010abf070a@redhat.com>
References: <20250605142305.244465-1-osalvador@suse.de>
	<20250605142305.244465-8-osalvador@suse.de>
	<3051c206-9a1c-47b9-a5c4-18010abf070a@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Jun 2025 13:51:35 +0200 David Hildenbrand <david@redhat.com> wrote:

> > -	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
> > +	if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)
> 
> Same comment :)

Thanks.  It appears that quite a few updates are coming so I'll remove
the v5 series from mm.git.
