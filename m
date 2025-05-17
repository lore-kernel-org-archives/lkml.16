Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB018C937;
	Sat, 17 May 2025 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481881; cv=none; b=cOLuFamQT0YvMtu9Z+bC6SH/0KQvVsKRtMov8uf0HeTRTpWX5cC80dlJ7wZdvLADRqC8KBvJQ5nPeaLx8yRcjUdTWBFRqtB/J3n5KKb683p0WSgWglnFKdKvYpD7Rk6bHx3qHxMzIyUW9iKHQk3MawHjmaz2+3yZOwo1cTfy0og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481881; c=relaxed/simple;
	bh=XDH5YfoUIxo8cwAdSIiAAjMA2NdaDkqxL/tY8At99M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diIqkvIbzXs+HAp7PWwcG+Z9cnCGO31VKXwJeLsIUsjUdU950D8RvlF9WKTjkPsXCeUfh7efXj66nw2QuVEuY8I/D/vRQ+KSO+4+qvRWVRmegyWFLD233o/iwYm8DtDr+Ypl5qADHU+pGBJ5cAhfo+GQWranl0QskMDM3bgj5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDbKXMGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDbKXMGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16928C4CEE3;
	Sat, 17 May 2025 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747481881;
	bh=XDH5YfoUIxo8cwAdSIiAAjMA2NdaDkqxL/tY8At99M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDbKXMGT0o5EQJy+NPbLUoh7ZMK2L1aOFf4URQWdtZyujtyPSxerVcaEy4TojPjRB
	 xVFjgiD24YXe22P7XC/n6UG3TA921X5kXcIiReborgp3wKx42ZkEydzNrUZoq2S6Gs
	 5DZ9+C5R5qHfq13NGU2UongsbYJcgYwLMH7w12FT0eaTlTPlFT0WAE6Wps/POdJZIX
	 fRjteMPOxofvukTJ7K+DvQ1VoB44OfFVnKHDQmHnMbN7+0VW4l62+HpRkYsd48u/L0
	 dRfYp4lHhG5JMjKPJjiTsX1T4tGd1ojBN1L1V86Jp48pkkYlbyE/cpUkVYqqmwFOSo
	 LnpJu8oCqQdPw==
Date: Sat, 17 May 2025 13:37:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH v2 4/4] rust: drm: gem: Drop Object::SIZE
Message-ID: <aCh1ElBmXs6ZKYQ2@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
 <20250516171030.776924-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516171030.776924-5-lyude@redhat.com>

On Fri, May 16, 2025 at 01:09:19PM -0400, Lyude Paul wrote:
> Drive-by fix, it doesn't seem like anything actually uses this constant
> anymore.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
