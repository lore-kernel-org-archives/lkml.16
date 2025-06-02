Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E51253924
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902328; cv=none; b=GBniOApVd/ZAGX3wYDCHDNQg1hfdtpxn07McmBrx2GSH8NUD6OrhbPO7Yc43sbP7cX8hrDFGXQT7j+TDEtxphkfMyi0yLe3FUo7p5gFJCrtgSkkl/NutXX5nhn7I3T82EhxWXu5TkF/5tO9/WWVJBfuJxQNRdTYNu0cgQLxaR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902328; c=relaxed/simple;
	bh=qYjz4apuxrHx66aibZhx0HKmmujs0oYFsBNDV/s4fwk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YGfNfPmGdpOQIfQJC/iRB4FaW0jVXVBhhpk4Hdc1mv79wr9qXLuypjhIk1d4q9Uz/Zi7bA6MGnaIwMb4qEf8hq1wAIPiwi69pHJ+fiXGXihouVx+OE0J1tdPcOusSWuo8zLFMcvj1m+xiLg6IHyjAau1LxU5ohc7I12iK4ezjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rkj8b5fw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rkj8b5fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF3C4CEEE;
	Mon,  2 Jun 2025 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902327;
	bh=qYjz4apuxrHx66aibZhx0HKmmujs0oYFsBNDV/s4fwk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rkj8b5fwlaaNXl0KCRVz/vrrUV0iuBYFdAZ0fI7RP4glaE6uj6EKRwM3cGXXoqERm
	 IHqXuyxI0iZ0Ocn+1PQg+vFcHr4b2PSM7gMk4OmKF4Zp5+AHNNMfMdsYZhLHtU7vRK
	 8TEDzS3/RZUuMoMrfK8wYLV4jRVgS742cFK9pltwe/8FRqk1AZCElvTjFM8Zr0IBY1
	 1FEDqcpmdVNkiJrlbBEp4YS+nJ5sIRp5JQGfMltOsRhd39uAP5NFy9KRIwJMkOZbO4
	 9GJxi8M+pR7ewtK5XmKWPtUqGuAsJv/DjCSoCZjsPdt12WPmOHXYeSya4l+18h01gw
	 QjkZgN2VJeqeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71974380AAD0;
	Mon,  2 Jun 2025 22:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] riscv: kexec_file: Support loading Image binary
 file
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174890236014.925497.1303542607611345716.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:40 +0000
References: <20250409193004.643839-1-bjorn@kernel.org>
In-Reply-To: <20250409193004.643839-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, songshuaishuai@tinylab.org,
 cyrevolt@gmail.com, bjorn@rivosinc.com, mick@ics.forth.gr,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  9 Apr 2025 21:29:57 +0200 you wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> Hi!
> 
> For over a year ago, Daniel and I was testing the V2 of Song's series.
> I also promised to take the V2, that had been sitting on the lists for
> too long, to rebase it on a new kernel, and re-test it.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: kexec_file: Split the loading of kernel and others
    https://git.kernel.org/riscv/c/4abec7d96c18
  - [v3,2/2] riscv: kexec_file: Support loading Image binary file
    https://git.kernel.org/riscv/c/1d57a3df656f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


