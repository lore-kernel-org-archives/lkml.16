Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3462750ED;
	Mon, 14 Apr 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638989; cv=none; b=MOI0raMI5MQ1c66iv3bKygbeGsFPNngUSDJsadFkT4TdFAw7zzHyQdhrOSAmRBsilFdLFho6DHCkbO9syzR7ahY9WNMDDaOOsZob20g6iMAP5gfYe1v9IlM+CZzSYTW60Ruz+7s3CV8OWkD6NJhkHQzPfqIUC3rwM2qaAZRYYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638989; c=relaxed/simple;
	bh=gLm2vzhJ3uDuzn0pKBioj0Z4oIo5DgZwBOkT+5Uz7Jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RxyZZc78rt/X9NaUSa35f0varvwqHhRApxWZAXw2B6Vl91az+iTBbQp5o6DkKnW7GG+bUoQ3Dqz9i2zMYL0AmHclUnv8dkAtMOHkE1azNy8DeF8QKShA0OYkwSI6PgTe2pjVnR4IrUbj2aq8mUPp3sHcHUuM/+Gq6GjO3YmPp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgn8kIJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgn8kIJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDD5C4CEE9;
	Mon, 14 Apr 2025 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638989;
	bh=gLm2vzhJ3uDuzn0pKBioj0Z4oIo5DgZwBOkT+5Uz7Jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tgn8kIJ43cUnJ00H+doTmdn6hE4DV1WXNb8122G+3FmRzY/sAvJY80Lg76yQgAAJh
	 nAXjqet2dDAsEY649IlgtDZ2HCRqW6a2KPabaiwTFMAbfmGcIcrQw1rsRf4o+5JxhC
	 Zz5JgFWkmDLns5uX43DwmhUqp6nBmURwu4sG6VoNY3z8Z8kiEF/gEWqwUFEtRoSf+u
	 rxypn5aE+rO/EvQ5GnO7qQk16T8ohNpl2N14QGkuGe+ipa0XdUW2izuvFcUz5y5ya0
	 LZgd29uwfKddDsjtt49dA63lsCPNPA63c90p419QiviyYAg9dLWn9bMdwv748dOlPb
	 YbZeBQCh/m5hQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cy_huang@richtek.com
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>, 
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1743774849.git.cy_huang@richtek.com>
References: <cover.1743774849.git.cy_huang@richtek.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: Add Richtek rt9123 and rt9123p
 support
Message-Id: <174463898663.86688.15893765350438287910.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 04 Apr 2025 22:22:10 +0800, cy_huang@richtek.com wrote:
> This patch series adds Richtek rt9123 and rt9123p support.
> It's a 3.2W mono Class-D audio amplifier.
> 
> ChiYuan Huang (4):
>   ASoC: dt-bindings: Add bindings for Richtek rt9123
>   ASoC: codecs: Add support for Richtek rt9123
>   ASoC: dt-bindings: Add bindings for Richtek rt9123p
>   ASoC: codecs: Add support for Richtek rt9123p
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/4] ASoC: dt-bindings: Add bindings for Richtek rt9123p
      commit: 4a046b67d2d267daf884798ee8509a502abe7a58
[4/4] ASoC: codecs: Add support for Richtek rt9123p
      commit: 38c2585c7439cc678ae105dd826f10321db29552

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

