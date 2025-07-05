Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF251E4AE;
	Sat,  5 Jul 2025 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751713588; cv=none; b=um6/7ZRwXg6kVpaCsN8sd/mAE7xHsjzvA4hZdr+TZJfOzhcyaKY1x9rdH204CrjcwNGbgEHju+QkjqsLNkJNckR6AGpDbv+eCS7+XBRUTSPpk4IVk8KB/HE4ta4vYxhMAhup+oi30N4AKACl8PZ9UHEj9LhK8cTwuagi3y8tUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751713588; c=relaxed/simple;
	bh=9mv0UxhGjH2mL6KMOypiQnTrOj6P8HKSW5WCnLKIHyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btBl7pN5UIcb0Tv/kqw4cqKSYShGWL+xteThnkNn7hLWruC5intkwG9XazwJ85R843h+z3XE93Sn4cZ1RkNs0ZOmTFFoO/MgB2iAtGjisF5BZm3g2ZA3AAWRAQmJnY1mFUsduRA3UWuvAogMLQ5YqkBOub9+57kEaGvPJKCoXHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aafTTmDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aafTTmDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0E3C4CEE7;
	Sat,  5 Jul 2025 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751713588;
	bh=9mv0UxhGjH2mL6KMOypiQnTrOj6P8HKSW5WCnLKIHyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aafTTmDmBLWRKGomxX2C4LHrmnv/oV98ZkaEj/FkfFxKgK4ZeAx3vbutrx+H1jDfV
	 oDBvmttYEiCi/VTvZ0DTba295JD/uAOcDTkzCkD9HIYvXG/aTMWDXOL7+JISi/B/+C
	 IYjv4VznW8PA3o6bBBYNiS2sX13T5FqW03KM/YQp4iDMN6CgPuybf09N9pO5kwDblQ
	 /Lad6++1ZQ9PzfmpuUX8AT8Z8Rc8GMX1lqnnpfAyxWRBmYGiI+wRd0PwZ6x8Sfhkpj
	 RmWqx4TlyUj0ffFYalN0H2yybq79thzskSWo9Hv00Zji5g6oY0NkUwccJIapo18hqM
	 r4xu14tfn231g==
Message-ID: <07058db5-e56f-4771-9d6d-93c5e853af6d@kernel.org>
Date: Sat, 5 Jul 2025 13:06:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: drm: remove unnecessary imports
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250704-cstr-include-drm-v1-1-a279dfc4d753@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250704-cstr-include-drm-v1-1-a279dfc4d753@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 9:50 PM, Tamir Duberstein wrote:
> `kernel::str::CStr` is included in the prelude.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-misc-next, thanks!
