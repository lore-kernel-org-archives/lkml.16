Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35523224B0B;
	Mon,  9 Jun 2025 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502841; cv=none; b=OkeajcbFfRRcLh5f3YO9NkDG0KlwcuZLOgiACkaf3WJ+P7PeT9UoLXXe2x1zsB1rlDI0FG5hPtJYe5wm1koQTLYlTJUwdRrg1yuIMclZOl8tyWXn640YSgyeO2NN+PsYPD/0SVcpJJgok8ylgiFsHFyZUrd7/4Q7wu4b4q/JPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502841; c=relaxed/simple;
	bh=PE6ib+uLRoqj590T1jWJYp0ehNnnQOpkGoqllX8Ob9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G8FlImeDBVDeL7DN5sGvyuZ+MXm1F1C+bhNNbttOP8JLaYgZcShiTlQfgo3vtyJWO8PIq75igRX4coogaUhdcYM1enqobWiVtYZ59KoC133RqydL/PjNOYG1Mvv8exO5bE0ke6lX7YJ1sU2NOYz28AHp4zF8emiGNY2ngyM/dqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adv8bIF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adv8bIF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C05C4CEEB;
	Mon,  9 Jun 2025 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502840;
	bh=PE6ib+uLRoqj590T1jWJYp0ehNnnQOpkGoqllX8Ob9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=adv8bIF+ESe1aZAnZhp/JvEwuWLb9AtWvP4YJPnQjKG2At4nvcSbkQruAnba/ZxhU
	 lDHZ2e6/Wk5YlVnKB+9j3X8GBA79stguKtyJOa6kWMHsexdTaPiQ/OyjqO26YX9Zt/
	 oCmJ0/3qe7hR8qIjOvbOSKonOGIjMl5h5C8HtM3YMXtHsRMaQjJcyJMJZ281r4vUhz
	 Pfd1OrQ0P6qWVj5hF1mOjgkwr8uLP5MiUZeo9iUttVmLs3XYp/oT96JY4FUJRNsWGp
	 GvwIgGLpTaIrPdSx43Rjg0eaZ0Iq2jUnDzwk0CMiBTqhhvSOka2V8un5QEn12XErT4
	 c3kOxv1I8Q9UA==
From: Mark Brown <broonie@kernel.org>
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, peter@korsgaard.com
In-Reply-To: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
References: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
Subject: Re: [PATCH 0/2] ASoC: tas571x: add support for tas5753
Message-Id: <174950283813.277844.9032715257429571455.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 28 May 2025 14:10:07 +0200, Bram Vlerick wrote:
> Add support for the ti,tas5753 to tas571x driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas571x: add support for tas5753
      commit: 23d3f6ecafbbc7cd98925a87a4f59794928348b9
[2/2] ASoC: dt-bindings: tas57xx: add tas5753 compatibility
      commit: f6f914893d478b7ba08e5c375de1ced16deb5e92

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

