Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDAB641;
	Thu, 30 Jan 2025 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236802; cv=none; b=FnPVvtj5YTOutn1oMn8n0/uh5yBM9XlWQZknalElyn4Iz5pxWz3VX/jYAH3CiUWn4Jbt4nCRIemYtSxIHymiNixdCjmy75ag0AkppmYBfjY7egYrinER5HC1LB8IxFTcZI4pBXJAhrvhh87AFSpxHGjZpJnUioZ9+s7ALv/IQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236802; c=relaxed/simple;
	bh=RRUhH+DmDXDU6i77hNNfXCc1sczf3u4i+v/EkBuIQ2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kGjCiR/hhRDqlxXAcovA33usJtQsNLS8sDy4t1E1XVkBS0pGRCZRpXvYNEt5a9rH/hgizZOJF/U/sJ1xJy3NNm9DZiJCNUchDdD26qhOZqQiQiGy2Ak4I5SiTltG3R+0aIysceJT8eaMjynpX89HY+BQSyy2rfTzuKuZt1Wpiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=DsbB85xW; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="DsbB85xW"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738236788; bh=40vAvf0O6fWqy1ripxwH0SIj+QHN5WPdXZ9JB/ctrmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DsbB85xW9g+ppCK3GEoFu9DUTZ9HRKkN1Cr8P9P4v0R/tpYiFZnqfkkk/+JxkY6VQ
	 tqpUTQ3mdFco6Z+dkaPrHi11O4pnhRzKw71JXwgJng9MpSZa4muHUvERUtoqA63gH/
	 cyx8b6ymg0RikZPvsfh0SfEeLAJxH9CUowTdAVhU=
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Trevor Gross
 <tmgross@umich.edu>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: task: make Pid type alias public
In-Reply-To: <20250130-task-pid-pub-v1-1-508808bcfcdc@google.com> (Alice
	Ryhl's message of "Thu, 30 Jan 2025 11:21:38 +0000")
References: <20250130-task-pid-pub-v1-1-508808bcfcdc@google.com>
Date: Thu, 30 Jan 2025 12:33:07 +0100
Message-ID: <875xlwfsek.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> The Pid type alias represents the integer type used for pids in the
> kernel. It's the Rust equivalent to pid_t, and there are various methods
> on Task that use Pid as the return type.
>
> Binder needs to use Pid as the type for function arguments and struct
> fields in many places. Thus, make the type public so that Binder can
> access it.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by:  Fiona Behrens <me@kloenk.dev>

> ---
>  rust/kernel/task.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 07bc22a7645c..49012e711942 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -106,7 +106,7 @@ unsafe impl Send for Task {}
>  unsafe impl Sync for Task {}
>  
>  /// The type of process identifiers (PIDs).
> -type Pid = bindings::pid_t;
> +pub type Pid = bindings::pid_t;
>  
>  /// The type of user identifiers (UIDs).
>  #[derive(Copy, Clone)]
>
> ---
> base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
> change-id: 20250130-task-pid-pub-484458aec19b
>
> Best regards,
