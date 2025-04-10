Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AD1D5AC2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266709; cv=none; b=Wz6RWxcaYhCHcomI11Yq1PY/RhuUAN1ZyEIRfkRybQcEc40IxpMTGSGruKMXP/APE7OivsQ2Wrcy91gRIX0jL4f7IofiCZURz9xQSkKoJVdaBroc48rPBeLjrnfqUfCUguoW498Z514quT6wWEcaW6lREkJd8G/jfMJFSXYjyI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266709; c=relaxed/simple;
	bh=zY7ObH+OLnFQN4bHOIh/YvqlK/4YngXqHZTmGQDgwOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuctAgBPwjw2OEg24bsabCmtmQU7fNck+c+OPrEgkWx5ihgMXanQXn6yrG1MhF0oBCK2BOV2HMH+4ayugYRRuoLn5US3qPaJtdojbb4sAAARupUwuR+4SPm8/cmBkitBrMhHNKb7sPOX4rqYrCMTHAgaaB4/IzGyTZKr2r7T5d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuVKk1fr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuVKk1fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AD7C4CEDD;
	Thu, 10 Apr 2025 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744266709;
	bh=zY7ObH+OLnFQN4bHOIh/YvqlK/4YngXqHZTmGQDgwOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TuVKk1frCVSoR6vvb8suAlArXraF3MIjWwCsqRmNEOILlxLwNZfC0rAalSIaacT7Q
	 tny99fivJInELowKKVkENo/0jNYctznYow7i/XVzs9t/JblG25afosZS5BxIyN76UF
	 DyY+/WWtipaWN0AL3RWymXhOTmf3k+2qT3w5b2wRvPahd8/v3tMj1ESHLrZqZrHuYW
	 chBTRHjlDtuHZfwGgrGZwKAwDJK0Cpf8S3BmfjoATyoh/wdMOy4/RVZXHXhgYDepn/
	 UluqVnQHguveLvveRZa98nFg4NgGwvAftJw/sFhBhhA50JEq7L3t50cnNfSKVwko/B
	 FV8TupzXulyAg==
Date: Thu, 10 Apr 2025 08:31:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, hpa@zytor.com
Subject: Re: [PATCH] x86/Kconfig: Fix dependency for X86_DEBUG_FPU
Message-ID: <Z_dl0HhwMOBkVTFH@gmail.com>
References: <20250407231057.328010-1-skhan@linuxfoundation.org>
 <Z_TIMh7UsWQiSkqg@gmail.com>
 <f9642a9f-27d4-4f84-818c-390194b898bf@linuxfoundation.org>
 <Z_bnzs3IPyhVIYaT@gmail.com>
 <e0842dd0-71d3-4de0-a2ee-e83493df890b@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0842dd0-71d3-4de0-a2ee-e83493df890b@linuxfoundation.org>


* Shuah Khan <skhan@linuxfoundation.org> wrote:

> Yes it is vanilla

Thx.

> > More importantly, X86_REQUIRED_FEATURE_FPU *does not exist* in the 
> > vanilla v6.14 kernel, it's a new v6.15 feature. So this part of 
> > your changelog totally doesn't apply to a v6.14 kernel:
> 
> I started with vanilla 6.14 kernel running oldconfig on it. In this 
> case if X86_DEBUG_FPU is enabled in the oldconfig, should the config 
> generated for 6.15 add X86_REQUIRED_FEATURE_FPU.
> 
> It appears there is a dependency between X86_DEBUG_FPU and the newly 
> added X86_REQUIRED_FEATURE_FPU

Could you send the v6.15-rc1 config that has this missing dependency?

Because if I put the config you sent through 'make oldconfig' and 
accept all default suggestions, the X86_REQUIRED_FEATURE_FPU dependency 
is present:

 starship:~/tip> grep _FPU .config
 CONFIG_X86_REQUIRED_FEATURE_FPU=y
 CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
 CONFIG_X86_DEBUG_FPU=y
 # CONFIG_TEST_FPU is not set

... and the build succeeds:

    OBJCOPY arch/x86/boot/setup.bin
    BUILD   arch/x86/boot/bzImage
  Kernel: arch/x86/boot/bzImage is ready  (#4)

Ie. I cannot reproduce the build failure with the config you provided.

Thanks,

	Ingo
