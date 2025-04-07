Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162722066F5;
	Mon,  7 Apr 2025 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069740; cv=none; b=H5EH+rqM9SMBDF29+91Brv+s8UNUKg184VkqTGQAKoVTC19G7OQmps6jdi7WjMCg/nwPdtSJqbp02zFPKmHB+TCUh/7VwYCnOYYJfZ1v5T4jp7wHm9YLTVd1eGTjWMnpGDmnfozj+x8NCvAX6OMR7oInkO1EvFHvEonyoMiMfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069740; c=relaxed/simple;
	bh=cu6+kIckq67kdlzXZHJvMgrKi3jntojrBC9KZq6RUYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=beS2iFJbkDAGy0XPxSg6KPG2Wf3K5TlwGvHn+ceBrcrT+FLyAqxkuFwj4zn5JCJYYp8gIlWCliZonLpKedv826NhFumPBo+OGHZ465JSO7JqZ9csQE7iIXF8JzDck1wO2UFQs520IxHL8bogGupD/nlFLKvzQAWHCj5Dec4Vn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm8HtMSc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm8HtMSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B98C4CEE9;
	Mon,  7 Apr 2025 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069738;
	bh=cu6+kIckq67kdlzXZHJvMgrKi3jntojrBC9KZq6RUYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lm8HtMSc+/F7tBFYJtNSAuDzRFilfStpnlI1smijGQJUR+VNmoB8wq7eqdBSyeETy
	 25YjrHB/3ygosZoqFxz+1fbuDCPrnBmvPuiiU5bMx0KBulmO90DY9RHDKjjohr+XnL
	 Etb3Sc+A8IMFDjcQ52wJIEXywt4ftQ3ilQWYTTqCFihQ3UeXeAewCCKrbRtDFjYjXr
	 EjOvEK3Wgjg6B+y9ZRsXKZMsX3pKEOcCjvb50kLhZ/UhWf05vfKVZdDkB46wPCdre6
	 6Zo9J3R8QJH731vWr9SQDalkdDTH3o0F453FYAaG+GCgJrm6IOE/PFDHyABVPoYaPF
	 KUprz0XI6P3Cw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 Henry Martin <bsdhenrymartin@gmail.com>
Cc: pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 amadeuszx.slawinski@linux.intel.com, ethan@ethancedwards.com, 
 jbrunet@baylibre.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250402141411.44972-1-bsdhenrymartin@gmail.com>
References: <95c39d93-f35f-4017-843e-e5d836f1b091@intel.com>
 <20250402141411.44972-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Fix null-ptr-deref in
 avs_component_probe()
Message-Id: <174406973561.1344763.15018486948824097169.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 02 Apr 2025 22:14:11 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> avs_component_probe() does not check for this case, which results in a
> NULL pointer dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()
      commit: 95f723cf141b95e3b3a5b92cf2ea98a863fe7275

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

