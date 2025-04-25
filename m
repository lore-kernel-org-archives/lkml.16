Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A9219A94;
	Fri, 25 Apr 2025 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607481; cv=none; b=Ry57jW8u3OxOy2N5cL5PbaFLDlYvqtZRWIwDN+71Lv9UoDN1OIqNXMOsTOlzPPFCDbiw1p2zYKIovBiOab4MVaVpSBLcwtrgP4ToaxwUSDY2O0OR0ke2Twpj5X1kcS182bMW1noBqzcK5I4lsHQlnKmHpW0kZQZbsLGo74CZfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607481; c=relaxed/simple;
	bh=GO+QSh4ElCqimbI1vVBwAKTlSThh7xTUR5YPhcNbVGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LdD1is81pY5FKFdtICkk3oQCYssdqxpPrvB+JYgQTZojvZdszXkS+czqhoHqomsQGKsJ9LoM/QHu4FbAk8uVkrqYnC2zfiP1foKjRZPOrnhxdL5py2VpKecdSfJYM7ic4LamzW1n35+Zmz8zcCS+2vTEPN3+cWL+723eFZpktuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnskCr1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnskCr1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B8FC4CEE4;
	Fri, 25 Apr 2025 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745607481;
	bh=GO+QSh4ElCqimbI1vVBwAKTlSThh7xTUR5YPhcNbVGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bnskCr1Mo3ot1bVDXPLqcKcS0S2H1YFqKeds5cM6maPmj4iq1tpeNQq1k/oP58zuQ
	 PZhXIBSHA39wofDcsqXF5G1BgAd6NrW++tT8Ixku0TYo1q1UMonLK0AhGwl9+s+Ts8
	 oHnDxkRNrA+3wAvoxwMu+oWxqqgr4PWisTBoUZ+gmhtWUsLLBcKGXt4/CgLfyoOx9T
	 MLLbdsrrEmhvp+7l6MX+lVuoJWyr4atGL/3FbxC3GQ5Xz+cz0QJLj4KzKU1vGcz55u
	 +40ro0SKqZtCzhq4zf3vb3gRFOzkDuLAqsDx88emeVSf05UbOzcDh6HbmmOzEBQLvT
	 uFyP17FlEUUSw==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Peter Rosin <peda@axentia.se>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250415074145.7202-1-johan+linaro@kernel.org>
References: <20250415074145.7202-1-johan+linaro@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: wcd938x: fix mux error handling
Message-Id: <174560747941.245250.2934733747372227854.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 19:57:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 15 Apr 2025 09:41:43 +0200, Johan Hovold wrote:
> A recent change added support for looking up an optional mux control
> before falling back to gpio control for us-euro plug selection.
> 
> The mux framework does however not yet support optional muxes and an
> error message is now incorrectly logged on machines like the Lenovo
> ThinkPad X13s which do not have one:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wcd938x: fix mux error handling
      commit: b0090115001a3602d0d18828960e8eb1ae129b41
[2/2] ASoC: codecs: wcd938x: drop unnecessary mux flag assignment
      commit: e358e012a69a3d553803cbe62d9f6eeea57726fc

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

