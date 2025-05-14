Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068127933F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235823; cv=none; b=IcikSfoXUabO4FDgvI4lBbs5TWkkGtkZ7KeLBiU4ckTHJGrnNkt9Bw9Cgu3IC0ICgrh7H4x4U5nc4akltnhYZZNKvNHT8DBtsXyREFY+7T9RiEiZ8TCvxAGhzCZP2MifhRE64pbVD0h2sTvzw2stZ5jkCsYHARRoU3ElYbe7OnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235823; c=relaxed/simple;
	bh=4exlvaWiZStICEmxDGRhB1/5dfYeOMHszVI40B24+p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5NlnbEb/X0CKsTRb60JiM0gNmlm4gT4uCuniyHszgv3iw3UypUCYOYPELUcrwrVS0TpJulz3xMD3HSNv279K9JQxkIyIntoqu1OcihvXCIxr/KgiLdoOAghCOwPPK9Ulfn4Uc/E32d57TVvbvzhSP3Y3qCzR5gFOe9K6nP/Wao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E2C7168AFE; Wed, 14 May 2025 17:16:55 +0200 (CEST)
Date: Wed, 14 May 2025 17:16:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: ilya guterman <amfernusus@gmail.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers/nvme: Add quirks for device 025e:f1ac
Message-ID: <20250514151655.GA31705@lst.de>
References: <0250510102130.14710-1-amfernusus@gmail.com> <20250514151130.701885-1-amfernusus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514151130.701885-1-amfernusus@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks! Applied to nvme-6.15 with a little tweaking to the commit
message.

