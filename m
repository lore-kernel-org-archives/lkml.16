Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CBC221DBC;
	Wed, 16 Apr 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829684; cv=none; b=BVirdN0ncrrE90SIVLx/2n6IdzpuZ8DDhg1A+SQA97nBjjTGKk23kBslzqnlPfJy66jychnyBtBBkaMMsQgaMXjoqxtJE2g/8LmQcilBRRNMIrGE0ceohwn7EJaWIsaB9o23+Ba7E8WzLqidPOOwXTAwhU5m5ku5vTzR18BWtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829684; c=relaxed/simple;
	bh=HkxnMpHH4HUof71suoyJTPqcloEFW2ZCJEO35rSobdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WDHybM8GXDVyuDos/ow//wB7vTE0cbfTO02eZutpXM4RYzPdfx5dtVi2DeU0jjO4Av12bIwIxcRTKN0hOU7lfcOpdJvK4cFotiDTGNDus4u4UOJEP79lkC6S7A/TlHmhJnwUYIwL7RB36Z2SJrxh6z0qq/15aH08Qjq9TRO1fbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBkSJNao; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBkSJNao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFE0C4AF09;
	Wed, 16 Apr 2025 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744829682;
	bh=HkxnMpHH4HUof71suoyJTPqcloEFW2ZCJEO35rSobdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hBkSJNaoUw05O1BtAawQzkeO/5ucbxvrTkR2ZFvtt9lnYRtxiQvg/pkyKUpNB3GIg
	 yYNB09/B7cFbpRe/EEP5jSY9kS6Ewck+hJo2Dy/FZH+YoZ/cGPZ88ZzTHAWOyBNywM
	 8jsUYAI0Q04x4CHeE5OuE6cZ2Vm7/WzgJ7mthGRbLtzHNhZMs99arqiLUMAAOVs5vV
	 aJoDqYOHEcSfu3dZ+fp6fzOHk7eLvbkOl6/WdQMgsScHDiLsA49IAOl9UX9DWo/KKN
	 6saIwxcR/7y7QQ6eUhVd/5uJ54drjtonCdXE+yR5ehGpM2hagmKUSa7tr+0MyPa1Fk
	 AtxGtpIx48E7A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250416041431.546370-1-nichen@iscas.ac.cn>
References: <20250416041431.546370-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Remove useless return variable
Message-Id: <174482968045.823707.11072007128438554496.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 19:54:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 12:14:31 +0800, Chen Ni wrote:
> Remove unnecessary return variable and compress the return logic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Remove useless return variable
      commit: ba05bc25490a2256f60be2c02bd797e6f8217119

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

