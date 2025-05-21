Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835B1607A4;
	Wed, 21 May 2025 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841245; cv=none; b=h4ZS2MgiF8ZAcsTkR9DpPieB903BWGiMGXHtyCW2B0JDAVespUEFHDGLRzMdAMu7Ntc9p0rpgYtO2eJGRDtaCjHomIJ5v3Vj1lTu21/TwLroZoYjLWc9lqYGr81HssZIs+g16NpQ+G60iYV/vlAWadwfR8VrX8a7dyIPS+//fdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841245; c=relaxed/simple;
	bh=1Ss0ZBRaHEV8F3rUqaE1lwJOphYa1YfsxLlCy/ljJ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsFrIM7OvT7M551lYa1t+3eV1jEAPVJgxWuCJTohQ2YFH6OmC/muCYaH5UJVtAY4yNrnma/9xcya9ELl9oCSPy1uBObmKOD7XedPUDsd8Q/PQuwX8srMeSrxeMha6Rfsy8skD7mbRBPZs8hQM+jFbbGBTd/DcEQJtUysRNcgk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDihUauO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDihUauO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06D7C4CEE4;
	Wed, 21 May 2025 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841244;
	bh=1Ss0ZBRaHEV8F3rUqaE1lwJOphYa1YfsxLlCy/ljJ/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NDihUauOCxLT+TOKx/cv9W6c4iEgwOc7tKgC4GKSbNeqJ7Hg8jHz7cYO5U7llA9Y9
	 6hlluj+bY+QwKq2rHZuxtCiXV0fbeCpqYuF51piLngZ9s2ZUaL4Uh8B8XRunKZ3XtH
	 oNHBMJh9NK5lZfTssdqJiRfhk2n5PolNyeddJCkqDCaonPpLNxZjKsyFFUHxEZ5OhE
	 /OSOH/OqYcKAgkfCUGZxWVK95kHII+yliC6/93sFRT0Kokk2PqtOiZRik6/QJZ0ZDa
	 gp+lC11w+Ct8cFyzufRMM9UqjesNMHD3YLgZhL/LIoxaP3VCE9D8BLWrxv+00gEvgp
	 f06UgpMA7xawQ==
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
Date: Wed, 21 May 2025 17:27:05 +0200
Message-ID: <20250521152705.1056252-1-ojeda@kernel.org>
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

It would be nice to pick this one up, even if it is similar to the
cursor one -- some methods shown here are not in the other example.

Any reviews Reviewed-bys/Tested-bys, anyone? (I can clean a few nits on
my side when applying).

By the way, similarly to the other one, your email did not reach my
inbox for some reason.

Thanks!

Cheers,
Miguel
