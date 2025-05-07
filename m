Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B01553AA;
	Wed,  7 May 2025 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617877; cv=none; b=RLYL8ucnex3+avrpPsCJKPMsvsDI6N57FG9Qr5NOY32vdiD8gwT8kD/i++7E5NyoIz/8CugJerowIv0kLmxHojMwdH0fOCHhIQUAaapPXqGvkUqaTcFtYqgOctlIg3bIiz52dXWXuD6p4iih2ytE9Z9gBfQ/I8Rk9CFnphB/+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617877; c=relaxed/simple;
	bh=btVRiThXFQDNMGo1xwZjxj17jJUQAThMgxZxOxdTXNU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=FvubLILcEesPgDCoU/XOCYUgf7AWOupO5kAy7+LhVcua19S/G13ud66y2TKNrRIr0gfXAQTS0jdrzQnI1nkVFDjk4EidV5L1WRZcGbL8Fcb5IV7RfPDYINW358cvWnQqZFaQHqrcF/86xFewuEiXWuMM+veENZaV3Z7QDU++FcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtNzlUkG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtNzlUkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3567C4CEE7;
	Wed,  7 May 2025 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617876;
	bh=btVRiThXFQDNMGo1xwZjxj17jJUQAThMgxZxOxdTXNU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=dtNzlUkG3nNNytw1glxcIx1Bywa0rowCS4mIf6t+d/oVJTgvIk+RYb28w944JrJoh
	 /PdDkwXKZjbN0rHsbXH72fRTeqxCMZs5hBZHfLiPX/tHp69aEUtWSrA5krJNk1xpjn
	 dzRv4ONzmuBIV4b0W/2zJSURK6ELL3M7RWvkmeRxuTHOe1DWSgrcvduO6J50xzk+kU
	 Ll/JtFg6mqK5j28B6faLOReLskFaUxGmWLdfelYMhAR3butjm1tE8mBYUpkylQkU7H
	 UknCEig9EZalCiPKU8NuFS6Jb4OcgKFTA5smmi1lNA9mOFMvVV5FO6PCDLLcgd9il1
	 fI4QxULNIcJfg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:37:54 +0200
Message-Id: <D9PWD2EJFDZN.5LYMLZZQ4QCF@kernel.org>
Subject: Re: [PATCH v5 4/7] rust: alloc: add Vec::drain_all
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-4-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-4-06d20ad9366f@google.com>

On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> This is like the stdlib method drain, except that it's hard-coded to use
> the entire vector's range. Rust Binder uses it in the range allocator to
> take ownership of everything in a vector in a case where reusing the
> vector is desirable.
>
> Implementing `DrainAll` in terms of `slice::IterMut` lets us reuse some
> nice optimizations in core for the case where T is a ZST.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 59 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
