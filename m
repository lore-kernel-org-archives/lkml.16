Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23382E3715;
	Fri,  4 Jul 2025 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751660597; cv=none; b=cqE2vmJcOod90eXR1UqGnnO/2xLAR+PT3SzigvzvnFxKJ8vjrjFUtl57T/9kQh2DA5+JAjinIuNR+Pi3qTax8pYmmwcCuNZeL7nkh1kmEGfyDVismG2dqUnYFwK0I7GgaqjqKVB6XMHkzwTzPTNZ3937B+gJk6qM/O3RJdVHD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751660597; c=relaxed/simple;
	bh=bwqfxaSn3gMX+r+CX3L5sICpxhvEVe9LILpah+YwURA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFQppsy09S2E9N9hReHnokghMjxOavdbu4yv+k4W9Yvjg8yQwBDQOts4gIoVcwTDp9avub7X7bcv/OSbJHtU5X76G8l7MKvI7WM1gXjcYc+70CTRgdlGIppn1B37cAXN9dIva86WLo0R++jIFViiTqlkLwawZaYUASLEj8Z+vxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KT3er4mu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KT3er4mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E476CC4CEE3;
	Fri,  4 Jul 2025 20:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751660595;
	bh=bwqfxaSn3gMX+r+CX3L5sICpxhvEVe9LILpah+YwURA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KT3er4muxKHMaOW+0y5WIkzyi8MfSNet+lbI3v4KD9NhUUWAvWWKYHn0qr/tU37Wx
	 Qp1WMejW9k5BRqPZMbra8nIiM9RyoX3wnQv/IYs6MtA2VPjDZbNtkzWVIsFgNJYhNA
	 tg/IUL/VxtuVcMcfa81WJYRVW655dXcQto8Kf4Fpk+ipDZRor/YEPmnA3d6o058A93
	 DiTrdCYAU2aBjWgvkMnClGeXGL3mNLypMfxdI5miDbw/sn9+7+5/d3brjrJmUfiujz
	 KkKbGHXS+sstAAHnSkaAZHyw1BO17rLMrLFIjJLvWMYwygOrBX4JG6MHguyURryhJ9
	 RInC3hxkD0y5Q==
Message-ID: <483d26c9-413f-49d7-89f7-7cc0e7f4cccd@kernel.org>
Date: Fri, 4 Jul 2025 22:23:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: devres: remove unused import
To: Tamir Duberstein <tamird@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-cstr-include-devres-v1-1-4ee9e56fca09@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250704-cstr-include-devres-v1-1-4ee9e56fca09@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 10:11 PM, Tamir Duberstein wrote:
> As far as I can tell, this was never used.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Do you want me to take this and the other include fixups through the driver-core
tree or do you need them in rust-next as prerequisite for your CStr series?
