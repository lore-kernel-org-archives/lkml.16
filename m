Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CAF23A997;
	Tue, 22 Apr 2025 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306679; cv=none; b=G0DFBJBYB3/afrla/u4FomZ0nsE0esu6Mj7Xe3xvjrACKgQeS/RgyG8UzNQ9Ld1JMXD01bJsGNCFbRq4NO9reVMlWTNKf2NOrFwYuPq4OtkJ4QhLZIS+z+e/Inkw+quYpUt73YflQmvwbNHcEVuaOWt9eQkzGRq62gK13W2WbNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306679; c=relaxed/simple;
	bh=rARWxkaM3ziM47daCESlNva3TTKxaptZ6wnLUD/IjrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm2+/60b17QgYSMTFrl/WH2PI+89x+Tc9pWdO7AJsOaanQPbzEDjt6rf9M0mb8KCFKRWiNuyIro/rPVRjSwYzK2gtB5vkDcKHN+w37qb0ZStVbvwzN0dTISal4AuOcaJXQnUgmePBMTT7MtNAo4PjfXzOw9bCAgSqR4zJpXU5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WQPEIqfk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WQPEIqfk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6qf9NVyxxYmhp4Hd5psJAzdLeVZIv51mqD4ALuDoFZA=; b=WQPEIqfkHJ+dzMX8QLLz8iFWqn
	d3ZexGjf6uzR8lxnnwSXY4Wy291ir1mGk4hhms1r5HnZpe/TsBLNsdO350kTqQZk32CGPBaJyDUK5
	QuxV3UEfqXzljiUKe7MUILPk5m9ynr/wc9WnJcDN6ynI7GIaCN9Pr6jkKQHrUHb9+g2zXalcCaO8f
	qbGlihHutDlJfUVUwksYMldtc+wL1cY9J8JS7iSIaub61LsxVgASEnaSbTudmM/AEsKLjq7cYula9
	k3mbad5zqc/5PVr+kYNqJBV47zTKsYWkCj75oFA6/RexxfFEhc3S1tEpNtAyM3IXWZoSOpb6P65BP
	srDf/Afg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77zf-000000066dm-3uaX;
	Tue, 22 Apr 2025 07:24:35 +0000
Date: Tue, 22 Apr 2025 00:24:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: skhan@linuxfoundation.org, gregkh@linuxfoundation.org, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shuah@kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <aAdEM0crDfSP9JYf@infradead.org>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422063409.607859-1-min_halo@163.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 22, 2025 at 02:34:09PM +0800, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> fix usb device limited  max_sectors when use usbip protocol

As far as I can tell this is a virtual HCI and can't perform DMA.
Thus nothing should use DMA API calls on it and the mask is irrelevant.

