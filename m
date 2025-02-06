Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81661BA33;
	Thu,  6 Feb 2025 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856721; cv=none; b=K6ub6p/ueQSb9Lppu9cSzEfgtlRoYMH8Ye7Rm1T/+IcXVGWUZlWhuRSWXkEg76q9PqFfdJtDDeykS11qsQqlnRX62bXCrMKq16uiMihxNg7F9KLMYQi6Zc23dfR4wiqmzu/ETT6+m+SMguj9WArlkH/XfL45IU7nrXKYRKAAy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856721; c=relaxed/simple;
	bh=o7szuTdI9sJ0WscJYpzG4yJcQVYcAyaIDo8/Sv6kNT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0YI9e0oLggly5E8feIsn7aGZ4vUqg+iGpI9noB7kEmv4TwnzmOJBYZOykz0TSqjpNZZ88x3vfWWOxD47lVWUi+7v9/30nCfc0KDjk02s47REGoSZDJayJ1AsPmi0ufa45pjUMLTPIiUJ0FD7i4EzOseErpZcHuOuNUkJ2XIhA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTNbPzET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTNbPzET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FDCC4CEDD;
	Thu,  6 Feb 2025 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856721;
	bh=o7szuTdI9sJ0WscJYpzG4yJcQVYcAyaIDo8/Sv6kNT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTNbPzET6MNjyLQ5w8oLzwv0Pa6vkYEiWKQlf7FMnQ7CvFkKKRsR+NKiK0nVeesH9
	 VwXTFoDk1JvQdNO6DmxISAo8SLn9wkZgdBETVWitaNctNGhChmFLTpeCqQyoYUgd8z
	 6BuRbQPzE1qhv16/benGCrBR9S6CEv2a++jj4flqtYk9rchPn4TSK8LE/9bSVACURh
	 ih7YU5GkZpUcBPVyh2HgqiV5MFqtOMI57CHG6ZpR5WduT+jMpYQ8EFGUaNlyFDZ6qk
	 XUP93YfNpWjRYA7ElMdx3JpzCWCvSMPci0rF913scyQufmCSfsv95WLNnjbMwVEZtG
	 uWo6fAPDoTTtg==
Date: Thu, 6 Feb 2025 07:45:20 -0800
From: Kees Cook <kees@kernel.org>
To: "Justin M. Forbes" <jforbes@fedoraproject.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
Message-ID: <202502060744.6F701A4CBE@keescook>
References: <20250129215003.1736127-1-jforbes@fedoraproject.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129215003.1736127-1-jforbes@fedoraproject.org>

On Wed, Jan 29, 2025 at 02:50:02PM -0700, Justin M. Forbes wrote:
> This seems to break the build when building with gcc15.
> 
> Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-fzero-init-padding-bits=all'\n")
> 
> Signed-off-by: Justin M. Forbes <jforbes@fedoraproject.org>

Thanks for this! I keep forgetting to keep flags in sync. I wonder if
there is a way to automate some kind of warning for this (even when
CONFIG_RUST=n)?

Reviewed-by: Kees Cook <kees@kernel.org>

Miguel, I see you took this already -- is it planned to land for -rc2?

Thanks!

-Kees

-- 
Kees Cook
