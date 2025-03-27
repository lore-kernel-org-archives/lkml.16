Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC51D5CDB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045851; cv=none; b=Fdid612ZGuVaSDrLmBKp8fBwxswHBwlMOaTNP/8nudOmOYg9W9hdmS0AcIdiAuh77QuRpOoJkwrzClixdRmoP074663qGxaCYyEtJNdDut1AVpGBamdYrl0J1tfUUZWTFb5x11+jXuuu0XuJrKbs8mBn7F1iMTIgSHJEXz+odZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045851; c=relaxed/simple;
	bh=wXE9QT59mwlhkHqahXpOLcJNBYIg8SFZbH6Sj2GDj4s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=V0Qw2oQlnjWUPyqs9QPtALIxPbbvcbcuxSQjl20qUe0OMTVOS0CxF9VcmajmZ2ieBe+pkzps7JiMUM8a03c5M8PFnlPe6RCm1N24SODn503EbTTK/m53GT4ALLzdyQdgdKXI80Zi/XEIDfJyU+K6nyXGl8w4VOyHRP1DpS89DDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zxx65NNz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zxx65NNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A912C4CEE4;
	Thu, 27 Mar 2025 03:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045851;
	bh=wXE9QT59mwlhkHqahXpOLcJNBYIg8SFZbH6Sj2GDj4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zxx65NNz6L1kpnGHFGxR3A9yIEzvl1KTson/KzYFg9ibzu8ehf/ccJro0DEgtpKfB
	 qNnXNhnalI10unGtYno8swsfZ6vjN/nGKq0Myw1kXEOBIfWbEADl89+YvvYhgXDJ5C
	 SYZoMQro3z0k2L/C5b8HC2z7sy3Zw4g+DmadmgO/xkmeSHwRy/hW+lIhXGezNA9asK
	 nelEm4hziAaIF3p+aRVYA/VD4P0GV5iF5X6NwYe4qXtJcXeOMl9r7nbTDStlo3A5ea
	 YI5imRWK80VArnhon+vfEDsz40NjFS9EhKzvsc5x3TMlQW2qjYuv1LRojZw+LJABQO
	 puQqatFiBlOQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C0C380AAFD;
	Thu, 27 Mar 2025 03:24:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER
 depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304588775.1549280.6265955912800341807.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:47 +0000
References: <20250317031214.4138436-1-pulehui@huaweicloud.com>
In-Reply-To: <20250317031214.4138436-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, bjorn@kernel.org, mhiramat@kernel.org,
 rostedt@goodmis.org, naresh.kamboju@linaro.org, pulehui@huawei.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 17 Mar 2025 03:12:13 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Currently, fgraph on riscv relies on the infrastructure of
> DYNAMIC_FTRACE_WITH_ARGS. However, DYNAMIC_FTRACE_WITH_ARGS may be
> turned off on riscv, which will cause the enabled fgraph to be abnormal.
> Therefore, let's select HAVE_FUNCTION_GRAPH_TRACER depends on
> HAVE_DYNAMIC_FTRACE_WITH_ARGS.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
    https://git.kernel.org/riscv/c/e8eb8e1bdae9
  - [v2,2/2] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
    https://git.kernel.org/riscv/c/67a5ba8f742f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


