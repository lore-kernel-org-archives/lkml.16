Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D4290DB0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047555; cv=none; b=QDh5XUByaEbo7h/L/EQ4yREveELi89w6IPo6zRSbHaQ7ppLDjVaQA3qB327y+XkYykr+7lkKw0Zzg7aTa4xIIHYyYMeW95Z1oAGxY6SqA6LcyvPM7qSgdMvCJva3neDSpnGlwJLskchKuhGMgHTRcKszKucCt5AE0+wLcFQWv7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047555; c=relaxed/simple;
	bh=0cex6vSsXIzLr3HCp6pdJwaZEIj6tYWrRSJ+A1mcFLI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NGpyCWH/jpWjDn0+UAkR2nGG/141FZYh6Fimd0hqbvX6dprYhs/tlylEWd5kgKFr+m8/gS5PCMGjj5zRcnYLmC/2CIT7LFiB5LAZimdDN4WAsemzcgjS4BY976mdVmemKn95ayuix8MWPQDzJ/lboAJeSKMVbAKUC9Xe2bmfMy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcU55DcL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcU55DcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065C9C4CEE7;
	Wed,  4 Jun 2025 14:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047555;
	bh=0cex6vSsXIzLr3HCp6pdJwaZEIj6tYWrRSJ+A1mcFLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FcU55DcLd27Gzr3kTtCD7R0h8Y+7t99/1qb67kVtT7VJmq2VsTlx8WVfgKCaUzAY7
	 s6639hu3xKMWeHBGHX4FqKRT2crjgv9FG1p/XNFds2H6apBCBqPplBZCsv06+GEZER
	 QOu2AjNw+jItngyM8zBYXR9vuNIZfz7PAPUTWhfXir7EvPccAuOC9oCO2JmcwJN9/F
	 Cbqho20ofD7DtdUsKULcNQKAVgMG4MlA+Q3V4G2OJbIvTK8Hg67MzZofyiZaL8+isR
	 pX6eB+05poNoSy4eiUs7UZ08J5KgQ3fzkccK6+t5/DcZCAETw8VNQXQxL7fUK6xO2F
	 HvqIc64Kpmt8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BC438111E5;
	Wed,  4 Jun 2025 14:33:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/11] riscv: kprobes: Clean up instruction simulation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174904758698.2309006.9940004806769596353.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:06 +0000
References: <cover.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 14 May 2025 11:38:39 +0200 you wrote:
> Hi,
> 
> There is some instruction-processing code in kprobes simulate code. These
> code should be insn.h. In fact, most of them is duplicating insn.h.
> 
> This series remove the duplicated bits and make use of macros already
> defined in insn.h. The non-duplicated bits are moved into insn.h.
> 
> [...]

Here is the summary with links:
  - [v2,01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
    https://git.kernel.org/riscv/c/d29656bab74c
  - [v2,02/11] riscv: kprobes: Move branch_funct3 to insn.h
    https://git.kernel.org/riscv/c/da6de46c2eed
  - [v2,03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
    https://git.kernel.org/riscv/c/6d47d903b18f
  - [v2,04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
    https://git.kernel.org/riscv/c/5cefc323f32a
  - [v2,05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
    https://git.kernel.org/riscv/c/a285674909ae
  - [v2,06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
    https://git.kernel.org/riscv/c/c7196c136e29
  - [v2,07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
    https://git.kernel.org/riscv/c/768007ca3fe8
  - [v2,08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
    https://git.kernel.org/riscv/c/f2c715fff676
  - [v2,09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
    https://git.kernel.org/riscv/c/284ca2a100de
  - [v2,10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
    https://git.kernel.org/riscv/c/a60c2933ec74
  - [v2,11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
    https://git.kernel.org/riscv/c/ee4c45f5cbeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


