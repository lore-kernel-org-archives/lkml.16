Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37794293B5C;
	Mon, 30 Jun 2025 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299929; cv=none; b=EnIsAVVzCTw0pj1ibL8wNNQPqu43XTu1ANxvMnub4gmzDfgvqP/GPDCGnOpuNINdmfnvj/Ds2uOU5HctuwxYZXYTPWcywEsiqYwIKJ6/wWcgxT0XkDSj9SHsq8Dz3Y8H7WW1JgkZlKjP2oneZ14b8CAwUS4/iFuRcH+juEyb3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299929; c=relaxed/simple;
	bh=pMdI6QJaU0k9Tifk5m6sg1z61/DI88a7J1nzMO0v4cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDT8lkxazAcVkVJaT6u0AGhTvbx95jS7tjqNmp75BQtsN41+2JYvy1ocw4Xn/4uKUb3n2R3nO3TKELAhfy5n4SBEdACgoBqfA1UiRXfdr+BpEnaWTZhhtMr8YRfgzaJH1nbG72Tc+Tz59oUjfbcUApAtYQUGcbCUZnUs/Org5zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbkKMYdK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbkKMYdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48084C4CEE3;
	Mon, 30 Jun 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299929;
	bh=pMdI6QJaU0k9Tifk5m6sg1z61/DI88a7J1nzMO0v4cE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JbkKMYdKLwJlbbYUyG93oRN55gMsdPUa16eCyB9QXrfNcfm/oKrmIDeQ148OE1sJ1
	 l9FstzDwuLqEGpHVE6PeHYwZ8EBJ4+dmwJ1ODI35QnsM94xYT7s4Zw/zZqlfyHhk+m
	 qT1Y6VL5IFf7rfk9uQ4S4eDvWpA4LezxIfmC/v5xi06vbbzBkMzv/ZQXAvJUNHsSOJ
	 O5osbfYFt64BQYZjuwKgumkRBIDmlMDOWiQZQyY+zSc/iB0Qpmt8JUVvX/tdUX4yCA
	 cD3pJ98XWWUKK/BZKs6bRQPxxSgPUS7kM+kcSiFBIbYolXh1Ave8u7J7ABaqNUz1f1
	 EAwuVgzrGJ8Pg==
Message-ID: <e64c20ae-5aaf-44cf-a463-c7eb1134daee@kernel.org>
Date: Mon, 30 Jun 2025 18:12:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Introduce Tyr
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>, Beata Michalska
 <beata.michalska@arm.com>, Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux> <20250630180631.5e8066cd@fedora>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250630180631.5e8066cd@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/25 6:06 PM, Boris Brezillon wrote:
> On Sat, 28 Jun 2025 01:12:34 +0200
> Danilo Krummrich <dakr@kernel.org> wrote:
> 
>>> +    pub(crate) fn log(&self, pdev: &platform::Device) {
>>> +        let major = (self.gpu_id >> 16) & 0xff;
>>> +        let minor = (self.gpu_id >> 8) & 0xff;
>>> +        let status = self.gpu_id & 0xff;
>>> +
>>> +        let model_name = if let Some(model) = GPU_MODELS
>>> +            .iter()
>>> +            .find(|&f| f.major == major && f.minor == minor)
>>> +        {
>>> +            model.name
>>> +        } else {
>>> +            "unknown"
>>> +        };
>>> +
>>> +        dev_info!(
>>> +            pdev.as_ref(),
>>> +            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
>>> +            model_name,
>>> +            self.gpu_id >> 16,
>>> +            major,
>>> +            minor,
>>> +            status
>>> +        );
>>> +
>>> +        dev_info!(
>>> +            pdev.as_ref(),
>>> +            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
>>> +            self.l2_features,
>>> +            self.tiler_features,
>>> +            self.mem_features,
>>> +            self.mmu_features,
>>> +            self.as_present
>>> +        );
>>> +
>>> +        dev_info!(
>>> +            pdev.as_ref(),
>>> +            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
>>> +            self.shader_present,
>>> +            self.l2_present,
>>> +            self.tiler_present
>>> +        );
>>> +
>>> +        dev_info!(
>>> +            pdev.as_ref(),
>>> +            "PA bits: {}, VA bits: {}",
>>> +            self.pa_bits(),
>>> +            self.va_bits()
>>> +        );
>>> +    }
>>
>> This is called from probe() and seems way too verbose for dev_info!(), please
>> use dev_dbg!() instead.
> 
> We do have the same level of verbosity in Panthor, and it's proven
> useful when people are filling bug reports. Asking them to reload
> the module with debug prints enabled is kinda annoying, and I don't
> think I've heard anyone complaining that this was too verbose or slowing
> down the boot, so I'd be tempted to keep it like that, and least for
> the information printed in this function.

Yeah, I think for the GPU revision bits that's reasonable, but do you really
also need the other prints to be dev_info()? Don't you know this information
from the combination of the GPU revision bits and the kernel version?
