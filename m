Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D439026738B;
	Tue, 20 May 2025 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739122; cv=none; b=P4+85zoV8MDhhf2nbENi0MOgW75VA+eZxduWlaT1jl1BnfIk120XsgXUmZcPnz2IwvkaHUCxkGAcdHASc5eM9gkyEmGb1SWNgUVYLy1fMPW6NjC6TJZh3XEX51645jyiXPmqThtkoibwpjjU1v+QNrCHKzWXchjd45n7MA5KNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739122; c=relaxed/simple;
	bh=tUyeTPexFgQtJ0LVk2MC1amsZJhPQ5WhJKR+TnrkfY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gRjhQU1Nl75Z8iUwLJ1BMiT/TWI9E+4k39EowfpWdhVLFmN16YWALwD2rO/eLEUHMQaUC+J9k8UUD60tDSwVnXg//Vre/ZieG4w7ANRjwSEyOBZexuxmHWywbG31oiUUjJV+VnMONngRdBbZHumyJg5xG5XwQuoTguosXLueDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmPWC8ml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmPWC8ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17554C4CEF1;
	Tue, 20 May 2025 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747739121;
	bh=tUyeTPexFgQtJ0LVk2MC1amsZJhPQ5WhJKR+TnrkfY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GmPWC8ml2RNiVFqKAcGEFeZv3c7EPp4+mWHQPqy4aGSELE9/4DhSNYvcw7NT0Jj4C
	 +65KQt3ACyX/SZM6ragCX8v+6igXXW0Tov9HUJG8ZdtVXb1Be264ulRO3jXzwvZkNw
	 gAlNGvdBN/jC27AltEFbh2IS/dyakncgocphOMjdpwDi6USDE2yxfxxvoSRbw6zQ2h
	 +h9HPD73vZPS1g8WgHhRiDiQBP6Ho2SNe1GV0IJvfkcAootr9V+RilQrnjGzvSTkV+
	 xvGsDswdMYhqL+KNYvMp9F7fbVQnRVHIM3Cwx/22hM5z7lXa4ZXF70QAOJfbX8w/xD
	 Gd62x/yDAZCng==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
In-Reply-To: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1 0/2] Add sound card support for QCS9100 and QCS9075
Message-Id: <174773911882.44858.10139663344496764867.b4-ty@kernel.org>
Date: Tue, 20 May 2025 12:05:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 19 May 2025 14:02:42 +0530, Mohammad Rafi Shaik wrote:
> This patchset adds support for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Mohammad Rafi Shaik (2):
>   ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
>   ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
      commit: 689a95178f31ccfc9af0a11abcb11f2a200095bc
[2/2] ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075
      commit: 5b5bf5922f4c104e4e829c0dbfdd9399b7cfc434

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

