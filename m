Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF822AE6B;
	Mon,  7 Apr 2025 23:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068943; cv=none; b=eaRacJXjr+e4Fs4IW6OFwxOYjtuoFhyEJw+M0i02Yf0OMCugsGDunxp+9tQjS8DNdtxxzkZEfulWgkTye1v/ZeD2lYLbdpPyoK33yLFlUHavtBb8FMYiFdKHatmQxXAjZ92TI8Jn06NiwFi2C1ZWDDGA2pwHp69JT/SkfZf0SAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068943; c=relaxed/simple;
	bh=HPi8HtckWZx8UQwFm0nMJPZTaRI9QJIG08RLF6cjt1c=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EejO2D5XfdNGB89qNBwKeuVaDaTRggGKllWuFwcQZFYkbxQj5Ite8Mu/qULdX0ZY8kZ37vehFv+BI+ys4/mTG5z5fP1iqLGyQs9R65EMcLZCTrrzWFbGjfOFd61IM5wrJ6vfZKH6QquAgFp2yy9DJ6cbykdi+WqroOVKYtC81PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzaKwUlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzaKwUlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B28C4CEE8;
	Mon,  7 Apr 2025 23:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068943;
	bh=HPi8HtckWZx8UQwFm0nMJPZTaRI9QJIG08RLF6cjt1c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SzaKwUlfsazgiJipXGrE3lZvvfi+u5rUO57axM3HIs8YxP1Mh6jCXShlj60vHwyuY
	 0c//P85T5Y1bgoEXml5l0Ecotfdw9oK9bLouWyStRWFCtdMbNHXkwL2F14prZT2WzI
	 BWy7dE6SkKS+hdlpLDoSbJsZutP3x4SWbaE5NPh2qBfJqwJg4BbTqXzSgEKm2p3VIP
	 ik+stEoTe5Bzx/pQzUjfW07jHpUoisoYwKLYw0wl+NuvKjHkU4OcY770VFPNxxrdvR
	 /xVhsJibSacQu70C8w5qQGppOHLnB5wA6OaFsttN846J3mOr09+Fmgh4y2iScyOtLp
	 f0sqj4ox3dEtQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250328021339.1593635-1-shengjiu.wang@nxp.com>
References: <20250328021339.1593635-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,mqs: Reference common DAI
 properties
Message-Id: <174406894173.1337819.7850470508605306315.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 28 Mar 2025 10:13:39 +0800, Shengjiu Wang wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,mqs: Reference common DAI properties
      commit: 5a4c3ce480031c4654ea8ee6c5cb4621819973f3

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

