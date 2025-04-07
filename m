Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24751F63DD;
	Mon,  7 Apr 2025 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038259; cv=none; b=VfwQeKruTYAhwJ9x10g8OEycRttXC67IMQyEnKxuNqrscXVz8VZwP36k6p08QlMctY2MRD6BP8gMwvqfyJP7JjBjTp1bRaIAP7Fo/puBPmPz7P6wR/GLiHRVsmGVVwpBKCWi0Z9dDdU/ZqmdT0PEBN3qwBkfDKmmQgGieJy9dbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038259; c=relaxed/simple;
	bh=VPbekwC6pfzxawKZdmZB7HhU9UscXcKtY9Aks56NSIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1J1GBB9A9ErJk617OOJvO943E1yARJsISRtXanoX0VPPLNcPdJb0yHDk/8h+qgj1k2iRBKugXluMjicJZJRAkWJR0ZLhm8O49LsMDxAEs7QiYVY41UVoj/OR9R9cxxPNRNwZtoHtLEgFFiSsPoQRGeXXERsgPvKkOMR6HpmJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwoPD+Wj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwoPD+Wj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CD4C4CEE7;
	Mon,  7 Apr 2025 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744038256;
	bh=VPbekwC6pfzxawKZdmZB7HhU9UscXcKtY9Aks56NSIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwoPD+WjjLyfagUWJWbBGdYWv1erY1w9+NqC5pC3OyVuKSPC+rQRBqN5FDHzCQIh8
	 IlgYZvLLk43t+009tt4+Fw00s2RQY4Jv+t76bq0MpjFXMBZDg9uLEOQrMtYxyJVKmo
	 FXjRlMVYh6x0rch9hNvGtUqf06Ew9FOiBtWamnsS99xR8jw4KHWP4miV+XrkB1wNpR
	 aFV62HIgbycELKHeQO1rwfPlkA1actmuH++EDMH0iwZbVl4XdJCrCuKnvCu6kkdyH/
	 kNKbLqmAS78VlyZ237T2942uKsSg7fb8zwxRfvS9+k1gazm6UY0wLNcrxoo0Lm+RXK
	 0j5mtOK4GyQew==
Message-ID: <d94081d5-f088-4443-9ba8-5b1b7cf5db05@kernel.org>
Date: Mon, 7 Apr 2025 17:04:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: alloc: use `spare_capacity_mut` to reduce unsafe
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250318-vec-push-use-spare-v3-1-68741671d1af@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250318-vec-push-use-spare-v3-1-68741671d1af@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 3:52 PM, Tamir Duberstein wrote:
> Use `spare_capacity_mut` in the implementation of `push` to reduce the
> use of `unsafe`. Both methods were added in commit 2aac4cd7dae3 ("rust:
> alloc: implement kernel `Vec` type").
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to rust/alloc-next, thanks!
