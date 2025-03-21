Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715651E8336
	for <linux-kernel@vger.kernel.org>; Fri, 21 Mar 2025 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742537755; cv=none; b=F44Wm9VWdfD6/qBMBeoVVf6RSj6JULNueav0JXZl1AAPoP3d8bgk/ArgDHVb60pg7H+O8xk2bZ3nC0K9Vqa7eVmOPOdJpBEx0PU2NPH6djaFJqzoVXL2PGepD8YxewCXogXVTafTZ3/6nLQSzYWhDWlfVgKKOl36nwTgYTUSLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742537755; c=relaxed/simple;
	bh=Emf1WuAUrZ46ch/rp0NDD/4Sb1YnvJZc/PHuIXpw9ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyRhgNGYeKt1hG4iTstBCIa+3oyXN0OaE9Bm5wwBJV35P0DlhlxoThJ1JDv2PJ3V5BsJwG0fdKO5mCr9AAkYw6uKkUEZ7fOwJ1BYxOOPPVpg43C4Gwc3boRaL1zyO/MxuKJcCU66DZUARLw4U8ch36XteyDKK1/TAT59d4YfS9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 98AC068AA6; Fri, 21 Mar 2025 07:15:49 +0100 (CET)
Date: Fri, 21 Mar 2025 07:15:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <wagi@kernel.org>
Cc: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/18] nvmet-fc: update tgtport ref per assoc
Message-ID: <20250321061549.GE3198@lst.de>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org> <20250318-nvmet-fcloop-v3-13-05fec0fc02f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-nvmet-fcloop-v3-13-05fec0fc02f6@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 18, 2025 at 11:40:07AM +0100, Daniel Wagner wrote:
> We need to take for each unique association a reference.
> nvmet_fc_alloc_hostport for each newly created association.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

