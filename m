Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D072D052;
	Sat, 17 May 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481839; cv=none; b=DAlzoeYN+yRviA6763QFuOwfsGObaeMp0Y/D8ZSRhBWkZkd6pP/al8+FR4TqkwDoG9afP9SfvxS0JXNyBhv95KfUrdcsSuH6LgCTIpKEHgzZV9yl/w4YLUITctY+pVbc6I6ViBDLkf4bRdeuOOT2pi6DuGP69X9B4oHC4W7VF2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481839; c=relaxed/simple;
	bh=Ei657i5dwkNqoKljVGDuxMWyt63ZJ2kvORGx2NS1+r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpXITAndEcKHgl1Qu/p7hVU9Cwd3KBX/qBHoALTSNnLuksi54r1Wo0v4VCR8CT111jASzvQtqon5V6e0FufSNOunb8xUZJCJJAYN99Ec3WB4azX2bVeVSMhEr9qkragvEMEJJ3ggHE+QyQP/S+jrkx5XPg3NeNW82y6+Q7f2oaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlM0QxaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlM0QxaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445BBC4CEE3;
	Sat, 17 May 2025 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747481839;
	bh=Ei657i5dwkNqoKljVGDuxMWyt63ZJ2kvORGx2NS1+r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlM0QxaDEU4EEuXF2Mw17ji0aXaqFOvbJ29zORX8CLSP8450GgW97pODC4n/w6ddl
	 NtQ2vXeNFwltLBu7Ki6hZM2E3fY47i44++TQ9dtKanTKeVGIuWbfu9HKZ1El+QoXa1
	 DTbifq0aoYfhzKjjAzcj+1o7wYiIvbKA1jrJIqwXleOekuD/xHTYhZBeZjD45nfBEb
	 AZC3WS2DecyCJNhDPJPE8vZk1a/Awh1Hyqj42LSf54vSCLczPU9SSgeGXso4P7dLpN
	 VE9Y2YlIosKh5JXsg/vRqvCI+N6YlpLmkRQJu/I6lYq2LFUuLfoJw63vToFRjZl8bM
	 DPnlVx9/2xJVQ==
Date: Sat, 17 May 2025 13:37:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH v2 3/4] rust: drm: gem: Add ObjectFile type alias
Message-ID: <aCh06ESdHK-vDYXy@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
 <20250516171030.776924-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516171030.776924-4-lyude@redhat.com>

On Fri, May 16, 2025 at 01:09:18PM -0400, Lyude Paul wrote:
> Just to reduce the clutter with the File<…> types in gem.rs.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index c17b36948bae3..2b81298d29765 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -17,6 +17,13 @@
>  /// A type alias for the Object type in use by a [`drm::Driver`].
>  pub type DriverObject<T> = <<T as BaseDriverObject>::Driver as drm::Driver>::Object;
>  
> +/// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
> +/// [`DriverObject`] implementation.
> +///
> +/// [`Driver`]: drm::Driver
> +/// [`DriverFile`]: drm::file::DriverFile
> +pub type ObjectFile<T> = drm::File<<<T as BaseDriverObject>::Driver as drm::Driver>::File>;

Shouldn't we call this just DriverFile? The fact that you derive the Driver type
from the Object type isn't relevant for the File type, i.e. it's not specific to
the Object, but to the Driver.

Also, why does this need to be pub? Shouldn't it be crate private instead? Or
does it make sense to use this in drivers? If so, please use it in nova-drm for
reference.
