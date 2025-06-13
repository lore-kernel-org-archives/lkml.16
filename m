Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354921547E7;
	Fri, 13 Jun 2025 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749852324; cv=none; b=bj/Bq5khdCyENotMYpxpE3zFz/QrnMNbuhU2ez2jAQQQWLaKcEvkXBBUYcjZz4y4QZYps5I/5QzN5txm6unV8BzZRcQDi+GvqB0dT4XoQzgW0tJUgBeWslCBJpIyBLZSlP8LMWp2KJZ+LGWnzcLK3uV1yLqbbNZqC4WFilkEc4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749852324; c=relaxed/simple;
	bh=GXWUGS0XH8FJlpw/FeJ46yy89/xK49Y5v2lyLRTludw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee24lTuSr/Fz61CPTlgBenzH/3v64xBWO+/BNZZ8hLEcY7g0VJ038l2A06Su8/R6evQUxsndxQWR1lvGZLuK/WuAubtHeD0VMqxt5n6uR0ZnC1ts8qnoRxMaHjdabZ2ZQw4lzL464DO/Kj5C0BnTmRsryq8Ce14CjV47/Evv/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu3WipHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu3WipHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F9BC4CEE3;
	Fri, 13 Jun 2025 22:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749852323;
	bh=GXWUGS0XH8FJlpw/FeJ46yy89/xK49Y5v2lyLRTludw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nu3WipHLp/LgDnKasFrO5xFhOUEyAZwzaqCahQjcHo3X+UQ83wIOTKFUvxYIjvIVr
	 jCimJpwmX4dFMmV7orpVJAJOjPIMWpwG2HxoIpGL8SDy//43rHiBh/x9ky0JNsbft7
	 apxRHzThBAYD433SSl5fN4ajL/bEX8QPTZC9prv2vtCRugSutBU/abQZoguwcQeXI9
	 zEOkp3pAUbs42lM8QTXoVFtLdQj49/jF//+3zsfzdHJ5rE1BZkouVvX+vPT7MNMLjm
	 9a0xsPxRk9PvLG5DetHuXNgyRxzVo4R8GtQMXz3yiCKIE0OfnC+9AhnLajhO8FgBS2
	 Z3lMj49TU+m4w==
Date: Sat, 14 Jun 2025 00:05:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Fix race condition in Devres
Message-ID: <aEygnmFvpkHPYRPW@cassiopeiae>
References: <20250612121817.1621-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612121817.1621-1-dakr@kernel.org>

On Thu, Jun 12, 2025 at 02:17:12PM +0200, Danilo Krummrich wrote:
> This patch series fixes a race condition in Devres.

Applied to driver-core-linus, thanks!
