Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CB214223
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018707; cv=none; b=UEn/C/xTq4Hr/NfO+7s4jiyxHDF7j1seKn8m3TnIGeTza85wPvfKe7OwxzWgBYkigjUdW4RgarWnRa2Gb+rNjFhZB3qPFlfnMqiQPrJ4SEmBQyCtOuyYuGEp96+EpLB5sUodCx0QZyz3+lhWasgIrwdl/9muYAx22viS3lx6V24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018707; c=relaxed/simple;
	bh=OBsjaD0Pqfjc4dBlvRr3DUQqSvp/66vJ/h2DsOXbtiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EACWb6XIwuTUt4ypy3twnoS1pmv+3DxgCBHw/NshoFitHt2DYR8vLyWEkSiAP1t7mJBUsYQPIQgnt/JIxmYZbZ/frNQlyICdu5d4xKGQU+5+GJqRduHF6hxDIecRJRzPa5y2IEMPsXbrHO29PifFHhYULMREVRfdXQC2QY7J/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 86BE767373; Wed, 30 Apr 2025 15:11:40 +0200 (CEST)
Date: Wed, 30 Apr 2025 15:11:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alistair Francis <alistair23@gmail.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	hare@suse.de, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2] nvme-tcp: select tls config when tcp tls is enabled
Message-ID: <20250430131140.GA2191@lst.de>
References: <20250429222347.2215363-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429222347.2215363-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

I've appllied both tls select patches with a bit of commit log tweaking
to the nvme-6.15 branch.

