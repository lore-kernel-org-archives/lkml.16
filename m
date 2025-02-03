Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D162116FC;
	Mon,  3 Feb 2025 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610131; cv=none; b=OkHptYV+AIdYFvwjV4vWn3npbLdt2Nqfyhw7xk8hkFA2xxno5xGn3/0+WyZD13/qwCDYYUT+LCk54HcNPDDPbOoIcnAVoh0onCLYDJEY+H+TMwdNajuF++ewrvtfO6gnwt8vSMtrId+JDUnpwK26vRZKVF4qDaxTkh4HFqRl4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610131; c=relaxed/simple;
	bh=pPs4zpMkrtQEqUvceHWevri/kDXcPrJTmFBrzvXMfaI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pAbHbUNLGWPS/+4x6y9FLQnnseX7DjPN7E4yqgWTehcjLpc7u1r8AuhQvfQXe6zFdyC0xkIpYNqreY+MGlf6EavJhhwKYK22C/yrvxxlRXoNRKj9mMnJJKUPmMAkp1+IRT8v7VDB511p8lqk3ixsfZXgK1MfWKKoi0Md40FBzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+Rplytu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+Rplytu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6269DC4CED2;
	Mon,  3 Feb 2025 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610131;
	bh=pPs4zpMkrtQEqUvceHWevri/kDXcPrJTmFBrzvXMfaI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a+Rplytu3bGH4EQVZhqiUvFlGD7cPE3wCuaI8qChQCZGzEmAtxRaI3rgrUEPYo9+X
	 RuTJT72Buv8c1RH6oLjWWU5NEeHzfWylJ7FenrNY0MEBbRAlRXE8MciiHv+JZ+7wnH
	 QbCwbHPHDtgH3nI2flmS5Nyzjk34mMAHBmH7Fnh+uaSbAx4l9YwScFrCYoSmg7UUlg
	 9/mIUEIacWfrSxtic8xUIBQb4kZnH89siL2yVhwOVKSWWUc8oqQ6EP6XyhNCVKMfTn
	 7roImGwYbylNozZVOCu+W6sFcQ09y56j9i9bk8iIyq5cJaqxOKoOY7ZpNpTlVPbJ8j
	 AfN2U1Lb+KvwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE055380AA67;
	Mon,  3 Feb 2025 19:15:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861015850.3409359.6457600401627321039.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:58 +0000
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
To: Valentina Fernandez <Valentina.FernandezAlanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, conor.dooley@microchip.com, conor+dt@kernel.org,
 jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 valentina.fernandezalanis@microchip.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Jassi Brar <jassisinghbrar@gmail.com>:

On Tue, 17 Dec 2024 11:31:30 +0000 you wrote:
> Hello all,
> 
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox driver.
> 
> Microchip's family of RISC-V SoCs typically has one or more clusters
> that can be configured to run in Asymmetric Multi-Processing (AMP) mode.
> 
> [...]

Here is the summary with links:
  - [v6,1/4] riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
    https://git.kernel.org/riscv/c/c1382852330e
  - [v6,2/4] riscv: export __cpuid_to_hartid_map
    https://git.kernel.org/riscv/c/4783ce32b080
  - [v6,3/4] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
    https://git.kernel.org/riscv/c/af33bd58c244
  - [v6,4/4] mailbox: add Microchip IPC support
    https://git.kernel.org/riscv/c/e4b1d67e7141

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


