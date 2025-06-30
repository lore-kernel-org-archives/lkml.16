Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BA1EB5B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261797; cv=none; b=CzpW4JyQmnBClasWvDDKiObESAfR/WPqgJOhILjrhXEOeRPTgylhHiIuJeW9qgbwQ3hMOvc1n46sW3VqaMHJli6OThhsUFNvhho/l0MrKgvjsarsKB8G1yqHSzmE5JRYP23QTXOu1ExE7LRozsze7cdW4MguWaAbRy7k2cNd/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261797; c=relaxed/simple;
	bh=oXqXsp2UYEmDmZnAKxW3iAic1oVHWLpTtUGnOMSwntM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FipfQPJLU/8JsGFnHc8TrwF/Gzx8DmQ76AkTr1LI4qgvxeb6mSoJXE9SqeIemnov7jF0d+Bn0qLHw2GHuaDIudBYFRbKGA/ZKwooYwmt3jTpyqMRvwULyWrrsifPkisedeTVaSXlpPzME3KH2wPHGityInwDpmCxomyQcQ0i+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B3F4368AA6; Mon, 30 Jun 2025 07:36:29 +0200 (CEST)
Date: Mon, 30 Jun 2025 07:36:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>,
	Christoph Hellwig <hch@lst.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] brd: fix sleeping memory allocation in
 brd_insert_page()
Message-ID: <20250630053629.GA28490@lst.de>
References: <685ec4c9.a00a0220.129264.000c.GAE@google.com> <11cb9a09-f66c-4c46-bd38-fc6080413c29@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11cb9a09-f66c-4c46-bd38-fc6080413c29@I-love.SAKURA.ne.jp>
User-Agent: Mutt/1.5.17 (2007-11-01)

I think the correct fix is "brd: fix leeping function called from invalid
context in brd_insert_page()" from Yu Kuai.  Please take a look at that
and double check it, though.

