Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A8256C7C;
	Mon, 23 Jun 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687058; cv=none; b=E0K0FoVIfvZgtyoye/FSUspq2mCKRXDZawSOOtd6kP4qI9WH92jtm7vEMMH8PDZl3+q6CWAGr5H6yhzM8lgmWuGVdHwPDM4JohblLXPDAONyuvNI8+yBZbdTdMwsrC+2YZlrpqeiNK7Yx/cbdAhEStKs137T7FwZoK/Z/UQTNg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687058; c=relaxed/simple;
	bh=imYBn9MTOZDWI2+TrkiwM/apq+61Hrpdpn+5kkfKPVw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OjxvVqlnHiEIjFxZvbvMeAM+5dfpePWHIPJr/Y7lvSA/VFlBMnytm+JAE8azUS4WaUrmN+RCh5TuGb8b++fSBP+mig0c7YiQQOj19JRtpviwOgNgfp5frXFef4dIFwHss2uv0/G0TEhN9FUgjWMgML2JxDczzEBIPdJMpbsneVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oksDtWEs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oksDtWEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C008FC4CEEA;
	Mon, 23 Jun 2025 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750687058;
	bh=imYBn9MTOZDWI2+TrkiwM/apq+61Hrpdpn+5kkfKPVw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=oksDtWEsLKf6LvdJuXYJT82KcbIr2odnoRA0+iyx9aatjqNRMZoCzUKrow9Up6FB1
	 UVYQqx2O6Dd63Y1nXhc3914p/W4ecUdGiJLUpnPjXVAY9E8/zrpt53AN7ztGzOVScX
	 s4v8S5TPw/oDHaIk2hfRRIwmq8G8P1VQvkOBmy9OsEB31Fuk3UncvAzq37LnyfkblZ
	 BanT6wPhjJQLLxBz2Yl348Ph6rvzrEgVWu93zKGenbnXATWRA0TvIEyyTxydv9jQoR
	 QdPm8AAa/Yzx6VGyyrBmR9FAyuaDEzCVYxG/9bhSGAvoWA8Hv0fs2+8ItUcr26kmje
	 p9t1zR9SYsqHw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 15:57:33 +0200
Message-Id: <DATYRLJUE9PF.MPUJ2S7PDU7J@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>, "Miguel Ojeda"
 <ojeda@kernel.org>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Brauner" <brauner@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
 <20250623-gigant-luftraum-ff854d561474@brauner>
In-Reply-To: <20250623-gigant-luftraum-ff854d561474@brauner>

On Mon Jun 23, 2025 at 1:56 PM CEST, Christian Brauner wrote:
> On Fri, 20 Jun 2025 11:49:35 +0000, Alice Ryhl wrote:
>> It's possible for a poll_table to be null. This can happen if an
>> end-user just wants to know if a resource has events right now without
>> registering a waiter for when events become available. Furthermore,
>> these null pointers should be handled transparently by the API, so we
>> should not change `from_ptr` to return an `Option`. Thus, change
>> `PollTable` to wrap a raw pointer rather than use a reference so that
>> you can pass null.
>>=20
>> [...]
>
> Applied to the vfs-6.17.rust branch of the vfs/vfs.git tree.
> Patches in the vfs-6.17.rust branch should appear in linux-next soon.
>
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs-6.17.rust
>
> [1/1] poll: rust: allow poll_table ptrs to be null
>       https://git.kernel.org/vfs/vfs/c/6efbf978891b

You took my RB without changing the safety comment that I had a concern
about. Can we fix that before you send the pull request?

---
Cheers,
Benno
