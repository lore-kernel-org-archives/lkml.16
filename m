Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576112D1F1
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746984568; cv=none; b=TUk/gxbb7/TuH2zIH/+5FDrRkb5oazj22QKtH0e+o5n/fb4XYo3hdNjsskKfH2uZ9m85jMwCRYHAitXUJIYV73DB7CknZ23Kt6T5j01oUG2nq5xs5S/6OcWKfgfhhu9efUYUpzuz4WstvAi8kAkeByQby69ZgBODVUl3u/b5x+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746984568; c=relaxed/simple;
	bh=Hx6URdiyzedrdHYAu+pYip1Tz+rCEYkyI9+mg/tQ4SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsH/r6348y9EFG1T0uuJzi5RbSHNtqowFmycKKaiPoAifx390+Rk80iHsCWmI0UaHavxguwxL5yK0HRgvlqzbNBalO1huzH1DRbblChLkEG8XkhTjBU/obYeh/PfL66cVkawxUJINQ9YZOSPlLk8C4bfyLqzPbPAXIFWeJTagUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoK30iUO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoK30iUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D29C4CEE4;
	Sun, 11 May 2025 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746984568;
	bh=Hx6URdiyzedrdHYAu+pYip1Tz+rCEYkyI9+mg/tQ4SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SoK30iUOLcTfaVwSMfdYHxvTUnJXF9XEBDRTEhFrcpnFv55e09ZIfZGq6RjeR/J0E
	 CY+pv5FMXDB4rOXe9mV0JEUP7w0qY4mjH8sAxd7p7ZJ+MOC1TeswdtzI4hOFFYX1OJ
	 MglKITnM4AQwXRl2zhVmrmKPQ7smtMvHauXaGaXMzClIrWFcroXK58lW9gyC1mhxTt
	 16WpTawYIfL3qFsmb0D5HBiSJDK7LpesG8+rFChlV6dbDhYMGoAbZ2nCWpiHTA9BoY
	 sPLbZ5peFGj5fSS+Y6ow6hpw4woUdrmJMGbAY2dqLe/IMorpyL+AUpzqInyTaMDohM
	 EI55bV7ASeweQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: nathan@kernel.org
Cc: jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de
Subject: Re: [patch V2 26/45] genirq/chip: Rework irq_set_handler() variants
Date: Sun, 11 May 2025 19:29:11 +0200
Message-ID: <20250511172911.1008109-1-ojeda@kernel.org>
In-Reply-To: <20250509132211.GA3618294@ax162>
References: <20250509132211.GA3618294@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 09 May 2025 14:22:11 +0100 Nathan Chancellor <nathan@kernel.org> wrote:
>
> I am investigating some cases where
>
> WARN(!irqs_disabled(), "Interrupts were enabled early\n");
>
> in start_kernel() in init/main.c is triggered in certain builds with
> clang after patch 23 of this series (very bizarre since the conversion
> seems to be correct) and I happened to notice that this conversion seems
> to be incorrect? Should this be scoped_irqdesc_get_and_buslock() like
> below?

Yeah, I am also seeing this in next-20250509 in a LLVM=1 arm64 defconfig + Rust
build under QEMU.

Cheers,
Miguel

[    0.007387] ------------[ cut here ]------------
[    0.007414] Interrupts were enabled early
[    0.007833] WARNING: CPU: 0 PID: 0 at init/main.c:1023 start_kernel+0x31c/0x394
[    0.008001] Modules linked in:
[    0.008340] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc5-next-20250509 #1 PREEMPT
[    0.008458] Hardware name: linux,dummy-virt (DT)
[    0.008610] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.008641] pc : start_kernel+0x31c/0x394
[    0.008657] lr : start_kernel+0x31c/0x394
[    0.008670] sp : ffffdcd810333e80
[    0.008688] x29: ffffdcd810333e90 x28: 0000000000000000 x27: 0000000000000000
[    0.008748] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[    0.008762] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000044200000
[    0.008775] x20: ffffdcd81033a000 x19: ffffdcd810345940 x18: 00000000000000b0
[    0.008789] x17: 0000000000000000 x16: 0000000000000008 x15: 0000000000000004
[    0.008802] x14: ffffdcd81036e830 x13: 0000000000000003 x12: 0000000000000003
[    0.008815] x11: 00000000ffffefff x10: 0000000000000000 x9 : 77ed5dd15956fc00
[    0.008849] x8 : 77ed5dd15956fc00 x7 : 2065726577207374 x6 : 7075727265746e49
[    0.008862] x5 : ffffdcd810886ef6 x4 : ffffdcd80fe025f2 x3 : 0000000000000000
[    0.008875] x2 : 0000000000000000 x1 : ffffdcd810333b80 x0 : 000000000000001d
[    0.008985] Call trace:
[    0.009142]  start_kernel+0x31c/0x394 (P)
[    0.009320]  __primary_switched+0x88/0x90
[    0.009501] ---[ end trace 0000000000000000 ]---

[    0.007587] ------------[ cut here ]------------
[    0.007623] Interrupts were enabled early
[    0.008277] WARNING: CPU: 0 PID: 0 at init/main.c:1023 start_kernel+0x31c/0x394
[    0.008526] Modules linked in:
[    0.009030] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc5-next-20250509 #1 PREEMPT
[    0.009228] Hardware name: linux,dummy-virt (DT)
[    0.009459] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.009507] pc : start_kernel+0x31c/0x394
[    0.009531] lr : start_kernel+0x31c/0x394
[    0.009554] sp : ffffd5bfd7933e80
[    0.009585] x29: ffffd5bfd7933e90 x28: 0000000000000000 x27: 0000000000000000
[    0.009672] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[    0.009687] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000044200000
[    0.009701] x20: ffffd5bfd793a000 x19: ffffd5bfd7945940 x18: 00000000000000b0
[    0.009715] x17: 0000000000000000 x16: 0000000000000008 x15: 0000000000000004
[    0.009729] x14: ffffd5bfd796e830 x13: 0000000000000003 x12: 0000000000000003
[    0.009743] x11: 00000000ffffefff x10: 0000000000000000 x9 : 2d9976f44ddcd000
[    0.009778] x8 : 2d9976f44ddcd000 x7 : 2065726577207374 x6 : 7075727265746e49
[    0.009792] x5 : ffffd5bfd7e86ef6 x4 : ffffd5bfd74025f2 x3 : 0000000000000000
[    0.009806] x2 : 0000000000000000 x1 : ffffd5bfd7933b80 x0 : 000000000000001d
[    0.009914] Call trace:
[    0.010060]  start_kernel+0x31c/0x394 (P)
[    0.010250]  __primary_switched+0x88/0x90
[    0.010458] ---[ end trace 0000000000000000 ]---
