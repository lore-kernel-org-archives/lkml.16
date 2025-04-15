Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D422F01;
	Tue, 15 Apr 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721148; cv=none; b=RegblqJEtGUZx4d6TzQ7qDbZhLe5HrFuUAUKgeXFTGFw1tfzU9CJiOgop3sRbLoQxDjPe8Tg6qYch8DN/Bc1ktofZD4egbK8/AH8DowmN/EOdaImmgufjk3BakndSnLylMHeLq9ffNfbOEnIMP3hWsPC/ikOsH/fTgd3fkkNMuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721148; c=relaxed/simple;
	bh=ZypjQZY5ezLBgzzwIlmEi6O1Yc7YVR9YFjeUN/KN3SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMcT3FL3gZX9NTlMavvrnzRFGQksTJooBxddCLj95ZGxmFeP4TWiWfBrAaGtl9uvrZPh370OmiyKuXhQqLNlQNUk3qGDvVxiuluUg1NjdF68upxccEacgnoR0WvIEdFlGtnI+ZWUCLsU2l2fyU+J1+JSrFirvNKVwAQp/s4zqpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucCCEtP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucCCEtP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3023DC4CEDD;
	Tue, 15 Apr 2025 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744721147;
	bh=ZypjQZY5ezLBgzzwIlmEi6O1Yc7YVR9YFjeUN/KN3SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ucCCEtP5INyXov+dgU7oIv+K37cc3naazdBH8uSx8MR+sKQQz++QkcrjBMjfc41j9
	 unkxTpA0A2eOrPZsgHNs2KWV8fX2rKni47FiVol8GIE+9w7QAJBRbsOgYx78iaFGYS
	 56qqRdmuc4Xhv3BIGmE9E6ERbZNxIz10JqZO/TChVcOGcuekOoekO9eBsNajD4R+AS
	 C6YHmdJg/uGMUD7ON7T0VM+X6/38hfe9VnaOS/c8fcV+JvI3yz7CF0RKX6afb4dt0W
	 l4YqfTzNsk5I2psqh51xlXNBfSQZ8jWWRz3Sz5+xmzYRBOWagtx03LyCD4cct4WmYy
	 ATHsERNDy9Xeg==
Date: Tue, 15 Apr 2025 14:45:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu,
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 3/5] rust: auxiliary: add auxiliary device / driver
 abstractions
Message-ID: <Z_5U9baQ-6VE2VjJ@cassiopeiae>
References: <20250414131934.28418-1-dakr@kernel.org>
 <20250414131934.28418-4-dakr@kernel.org>
 <Z_5MODlzsC3LNtFj@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5MODlzsC3LNtFj@google.com>

On Tue, Apr 15, 2025 at 12:08:24PM +0000, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 03:18:06PM +0200, Danilo Krummrich wrote:
> > Implement the basic auxiliary abstractions required to implement a
> > driver matching an auxiliary device.
> > 
> > The design and implementation is analogous to PCI and platform and is
> > based on the generic device / driver abstractions.
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> Overall looks okay to me, but I do have some comments.

Thanks for reviewing; unless there are more comments, I'll address those when
applying the series.

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
