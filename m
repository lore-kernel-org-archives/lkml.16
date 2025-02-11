Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB51E5018;
	Tue, 11 Feb 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299103; cv=none; b=NLM0YtzK0lG2QbMWr2WqABo6Eyu1BKFotaBgJbgy78q8F7LFvZrQVe8q2D921v+hxbM/XmNtpNGtuMVhqeREr0nI9bW9npt8EVimzKe0DN5G8DOBmCUlZlDFZFgd+6k38SNre/TRx33jY3/DC7ACgf0gH68PZ2+Ctc+ssAxAAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299103; c=relaxed/simple;
	bh=9d6jju/AIBaHpo4CcHOAS0x1UR/bdfVSyRx15+juWkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5u1eu3ecVyZLklugh7PNSq9g50WtQidGYkt3kpPW52SMC8ivm5Nq5UFBRqwXbkNu7Znti8jX9jAS3++qaPSQaXS8nHkvHfuw0uoQTnHr4Vu/a7iCfnL7Idr02Hqgzx2JH2OqWTp/dSx4gl/ZoYFzrg9vcoc6TOMtMDGMDXfrfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KM4EUBoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KM4EUBoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CCFC4CEDD;
	Tue, 11 Feb 2025 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299103;
	bh=9d6jju/AIBaHpo4CcHOAS0x1UR/bdfVSyRx15+juWkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KM4EUBoMjRN48xcaieQjd0BFqnOJuWcuSbQtEJHC5hn90/M9bzWaCsy+NfatKadD5
	 wzYebE/Daz96X02ZYwZO/u7UA4Isg1XE8pzUej0EpmicEW9MSn2gMzR83dOlOXLcJy
	 jPOZ9OIahCPBkd2d1KDBubdKO8twfNjmRdEDCEhgFtxI69ad9Ea3KTzxSlFmMjlpaQ
	 kDrL8M5vH5HJwy0kQRYDH8KUIvntS7ecZNLjcdd6AfWNc+ROBuLTIBeYJbccI9ym/z
	 4T1hXfsOtpEP6QOMa1EsLNq5QoYiZohM1tlVvKkW70jVhc7kOx0PqYSWsstrLu4bTz
	 58+lRzskHQbDA==
Date: Tue, 11 Feb 2025 11:38:20 -0700
From: Keith Busch <kbusch@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] apple-nvme: bug and perf fixes
Message-ID: <Z6uZHKwyMCWgM1a4@kbusch-mbp>
References: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>

On Tue, Feb 11, 2025 at 01:25:56PM -0500, Alyssa Rosenzweig wrote:
> This small series fixes three unrelated issues with the Apple NVMe
> driver.
> 
> * fix NVMe on firmware/machine
> * fix a power domain leak
> * fix pathological driver performance with random writes
> 
> The first two are strict bug fixes, the last is technically an
> optimization but given the measured 200x performance difference I do
> consider to be a fix ;-)

The last two patches look good to me.

I don't know anyone qualified to review the first patch, so I'll take
your word for it if no one replies in the next few days. :)
