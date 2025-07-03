Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A4B676;
	Thu,  3 Jul 2025 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543041; cv=none; b=e1CAqdAkqfd7e8dykA1f4sK0y9L3IUT+AieN3AcXCBpSj+/kWk4jSNlqIJ6x42l+vO+HfOPlQ14jqEW6+e+ayMuh6wUyGkb87kvfdo21GNwLyrzF32egTnN1IJRgg05o4tn00ULAmxoToCk+4POSvArLQab30BXeRyEKyTo/264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543041; c=relaxed/simple;
	bh=2E4q/VTewWdAiwGBze8dCv3IXOy5Ea14A1k3uP8YBWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldIv7ykKhe17g2XbRIfDntYegdlDE1y56MvlejzdUHtVPs5KjPF5FtYidu3rBnzgmGvRwzhMRpjb91qGMvHiwBmTM7q98qVTwxB1G/y13Ut1DVXIWYSMXg1uA+gESsW0o3IxrKXRDywEr0zqzUWmjACbsAArfgiYS/ZkTlQKpRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0192F67373; Thu,  3 Jul 2025 13:43:54 +0200 (CEST)
Date: Thu, 3 Jul 2025 13:43:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-nvme@lists.infradead.org, rdunlap@infradead.org,
	kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, nilay@linux.ibm.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] nvme: typo and minor cleanup fixes across host
 and target driver
Message-ID: <20250703114354.GB17686@lst.de>
References: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks, applied to nvme-6.17.
