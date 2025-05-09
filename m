Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E3421CC60;
	Fri,  9 May 2025 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811796; cv=none; b=ZM/NJHYvApOYHhS8lpcUAKIG4m73bahqPHVojHi8tiI602oSFN04mn7zhQwUGZVdFOe15aEdXXbM/Z5tiFk/5T1P7P9m3+b2BBC5Vk0DBIyJp4U7JPH2jlj12N02UHA8/qwFhYwjCIbHrGcc7YVkNpb/0g600GdLok1KqNP3pJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811796; c=relaxed/simple;
	bh=qkjoxm3bbJP62+wBHa3WTMwFdpJNYs1tNupsrehi5/4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h7OdNGRzT12kudprTU0O9EawdyuQjTVCid9dZNJxi0XtGeToD+KeVlYUlemDdN6/XYYRro3w4XYJTJzgB/fR1EPziZdtoXJj0UTWeaWAx6/Ea8L/dzXLpooCknTPU/hHuD0+Q4tJhroy10e7vNHWTFcOb9Q3hGCh53rAVnFGZgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2P1BPXC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2P1BPXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB59C4CEE4;
	Fri,  9 May 2025 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746811796;
	bh=qkjoxm3bbJP62+wBHa3WTMwFdpJNYs1tNupsrehi5/4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m2P1BPXCDIbjZYVWk50NZRZNQWKvevBWYdk4hBZedF120Xv/aG5bKbwKRZuURLNK7
	 a3cwGZ1YIwnVuK/wscgOd/NnvkUaIt4A7vMqEiQOi/IXJkvFPITCYfa9rZRgIwbMqe
	 +zruay/MsLPZ2EEhqXVRv08+871Ex/5chti0jGjU6x/L9JnxHi4x1HxltOPFVqLDw2
	 22gTjrv1UxOVqw1rVYSAhxbTnOVE2y7k07LTIegJ0hzLqlpyMx9HmLuBoaDnfTLB6E
	 /p5cmYXz+2nIGXzgxG/PkSkCKB/BS6/61lw3YMnx5fJDeXsUbv5RRMYd+C1cDopRo5
	 J6hJw4zWW4Y2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1BE380DBCB;
	Fri,  9 May 2025 17:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/12] riscv: Add vendor extensions support for SiFive
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174681183450.3697320.4232905271465493663.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 17:30:34 +0000
References: <20250418053239.4351-1-cyan.yang@sifive.com>
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 18 Apr 2025 13:32:27 +0800 you wrote:
> This patch set adds four vendor-specific ISA extensions from SiFive:
> "xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".
> 
> Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
> has been added to query which SiFive vendor extensions are supported on
> the current platform.
> 
> [...]

Here is the summary with links:
  - [01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
    https://git.kernel.org/riscv/c/0f733b5be965
  - [02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    https://git.kernel.org/riscv/c/2d147d77ae6e
  - [03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    https://git.kernel.org/riscv/c/e8fd215ed0eb
  - [04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
    https://git.kernel.org/riscv/c/1a6274f03534
  - [05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
    https://git.kernel.org/riscv/c/a5a15e07cbb9
  - [06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/e84fffe21b74
  - [07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/659d664f7df8
  - [08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/1d91224394c9
  - [09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
    https://git.kernel.org/riscv/c/d5ca02b25f5d
  - [10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/34e9b16b4b88
  - [11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/a3ca43dc5271
  - [12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/d9669e33c8fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


