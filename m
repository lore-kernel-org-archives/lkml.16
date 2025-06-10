Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E324293F;
	Tue, 10 Jun 2025 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572881; cv=none; b=HPESLnjRUQ1T+hN4IuRCNyD/XzASV5ngp7GZByH4jX69ZqkLa/6Q1srLdiwOzO71p+4pQ+yP4fQ7lQgr02XhTDCZnoSj3iWAXkubc+Tv5cqBmgIFB6QVNEmGqhrcjU+7RfRNbBtsEf+0+jjow3Aq0Yi/BzzIwGGYzHr0BBH9pl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572881; c=relaxed/simple;
	bh=UQg01saWHZ2SA/EHnfOE/P97kB6OOfXIeFxq0POFGoI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hebZZqF/bHfdpAJt5ULjME8vg82zyagsuXbhQR1CMzpCraAzVLzFAUMu3MY4sRLcCsCOAQ0eXmE5cxxPct/Hmoue33DrNXHCz02w3ADYjeVhrzuHALJX+75OQ2vkhyml/i08Y910YxxA5/+8pruJ6Qx3Y3+gDg6FGFz55kTKYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAhxn2YI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAhxn2YI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE0DC4CEF0;
	Tue, 10 Jun 2025 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572880;
	bh=UQg01saWHZ2SA/EHnfOE/P97kB6OOfXIeFxq0POFGoI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MAhxn2YI78qtGczPWBE83PlISURuIeOL+05W5FjQubzGvSi7EoCrhaQlwPloGgdbt
	 m3KQqdhdZSPuMtJCkDrurouHSKc7fMYa7USoDs9rauIAVc2uignIg/8Sy4NlDhfGUL
	 2ZzDxcXkt6DyW1Xswug8nfZIvyBR7fHBXbB/qj2Q+BTF+MxAdHQhNP7RlMkx5LiytS
	 0l7bPsWJ6V911h0DIdyU6is3Rbv0e5J2y5zKehEDF/xbPd4d4KuIn43rtPPChcq/80
	 O+WjTPhXswU5qYgeGIXQlX75e30BPG+ZBLM9h1aomo0GZSIHELeufuw+BEpU84uYoU
	 HdoxaRU30SbfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C4339D6540;
	Tue, 10 Jun 2025 16:28:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/12] riscv: Add vendor extensions support for SiFive
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291100.2454024.4751197828124838504.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:31 +0000
References: <20250516030310.16950-1-cyan.yang@sifive.com>
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 16 May 2025 11:02:58 +0800 you wrote:
> This patch set adds four vendor-specific ISA extensions from SiFive:
> "xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".
> 
> Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
> has been added to query which SiFive vendor extensions are supported on
> the current platform.
> 
> [...]

Here is the summary with links:
  - [v2,01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
    https://git.kernel.org/riscv/c/0f733b5be965
  - [v2,02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    (no matching commit)
  - [v2,03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    https://git.kernel.org/riscv/c/e8fd215ed0eb
  - [v2,04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
    https://git.kernel.org/riscv/c/1a6274f03534
  - [v2,05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
    https://git.kernel.org/riscv/c/a5a15e07cbb9
  - [v2,06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
    (no matching commit)
  - [v2,07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/659d664f7df8
  - [v2,08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/1d91224394c9
  - [v2,09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
    https://git.kernel.org/riscv/c/d5ca02b25f5d
  - [v2,10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
    (no matching commit)
  - [v2,11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/a3ca43dc5271
  - [v2,12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/d9669e33c8fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


