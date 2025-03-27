Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681531C8627
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045847; cv=none; b=t1CM24ENzBvzQ2ZV6IaPY3030WLk+fmGJQVUX8/wADxZ3Nua17rJaxpGmLEJgDCkycMVOT6Ekj0EiqgGM+ACvnyOYFMIBxo+uPwfm7LPmO3rgEDeVpOcEQ5+eC1xmLlQnCVRXqkDXA8Qlj9M3hDJz6Hjv631P3pz4rks5PtdkDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045847; c=relaxed/simple;
	bh=V5q+L5MEwmlD3IO5ghSBb/GcQVG1wIMzE6ywtDo/D+Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gEdzQkfhUhTKLfDDobp0yUK9oXY+4t0GYutDKGignvKYLFmrKM9HNZ6CY+TaKyFOK9OIxVF26+W90qjQH/DbjIRZlbUSXZfeVWam4hQt2yr2jLlYf8mwbV5YjagR+eDiBSE6YnwGV/m0MMPe3z7GVbTEzDZzu/8wRX5XJglHOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck/jmJzV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck/jmJzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4070C4CEED;
	Thu, 27 Mar 2025 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045846;
	bh=V5q+L5MEwmlD3IO5ghSBb/GcQVG1wIMzE6ywtDo/D+Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ck/jmJzVpramqNP9f1zzuIpRjoDKhHwQtRfSgrWJAA8Q1E4h1+4Ppz6EkQ6aVbg6S
	 xWzcI8AdDujfKJpofUc2OV5xXzotsVadCZPvuDM8IMYiA9Cxg4eql7vQvMrut9KPjb
	 OnrodztxE1gwTF8KZ6uNGQPT1IwhuodXgQ7PIIiRMxlUxxX6XR9UAuFMQrnTPvLIl7
	 1HeoxphVlZWKntmjTk8DD313Cvuwa3iaQOzLYonB8kgsiJm/7AfmK7bRV/RNWt8ZU/
	 RycBMkJKbtPXxDN8+k1J57kpXZrHBKY5eKP4vNCH0RA+SYUFZmG0Rnhbn8EgfhPmB0
	 ge6mudUncGm3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC5380AAFD;
	Thu, 27 Mar 2025 03:24:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Fix the __riscv_copy_vec_words_unaligned implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304588308.1549280.18024028894833270695.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:43 +0000
References: <20250227072721.5889-1-tingbo.liao@starfivetech.com>
In-Reply-To: <20250227072721.5889-1-tingbo.liao@starfivetech.com>
To: Tingbo Liao <tingbo.liao@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Feb 2025 23:27:21 -0800 you wrote:
> Correct the VEC_S macro definition to fix the implementation
> of vector words copy in the case of unalignment in RISC-V.
> 
> Signed-off-by: Tingbo Liao <tingbo.liao@starfivetech.com>
> ---
>  arch/riscv/kernel/vec-copy-unaligned.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - Fix the __riscv_copy_vec_words_unaligned implementation
    https://git.kernel.org/riscv/c/475afa39b123

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


