Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6F255E4E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902334; cv=none; b=bLpRIIT7msGYRp/BFn5VswMOMXhmpCXia/dLnzgVk6IADbm0P07mEZIl91nnNaDjpzFWH09SLJYQ8+mEMlrr3RYCrGY/CEHqRCoJmBFQeT3iIjSyYWIBFIqG9+05f/ShcpGsUJ0frZfYDILeycuTGs8SMypydsFtLk1Z7B8D73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902334; c=relaxed/simple;
	bh=mnMBuXPc2ZQFw3argKuVRCHSdMH2r8EVc5rT2Tz2hRY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mRJIdTAvU7eh3CGD00yhatpn7xw1mJnLVj0UB084/Nvx3I+T1SV4LNnuQ0k5XI2GZlkBG+aR8gAMiUUQUqBgi5k5cu3XwEPL/+VpHeJmATJDh5P3T0KdHi/ca9QW9cg5VHW3+8KTU6arU21z2zYHqzj4HObAPjAtgcSibp1mtvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=reKmYbUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="reKmYbUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A307C4CEEB;
	Mon,  2 Jun 2025 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902333;
	bh=mnMBuXPc2ZQFw3argKuVRCHSdMH2r8EVc5rT2Tz2hRY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=reKmYbUXF9j28zyl2c7Q/9//n7V4xK/4Coo/W/hzAvJPrf0ORw0BQlsHauVn/0zyE
	 XwY5lmrm7vc644GWrKGnTLME2QBQh+JR3U+l35NKi0YL50UHgoSz1yuVdUnaZTqB3L
	 /b4UTQVNblan8RaLS4sTAg13GjH/8g8o85eKfNQpB8VABlkghAWSKCFXSLdZkyOLSk
	 032+0NfHSWUvvBQjvKTnuv5tePxMd3PvDYaNlQhEfrPWI7++yNrFjUiQXz571wLz24
	 W8yipZwo2JbbfA1y7fodKIN0w+st6jrAgRQ3WSFmBjup2WPdxqQvtidlJwLj2NWs5X
	 xd7PEQKPqVn8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71209380AAD0;
	Mon,  2 Jun 2025 22:12:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv/kexec_file: Fix comment in purgatory relocator
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174890236599.925497.11306329780731063365.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:45 +0000
References: <20250326073450.57648-2-ziyao@disroot.org>
In-Reply-To: <20250326073450.57648-2-ziyao@disroot.org>
To: Yao Zi <ziyao@disroot.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 ajones@ventanamicro.com, sunying@isrc.iscas.ac.cn, arnd@arndb.de,
 kent.overstreet@linux.dev, lizhengyu3@huawei.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Mar 2025 07:34:51 +0000 you wrote:
> Apparently sec_base doesn't mean relocated symbol value, which seems a
> copy-pasting error in the comment. Assigned with the address of section
> indexed by sym->st_shndx, it should represent base address of the
> relevant section. Let's fix the comment to avoid possible confusion.
> 
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> 
> [...]

Here is the summary with links:
  - riscv/kexec_file: Fix comment in purgatory relocator
    https://git.kernel.org/riscv/c/0f6edcccfbd8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


