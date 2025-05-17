Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D5B1DEFDC;
	Sat, 17 May 2025 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481515; cv=none; b=Ti/uieWj2OMxnDUsQ77qk0tAvGPt9PnNEwK98nD9DjMUlX6xL1uitQEMCayAf/4DupffXdx1cQmOmEvhIg4rfxjEeXabwf2YxD2sR2lc41Y1VTtFca2hNO7iPDQVHyVTd/koNh7Y5BrK6VvfzsR3LjItkEfNQ0KcIuGqBFlwGj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481515; c=relaxed/simple;
	bh=xjvMDCx8i9vBvCJr0E6wUxIHogd0KLquBF6x0OZC2bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ad0hSD2uR5ej8Kc7PEhDWrgyHYQxN0A52/oT9k/1W8xkqBwUJs9NbDBGX+/usdqMQxlGZGDr+16NcK0L9I6yoeX3bm8vmbpsQHsRQepeG5YIwKJaQ3dAjiaR7W5kkilqce4pFUCgMs5EZGMKvba2+FJwOqcu9Z+Rw/61pfZii+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmKnm8rM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmKnm8rM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E761DC4CEE9;
	Sat, 17 May 2025 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747481515;
	bh=xjvMDCx8i9vBvCJr0E6wUxIHogd0KLquBF6x0OZC2bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmKnm8rMEn6iNLXPb0AjNCRHcGTn2+JEyGd0XAj50THBKS+/0yHMTpVvM/laPonBB
	 E4jStq57sc9gG35/dJyvXND1PBVWneo/ruNoq4Qx91XKTK/+fZGGV2MK20MtlxW/Fh
	 j6+S0wMXnVmMR/APmKwnRYyLjyx0R9skfwX39O9AhXcnttpyav5Eh3yWvPGiNOydS3
	 GAPMxSohUfEaDSoCIodosprPI1o1aIPbfweHGjdHRElWLldMc8adSbx7no381C8CQb
	 X/S/x7ATtRfdwz70rIMPVh4g+d98IOW/6mHlS0GkNu6Fk0vlT7t2+y7nCGClHj1Qw5
	 /X3ETq51iqrVw==
Date: Sat, 17 May 2025 13:31:49 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v2 0/4] rust: drm: gem: More (and final) cleanup
Message-ID: <aChzpeMfDvxQsFb-@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516171030.776924-1-lyude@redhat.com>

On Fri, May 16, 2025 at 01:09:15PM -0400, Lyude Paul wrote:
> Look mom, no generic soup!
> 
> Anyway - this is just the last of the cleanup stuff I ended up while
> working on cleaning up the gem shmem patch series. It simplifies the use
> of generics and also adds a type alias for some very long types
> currently in use. Also, drop one unused constant I noticed.
> 
> Applies on top of nova/nova-next:
>   https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next
> 
> Lyude Paul (4):
>   rust: drm: gem: Simplify use of generics

This rework breaks nova-drm, which, given that this series either needs to land
in nova-next or (which is much more likely) targets v6.17 merge window, needs to
be fixed in this series.

>   rust: drm: gem: Add DriverObject type alias
>   rust: drm: gem: Add ObjectFile type alias
>   rust: drm: gem: Drop Object::SIZE
> 
>  rust/kernel/drm/gem/mod.rs | 102 ++++++++++++++++---------------------
>  1 file changed, 44 insertions(+), 58 deletions(-)
> 
> 
> base-commit: 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549
> -- 
> 2.49.0
> 
