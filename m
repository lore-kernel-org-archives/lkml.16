Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D861BD9F0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746054584; cv=none; b=suyv1GbxJahEyJ9fghrPnBYRL/hahr+95aYQNxz8fWCGRYjhsqSbAArofzlydgjLWim9bszrlxFyAV0yNxiIYMC8n9ShyIzqBRTv5N6JAcVGZHk7cP9NtjP4Z4udHYe1fC24spNZB+WWvBdnP3iekf8Q/+AnB6hb+FeAPoGtEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746054584; c=relaxed/simple;
	bh=eRM49ENGm/AH7ifjnE7OSeEzVG18E9Yp542KftbtE40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rkrloXVqDU/b1d5gKA9dQTvxKr0HaeUtdVnRBAVJNtv+NYLALFY2pY6buLNa71xnRS68bT0P0mQMiJpOg3uK4VQn3ehR68FgcNMUOLKgC+RiIB5pSfW6CkxaeSzX4ZzRfTq/lv2jt9noEcX8KvZWw6/SLRlpzWItA9IGl9vpooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBocPFY1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBocPFY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4A6C4CEE7;
	Wed, 30 Apr 2025 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746054582;
	bh=eRM49ENGm/AH7ifjnE7OSeEzVG18E9Yp542KftbtE40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lBocPFY11L1YL+G9gb7BjUr7OJNByaiu2CfXJ1IViX4+9p6YRvNe5g6sKntOeBVqj
	 YYP/s/Llj5ZZaK7v8047uYA+9ccOb6ODIAdw+ZZTvcGijZNBkn7MyR0+w+RQrXx/wr
	 aOlIUUkIEBX72G1FeMsyoVCR0pMqbMVX7TtXhHaIdODReGtGjF/IulZjmVyPmYt9T4
	 AstwrgF3Bj+HSklI/kp73a5dldX6+2uXj6vGRWvm136i8j2P52uvEUyC8vmK2CVdhk
	 A03D94eYyLwhGxapxyTp8OosRmi+/9cCLMY61vuXPnv/spUKjm060RxMTY9O0W188Q
	 OZ9Kq709jA4zQ==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250428061318.88859-2-thorsten.blum@linux.dev>
References: <20250428061318.88859-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] regcache: Use sort()'s default swap() implementation
Message-Id: <174605458012.3999461.2521484594284495976.b4-ty@kernel.org>
Date: Thu, 01 May 2025 08:09:40 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 28 Apr 2025 08:13:18 +0200, Thorsten Blum wrote:
> Use sort()'s default swap() implementation and remove the custom
> regcache_defaults_swap() function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regcache: Use sort()'s default swap() implementation
      commit: d30e845b0ae63400738709ca624a4a7bb69c4ba2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

