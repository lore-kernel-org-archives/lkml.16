Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1622882DF;
	Thu, 22 May 2025 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907582; cv=none; b=Ex3isqvyQ6UpQvMT/L5nVvqHHPqUN8bnThkJi/6dbrBs0n8m2/j2lPtMCqFomy7OL5GmdzxnNIjc7ZC//gZYUw+y1fMvbmwEy09TXtOkAubCdajEia2pIw3F4FJ63wkXwpayp3OBRTFxOGtPlKlNwV9S3wyyvaAOMgXBKqArTbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907582; c=relaxed/simple;
	bh=Kth+fgiaIltG9Hsh+2bZlDKyUt9RmeE2dnuT81/pJSw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=U+h+3f2pSiebI8IUeAwOjD1IdvRpfT3IyyNNsU1uXk893Q/XpopbyqfVoiEsxT7CYoMxoM/kjL4J6nQ/rrqvcq+m9UJ8d5l3PqwyFesN/9EfDXlLxORruLjcaJlPtX/gGrrbsKAtTFjUeGx7i69j+Zr5NpAbt2HcXUqTaUNHFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXwiSJnG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXwiSJnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CEFC4CEED;
	Thu, 22 May 2025 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747907581;
	bh=Kth+fgiaIltG9Hsh+2bZlDKyUt9RmeE2dnuT81/pJSw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=sXwiSJnGQjjdzQJT/VBdLGxc/7z5xoepc4jFSDwzSVxrZG9E/3zT8XTxG2K6XxpGk
	 sfN1Xiov4AYwAfjbNgSvA5/680vTA3zW57SXW3EdFQ1EWDMHwLN/Zh+bY54BGLKuX3
	 mUDkk1ftSyx6TIvsZaUTUJeY6O04yGuAQqn8aNpJlPHu7MZGzuMs3ZDHLOZkYcB08b
	 ihE6VU4X4+f1rfXgdEimo8nc6yN7QJSQ8zIsTt9FEYGxqq9nT11UIU7apqW0wS5UAf
	 aICqaM3ko0E804n3ZO2phivYjrLTHuKBUns420XIaiom6yEuhT1rFZ5olaMQPoAY7d
	 QCNVu2leHi4TA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 11:52:56 +0200
Message-Id: <DA2LIVGXSOVX.25YPFFEHM5CQB@kernel.org>
To: "I Hsin Cheng" <richard120310@gmail.com>, <ojeda@kernel.org>
Cc: <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <jserv@ccns.ncku.edu.tw>
Subject: Re: [PATCH] rust: list: Use "List::is_empty()" to perform checking
 when possible
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250310073853.427954-1-richard120310@gmail.com>
In-Reply-To: <20250310073853.427954-1-richard120310@gmail.com>

On Mon Mar 10, 2025 at 8:38 AM CET, I Hsin Cheng wrote:
> "List::is_empty()" provides a straight forward convention to check
> whether a given "List" is empty or not. There're numerous places in the
> current implementation still use "self.first.is_null()" to perform the
> equivalent check, replace them with "List::is_empty()".
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  rust/kernel/list.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
