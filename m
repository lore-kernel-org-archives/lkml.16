Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41822A7FA;
	Wed,  5 Feb 2025 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759461; cv=none; b=WOjsxT0BUBTmQXmGrDuU3AdD9pqACUaS54xIc9df2eLxHg/sbP1xmVT5dvZulPvffGYdpUWJuLrrx80F223ru0mQwybb6Jzwx0t58sAN7QMsfw6lxvIyuzNqG8GzNoq1dScD6MMqk8KhJDECqD0QDwvel4zQXdQdMft81XMW+AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759461; c=relaxed/simple;
	bh=pndALRAxj8SSHI3s2SLD4uhfGrnoFhTi0WG4bEaxkMg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bNNMaYDpuwv8+qFzNawcOPpgYsh5o1DrmwxAxn2Ed16vYHgtwBN8zrgnNpQNG9zYq++rpn93pP9H+KLdRfO9UdHyJW9cFmEPaf9a+2DZ9K2g52L7wyS3Nfe9kk++/AKHzV76yGzLxd86ljavWoC78wST0G/eSzn3N186Edvc17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWeKgK2E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWeKgK2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4F5C4CED1;
	Wed,  5 Feb 2025 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759461;
	bh=pndALRAxj8SSHI3s2SLD4uhfGrnoFhTi0WG4bEaxkMg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mWeKgK2EQ5glYceYFsOH1vLHo+nb4viPrD+h4lItnE378XR0Il704KhP5n2hSVTGt
	 AquexTF2hjCJ7enRHRC/dbs1NzOczS4kJFkIAxa305HMYciv+RtnRuv5U5Hw/FRLT7
	 VQjtmyBukmx4UGscoQueSOqckaQEvLiWH2NLe/+e0O2nf70hVix2Bu+naXwmHKMNnb
	 Tlr7obWZxHauYJiy/8InUtEh122RaYNzQjc8xYh+xrC9qDRM7wOzr2aYIc6Psg9lCS
	 Jak1FId4zKTWZiqeZ6Q+5Ao5tNZScJqByCFAeniTEAC1Nq87vztNRAy++iaDXRV4jo
	 RJMRpiDdjx3YQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 Zhang Heng <zhangheng@kylinos.cn>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250117014343.451503-1-zhangheng@kylinos.cn>
References: <20250117014343.451503-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: SOF: topology: Use krealloc_array() to
 replace krealloc()
Message-Id: <173875945870.32457.1216204039279705244.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:18 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 17 Jan 2025 09:43:43 +0800, Zhang Heng wrote:
> Use krealloc_array() to replace krealloc() with multiplication.
> krealloc_array() has multiply overflow check, which will be safer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Use krealloc_array() to replace krealloc()
      commit: a05143a8f713d9ae6abc41141dac52c66fca8b06

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

