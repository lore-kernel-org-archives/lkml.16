Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3A25D1E5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290422; cv=none; b=Ucy9OoxH6OqWNk+ZaTW+AcPn0s+jcQ2bKODxG4720bKilQ0DSowJh/kYCe0QNIAuwl/t0+UDCtxBXpIn4ieCDfEYFmO/uBNIbwCMpXtcqXx0B6Y2e75iGm8sBxTQ0ooY5/hScAaWBPBvfjhhUFPdWL96ny8D90N8X6HarbD3qpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290422; c=relaxed/simple;
	bh=iZ+s9SMgf+Y4MCs52QI7GV/8Kt/HHq5Cj/gYOGruYyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ld8AxZpOp9wa8S8pnAb47MPxRhCvPwCdmfKaEwjHD4o4IuahibRdPHnMnVrM726mYsrHcCErOU4TWcBPxfLrLnP+lfNfxpId0GTQuZ4YQz5h5X7ZdImyu4H9ZzdPQrYMKuHVijLENdjPo4K6j+loR9y508enym/E/tMz1b1KaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iurEpeVs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iurEpeVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB2C4CEE3;
	Mon, 30 Jun 2025 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751290421;
	bh=iZ+s9SMgf+Y4MCs52QI7GV/8Kt/HHq5Cj/gYOGruYyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iurEpeVsfekOhVmSaId5siebDwIAvaETGpWgx0tgrX60B3g4kkU28DC2YufKIwQER
	 IVvZ+DhGLKc/6QYLJn+2PGgQWx08/BV6tvYWTheBtC2S7kzNshWy3JpAqXxRG/TaYJ
	 0euI806g+52O4Zgpyj0xDdKqfUcdGivlEO39SIHhgEPBN1SALeGHByEj6CNGjkkkyR
	 ecGt85Y6ul1qTbpUW2L7tLg03EK/jViGXc2axe1VVlJwMQauFMK4Ty5Asv/qlHaar5
	 nCVtXZxDi/O8sFtyyv1H2ksDSZ60H+Zjc3SFWdHT+DNM3t7jzOCUBsuvhsyFK6O51G
	 yhIzNjGeaa/qQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pnina Feder <pnina.feder@mobileye.com>
Cc: alex@ghiti.fr, bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mick@ics.forth.gr, palmer@dabbelt.com,
 paul.walmsley@sifive.com, Pnina Feder <pnina.feder@mobileye.com>
Subject: Re: [PATCH 0/1] Fix for riscv vmcore issue
In-Reply-To: <20250630112309.97162-2-pnina.feder@mobileye.com>
References: <20250409182129.634415-1-bjorn@kernel.org>
 <20250630112309.97162-2-pnina.feder@mobileye.com>
Date: Mon, 30 Jun 2025 15:33:38 +0200
Message-ID: <87jz4txsjx.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Pnina!

Pnina Feder <pnina.feder@mobileye.com> writes:

> We are creating a vmcore using kexec on a Linux 6.15 RISC-V system and
> analyzing it with the crash tool on the host. This workflow used to
> work on Linux 6.14 but is now broken in 6.15.

Thanks for reporting this!

> The issue is caused by a change in the kernel:
> In Linux 6.15, certain memblock sections are now marked as Reserved in
> /proc/iomem. The kexec tool excludes all Reserved regions when
> generating the vmcore, so these sections are missing from the dump.

How are you collecting the /proc/vmcore file? A full set of commands
would be helpful.

> However, the kernel still uses addresses in these regions=E2=80=94for exa=
mple,
> for IRQ pointers. Since the crash tool needs access to these memory
> areas to function correctly, their exclusion breaks the analysis.

Wdym with "IRQ pointers"? Also, what version (sha1) of crash are you
using?


Thanks!
Bj=C3=B6rn
