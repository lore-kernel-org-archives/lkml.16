Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1025B301;
	Tue,  1 Jul 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374491; cv=none; b=IgEkWthivlm6u8sQox7m20IHFts622yOoEgHQGggGnAXjv4IG5yyaD+1XrApn8z7pVpT9y+28Q1pf4DwF9t/Xo3AkbhUYihVIdkbW+Tr2uZsbHZmP9sFixoRmPJir4o5IaVW3ylZMZizR1TkyOu2hcI9C3Zq2QkgyT9TF4DP0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374491; c=relaxed/simple;
	bh=JUxBJ96sPF/IqLs5HjgYnXkzV4UCixqIj5B+O9WFJhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kTrSDdCSNy0yZuZEuPU1FtXRkS1dxWcLZc0XyfaEcsE1FsfLwtyBcvJqpnjhPiIIluzCh3kXRiLm1kxVZ10xU63imGG3VAYIea8ye+Cruqi17ey5wmLStpIF6/gaBMo4hyfUL2iKel51VR9HuDlh8PCw55I0+NG0JbdECz1Nx60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PNnwL05N; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PNnwL05N"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A727640700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751374488; bh=0dzsmgWlqJLGfMOQQ7Vy3xLEXExKhldgLTdaqXjyC6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PNnwL05N0KkuN59lN1vvfgx7XdEk388aCs7ZkpKdgI4t+QQFhBhU8xe2XojQVhdR5
	 tDR/y0CPOOM3cWXXaZN+R0W0Xyn9W2HenYgsBXlUua6+0y0SsHwS1oGwvWKrVG7Rul
	 cQvIQZYTQhqw+bYBt6kcZK5Zp7PGoAnNpzs6nMofoDYgV+SUQIdV1iqgx8XSgb5sIs
	 LBHefaXscYb2/y0e1qikQhokvmmEkc4nxEFuL4vtMkwcOyzIb4kSlT1RA+HoobDH35
	 ayzRB8cq2E/WeFypVEWCl9wAPQcMHjkfacR07UhlXiVFGImP1lfjBEP1qfclztKYZz
	 EbT6XCjNJacwQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A727640700;
	Tue,  1 Jul 2025 12:54:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Tesarik <ptesarik@suse.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Bagas
 Sanjaya <bagasdotme@gmail.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for
 dma_pool_zalloc()
In-Reply-To: <20250701133833.4060f406@mordecai.tesarici.cz>
References: <20250627101015.1600042-1-ptesarik@suse.com>
 <20250627101015.1600042-5-ptesarik@suse.com>
 <5a997777-fd14-40e1-919b-2e61a6e8d570@infradead.org>
 <20250701133833.4060f406@mordecai.tesarici.cz>
Date: Tue, 01 Jul 2025 06:54:47 -0600
Message-ID: <875xgct6js.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Tesarik <ptesarik@suse.com> writes:

> Do I have to submit a v3 then?

What path were you planning for this to go upstream?  If it goes through
docs, I can apply that tweak on the way in.

Thanks,

jon
