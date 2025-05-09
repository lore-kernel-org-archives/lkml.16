Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3123A9B3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811797; cv=none; b=riCebfiGVzzL/nmOvISEffUElNVHdnTSrhoE+GIzxNsGqjyHUqD1x+v2ISO5OHMVpQbQUIJXq4qu/f2igG/kSL9EJ7uZW2vm2DbrqjoRmmdobR+pr3QqfFSs/fV8TQTqY4LdEs/SrMOJ2DuNKI80KD9Xl6qst6HLlRSY+o1W9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811797; c=relaxed/simple;
	bh=etDsIxt76pe2uk/B9drL0wcQPb5b1z/MtT4+J3JduI4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XKMP6OJtv5UgM9xIM0deS4uMIahzvsyjnABfBrc1fc03kZ+0OpP79iDaMVX1HIgESsg3EUlo7RGxhWdxx8uzt8myy9BqJFLBUMj8+oEnDgtgDQr7d1VV12s8RdmUYIBajvtIffHdaoEmkgVlb38sjZYhFg2PIi3GO2e6mlDbjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQMHR6xy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQMHR6xy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2C9C4CEEE;
	Fri,  9 May 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746811797;
	bh=etDsIxt76pe2uk/B9drL0wcQPb5b1z/MtT4+J3JduI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aQMHR6xyE5UP1RdRHiJ9tbHGeftJChLoLCQABr/cgqNexjgRdf+M3/HnHOykeVBp+
	 1cyUo4chGPTgrs0SyittY8u4PC8fzQ91pvLM+126Fw+3qYcE0R/2lpRPUW/JVrvNXT
	 kryN8nqD1sBqxbY+BIBczxAupGpWZNG2mqauR4x7QiUgsI4viWhAd4NxScbTKBkKQg
	 TOfjoNQAo+Ta/BYQxFB2JAtrqhWwGYW/rsKLLI2AeJgsdxRkDRBMBbKaC+soEoyPRl
	 jbdAIVdEHeEw56OC6w/tGqV2/Bk27Y2WtqV4DaYbprsTVd5Q9h8SI1LrNLw/2lpavq
	 hKXO1Sff8OYFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADE0380DBCB;
	Fri,  9 May 2025 17:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/5] riscv: uaccess: optimisations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174681183574.3697320.3349869843167722914.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 17:30:35 +0000
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, jszhang@kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 10 Apr 2025 07:05:21 +0000 you wrote:
> This series tries to optimize riscv uaccess by allowing the use of
> user_access_begin() and user_access_end() which permits grouping user accesses
> and avoiding the CSR write penalty for each access.
> 
> The error path can also be optimised using asm goto which patches 3 and 4
> achieve. This will speed up jumping to labels by avoiding the need of an
> intermediary error type variable within the uaccess macros
> 
> [...]

Here is the summary with links:
  - [v6,1/5] riscv: save the SR_SUM status over switches
    https://git.kernel.org/riscv/c/788aa64c01f1
  - [v6,2/5] riscv: implement user_access_begin() and families
    https://git.kernel.org/riscv/c/19500c6dbc5c
  - [v6,3/5] riscv: uaccess: use input constraints for ptr of __put_user()
    https://git.kernel.org/riscv/c/62135bf660b2
  - [v6,4/5] riscv: uaccess: use 'asm goto' for put_user()
    https://git.kernel.org/riscv/c/cdf647e81714
  - [v6,5/5] riscv: uaccess: use 'asm_goto_output' for get_user()
    https://git.kernel.org/riscv/c/f6bff7827a48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


