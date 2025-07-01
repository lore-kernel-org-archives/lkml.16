Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1BD72602;
	Tue,  1 Jul 2025 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361075; cv=none; b=md7p226jv0qo5dI7jpMaMO0rNxr9IjzyO+dCcb66r0MQIGAut5z3/PpEYeoeCvlQRhfFgJK29tC/94woi1jgjeodGZLBoWCJA0gSrevKH15M5z0GHP6xsnTxR9cMd6cPu17y9WBvnJG4q9OxNgGrWzayquwG39hldRpjyb4y8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361075; c=relaxed/simple;
	bh=rAIL7P5+qgQNxK6HoIqMiX8Nk+ttOzK/4HLG7PIlpec=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7dJfE6PAyNTo8iOR4ccEF5nHRDqmgyxC5s7OzJFqj15hsB2mzoAjhuHJSbtGYUJADEfCbOmcLPzV9QM4n+VR4R4GnCT61BxYVTeO6YRO/5ttocY81SzGV17X4VS0bOXTA/uALO56VAQ6R1hlFhNfZlp3VkGc9KrHNcYdAZa5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XiY0mipX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XiY0mipX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751361070;
	bh=rAIL7P5+qgQNxK6HoIqMiX8Nk+ttOzK/4HLG7PIlpec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XiY0mipXyPR5TGdzWUzCkYtMFOFA9XsLStZoUjZL6EMse9DdrVrca8Mrd7cE0DmW8
	 wmR0+Lb8y590XdxthIJQGP75zQY79S1hOMPK8tUOEmBEH2hnvgXBjDMZD14edIiTGP
	 MixfqPrVmDwiu62qP91NCqC2GKBMj8gjtY38Ky1Rgb1x9zKnk592Cx3gbT+g2SKBs9
	 iWx5Qiy9TfHTeP9t5sZU6TUn6f9s6/piHke1BNvMh5C4b6BmTSyHztDWtqU6wVvR1X
	 9wMY6c4jgyuZ9k0Lv6K3X0kk6aF8564rKmR1kEX7ev11LcKdz924p51PF/JVuv8LsB
	 kcYT9taBGpgVg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DAC417E0342;
	Tue,  1 Jul 2025 11:11:09 +0200 (CEST)
Date: Tue, 1 Jul 2025 11:11:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Daniel Stone <daniels@collabora.com>, Rob
 Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>, Beata
 Michalska <beata.michalska@arm.com>, Carsten Haitzler
 <carsten.haitzler@foss.arm.com>, Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <20250701111103.728ef3d7@fedora>
In-Reply-To: <e64c20ae-5aaf-44cf-a463-c7eb1134daee@kernel.org>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
	<aF8lYpK_l2I-ts1k@pollux>
	<20250630180631.5e8066cd@fedora>
	<e64c20ae-5aaf-44cf-a463-c7eb1134daee@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Jun 2025 18:12:02 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On 6/30/25 6:06 PM, Boris Brezillon wrote:
> > On Sat, 28 Jun 2025 01:12:34 +0200
> > Danilo Krummrich <dakr@kernel.org> wrote:
> >   
> >>> +    pub(crate) fn log(&self, pdev: &platform::Device) {
> >>> +        let major = (self.gpu_id >> 16) & 0xff;
> >>> +        let minor = (self.gpu_id >> 8) & 0xff;
> >>> +        let status = self.gpu_id & 0xff;
> >>> +
> >>> +        let model_name = if let Some(model) = GPU_MODELS
> >>> +            .iter()
> >>> +            .find(|&f| f.major == major && f.minor == minor)
> >>> +        {
> >>> +            model.name
> >>> +        } else {
> >>> +            "unknown"
> >>> +        };
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
> >>> +            model_name,
> >>> +            self.gpu_id >> 16,
> >>> +            major,
> >>> +            minor,
> >>> +            status
> >>> +        );
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
> >>> +            self.l2_features,
> >>> +            self.tiler_features,
> >>> +            self.mem_features,
> >>> +            self.mmu_features,
> >>> +            self.as_present
> >>> +        );
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
> >>> +            self.shader_present,
> >>> +            self.l2_present,
> >>> +            self.tiler_present
> >>> +        );
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "PA bits: {}, VA bits: {}",
> >>> +            self.pa_bits(),
> >>> +            self.va_bits()
> >>> +        );
> >>> +    }  
> >>
> >> This is called from probe() and seems way too verbose for dev_info!(), please
> >> use dev_dbg!() instead.  
> > 
> > We do have the same level of verbosity in Panthor, and it's proven
> > useful when people are filling bug reports. Asking them to reload
> > the module with debug prints enabled is kinda annoying, and I don't
> > think I've heard anyone complaining that this was too verbose or slowing
> > down the boot, so I'd be tempted to keep it like that, and least for
> > the information printed in this function.  
> 
> Yeah, I think for the GPU revision bits that's reasonable, but do you really
> also need the other prints to be dev_info()? Don't you know this information
> from the combination of the GPU revision bits and the kernel version?

Sure, we could have a tool extracting most of that from the driver info
and DEV_QUERY ioctl(), but those info have been printed in Panfrost
since the early days. I picked those traces up in Panthor because devs
were used to it, and I honestly see no good reason to not print those as
dev_info() in Tyr too. What's your concern here? Is this about boot
time, not bloating the kernel logs or something else? I mean, we're
talking about less than 10 lines printed at boot/module-load-time.
