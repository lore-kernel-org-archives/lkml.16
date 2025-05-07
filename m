Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3772603;
	Wed,  7 May 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617540; cv=none; b=XhzTxMJve7HqFrXMYOa7trIgE5yeuxug80cNbyv/7LTRhfgKoYZvSnssAfwOdrjvUPqG/Q221EpqOiUBZCLj68l8wb0pmDQAuO7ZUY1zVJZHn6uh8c+29YawJ4GpVXpun104NirqjaMl/0o8a0cx0g4bjoGni3B+slA+CqysHfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617540; c=relaxed/simple;
	bh=ppOWR/+wRXVgfnfeTmB/NLZWoBhyD0VdA4XsIavGfyo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=A5wHomSKOh1rgrsbRjgp+6BD2JPMO8T2rsVbAotCj865MDXZ4mJmpzZwkwDOcuGPvzbMSXlmHuZmTASF6tZM2CKdyKVAOsfhQuwbG5XzW5nNbEkgyklc8x/0VVHHDtWKdLcR9jbQCBtLLDUd0TsKDk/hlO2VnZTTiOJP7B6Vyns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNHSdFkl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNHSdFkl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5D4C4CEE7;
	Wed,  7 May 2025 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617540;
	bh=ppOWR/+wRXVgfnfeTmB/NLZWoBhyD0VdA4XsIavGfyo=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=TNHSdFklxQ4NWF5ZITrKWIbriby/SgrmihxhPnL0MTHRmOBkMWnkp4ZhPbq0BgadE
	 Kq2PICBqDjeOs0hXiS11i1+J3xZgU3WUbCeFCvkk/e0eYcQTnPB/QL+mABYEGEqi5X
	 7YbuZlgelHZKK8f9dvInlw1ycCg8snlDgZWsKyR3y7wJpFry4h8jIFi0xlkWhPfwZq
	 UX/iStTK2IjmX0Xh9x4NK5Yu0EY9Uv364vrfqxH0kylM+62dseDlTd7KcTB5bq+63C
	 lvRLTU8w3WDy8/6U+gUTUSk2Jr48JdWPxPs2uJbZSUVl2aYBT5Tq1JphDtj20ALYY0
	 sHBz+ULajVW7g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:32:17 +0200
Message-Id: <D9PW8RPJMRKD.1ULWBM44AECKJ@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] rust: alloc: add Vec::pop
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-2-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-2-06d20ad9366f@google.com>

On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> This introduces a basic method that our custom Vec is missing. I expect
> that it will be used in many places, but at the time of writing, Rust
> Binder has six calls to Vec::pop.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
