Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD34118CBFB;
	Wed, 21 May 2025 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840999; cv=none; b=DRrcFWVnNKSj+9rVzqIensNUwa6o3SLgmg/oOi5SyA2vEEUpe0VgDKULa2jprvaCHpPKxg/aXagVt4jTu4V6ke0b8OFB4ahiXXRqSlw5n/T7veIkjKsWKfH6iFx69zB+U6ZMOWhi3qy5NYURBSbH/LnO/XZeCuIwoQDVTtOEoGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840999; c=relaxed/simple;
	bh=h3GAfnHqQdjYb8KerfxcMvxAQu/1JesrqC8XxoefLB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N18MSmd1sBsGCN9w++OVhvd0FXDpkbJxgUZMf6O3AbQ/kdemxBZR1dbWkmLNT9KJxbmEEdEFFdp6ndVIVW+ypawA/+hhG0W7cP8aXyh49lc2uVt/a0txNl1wnJaZCn9Drxx9ffa7ZSehV8I5tq2ZLRS/4+7yXy8ADyNrNj4bX3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAXkDsC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAXkDsC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F893C4CEE4;
	Wed, 21 May 2025 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840998;
	bh=h3GAfnHqQdjYb8KerfxcMvxAQu/1JesrqC8XxoefLB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAXkDsC/cnA0VecY2wJBf4tmIpStq23KiR5PSsUguOpRKAw8o3H7/pskGwaAIzAgx
	 TuN6bZsJeY6sMZS/QpWtA56N/lNt97NaVNAhREYmlv3jDsE2V3BmoTfAnXWdqAFn9z
	 nGYwmmLzy9eeq6tGbMBA02yTX+UoxWYuesEhML8gK/GzVgd5TtUWPnXdoe0z1OBCk0
	 XLp8UbfOMbQVol3GeJJuTvbxh3av6fPgONRFrziESf4eeu2QvKek8+ZV4boK4+R0U/
	 6pZBHzrPA8GiC+QMbMs8tBOs3CudkMf36w+pHMpTtloIjvJQ6d7+sLv/IeAjgDyeAj
	 QhxB6xZWNzNeA==
From: Miguel Ojeda <ojeda@kernel.org>
To: richard120310@gmail.com,
	aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	jserv@ccns.ncku.edu.tw,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	tmgross@umich.edu
Subject: Re: [PATCH] rust: list: Use "List::is_empty()" to perform checking when possible
Date: Wed, 21 May 2025 17:23:07 +0200
Message-ID: <20250521152307.1055810-1-ojeda@kernel.org>
In-Reply-To: <20250310073853.427954-1-richard120310@gmail.com>
References: <20250310073853.427954-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Mar 2025 15:38:52 +0800 I Hsin Cheng <richard120310@gmail.com> wrote:
>
> "List::is_empty()" provides a straight forward convention to check
> whether a given "List" is empty or not. There're numerous places in the
> current implementation still use "self.first.is_null()" to perform the
> equivalent check, replace them with "List::is_empty()".
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

There are a couple cases that still apply here (i.e. after the cursor
between elements change), so I will pick it up.

By the way, for some reason, your email did not reach my inbox.

Thanks!

Cheers,
Miguel
