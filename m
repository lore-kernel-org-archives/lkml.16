Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FA525D1F0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188315; cv=none; b=obprivKtjcNny08fnUqi1kKnEme9rW/UQdySWG18rQIrCNnCLxQHCArflJ4x8pW/K910o3DB7gAAsbZlUYMHGSUup/6/rnV6KTZ/s+uxejB0+mJgpDyY/pPEwggq6KiVdu8oYObLK+LOfrvKjfXAtexGQqY4JbjR6JKiaBOWEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188315; c=relaxed/simple;
	bh=APb4kbTYmWNwwMpn3aJyqwVPVHnbqtlfF4Eo1Azdgrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOskfBKv/ZuUZbQ80OVhldBg96047Peteuf34hH3ryjzj/8DpSOrDhEi41gLkdS7ivCqNgpjximQz0WhOikvPm61hbSGsJx9c3xURd92vromLN2GsneqqTF3v3PBJv9l3BE+is5pnoD7vGyZBfsnCCXRp7nT3+QHVZAfr0Mdejg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2EA5F68AA6; Wed,  9 Apr 2025 10:45:10 +0200 (CEST)
Date: Wed, 9 Apr 2025 10:45:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-tcp: switch to using the crc32c library
Message-ID: <20250409084509.GB2771@lst.de>
References: <20250226062841.60688-1-ebiggers@kernel.org> <20250409040415.GB4424@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409040415.GB4424@sol.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)

I'll pick it up once the 6.16 branch opens.

