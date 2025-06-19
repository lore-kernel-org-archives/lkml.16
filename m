Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A323E33D;
	Thu, 19 Jun 2025 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337026; cv=none; b=ULZgAN5BrjJRVVdJY5s3yeB2Euwap+i7eTmgeQV1JyxNktag64/XIw9faSRXRnakBpIHPgGE4MPwcDkprN7etxXYPkvIlX5w2QUCy7GwgE36zEMI4PEkxUBD0vprkdfPKJW8HfP1p8cLMJjr6tPHuqZIL/trY0Cheuw5z4cBtJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337026; c=relaxed/simple;
	bh=3Q+26Gs812PgxPgZQayKZD7t0zCaR+Hv4tK2DXS1a68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYiDfRMZsVbqI6ek3ofRTlJbkxo0x+/RbNZZ430aygtFOwREO5QhHJjm/2Rmz9ieCvoSNvCbfIoVDyxyAVVk3Y87jiaDXk0WL2Os3Xweiza0iKUL6yMePP6/P/fvZLqMGcmmXStcJOM7AzhlSJojEpquZaYrGuz4O5HNC7xt6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTMaFr/R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTMaFr/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E556C4CEEA;
	Thu, 19 Jun 2025 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337025;
	bh=3Q+26Gs812PgxPgZQayKZD7t0zCaR+Hv4tK2DXS1a68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FTMaFr/RkKfNt3SsQugX9H8NpQbmRPK6hfgkqg7QHHDskTKeblhFbfcc70sa19EtC
	 eMaWuFJhNXGQhi4QQlt5yvae6oba9s7Tlv9rpxbm8y/ebp/X75PoFGSAIuL2N4PSsy
	 /dMIsXaMn/Y6EWaIYuHkjU/MVPkeDDvR2jo5iN57CW4DuNmPg07Bhyt3UkUG+OGlPI
	 uxtZQY+cNtgIzTFt7JLJi5zF92ss58KtV3XJLiEphuMvTIAe2tPQKPOcZAuynOCJVQ
	 yaYqnxRy9FEpoMbBov5XK+2lQ0/1Zf+UiKFQNOZBWLMJ/qsY3u/rTWLBi/3mvxp3Ct
	 SqWlgChbCcr0w==
Message-ID: <3c3725cb-9c00-46b4-8947-4263ddc293ae@kernel.org>
Date: Thu, 19 Jun 2025 14:43:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] gpu: nova-core: load and run FWSEC-FRTS
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
 Lyude Paul <lyude@redhat.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
 <aFMgLDfNKWPsSoD1@cassiopeiae> <aFMgiYzDXwHXVn8X@cassiopeiae>
 <DAQIIXV4SHGV.11VXZCUNADMX9@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DAQIIXV4SHGV.11VXZCUNADMX9@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/25 2:35 PM, Alexandre Courbot wrote:
> All of this code is going to be moved out of `Gpu::new()` eventually
> (i.e. the follow-up patchset), but we are still figuring out where it
> will eventually land. We will need some other entity to manage the GSP
> boot (GspBooter?), and I am still learning which parts are common to all
> GPU families and which ones should be a HAL. So for now I'd rather keep
> it here, modulo the part that can be moved into `FwsecFirmware`.

Seems reasonable, let's move it to a separate function in the meantime and add a
very brief TODO please.
