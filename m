Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0512139D8;
	Wed, 28 May 2025 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429557; cv=none; b=KtDcwfCBHlHk16BeYP7+Vvn/Agv9D+GKtr3Zvz7JFPOeTidal348u3b4z/w/ZGcrxdeXamqgc4HsGFtVe6FDeo3cZOIpuy/1jVjJ2z4tkA6bXiz0MVKFo+LijE2aRtd2m5TdJ4Vh9Pd38B57OQqIFUJsO0WzXT4U15XlO+GvdWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429557; c=relaxed/simple;
	bh=GUs28pJdm4CINoN+poc+XGtdJq/AcECrplYFC+uuFTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0NcI/03F5rIQ2Awo6xPHXfGEOBKCiZo/FVW706nFeEzeB9JtZ6rhWjZHZA+Xoo3piN6Oqjz9zoOVle5qLmkrZLRXQJ0JQ7P7142Z3TLk9XH+9yUJ4qiTEqz/htg4DtNoiGGkfOxf5zz0kLnLjvaanW6oCIbBHUG3ddY3OTHeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+qcIY1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+qcIY1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE81C4CEE7;
	Wed, 28 May 2025 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748429557;
	bh=GUs28pJdm4CINoN+poc+XGtdJq/AcECrplYFC+uuFTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+qcIY1h5ai4P2UyiCKdD5RbR3HG2EX+mOwLaOOGq2+6cvKYz8mTOlcnjt886Xn3M
	 mV4q5KHqSczdMea1/glY/Kc0J2JzP0mNGRAae9HqGU58q5vsMofM/zQ388KB1m0RSq
	 fZupIGKuw49qjLTqO7RMynzVZNN56TJ3NbsuHGxbwEIuLy9iE+1TYwUbNwsd4X+jU9
	 KKJkI4Fb7XIcBDhsKxiE8PCCxw6hYFsuY2N5zTNHYOQZ4KM8WIEyqPqviEMicHOxqY
	 gNMhTm77rnQ3rO2YdCReRXaHlxDIwDpfbkS6ZAJvvhTaX/gnChR9J0MywdemNFoIDz
	 /S5InTik/xGcg==
Message-ID: <0789cbad-3164-4046-b8d6-b245721b6515@kernel.org>
Date: Wed, 28 May 2025 12:52:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 3:53 PM, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
> 
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> leakage.
> 
> The type is added to the prelude as it is a fairly fundamental type
> similar to c_int. The wrapping_add() method is renamed to
> wrapping_byte_add() for consistency with the method name found on raw
> pointers.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
