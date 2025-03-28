Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881EE1E1E11;
	Fri, 28 Mar 2025 21:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743198636; cv=none; b=tknGqD7BZ/b9KIKrITr26pozin9u2ircENEADHFZednenXWf/xqmRONJQaSiGrYc/R9UEANfhwWdlGiJAaE7XzdioZ4318XLTuJceDwXP6Wf6RI+vdNfNke4zTtOWlRCyblpQHK7WjYs1+ZBYw4a/mCsxmu/HQum1qVMCBLvRVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743198636; c=relaxed/simple;
	bh=xA/HGFv/EsKPCdBIXVGOMHfpAAFyy6nmg470K7yJVyk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q85nhmwnTeNA+5hQP2VkG3VCrMYiToLwKTmE8CFbm5dkUF1AJJoHI8YN645v1aPS+loPLHnf0RHDNLqk6gI7IspYNZenYDhRs0lgFeE6NuNf4T5+Tb8PK88smIqt/RWEiLGIJPcHQInlqC0wwvkbovWobFLC9WeWJEFN2TZ7gaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d7aWhZVW; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d7aWhZVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743198627; x=1743457827;
	bh=CN6cRrOpEKT1gAzrcmidhzmRfsqv0twK4mJ6/TD+VFU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=d7aWhZVWk32kXjeuh1S6OhIpWD5QVFFQcnf+NoR2tmFvkgwWIUgWwddJjvxn/xWgb
	 kfNBYlbmgfsz81BsiVwJMM8r5klH9MrNzLQ6+IA50XEVcbS8ptOb+LtTmLMHXriDBq
	 JCxK9tw5ensaPnxVHW0c/JbsOKCuLjbrTfDuekadJnIg+XCL/tbrLaJVs0tk+Kbdrn
	 uvXewnwawU55rfGpo7GVLYJGpciuk8jgNlKhwVyGQFR52a1ouBAzsriakmPjq+nSe0
	 OTu7wj1cS0L3wONwFGUmvy4EW0O7KiK+JdsL3yGb8bj5Hcc9Whjb+DKBIP8y2e1xZr
	 dZzrUjflv2SvQ==
Date: Fri, 28 Mar 2025 21:50:21 +0000
To: Igor Korotin <igor.korotin@yahoo.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rust: macros: Fix macro referencing core and kernel crates v2
Message-ID: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
In-Reply-To: <20250328180312.2025317-2-igor.korotin@yahoo.com>
References: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me> <20250328180312.2025317-1-igor.korotin@yahoo.com> <20250328180312.2025317-2-igor.korotin@yahoo.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7e491c078fa94a96da17aeb651691900356dd25e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Mar 28, 2025 at 7:03 PM CET, Igor Korotin wrote:
> Update macros to always use absolute paths for crates `core` and `kernel`=
.
> This guarantees that macros will not pick up user-defined crates `core`
> or `kernel` by accident.

The crates are not user-defineable. Your initial message was correct in
that the user can define *modules* that have precedence over the crates
`core` and `kernel`.

> Changes since v1:
> - Fixed paths in auto-generated code.

The changelog shouldn't be in the commit message. Instead place it below
the `---`, but before the change stats.

> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
> ---

(put the changelog here)

---
Cheers,
Benno

>  rust/ffi.rs                     |  2 +-
>  rust/kernel/device.rs           |  2 +-
>  rust/kernel/device_id.rs        |  4 ++--
>  rust/kernel/kunit.rs            |  8 ++++----
>  rust/kernel/static_assert.rs    |  4 ++--
>  rust/kernel/str.rs              |  4 ++--
>  rust/macros/kunit.rs            | 22 +++++++++++-----------
>  rust/macros/lib.rs              |  6 +++---
>  rust/macros/module.rs           | 31 ++++++++++++++++---------------
>  scripts/rustdoc_test_builder.rs |  6 +++---
>  scripts/rustdoc_test_gen.rs     | 16 ++++++++++------
>  11 files changed, 55 insertions(+), 50 deletions(-)

