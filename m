Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2B1288515;
	Thu, 22 May 2025 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907388; cv=none; b=BDD9Z+pgp8FT1UfJM82Cl0ZD0IZ5yQkJ3kthGH5CJ2AJgrvXLIEdYQu67MZmOZ/cuRsbsrTODb9S6yIUK02UfCQv6LPxsY/lFgQdJ4d2rMM6chaYS3tEGNeW93B3v4EiHS4vkqm2Q7pRQ1Z7qR3bcuH2wDIDh2NZwGfY4w+Pj2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907388; c=relaxed/simple;
	bh=WxrkF6GhZtKT3lX+bYF1iWXLBucnPgzrZfyUZ85+8Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiK3YFgMaR9fG4qMou9yORB4SCupHUBIfTBlXZEoKuDqr9ZVi9kwOBnabhLzXwmNTsWGZ5oCTeYbIuE3cH9a8fDsz1C8MAFX90oQHU0k4G85VP/DeDQiBGtI18M9e4tEXMdyGTAaOjoiIv4in5kqRsjFS+ruZhsLIz4XRL8xNCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5bCObJ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5bCObJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359C9C4CEEF;
	Thu, 22 May 2025 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747907387;
	bh=WxrkF6GhZtKT3lX+bYF1iWXLBucnPgzrZfyUZ85+8Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5bCObJ3kb/50cBDx08JW1l4U5veARWb2DzwU9phvLNFL2pmv+scZsdU6Hl5ok8lH
	 L7sODWPPOt0uMYHdjHJ76jynYYuZWVXfI4pPkqM+kjOVoMz26fUn2YaGPz/npdX8nH
	 2BZv0kJLYK5z4KTpvP8FurxB5PS6tzzWvY4832ctdavp7/RGH8bkbsoAtIKElSA0IB
	 DU8tmpqHgsqItFZKHgSfZxLKZ59Vky63s8RJKW9HcBHxfKjMF4icePWjNqFh3oI8k9
	 5jZrz5eIvipjgUXtcaxkYdGvGJpdiGrYzB5OdSmptoUVsyv8SYYUKIqO6Zjm1az0MR
	 bpzm7f82gVXeQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: richard120310@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	jserv@ccns.ncku.edu.tw,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	tmgross@umich.edu
Subject: Re: [RFC PATCH v2] rust: list: Add examples for linked list
Date: Thu, 22 May 2025 11:49:36 +0200
Message-ID: <20250522094936.1370073-1-ojeda@kernel.org>
In-Reply-To: <20250311133357.90322-1-richard120310@gmail.com>
References: <20250311133357.90322-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 11 Mar 2025 21:33:57 +0800 I Hsin Cheng <richard120310@gmail.com> wrote:
>
> Add basic examples for the structure "List", also serve as the unit
> tests for basic list methods. Including the following manipulations:
> * List creation
> * List emptiness check
> * List insertion through push_front(), push_back()
> * List item removal through pop_front(), pop_back()
> * Push one list to another through push_all_back()
>
> The method "remove()" doesn't have an example here because insertion
> with push_front() or push_back() will take the ownership of the item,
> which means we can't keep any valid reference to the node we want to
> remove, unless Cursor is used. The remove example through Cursor is
> already demonstrate with 'commit 52ae96f5187c ("rust: list: make the
> cursor point between elements")' .
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1121
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Removed prelude import and spurious newlines. Formatted comments
      with the usual style. Reworded slightly. - Miguel ]

Cheers,
Miguel
