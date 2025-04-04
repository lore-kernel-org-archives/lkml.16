Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD122068E;
	Fri,  4 Apr 2025 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799266; cv=none; b=t7ck1WSQHIXDOWuP2HwkMiFD2qOODi7gaWlvpis1Cam5S8caNoHFa6ftvXhqMuJlLvmDkh6ZeZLJ5knD2htt53o5cKxeIbTUydTlWGdkDYQmNb9qVeCaFeCUGEyXce/L/28wxy4HeK3TkovP+nYKKQLwRg3bRNa//F4gHlHJnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799266; c=relaxed/simple;
	bh=KwI9SWDH6Mf2uYcqQRnlcOfauFdXKQ8QN83mzWhe3Qo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bloV7ExjLpEItQjtjU6bFIcxsSNPlcCNyOMnVdRysWwc0nr1wLMObBU+J2XXw5hlGhXyLUP1fYhYV0J/AaQPUWH/FeyBLya01urkj8IdK2BiLPVn/Mji/+R3pEVuejgxf0aoZu7y9Eog5m34SRSb3Ui6sAkISC1RN78tp0QUl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s31J6os7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s31J6os7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2BBC4CEEA;
	Fri,  4 Apr 2025 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799265;
	bh=KwI9SWDH6Mf2uYcqQRnlcOfauFdXKQ8QN83mzWhe3Qo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s31J6os7RRJRMW4wsy19QVLOAAxcwc1HDVpjnZQYK+rE7YraCkWnWxCwz3JDp0l0H
	 RGVaklLEytF1No+Zsutvkm4WcsQaAUZ3O8MAt1KCCCwl8/Vt6jMh7btQxyancy/VjH
	 sJHxo8KD8qeF+eK4HALqAjB5XR+y873CYfVM/CYKTWK272T/tgqOaBNRkqZjD/rumD
	 om5lS1V8dfzyOVWyBki2S1YmX/aoMVU53dXuBkXveinYWgbusVuWqiZ0nausS1pZnE
	 QVxhHEtfJeN0txPbhBrkuBs+D73MkL43anF/reDPbBNk6ltk+NaBa2f/acOsZEXeP0
	 ZrAxhcWx6Hqhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD0C3822D19;
	Fri,  4 Apr 2025 20:41:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174379930251.3383526.17363830947494293444.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 20:41:42 +0000
References: <20250321083507.25298-1-nick.hu@sifive.com>
In-Reply-To: <20250321083507.25298-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, samuel.holland@sifive.com, palmer@dabbelt.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Daniel Lezcano <daniel.lezcano@linaro.org>:

On Fri, 21 Mar 2025 16:35:06 +0800 you wrote:
> Add compatible string and property for the SiFive CLINT v2. The SiFive
> CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> in their control methods.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v3] dt-bindings: timer: Add SiFive CLINT2
    https://git.kernel.org/riscv/c/0f920690a82c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


