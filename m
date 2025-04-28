Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1C211491
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874132; cv=none; b=C6MKMYCA/J7deaB1KQnun5VUh+oZqcDq+/wiaataeqKEdFRF//q+Vbm3lsmSneLIGZFXcbArRNtPCl4eQioA0gjN4pxsO7Rq3tU9mypt2ysqppnDRrST0h23bD4nSEpPJe6r7e+rLuXZkZ8wpKi3HWxOGSungj3SQEU9uieaoX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874132; c=relaxed/simple;
	bh=uFy64hjD9G3dmGLaWYI8NoewCg+O6nfEnbDF2t6mbl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlkypgfZ3uvvH5QWL2bmAMOY4RYvovXm5WKoYzMUabU5ON7f/o95+YBt2O9QSOnH0ae70eR6QHJNwg036uFQ3v6ajZ5jnsygCI+1gMVqGnYV2i3H1QC57i2ufiJ+r3VTw4bq5ZIXuTe7aCBjKHgGP1ScPfa0iAIB8aFcU9FySLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ESXiq0Zt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ESXiq0Zt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BH6a6zkB8uAs5Z9rvGvulPR/9cdqETpPuNGpFOYlvmg=; b=ESXiq0ZtjzDSvI1TfGX3bXDpDj
	H33dovjUSz5xkIDshHmIgYwrN6TvP9NHFCGBR+XMP44BcOYvDmt9SIz5AtVKXvCEA2IDbJ68FwAWd
	scWjpOa3EIQwNYTcgbESza3V9Hf5j7zO3ytHih2TcsFxKf78WBtQfVG6JazjxIlNVv/+4AKoyIWf5
	j7n4/udNcR0EAARPM0YM/4Lr94hD4YThh3uxJcxhW4OTZsiiLnvM/EWcp4f4egEZvfQh3KzR36IQ+
	AiSQjGLrrA9FdMsmXeSui/veNtAsd1bv05VGbYCFcVGq4LDmWUvJ3dHfA8Ab+z9JopBrDMQB43yfG
	VrK7KmLg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vc5-0000000Dmmi-0qj2;
	Mon, 28 Apr 2025 21:02:05 +0000
Date: Mon, 28 Apr 2025 22:02:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v3 1/4] mm/hugetlb: Pass folio instead of page to
 unmap_ref_private()
Message-ID: <aA_szRFu4zrZqabV@casper.infradead.org>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-4-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171608.21111-4-nifan.cxl@gmail.com>

On Mon, Apr 28, 2025 at 10:11:44AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_ref_private() has only user, which passes in
> &folio->page. Let it take folio directly.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
