Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48726B2B3;
	Thu,  1 May 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078207; cv=none; b=l2UR1L1nP0DoZFlp7+6fP9u6Ij1sHq22KwXRJ0aEUlRA3gF8JjwCrd141YbMyz+XDGuLVSj9Fz0iAYE1YW7JY+g6qaR96O2lvSlESX7VaTl7LRiYXqyrdHlwYNud6g2oLLdBWnvu94npX/RCwdy9HWfv7t4+RQL2x+GeBETSzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078207; c=relaxed/simple;
	bh=NRCDipJUBdEgiUJQN8iwpIvQzg/37FHaH672Um+AoMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QeHwarufHUB6p+0qU4YsE4dZ2WzxJmTXXGpqvz8tKboGfNGA8cZwqzZQ0bO5JNlemPAqtnRp9YaTY3EJseN+a3+WcxVGLNYQsaPXa46sDntbXT85YorQjqBhKM//ban8HKEq4DW53irdvmbJl5IbXh5YkxoHeY/EkQdprbSNVv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICPAucfC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICPAucfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06284C4CEE3;
	Thu,  1 May 2025 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746078206;
	bh=NRCDipJUBdEgiUJQN8iwpIvQzg/37FHaH672Um+AoMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ICPAucfC9bMd19oG9ta8lfiGGir9fbEwarsWmUUF0yCqD61M9WVFqxRWKGDidQG8S
	 LbbVsrCJLp2yQLyOXmiO2J9KOvVV13qjeupfrb9J2nj8/ISOqySJlRYhz8c9KqNtp/
	 EdMuTxuimJsp/IjlcwHD9GmdqE8vqwGTJR9ju862mgWsjB0sR8AbnWBUdBV2U1LI90
	 57zhA69Y8CQK6FC+kjyXMwp3o2YDBIgdvtMe7+QeaOJoT9cirimX8educNNwE6900K
	 0evvHzq9knfTwaXq9vHoQBXg+AlkimQWgJlICT9D5VhQfdAPEfDMsGuPk1MOzg0p1r
	 tIqNccwav4brw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, 
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250426141342.94134-2-thorsten.blum@linux.dev>
References: <20250426141342.94134-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix kcalloc() sizes
Message-Id: <174607820374.4025361.12413570841788037208.b4-ty@kernel.org>
Date: Thu, 01 May 2025 14:43:23 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sat, 26 Apr 2025 16:13:41 +0200, Thorsten Blum wrote:
> rlist, clist, and slist are allocated using sizeof(pointer) instead of
> sizeof(*pointer). Fix the allocations by using sizeof(*pointer) and
> avoid overallocating memory on 64-bit systems.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix kcalloc() sizes
      commit: d20df86b056b95845f6ed52da1010059202a0c23

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

