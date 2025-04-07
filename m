Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887165680;
	Mon,  7 Apr 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031275; cv=none; b=WdYikXueEolfCRX2bl6JN81KJw7VdPkVtERU9ASJdNGNzTf6r8Wq9UiKSRg1r6JqaTeP26li/Gypb89NO/7yOMxt4Msj2pgYNZZT6QjyiSK5LZ6k/Mnyk9xjbWME0cKrOvsGTc1kH6T0u/rXxqpF5HVy9NzdyXTbx3Z+UrxnaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031275; c=relaxed/simple;
	bh=xWhe7be5o/ojbUteURkl1C2wpnLnMk1jv3KDBCNo/ZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Dux2r5F86VIsHJBHqlZoWjnaX36MJGe0fXLcSIGE7VvmdY2WVdA0S7fuMod2FdLUE4U4oJn14YrMIN8u54thop7A9uTNjGmmALl8v3OftJfvwKzF6pBnEuTtFSzRgr+6HHPnB7ZSpFkLChU0np3neivX0OXA7yyTv2THHZXbEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eyxdn4Mh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eyxdn4Mh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C8DC4CEDD;
	Mon,  7 Apr 2025 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744031275;
	bh=xWhe7be5o/ojbUteURkl1C2wpnLnMk1jv3KDBCNo/ZY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Eyxdn4MhcX6zneXRyK4gH+8366w1qqqWPtZyPSKuGcORR1sQdtzdUz8hB1zVGmww/
	 A1fSQN+CPx3GPu7shg62eCQcREJIyCzbWqt4l1qN3sao5i9DFaW1ZDBic7uw9jbNr8
	 BaX4b4WWIEA1TjHMPJlUlYIbTv0HbyPyYq3Gkddw5cEFyqCumoItutsBEiNLmhFlUr
	 b61NOuhhx0IftjSdlBQWwwPNFe7wjTmrXJcfxpSk4niwv8A1sDS55P1E/A5nQE/Gxd
	 PVvqy9Z6tOnSXY6asarx90PnfiWo2zusbaryvwYWNn2s1S4G/nOqKSD3g6K1Q9WYpZ
	 NSrB9HrSpCYFA==
Message-ID: <5acd1373-5be9-4d20-a4cd-bb88cf4c767e@kernel.org>
Date: Mon, 7 Apr 2025 15:07:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] rust: alloc: add Vec::resize and Vec::truncate
To: Andrew Ballance <andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Language: en-US
In-Reply-To: <20250316111644.154602-1-andrewjballance@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/25 12:16 PM, Andrew Ballance wrote:
> This patch series implements the Vec::truncate and Vec::resize methods
> that were needed by the nova driver and removes the corresponding item
> from their task list
> 
> changes in v2:
>   - updated safety comments
>   - fixed rustdoc comment spacing
>   - reworded commit messages to be imperative
>   - Link to v1: https://lore.kernel.org/rust-for-linux/20250315024235.5282-1-andrewjballance@gmail.com/
> 
> Andrew Ballance (3):
>    rust: alloc: add Vec::truncate method
>    rust: alloc: add Vec::resize method

With the following changes, applied to rust/alloc-next, thanks!

   - Rewrote safety comment of set_len().
   - Use checked_sub(), as suggested by Tamir.

>    gpu: nova-core: remove completed Vec extentions from task list

Applied to nova-next, thanks!

>   Documentation/gpu/nova/core/todo.rst | 10 -----
>   rust/kernel/alloc/kvec.rs            | 62 ++++++++++++++++++++++++++++
>   2 files changed, 62 insertions(+), 10 deletions(-)
> 
