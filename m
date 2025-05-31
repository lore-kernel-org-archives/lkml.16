Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B329D19;
	Sat, 31 May 2025 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748702241; cv=none; b=jMRPHzf8G+aQZePVNdBciG34kiKbwPKY7dwcdlOOj9xKT6jeqyf+yRdnxsEPUkSfkWaz7EHqsyOLQR6A5CNGf6XWMTuUqtAIBsHepXrluwjxy91PGHI07a021K7FK8oIqzKT6iXiPvffuAWYgOm+qSU8hywG9fBBnZoPHYyx0yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748702241; c=relaxed/simple;
	bh=fivt1Mk4Yw5WXYfrIwOJfSKG3z+m2LyIrjnukMMgFOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUVJhtt6ymHLHPbEZjeTKHlDTYeTV7GgLvOFrcGPNNkn4eSK90gJRceyJeKWvoZIXzwJtl+hl6VjBoxadJsmdhlbBPSEk0IRnBTVQd+ZI0VahBj/Agwlg9SzfoF6ax43qZB62PEYerxlpRWenaTIXSqDsuhr+hofD8NkhLXWi7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSeMVG/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSeMVG/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4CFC4CEE3;
	Sat, 31 May 2025 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748702240;
	bh=fivt1Mk4Yw5WXYfrIwOJfSKG3z+m2LyIrjnukMMgFOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSeMVG/Fbe4qRBejiZw0EyatWeyiWsE20b6NZA1wBfJWpepek0YCiHbxmDi/Mb0gA
	 YvT1GDR0JgkrXPMEXnskuvgMpIxBIia/wv9AEZFvb8mJ9bKRGsuKfUfbHjQDaVTLqO
	 tteVaN0kse0EAUXGjtVD3idwokMzsGoi9l23MVq/J8ZnRSxOgCM8pzbX9ZiroqYtAx
	 tu+YSV3yG0bys0FsnbU5PPjpg1kkC4VGSF+612EPLKmNtGdAc49h5+AkeFtJUarRSk
	 Vtm4GfcJfJkvP9fKwRXo1G2dwMCcQAmwalOWUIRRBZlHfqXr0aDbl+gmHjbCeJT7qF
	 bimcc3X3iNdww==
Date: Sat, 31 May 2025 16:37:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aDsUGGrjbJ_8KyrP@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com>
 <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
 <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>

On Sat, May 31, 2025 at 04:09:29PM +0200, Miguel Ojeda wrote:
> On Fri, May 30, 2025 at 11:51 PM Lyude Paul <lyude@redhat.com> wrote:
> > TBH - we should really add some safe bindings for sleeps instead of calling
> > this unsafely, I'd be happy to review them if you do
> 
> In case it helps, there is:
> 
>     https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.tomonori@gmail.com/
> 
> I think that is the last one -- we have been going back and forth a
> bit on it (e.g. we had `coarse_sleep()` in the old `rust` pre-merge
> branch), but, yeah, let's try to get the abstraction(s) in.

We've already discussed this on previous versions of this patch series, where I
also pointed to the patch series linked above.

I agreed to take this code without waiting for those abstractions, but with a
TODO to fix things up once they land.

- Danilo
