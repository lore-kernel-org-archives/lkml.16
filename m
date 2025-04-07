Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7356B22A4CA;
	Mon,  7 Apr 2025 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068950; cv=none; b=uB6NYurHwH8RumoNL+06XBiElTrr+MMV9mzttnB/YWoAhJACukxfCmUjpttazwMhbxd/UoqTqUV+RY+8ebf0N61dEK0zlREs56byGLD1BLMRfzYqRB2gPZVWZfxJirNiV4Uuq8UiOIodAxAYr4k9jb5Kl+vLx4G5bvphjZ9E7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068950; c=relaxed/simple;
	bh=kIGTdKOcIKeSee4uGP8IJJetxDtK8tWm0G2YfHRLlyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T2ISf//QZd0xTHcXxbcSRggomDtT04Un/fms/xynpfdMpCRCAMEJgtsWvtodJRtqKCe2Mjt4/Ii1o5DwxxqZC499VdlTC6b7qE5g/ItAe38lODDEsyAH00x/rPBsQoB8uFwwA2hNHT5LdMTPrFnzn1LlfEvZIb4giCtmrCG7UiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBfCMlII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBfCMlII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDA7C4CEE8;
	Mon,  7 Apr 2025 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068950;
	bh=kIGTdKOcIKeSee4uGP8IJJetxDtK8tWm0G2YfHRLlyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UBfCMlIIUDxDJQkGrdwj9v5UZI80REtdGLVp5mcMVxWK99nz2pjK0NoVl2nwA3aeF
	 b21xwjy/KNWiJELcQZ9VSzH3sNO2NJOV+Rz6WucvZWG/6z5K0yDgW+3uYRm9sA+CQf
	 F0oGf3+PZ4iZ0FyT60RskOXBWNRiSJ+hECgxCOgtRFnPoeDtLH5/Pfpeimrap+pCH5
	 HJxvO5qKb1Kgnm6uA+k+4TE1F38G5/MtiQtSepfoEcUKOOkE3VhN8kk6XoRvrlK+Vz
	 PyITa5YoqynyF1e4ZjzH0KnX2jkBxsk+v0LQhSqE9r5h7BQOOAS2oGr8TnTZijKt/X
	 EDEA2OZ9ewu4g==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, shao.mingyin@zte.com.cn
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
 zhang.enpei@zte.com.cn
In-Reply-To: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
References: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Subject: Re: [PATCH] sound: soc: stm: stm32_sai: Use dev_err_probe()
Message-Id: <174406894704.1337819.6120750262182718363.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 03 Apr 2025 15:41:42 +0800, shao.mingyin@zte.com.cn wrote:
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: stm: stm32_sai: Use dev_err_probe()
      commit: d01131e3ce14f9837884aef1f3e463a3a492291f

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

