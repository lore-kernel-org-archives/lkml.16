Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984C186E40;
	Sun, 11 May 2025 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746937821; cv=none; b=eS7p69n8/iBygzMqRnysutxlsBjThxE+bVMtZcz72jZ5iC1ksJx//7XNvhpeIzHULXd+bOJx/HJzS/cmDISe6Tgkwpxj4FXQQWxPrH4xPCNWzw1ZBeZXzgBkjnc2DDjGXSnLZp319O/kExIqKGgKH1SZZnbOs0/u6QLBQ9ATqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746937821; c=relaxed/simple;
	bh=e2p9jy5xNl9YYjl0+xISgENnVHJBjkGHA3oGf0uB5Hg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kK5ICDx+RzObS1XlJ9AjRywueCDJbEHNaLukau/+05SwzUgZlEH5QvT1Mc2zBsLYCoyE/iLml6JLLgjLRr3ikl6dquw7zUSajlVamy6mIsDZEq7E4b8qk/QbiKImakDSountJrztvqH8h0H6qdw2jSmTbIOotPPJhlEk+U7pcdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uFbVWB9j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uFbVWB9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66953C4CEE4;
	Sun, 11 May 2025 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746937820;
	bh=e2p9jy5xNl9YYjl0+xISgENnVHJBjkGHA3oGf0uB5Hg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uFbVWB9j3zZFDqCB2SRy8zkHy1AN68oX2PO9d3xSB0511ZrVwNTzb7AV16HmS7cvm
	 4dzTQnqX3q2LN816JT69aDqAdu3/rhgNvF4UodHoQn73wCn9PFRmpYGTPddu5GtitN
	 rOxDbu7+OxvLHczocBn8ocG1OkNmqVx3fK2ARKA8=
Date: Sat, 10 May 2025 21:30:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nikhil Dhama <nikhil.dhama@amd.com>
Cc: <bharata@amd.com>, <huang.ying.caritas@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <lkp@intel.com>,
 <mgorman@techsingularity.net>, <oe-lkp@lists.linux.dev>,
 <raghavendra.kt@amd.com>, <ying.huang@linux.alibaba.com>
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to
 trigger free_high
Message-Id: <20250510213019.0929c25f8c9861d7416df264@linux-foundation.org>
In-Reply-To: <20250428050047.10491-1-nikhil.dhama@amd.com>
References: <20250425191156.c83d082b1c15e46f77c122b3@linux-foundation.org>
	<20250428050047.10491-1-nikhil.dhama@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 10:30:47 +0530 Nikhil Dhama <nikhil.dhama@amd.com> wrote:

> > Nikhil's attentions are presumably elsewhere.  Could someone (Ying or
> > Raghavendra?) please send along altered changelog text which I can
> > paste in there?
> 
> Please find the updated changelog text as follows:

As far as I can tell, this replacement text is identical to that of the
orginal patch.

