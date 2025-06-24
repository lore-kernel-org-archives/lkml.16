Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1068C2DCBE2;
	Tue, 24 Jun 2025 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776679; cv=none; b=Yb4OJCCyX+uZnWQ1WIJxXib2VhENaECiDUhR8TF/0HySpC4tsasMbyjILh3spKlTKw6EHsQxzvCC+u14D12tSwF3fgOEx4MnB4T0VrTD1HgilU2cvu0lU9mJdNZd6ejp3WYfXKp8oFIJ2tk3aUzMq2dGSSIubcg9sZZpzERx/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776679; c=relaxed/simple;
	bh=KK2vk1yPlnj09LCWq7CpMvw2JhhM32dj4jzP99gy3as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkaAeYjiPvasr1ehhzLhBezGBYO1sig6Bn1EUoYln324nwmZWMsa/ViMw3MYJoSLUtBUsBC/4EZdiAXoxeo9p8cAXqHFJZBroSMg/zJqq6Q+t2RF8SzS4A3lyghVJhyhKSd+oz9bxwcYo7B+YdL+9wb2sJElvaSqDROpIR3kIaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqNkzM0h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqNkzM0h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64845C4CEE3;
	Tue, 24 Jun 2025 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750776677;
	bh=KK2vk1yPlnj09LCWq7CpMvw2JhhM32dj4jzP99gy3as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqNkzM0hc6MqWy5NSlh7OAo2RDaSXtmy11gyYEBZ9JW89xcz3E6BiBoHTlFdpNkuz
	 IjYb5Hlix3QAMBwFUg2b7bbS04hGyRstVHEfsIIA9MUotozqvs/MQ3+v4D99Xc1F2P
	 1fJ7oYZnWjp8zXkf8Xg0GCiWx5hgwzAE810QhpSAv6sqLXOakDfduanhg5ctlKXD9B
	 fng57byF1XfjO0BThTWQ5FfkVlWy7pfN20KVHKUdBVT0xxCzpi29ElbvnPIHO8yQBU
	 HFGK33ccD/pN5vUZB+7s/cy3749bFf0DxMJKwyf/fKHwu9oA/WECii+gnaQ5hdnKUp
	 PIgESwe6+MAKA==
Date: Tue, 24 Jun 2025 16:51:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <timur@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	airlied@redhat.com
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <aFq7X_JeZj4n3suo@cassiopeiae>
References: <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>
 <2025053117-snowy-tradition-eb9e@gregkh>
 <DAL37D3FG3YA.TSCJ1LMJO1X8@nvidia.com>
 <2025062405-stability-privacy-f965@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062405-stability-privacy-f965@gregkh>

(Cc: +Dave)

On Tue, Jun 24, 2025 at 03:26:11PM +0100, Greg KH wrote:
> We know no user/kernel api can ever be changed in the future, so how can
> we ever accept this?

I think the nova project is a bit special in this aspect, since we develop the
driver upstream for the purpose of breaking the chicken-egg problem of not
getting infrastructure upstream while not having a user, but not getting a user
upstream without having the corresponding infrastructure.

Given that, neither nova-core nor nova-drm make any promises to be working
drivers in the sense of being useful to users.

However, eventually we will hit the point where enough development has been done
such that the drivers actually become useful for users. This will be the turning
point at which we will of course guarantee to keep supporting a firmware version
(or any other uAPI) once introduced.

Until then, it is what the Kconfig claims: "This driver is work in progress and
may not be functional."
