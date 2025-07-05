Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614119F421;
	Sat,  5 Jul 2025 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730872; cv=none; b=QHtsCmrOb8+TGR9fsEq4g+d3d3F/6knML9qjd06ZHXeOVvitMhv3BLtIk5UkO7OJEihvuPfx1qEODf3E9YvhqtGJHg74ny6tjmJaPp1UPmPSusIpsC9Yp/zIlXQJmoazoYDTHCq0euG832GeAPBaRFF6hSwx+y0YXmRy5dGtAnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730872; c=relaxed/simple;
	bh=7Pr44m3FKCwf7Gr1oxaQJTbLKYSt9xbXAMzO6dQA6Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSZUZ/1hkLMGps9cSlpGcdc5Nesz9hm+IGnt0bvrDpcjNS3M8i6NbPjYhxl3RB3jFFYqthbXftoHcNeW6A78KdzIKgMhtFks9TJnLAfonV8pqaVKgZIt1QHKL5CiZfrUVUSQNtvBLYtoxh7szrKCFUmW7sNQm1Gx2uIOkGjkVj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q14c1ULb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q14c1ULb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64877C4CEE7;
	Sat,  5 Jul 2025 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751730872;
	bh=7Pr44m3FKCwf7Gr1oxaQJTbLKYSt9xbXAMzO6dQA6Nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q14c1ULbDnUk/vw9fO8p2eLjn84Ch3UfB4jY1X6mdVj6QYuvBpPGIfdtuqjfGSjYv
	 4nEcKcHVDoDogp8epWkc4twG2RFmerIunrP1trbfX3+cw691dfw5GR08f+igCR7COx
	 Qh9dFNYijp6b4c6gHshvAS5hhx5EMA9DAHXdmknCkSAgkINdP/VU75mX/b5QrVEY32
	 9grL4cwztsHzUUrbiw5CJ0CanjLAyu0SIBL3H1bOSSZDuRFZlNnZ2St6qyA1sfxM1+
	 Ukx8DXx6rOI8d1RG3jWAVVLFyMWIgY52OoQ2B1FTGhDsbxUINy7IvURD/MjayDZLoT
	 q+WuhT9eXx2pg==
Message-ID: <990fcbf1-e067-474c-a0e8-0efc245d152b@kernel.org>
Date: Sat, 5 Jul 2025 17:54:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add miscdevice Rust abstractions
To: Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/25 5:45 PM, Tamir Duberstein wrote:
> Add rust abstractions to miscdevice MAINTAINERS entry.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

You should send this to Greg. :)

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3f7fbd0d67a..a9a094e2c914 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5568,6 +5568,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
>   F:	drivers/char/
>   F:	drivers/misc/
>   F:	include/linux/miscdevice.h
> +F:	rust/kernel/miscdevice.rs
>   F:	samples/rust/rust_misc_device.rs
>   X:	drivers/char/agp/
>   X:	drivers/char/hw_random/
> 
> ---
> base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
> change-id: 20250705-miscdevice-maintainers-2aca6f19fa0a
> 
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
> 

