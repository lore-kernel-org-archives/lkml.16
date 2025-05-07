Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA420E005;
	Wed,  7 May 2025 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618274; cv=none; b=BlLOy/EM83oxOuXolcAfRdvSgPja8nqn53VrTvOxojZmY4+owLKGXkkUa3z7T17oer9N+xoRDotSWn2HXNr2zhIqgme/CXOHJxmcIyrILFkkBLIgKrTDhEo+qwHjH9aM6Cnz/bPQDcNJQ5gyR7THuwCHG0iC+Cd0SwTs2wS3UwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618274; c=relaxed/simple;
	bh=nPEGgXcMtJIOP245hvY7rW/6LPrvpcp5iUBnypv6aSA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=InGb36jBzBZcT7KS1EdQASKrydDgyy2RbRe2bg51pLY8BjtWZcrLL+ey3SQeo0PK5Uh+/UItmDFcen7/5BIsbrwVBToPv0OFiYgd20MTfQNyRd9yC/nYceqCdqVUdegGpVDdySHUSNE0YJ7e9fSN58JbUzxNB3UUbmWdmV11+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVD9hXfs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVD9hXfs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568C5C4CEE7;
	Wed,  7 May 2025 11:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746618273;
	bh=nPEGgXcMtJIOP245hvY7rW/6LPrvpcp5iUBnypv6aSA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=LVD9hXfsOn7fjBBK/G2KPXduDg6Yu4lOWUie8F5Q4/dXbGeYsB1h99JUh1xSv+4/P
	 BkHI7ta0TfHBj67/Jor0a6HIvMgz1otxvjnBj3s2tdH3MYZA+JxGhtCiEgRS2POsCM
	 y+T8BRii46FYglgzYn69ghXALk3ZuMCQi6KHE8Ly+K90XJXxSPCVoiiqMPUAhnj9Hh
	 zvX92mpxo8FjCF/zKVrO7ZHPWJfXf+9ndEJ4qQEl8rdHw5vVGRVup+gGfaH+mZYdEL
	 VKzK4pa9/yRuZTtlPaoe08+4ey5KoISngXe5jI4J6w8XpRFQlYbDCxl/WhyNhG/8+8
	 AGW6vKkqDNz8A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:44:30 +0200
Message-Id: <D9PWI4JVVMMP.20A1IK9ZVSG3Z@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] rust: alloc: add Vec::remove
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-6-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-6-06d20ad9366f@google.com>

On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> This is needed by Rust Binder in the range allocator, and by upcoming
> GPU drivers during firmware initialization.
>
> Panics in the kernel are best avoided when possible, so an error is
> returned if the index is out of bounds. An error type is used rather
> than just returning Option<T> to let callers handle errors with ?.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

One follow-up comment below. With the `# Panics` section removed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

[...]

> diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/er=
rors.rs
> index 84c96ec5007ddc676283cbce07f4d670c3873c1e..06fe696e8bc6612a5e6aa2f6c=
28b685033acfa2f 100644
> --- a/rust/kernel/alloc/kvec/errors.rs
> +++ b/rust/kernel/alloc/kvec/errors.rs
> @@ -21,3 +21,18 @@ fn from(_: PushError<T>) -> Error {
>          EINVAL
>      }
>  }
> +
> +/// Error type for [`Vec::remove`].
> +pub struct RemoveError;

Would it make sense as a follow-up to store the index that was accessed?

---
Cheers,
Benno

> +
> +impl Debug for RemoveError {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +        write!(f, "Index out of bounds")
> +    }
> +}
> +
> +impl From<RemoveError> for Error {
> +    fn from(_: RemoveError) -> Error {
> +        EINVAL
> +    }
> +}

