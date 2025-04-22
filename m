Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9100293B55
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340807; cv=none; b=Pen4tU3OOCPAGxnLPQ0/dut5xcczQz24W+D/01jWDx/pcD8zAlEZyU63pglEceGbs+4duxcD6PZdaV4vT1gomcV6HfU222F777jUctWJ47+sHRbY2nDbGN3ZqHTizX9sdcfk5OkOvTW7mx0uexoGS+dlUMBbgbvCgmuh+CsNBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340807; c=relaxed/simple;
	bh=1VvrGlRC/Ba3kcGFKd5TjwKkEajuED8SBgZTYhd0zvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU6glBO+qiRtCi4XO/p1SbsjI55Gsp+VsK0Cx1vTVd98JLwGehO7YzdidS3xtAdxx3xKBKL/crddW+NDiuIVOjm5Oneg6fH0ql+hehIqZFdpr15O011PGlhS4YuYItCatFEG/4/m2ozuP/KQFYUgEK8Q6J9lsFLGtoCceQj1BEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=YuLJS3M3; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="YuLJS3M3"
Date: Tue, 22 Apr 2025 12:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745340791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNBnrUig8d/7iyBpxwbIYcm/9fUV1xZh0qLhXZS0ujY=;
	b=YuLJS3M3XrUeSddwGp+qWHk0nBrJudL0ed4BFYrYaqwLAUWE6hdV25uAM0gm+0cSsMpsMw
	zDEcn3zcFy+R/l7JQFdFndmgFNE6j8LvJIwInTge/DyNgXf3DQLtzNuFw8i+QfkWHLkWL5
	Mi/xhbT8kkRvBpQADeUjH8+xQhIC2nSQPOeAufkTjN7yAcYa9FalbQj6bhQgO5vyOvMofQ
	gsKctrqm/1RBa05SNfFbh6Mq9PtBgQdYJYepwnjq72pE97xdmRHxoV9P+gLJDw3dqPzRaR
	Ggh2f/GeF0J9lnmaIO3GtkFi3aVej1W4p8EL1nLrDI8pT41HJzQR6/heqDqBiA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 1/2] rust: helpers: Add bindings/wrappers for dma_resv
Message-ID: <aAfJadjG0RACO1-W@blossom>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-1-44d4fc25e411@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422-gpuvm-v2-1-44d4fc25e411@collabora.com>
X-Migadu-Flow: FLOW_OUT

This needs your Signed-off-by too as you are the submitter

Le Tue, Apr 22, 2025 at 01:41:52PM -0300, Daniel Almeida a écrit :
> From: Asahi Lina <lina@asahilina.net>
> 
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/dma-resv.c         | 13 +++++++++++++
>  rust/helpers/helpers.c          |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index e6020ba5b00237a08402fbd609c7fba27b970dd9..68d7be498a6d523797e54212d6c23ff4d8f2e92d 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -18,6 +18,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/cred.h>
>  #include <linux/device/faux.h>
> +#include <linux/dma-resv.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/file.h>
> diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..05501cb814513b483afd0b7f220230d867863c2f
> --- /dev/null
> +++ b/rust/helpers/dma-resv.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-resv.h>
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
> +{
> +	return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> +	dma_resv_unlock(obj);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 7a06d6bc48537248c8a3ec4243b37d8fb2b1cb26..c5e536d688bc35c7b348daa61e868c91a7bdbd23 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -14,6 +14,7 @@
>  #include "build_bug.c"
>  #include "cred.c"
>  #include "device.c"
> +#include "dma-resv.c"
>  #include "drm.c"
>  #include "err.c"
>  #include "fs.c"
> 
> -- 
> 2.49.0
> 
