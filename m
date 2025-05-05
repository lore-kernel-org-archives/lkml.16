Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3B1F30A4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454881; cv=none; b=hJG/Qpyod11EtzfInwYUTNIviXu9JVCpPQgoe5Cll6e9NyNVyN7uvIBfn2dyOZETmVV0tzXngSVs93+FA6SmnCvbTCSK6Q8uV00sKw+oqmxhF0RbZViR2A6A8gzvTpEHfXv739BciWCGaypQ+p5iJWzzl8blvSNJ518cARV2KSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454881; c=relaxed/simple;
	bh=ZV1Z2VR14ylgUix5FI+lRqQxmCZ8sNITwbPQ8g/6YZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=povkFeCmw5cICPw1+m1SBTJbqDqHI6eHgaCqXLu6pPzZopxXBaPX9Pk9vbJyveDUfQTH2UUtnVe0xcnpnVwiB1Pc+o2TKDJDEtTueY7Ks9M/UM/0H6I5jcVVECj+F6QITVspN88wsndc9XGFEEGHCFYzwvCBTQCN/np7qLbPqoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sySoIGMP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sySoIGMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72633C4CEEE;
	Mon,  5 May 2025 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746454881;
	bh=ZV1Z2VR14ylgUix5FI+lRqQxmCZ8sNITwbPQ8g/6YZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sySoIGMPnXUia5gYgjghar7ayTInJeYfRjo2/RniRA41GldkAI2ofuMu+WZG3CAXH
	 JvXuPMjVSMmQnyW+6xyj88pSxOTAN7RDvRMCTVMguHzr+4Vck1CZCanTIpzkKniKHG
	 et31GrPjuani2EXpEvdZY8+Y7L//LHseeLjMc+fUi1idbEC+rV2dta8ZfatCQ5Dwfu
	 7Dzk7m9RXC4GCBsklFVloFDarYOorTi6RLZy3Ld5mkUoa7Ept3bxn/h9nYDadJcsTH
	 Fvkk1SAmCw+axLL2v+I/vUa206XXCA2FtvC2LanRYViRWuIo1PJ/0kIc09OzVGUXss
	 j1TzuqzhjSpZA==
Date: Mon, 5 May 2025 08:21:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] nvme/pci: PRP list DMA pool partitioning
Message-ID: <aBjJXo8Svq2f3E9N@kbusch-mbp>
References: <20250426020636.34355-1-csander@purestorage.com>
 <CADUfDZr=OWv-bt+rzNQZ7zii9JyNxmkYCJxXCiCNsoHhT5UcYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADUfDZr=OWv-bt+rzNQZ7zii9JyNxmkYCJxXCiCNsoHhT5UcYw@mail.gmail.com>

On Fri, May 02, 2025 at 09:48:17AM -0700, Caleb Sander Mateos wrote:
> It seems like there is consensus on this series and all patches have
> multiple reviews. Would it be possible to queue it up for 6.16? The
> NVMe tree seems like it would make sense, though maybe the dmapool
> patch needs to go through the mm tree?

The subsequent nvme patches depend on the dmapool patch, so they all
need to go through the same tree. It's okay with me if nvme picks these
up, but I think we need an Ack from one of the mm reviewers/maintainers.
