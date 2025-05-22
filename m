Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA82868AA;
	Thu, 22 May 2025 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907300; cv=none; b=g+zuGjIPYbeosepxTs7rLXN3ezPKFjBx7kkgsJIFHAsXATv8opJ9UFFzfTxAauDPyc9FqWY9rdstZPt7BfN4gt4KY7/mPwYDfMy/SeZ/o00cCmc3OzXW9j5nS4KAwR4h9YJdm4lQNPyQuwJ5/OCNBVC6AsSQjJvKzw2cHVKz2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907300; c=relaxed/simple;
	bh=2xc14kofAPTIvpumlYOz6JKhfN4twQKcUTXPRnhTva8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruPWiMZWiyk+CAedNQs7KsQ4ZAbBUifhwhtzPeT9k+IQhMwiob+4UeXGqcbuWWSwy6xFtar5Cx48l3MvwhZxYpT6Lg2b0LkO8rtoSiMn6AcjmQmJZP7CFGaz/Q/H1aqD2BmaSo5pB5DhSQ/HGOVrT32gHDfxkCRkqIErbuxvtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0fuadPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0fuadPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F29C4CEED;
	Thu, 22 May 2025 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747907299;
	bh=2xc14kofAPTIvpumlYOz6JKhfN4twQKcUTXPRnhTva8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i0fuadPmZO2CjoTQ5YGZmtOpheGXsVRn81YUD8z/ORLstL2eUxQqIQunSAQBVnMS/
	 QLCciGm9Bg6IcpxKvFS3/M8pSkaghf8Khom9zR57BzqfDk6Qf/74MI05kzSuQeFgAY
	 7Klzgd2pGuMqLg75cyhpvUmMt/KIVIt67kUW5gojukCPDb9URmki5zsegnsvRWmiTo
	 gikw1b24qUBCk9t/7w3MgzJNPSDzCzFF5rrGeTfQneKMOjmPAFCiIjuqrPUcrtlcc4
	 RqGRKzfWYfHXJwnWNPRUo1PP0kte3xXeu6wO0BR5Cx+ztC37Jb5iZP1XdmsEo0/NXS
	 +zJC+X4wdDGAw==
From: Miguel Ojeda <ojeda@kernel.org>
To: richard120310@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	jserv@ccns.ncku.edu.tw,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	tmgross@umich.edu
Subject: Re: [PATCH] rust: list: Use "List::is_empty()" to perform checking when possible
Date: Thu, 22 May 2025 11:47:53 +0200
Message-ID: <20250522094753.1369788-1-ojeda@kernel.org>
In-Reply-To: <20250310073853.427954-1-richard120310@gmail.com>
References: <20250310073853.427954-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Mar 2025 15:38:52 +0800 I Hsin Cheng <richard120310@gmail.com> wrote:
>
> "List::is_empty()" provides a straight forward convention to check
> whether a given "List" is empty or not. There're numerous places in the
> current implementation still use "self.first.is_null()" to perform the
> equivalent check, replace them with "List::is_empty()".
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Applied to `rust-next` -- thanks!

    [ Rebased dropping the cases that do not apply anymore. - Miguel ]

Cheers,
Miguel
