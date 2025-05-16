Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0527BF86;
	Fri, 16 May 2025 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418947; cv=none; b=bzmJYgPWFllNxkydV1IB1fKnYDMI7K9xRJoSbG/kcmW0gO9OPDbSU+g0Is71NaXKO71TOvq2+ZA4MKhJm2kkLBfRj2N+DJzGSNvYd6jfnZtaavB6bRMlYnVcRCcRjEZgu3vtbGfE6tP+LkClb/+asglY/733+hyo0aO3FSYDORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418947; c=relaxed/simple;
	bh=wMHgGX4f7A4OzkkEqROlTliCv9zoUibb+ojdtAqddm4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q/Wk224Lk0WF26ptVlot+rP9QA5Yg1njtowTuXsatV69Ty3n8KhwhbelW+vV4g+Qho83xzoH5jdkz2r8AqMqDEsiBSxbX6ZXJbkP78QWbiZOrJmC7KZT8lx4iCvEzGl7hlLEFuqvBhwRHlwp/exWPA456/7Y9z6M1eBQPyQyAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+sXX/AT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+sXX/AT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB871C4CEE4;
	Fri, 16 May 2025 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747418945;
	bh=wMHgGX4f7A4OzkkEqROlTliCv9zoUibb+ojdtAqddm4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=V+sXX/AToaSjCoTCT0M/v/i4+YCXkUlMX1vJYCGkDzdT56QjIC19Ez3JNS1YlAs4K
	 8JJUBuJQpgp3Bk8kRGSexl0j3P3rPyZbXNE19Tw/XlgfIJZ3tPyp48LNRpFDrrzESa
	 ZLzgeBH7GH+imVmHiPLs/8v1DlOqgy+fzx2bhwoxGQbRad/nHd3p72RcCvju80m5vV
	 5sZymBlvJ90oMRHijywzR6+qUB+cahiDt8QYG0w8uNzmUyFH2NOBgsOV4Q/1SGDUzt
	 uqxkE3qUqfA2NACt7iShBekweKBHFzbkILZLCoWgZ7ASQS5x7p2foePVIM3ah4z3VS
	 NcdcXE5ZIbASQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
References: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: update platform driver name
Message-Id: <174741894247.384649.627225363726173031.b4-ty@kernel.org>
Date: Fri, 16 May 2025 19:09:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 16:03:34 +0800, Shengjiu Wang wrote:
> XCVR driver is not only used for i.MX8MP platform, so update driver name
> to make it more generic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: update platform driver name
      commit: c132d8d5ddfdc1f91fb1d0feee84912daa357f0d

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

