Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489FF1C6FF3
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409877; cv=none; b=hnbgX9REVmI30NIj+QNeTVZMb8rO2aCeiK63pp6aKUAHZuB5Chr3/yZleKLnqA2PizJGEOCIHaSe1OUmS993mKahtfgzptm4vIyrsxb92CDBeUh0G+Y6jl7CfzkBaBdmjvGyEEw3gTSD2LxHE/eXQ6NtaBMXYNUQ4HKpy6ysZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409877; c=relaxed/simple;
	bh=GPLWfIxhxeI+gEoZlD4EGy1WAmfKbNh7zDOUf73kHr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=swhCT7n+GDUuFi6LKO0Xi8YkIXoAQSGNVDQDV4utBzxfjn8e3cl6iEOPLMDmcwINCX4AdKw2e8dYTv9+Ez2ESrZMXOE+mCCgYhiZb1tROlwsp8IWzvyddOLt0fyoCVScZd1JUfjk+z5/tWzXbi0zNRON8OuQNREPZbxU+S7sviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWrjbSnt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWrjbSnt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED770C4CEED;
	Fri, 16 May 2025 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409876;
	bh=GPLWfIxhxeI+gEoZlD4EGy1WAmfKbNh7zDOUf73kHr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWrjbSntMZnHCoWWroihESxoAMFpKMGUBnZ83YpMR9MpmhslxLmHGbnWQZtZiJFC9
	 jBHieqIOARhil/WWM7HWsh4XkVNku68fvwCaV2R4WnBsBlPED4nrXW0a1/ON6KX7N+
	 zhM3dGZM2heN6iMrTpSPH7eeZvLOsN7mcT9CuNeC2IToG2nonNuuWHXrvaa2lCJfD1
	 HsvIk75tfo617e3YeKrOAX78f0r9SkLhSNque1A78cvth+h7p7hJtUEMoD2M9pkftC
	 2tbDRyqOZQ6wMLPTOiFBZLt7w37A0icH5f6ZfOcQjMd5D7Eai6N/d88CNyVzmuw6Zv
	 BfxWTghSNUGOA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2 0/3] arm64/boot: Forbid the use of BSS symbols in startup code
Date: Fri, 16 May 2025 16:37:44 +0100
Message-Id: <174740792413.188921.9613065517341295309.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
References: <20250508114328.2460610-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 08 May 2025 13:43:29 +0200, Ard Biesheuvel wrote:
> Move any variables accessed or assigned by the startup code out of BSS,
> and into .data, so that we can forbid the use of BSS variables
> altogether, by ASSERT()'ing in the linker script that each symbol made
> available to the startup code lives before __bss_start in the linker
> map.
> 
> Changes since v1:
> - fix build error due to missing declaration in #1
> - work around Clang complaining about the ASSERT() expression in the
>   linker script
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/3] arm64/boot: Move init_pgdir[] and init_idmap_pgdir[] into __pi_ namespace
      https://git.kernel.org/arm64/c/93d0d6f8a654
[2/3] arm64/boot: Move global CPU override variables out of BSS
      https://git.kernel.org/arm64/c/4afff6cc9a55
[3/3] arm64/boot: Disallow BSS exports to startup code
      https://git.kernel.org/arm64/c/90530521079e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
