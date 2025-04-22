Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45261339A1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361968; cv=none; b=K0U7O7qNrY/xHEjcohgSlV8lzVn8DnwFSA4EuezmlCm2/fZnaRkbvs7QckOkbdymz8Pitcc8w4YvI2GXerm/4JV5ZtDpkoNuz8LGJXTJwv3hhJhLOEhGJiCOzEaAWiEzCeWbTn0HKw5E35CuxZT5+Wa6lRC1SvbteDVVzpUpy1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361968; c=relaxed/simple;
	bh=BId8HiyXpSR3+LAxEsu8bktos8SGaOD3Ki0Fi2jQWwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNxBtWO6BwHgH9IQpTAR767bsAOi+/rgLNnrn1XzGxMrhkMiU5UeLAC67Kk6BLqzvL5vbcMD1R6R+5MXAMNRM0tlq9iH1Yre56TxqgMfIfIAxpxNIZA3dpbmJQOcoq17k6qttfyFPMyTGYGZxIdl1plb0HVVgSLqfQwp9raDv2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8QsQei1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8QsQei1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB4DC4CEE9;
	Tue, 22 Apr 2025 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745361967;
	bh=BId8HiyXpSR3+LAxEsu8bktos8SGaOD3Ki0Fi2jQWwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8QsQei1TFwlKl01mmg2EFG8y1LeNjpISFY60CTi2eBxktvrL2dNC5eRo7edOrC6W
	 PoNmDjoomhquPAKSolzJOvaP3nmSe5/4Xy6fIuOkj3rlmUSWjlkBBzbKSc/LMiaqtG
	 skpyHe6OPgoDlmiHpH2VcxJWHKU6fdLBRtsXrCvJmr8LM8WCa4RkPq0mk67TJc9/gp
	 rQwcvbr8NQt6ao4y7AOrI1FblBHdBzFRZmqJDi8JA9/dMv5098UWAxHNdzRHVI6qE7
	 BZzGSTuBJ0/q9rlMmi/nfjkh4URRIbfXkpybrVpZ/voigBIrnCDUIo1HoJ3fwJvExP
	 ufNj6fglltoaw==
Date: Tue, 22 Apr 2025 16:46:05 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] nvme/pci: PRP list DMA pool partitioning
Message-ID: <aAgcLf-X_kWTPRGZ@kbusch-mbp.dhcp.thefacebook.com>
References: <20250422161959.1958205-1-csander@purestorage.com>
 <aAfWUGAMTpwsHf2b@kbusch-mbp.dhcp.thefacebook.com>
 <CADUfDZr5nq9fAvxSZJwUmuZKry6pHqLrucLtJLmV8cAvZ6O6eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZr5nq9fAvxSZJwUmuZKry6pHqLrucLtJLmV8cAvZ6O6eg@mail.gmail.com>

On Tue, Apr 22, 2025 at 03:04:37PM -0700, Caleb Sander Mateos wrote:
> On Tue, Apr 22, 2025 at 10:48 AM Keith Busch <kbusch@kernel.org> wrote:
> >
> > On Tue, Apr 22, 2025 at 10:19:57AM -0600, Caleb Sander Mateos wrote:
> > > This reduces the _raw_spin_lock_irqsave overhead by about half, to
> > > 1.2%.
> >
> > Could you try this atop your series? I hope to see if we can squeeze a
> > little more out by keeping the spinlock and list links local to the node
> > using them.
> 
> That does help save some CPU time in dma_pool_alloc too. It's down
> from 0.87% of CPU time to 0.52% while doing 5% more IOPS. I'll include
> your patch (with a few tweaks) in a v5 of this series. Hopefully
> you're okay if I include your Signed-off-by.

Awesome! And yes, totally okay with me to fold the patch into your
series.
