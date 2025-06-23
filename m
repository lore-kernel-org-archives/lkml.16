Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536B1219E0;
	Mon, 23 Jun 2025 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712502; cv=none; b=SBVdqHD3KHL9Cb0NFSEd0xYnmwklN8rB74z7daMgXX+WeCPnIREFxAaCnoEtYyBlmbMr+gnefbSBhdsheEJu3ehCcnInQnl2NjREk4zxULFVT4bvV8udVNBmWk3orbAnDBgzF2F0p78OpIyUQYxpWdh+FdRI2rpxZnGxWeYtAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712502; c=relaxed/simple;
	bh=cXERQ1WmiGcavPsAUvd/Crx3myoOelB9VzsYgMSyqhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDkSMpb2qI4wzyhod84L4OjPPmrjCFG6BlCnhJkv+Bw3nKZma4Dp49uRt1f/7o7HFCrkS4yQE4DEHpZzC5grOrPXiF+IgcTliO05FSeFVIE/lzhv/JpBO1u2nSUkVS9FKE+KMyGtd80JnmF6XriZ46qcb3Q/ISUZtekKj87vleE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pim3mZX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pim3mZX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AF7C4CEEA;
	Mon, 23 Jun 2025 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712501;
	bh=cXERQ1WmiGcavPsAUvd/Crx3myoOelB9VzsYgMSyqhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pim3mZX7P22cyRJaxzARvvsGUQba6pzW1S54DajAidtnK+pjc26kCIT6gp5FcHyoU
	 4LKJ3PM8JXySQIIUGIRNPPO5muVBX09FIIu+xVm33HPD6xLgk/pqOWRuDlhl2Q6+F0
	 PeqqAjkxfWl/Sya2gwOOALAZ1bGBk9DEspMFZN6bCz72nSrS4gQScTKd8OGZdBxXCL
	 A883g7Bd4lsxrr7Wc/dnfj4Zetd/WKI2aJ7ZeIWVJdHANreVP9wC1MTjmqBKnvfchv
	 0WWDAatZxoBBeyF37BzqDHE+SvypbijyUdQt8E14Howwvy46wN9FnEIl2+tvZHbLnL
	 oJmK6rHvudkuA==
Date: Mon, 23 Jun 2025 23:01:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
Message-ID: <aFnArVIFkHCUzNqe@pollux>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>

On Thu, Jun 19, 2025 at 10:23:44PM +0900, Alexandre Courbot wrote:

Applied to nova-next, thanks!

> Alexandre Courbot (21):
>       rust: make ETIMEDOUT error available
>       rust: sizes: add constants up to SZ_2G
>       gpu: nova-core: use absolute paths in register!() macro
>       gpu: nova-core: add delimiter for helper rules in register!() macro
>       gpu: nova-core: expose the offset of each register as a type constant
>       gpu: nova-core: allow register aliases
>       gpu: nova-core: increase BAR0 size to 16MB
>       gpu: nova-core: add helper function to wait on condition
>       gpu: nova-core: wait for GFW_BOOT completion

  [ Slightly adjust comments in wait_gfw_boot_completion(). - Danilo ]

>       gpu: nova-core: add DMA object struct
>       gpu: nova-core: register sysmem flush page

  [ * Use kernel::page::PAGE_SIZE instead of kernel::bindings::PAGE_SIZE.
    * Get rid of the Option for SysmemFlush.
    * Slightly reword SysmemFlush doc-comments.

    - Danilo ]

>       gpu: nova-core: add falcon register definitions and base code
>       gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
>       gpu: nova-core: compute layout of the FRTS region

  [ In doc-comment of FbLayout s/bootup process/boot process/ - Danilo ]

>       gpu: nova-core: add types for patching firmware binaries
>       gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRTS
>       gpu: nova-core: load and run FWSEC-FRTS
>       gpu: nova-core: update and annotate TODO list
> 
> Joel Fernandes (3):
>       gpu: nova-core: vbios: Add base support for VBIOS construction and iteration

  [ Replace extend_with() and copy_from_slice() with extend_from_slice();
    re-format and use markdown in comments. - Danilo ]

>       gpu: nova-core: vbios: Add support to look up PMU table in FWSEC

  [ Re-format and use markdown in comments. - Danilo ]

>       gpu: nova-core: vbios: Add support for FWSEC ucode extraction

  [ Re-format and use markdown in comments. - Danilo ]

There's one thing that would be nice to fix subsequently, which is properly
resetting the GPU. Currently, it needs a power cycle to be able to probe
successfully after unbinding the driver.

- Danilo
