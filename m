Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D921882B;
	Fri, 30 May 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594414; cv=none; b=kRMKyPU3rQ/sBPLaUG7NmF/uv2MGH0IP0ok8Y+gMgCneEi2qlE0MGzZE2XIZVx6UQDYnnBflA337BzqcJAcYf6zQozKIs9W8MexbPP4yLDcxGNQ4hmIRMD1NG1KDvMK+vi4w15phAyuw1uLHwETJtgrsc+5Y33Xn51IrOs7rBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594414; c=relaxed/simple;
	bh=pyziCTH2diLk7jYaNaKaBd5SlO0DPjcx6Z2KW/GpnDk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGEQJC9mMWeEq2u8qwwHNKzuhE57cW4koftrSr3rEMWaSMpD+haNYUwLHlYUes2j0Xb3m3muzK53+FIk6KxR2NAn4P0an9KFJCXLw3l74jTgdALHnSb0jxxEqT/WLK6J6EeqMyZf2lXmjvjNvkEGovjZsebTCQU09ESiU/dlqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=kqBQFSvG; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="kqBQFSvG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=49GMHY4OeLfk5bMG6QeyscjCUBw8doMpODBe1qStcRk=; b=kqBQFSvGPsJn8LEtC9minAmpVA
	azao16RPeaJBiJCrLQFIl0edFlDbhpKN6Dng0rjoWPcYHR6fLLDcLZDQ8SlMVWTXJLVP2poXz884B
	+MixYgn5YQO0l3+HfxWk2FpSqM8EMrhGTWJ8BX9hZVmSnI5PlxXf8hPEP+wQKCP/7/YElGSDNyt21
	AjZGfQaqeIJd9e/ytqRaN4G568hb3H2bBod9eKKZjO7yq0hBHWQW7wmjdngwP8oGvoA2mXgORSgZA
	BCFl3UvnpMZdYfIKOlWycav1vmF8EEtcKKSMg1YCYCR00rPHaP6fxkXO9OBaqiIoQ/53dwQb3QBVp
	B2V7deSA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uKvHZ-009jxI-0c;
	Fri, 30 May 2025 16:40:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 May 2025 16:40:05 +0800
Date: Fri, 30 May 2025 16:40:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Add forward declaration of struct seq_file in
 dma-fence.h
Message-ID: <aDlu5TGyA1WuMsvw@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add forward declaration of struct seq_file before using it in
function prototype.

Fixes: a25efb3863d0 ("dma-buf: add dma_fence_describe and dma_resv_describe v2")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..b751ae49d007 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -26,6 +26,7 @@
 struct dma_fence;
 struct dma_fence_ops;
 struct dma_fence_cb;
+struct seq_file;
 
 /**
  * struct dma_fence - software synchronization primitive
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
