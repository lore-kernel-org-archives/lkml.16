Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC428C01E;
	Mon, 30 Jun 2025 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298232; cv=none; b=DPyLn1m5iUca3rVT3nXVT3lPfRudeLmYVLjMLRzgefCpj1DVKeZQzsbVfzgSZkws+Zo707dKhPYXtvxsKZuNCfbdFbk+nJWwDaZ9mlfxs29Q4OFZs7ipidvj7JV9RWlV6o1cI1TFiesh79Qj7QNyz/LuUcKUoplAiplgIy3b8Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298232; c=relaxed/simple;
	bh=FOffP837AZnxr3Cf3oXVoWZpuKRjIGbq0zA+f2kxS84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h16wa+MdAxaQeN+0AAaLZOH1rRqslm3/FzxaZJqkp1K1zPmHEgPittCff3e9mjuDCDUuasEW/IRBG6pKuFaErPAU10jjk90X+w+qdhktCukp7gTPIfnGdm2BjoQBGk9nU6+R0okG0b1F97p3OSmypx8qqKStVZWHVQGPOkmCYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4ylB0Au; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4ylB0Au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BBBC4CEE3;
	Mon, 30 Jun 2025 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751298231;
	bh=FOffP837AZnxr3Cf3oXVoWZpuKRjIGbq0zA+f2kxS84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a4ylB0AuIbou16df+1m7yjyLB8eVWeIJO2yvajmw6JYBRiP1WMMPflnAsna06GNjA
	 Sqw+n0UBzQRjF1LwWjkPC1mHh1AyHbvjHw7UGsn0NxwfzU5rSkHXVZEhIll3q8uNQe
	 Ingvk07sB2oU3zV+yaJkVw7+j54y+SeSdpyVNz+04U7SJ9TnYxYnJs5z22zlz4YQHp
	 MyJ1MqpGzTdpIfBaLWNx/6AN8yUrwpYjs6JpPWtDC3IDW64Yvl3n8qMa5nEmyOOtro
	 FvO/EEOH7d8lqu7ljW1GaI7cQzSE/LdkWoEHPTxkwFSs4bpRTvGCcM/784SgyjPOrK
	 RKr+yRjFie5Lw==
Message-ID: <324c842b-e110-4e15-b058-9238a9ee598a@kernel.org>
Date: Mon, 30 Jun 2025 17:43:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <aFnArVIFkHCUzNqe@pollux> <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 4:56 AM, Alexandre Courbot wrote:
> On Tue Jun 24, 2025 at 6:01 AM JST, Danilo Krummrich wrote:
>> There's one thing that would be nice to fix subsequently, which is properly
>> resetting the GPU. Currently, it needs a power cycle to be able to probe
>> successfully after unbinding the driver.
> 
> Yes, what I usually do is the following after unloading Nova:
> 
>      echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/reset
> 
> and this allows it to probe again. Maybe we want to add some equivalent
> programmatically in the driver probe function?

Probably -- how are things implemented on the GPU side of things? Is the GPU
firmware surviving a FLR?
