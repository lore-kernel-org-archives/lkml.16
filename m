Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB0238176;
	Tue,  3 Jun 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958599; cv=none; b=A086o1INSP9kqTSNEcchBU3jREsDrvzfnyEOGjrU/BjgiQ3TDmWIVVWM+KlhmmEw5eaJMchzYOh0Rzao7d1C9hac1D2du2licwFGF3/tN+jo8c7CoZ4RdZR7xozfcaaWznBGVSORVrgwsTHzkJ8Yww+dPvACbZ3zzMZCqMuglnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958599; c=relaxed/simple;
	bh=U6g39ClQB+hk5GPvCuPP+9un1adxAxTlTy6EwW+tjrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAGLn8IVoWsnG2yrKYB3jGyx6IillEMnUiU2kFvlY2mzeZdnk+rdQ3qXSpKIBsS+VrkCZ5KZc0Tmy5YeopbSA7xEoGcoYPKEMk/oX9S9uJufCGC5SbT8gIxCKVjCxPJsT2duz0qqN1VbPodmTxx9go7efY8dEOUivv4K8wXQVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boN5joj4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boN5joj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170BBC4CEEF;
	Tue,  3 Jun 2025 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748958598;
	bh=U6g39ClQB+hk5GPvCuPP+9un1adxAxTlTy6EwW+tjrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=boN5joj49PYGWo0gzBJX9Z4fLk/NDlwvoC+0Td17+T9qgc+Il0E7LuvK9sMl/G4+X
	 94m9luK4AsFPfQHk/DPxNsvCT1YFSHR9HtPgNjCZ4uFukxc338IUpe+Z0mwKMuHqOv
	 JRnyefbAM8+5ub9OsVv2TerLN2K4kOJ9xBE0tNAewRta3zM3tDifEmeaHnmJq2R/ee
	 37TahppRi/kTwKRoQa0tqoCka33buLW51YU0wwdmxK/VT9SBr4DpZcViPvWKocCkw3
	 tE8esBfYyrNZ8zcPAUn+VHY/k9MsDfdI1d5L7uQ7ZLOkhh2NV0J4QRmoLOSAdu2/UB
	 dVjgLMUI7ULdw==
Message-ID: <11ff2b73-c77b-4142-a492-1e525d530aeb@kernel.org>
Date: Tue, 3 Jun 2025 15:49:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com> <aD2oROKpaU8Bmyj-@pollux>
 <20250602151506.GA779285@joelnvbox> <DACQW908WCLA.2JHRLQ3V18FPD@nvidia.com>
 <2f03e11d-3621-4314-a232-611a5fd9ffcb@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <2f03e11d-3621-4314-a232-611a5fd9ffcb@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/25 3:47 PM, Joel Fernandes wrote:
> On 6/3/2025 4:12 AM, Alexandre Courbot wrote:
>> Would it then make sense to make `FwSecBiosImage` public, add an `fn
>> fwsec_image(&self) -> &FwSecBiosImage` method and have the caller call
>> its methods directly (maybe renamed to `header`, `ucode` and `sigs`)?
> 
> Yeah, that seems better. Danilo, you're good with that idea too?

Thanks, that sounds good to me!
