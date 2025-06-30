Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB220D50B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265276; cv=none; b=a2VvWU29FkN5mxYCoC7IuaQz0i2SIpznyQMn1Mb2mKlyyxBnGj0S8P9K+vA+NxcP8z9UKTCeRNKtlOD1YkrueChj8w1abEMkoU3PYnZcPOhmd/0rE9jLVnJ2sxZpmcByBQ6R/9SdvGqbSHw30GvUe3sMo5FI8V8/qH7K5ZZ/veE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265276; c=relaxed/simple;
	bh=j/1/3Eikw8RwiASSzqiDyHhestujvL1djLVDAsiAWwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2WLKL54WxUUja2+S4/kRsMs0Eh+XTFwfKeWOd5ZbSP5PqQJOEZnvRLPoddI1Za2c6EEgrnrEJmt1nl/35qEhm5PZde6OI1a+JIOFWWU5p54Z6lmIKMU/KAu+rZVn6CHEmllX45H/9tXWLIQxshFNqTWoXmif3Jc4DpeOhWrWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 92E4068AFE; Mon, 30 Jun 2025 08:34:30 +0200 (CEST)
Date: Mon, 30 Jun 2025 08:34:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	martin.petersen@oracle.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Subject: Re: [PATCH RESEND] nvme: Fix incorrect cdw15 value in passthru
 error logging
Message-ID: <20250630063430.GA29582@lst.de>
References: <20250628181234.3978844-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628181234.3978844-1-alok.a.tiwari@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.16.

I fixed up the commit message to include a Fixes tag and drop the
mailing list reference.

