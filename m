Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE282D1922
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932166; cv=none; b=DnNecChNiPwWKovJu/jEJ3y+OIWDMQp5Q32+xXr1Kr1jXKu5yyFdYnFCicE+9F1TrzmuoijjvBC59bHGtg1kpz54masAQVZu9MOmduMBswrjJ0jdd1aNk3pj5dl01YrfVD8FmEtKyyTW+AoFhjOnoyhXAQ8u1JFyO1tZ7bvWT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932166; c=relaxed/simple;
	bh=mZjMxrhZX3PqZC48WDq0iIbfVoV5QzA01VRsQ1C30T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n71s++kK/JH2D5sFSN0t9/SBMfuNQBjTu5K6E16N0iSFouWRCBTv+dSKM/uI9eQ7B7nsxe4xRC5y8FmWi3BP/4a3ChClfyVwxTy9QPg7lPMZgIEBtK0tOmVMdJckEInrdOTMPhYXu6/Q9ZExt/p5PhkyEsHPFat1fET3RAY4tps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 483C668B05; Tue, 29 Apr 2025 15:09:19 +0200 (CEST)
Date: Tue, 29 Apr 2025 15:09:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] drivers/nvme: Add quirks for device 126f:1001
Message-ID: <20250429130918.GA13970@lst.de>
References: <5AE9DE3EEA7F8772+20250422121725.162229-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5AE9DE3EEA7F8772+20250422121725.162229-1-wangyuli@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

added to nvme-6.15.

