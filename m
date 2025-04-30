Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DE19C556;
	Wed, 30 Apr 2025 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028136; cv=none; b=MLHXAm0E+Db0xJrN8iCMx5Ik6WCzhVJmJJTo1WbXxWis3K/ZJy2VqZdSDAv6TkRUTBBau8MdgGsgRAkCQwo3oBQ4SHdShkTNPw+PBCUrXKWg87H0CgQCHDyiK32dtQSNcu2xYWbeg7ZPo+PSRE3LiDlRwcdJSw4LgwW1bdhKGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028136; c=relaxed/simple;
	bh=EpdyxGfmIGM/4y2DbJ0OMYH/LxyVa4jnB71F6fCAjiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWzzrJC5T/nU23zFegdOt1rEOXJ72x+kSHvsh4XHWJC+OqKv8CQ5DFa07J03TrEqiutZCm2va03FREmXZwe9HR9OczL0ffmu/Jh0S0ymiAUfxz5khN4rM1ospx+GtZTclw9xrRhfa55PeAQNdPGhlijnqoS1bW8Rav7D1xz0XZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV+RSHRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV+RSHRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9A5C4CEE7;
	Wed, 30 Apr 2025 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028136;
	bh=EpdyxGfmIGM/4y2DbJ0OMYH/LxyVa4jnB71F6fCAjiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hV+RSHROe8y9M6TG3n4UqKL/GYMH1zRzLtVqgegLtW/9lsNUn95NlSrItfc+bHfEA
	 n6sO+hDAlFxcucIpRcjeVICiOWRHXxa49nhV+LMzqYVJmW33k+83cTJCT/wVz5UUgW
	 REjzRljhm9OKHR/UuT3XiaBKSqHiFO6CA7J8ulboqXfBMCpLjB8gUnwMEEl48iaOzW
	 Cek2zPGuf8n4TXhCcOTB710jnn8VmpCApsSFjPxJLIO2exXSmrIRFdtu3zbhJ4d+Dh
	 aIzN0U/QBkV/rGKqbQ4BvKQhunAMKyJtamk2Zh2ZknUjpueb6PBzNAqaXHEsYfBmy8
	 8XZI5WBXktHCQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: naresh.kamboju@linaro.org
Cc: anders.roxell@linaro.org,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lkft-triage@lists.linaro.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	namcao@linutronix.de,
	nathan@kernel.org,
	palmer@dabbelt.com,
	regressions@lists.linux.dev
Subject: Re: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
Date: Wed, 30 Apr 2025 17:48:45 +0200
Message-ID: <20250430154845.795993-1-ojeda@kernel.org>
In-Reply-To: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
References: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Apr 2025 20:15:45 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> build errors with clang
> ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
> '__vdso_getrandom' failed: symbol not defined
> llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
> such file or directory

I have also been seeing this too in my Rust-enabled builds for a few
days at least.

Thanks!

Cheers,
Miguel
