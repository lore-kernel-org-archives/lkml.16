Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1D17A303;
	Tue, 13 May 2025 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147686; cv=none; b=JYxNcX2soOmM6mPs9l7D3Njd5JKyVw7Oj585oHLOoCIBpAlOxVgtJepGgW/7nDTjTrPQEaaYqqhilAqi3ryzCGqEQMtyWRb3zS0ugT2RyQcaTeQkC2kK8KMAYMxAWcQUet6deD0TDA4/b7D0aWaHjthxQj6LgwfOs84RocDzQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147686; c=relaxed/simple;
	bh=pu5WE5MuuUFAeE9gbNtjiSxtT2sr+B5hH8+yd9SPu+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUsD4TRD/j1ZlGieoJ4r1DnznaqU+WyyQ+ftrQnC/QhjVJuh1EXZEDHHktulpmesKKPk2CgVChWwqGWPhqK5JROzwST/PFuFCIuSDCRJP3V56yf75B50WXjWKRzxK+4NfiWNmfs50zwGtOK6eDmMBZiLL/W0XQYf2nq6yFt/UQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXswE7qB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXswE7qB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEAFC4CEE9;
	Tue, 13 May 2025 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147685;
	bh=pu5WE5MuuUFAeE9gbNtjiSxtT2sr+B5hH8+yd9SPu+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXswE7qBVxvJqBIBBxdcEQuL74aFCEU9KM71rism1P8JnuSmssy/6/TFTTAvbGaxw
	 JPTA4wMpezpkA5U0oTLN1aHN61ETWYNl3ieeGwlQlKIflxp5Y0HMJEWIDscgir9jty
	 jXsZpDHd+mfQHiO7N7b4I9Ocn19oo8xLly5v2vdyy2V6wr5AVF4lSNRorzGvIzMEdx
	 G6o9NQ5UmLCbYGyYNbeOExG+rmmuULqoRlJPcgGiBF2/ZBinjmy9AXMg81zTdZDlO4
	 OyzVH6EayTgtR8v46yCr2dMHT7D2rhIkXUD+NVsYTk9El7BoEgh978jGyk5eHRRIeM
	 SF6WSeGLywj9Q==
Date: Tue, 13 May 2025 16:47:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 11/19] gpu: nova-core: register sysmem flush page
Message-ID: <aCNbnWJKM_O8sLtP@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-11-fcb02749754d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-11-fcb02749754d@nvidia.com>

On Wed, May 07, 2025 at 10:52:38PM +0900, Alexandre Courbot wrote:
> A page of system memory is reserved so sysmembar can perform a read on

NIT: Use imperative mood.

> it if a system write occurred since the last flush. Do this early as it
> can be required to e.g. reset the GPU falcons.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++++++++++++++++++++++++--
>  drivers/gpu/nova-core/regs.rs | 10 ++++++++++
>  2 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index a9fcf74717791dc7e23678869bf84f61e51873e2..c338da69ecbc2200f1ef3061a4d62971b021e3eb 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -3,6 +3,7 @@
>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>  
>  use crate::devinit;
> +use crate::dma::DmaObject;
>  use crate::driver::Bar0;
>  use crate::firmware::Firmware;
>  use crate::regs;
> @@ -158,12 +159,32 @@ fn new(bar: &Bar0) -> Result<Spec> {
>  }
>  
>  /// Structure holding the resources required to operate the GPU.
> -#[pin_data]
> +#[pin_data(PinnedDrop)]
>  pub(crate) struct Gpu {
>      spec: Spec,
>      /// MMIO mapping of PCI BAR 0
>      bar: Devres<Bar0>,
>      fw: Firmware,
> +    // System memory page required for flushing all pending GPU-side memory writes done through
> +    // PCIE into system memory.

Please make this a doc-comment.
