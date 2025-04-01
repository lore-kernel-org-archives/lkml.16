Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D513AC1;
	Tue,  1 Apr 2025 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530693; cv=none; b=kFEBDjHNKbQENj9dWSPw7mQzGJftteslkxaTWQdYFNgvRLfmycWxLmhMZ+iUeWZK6qXlDAmHSmp9kARSNTHDBR8CXxb6zfjfq/EY87zX3KhGTiFell9TBEgk202+mR6XJ1R4tSvpVBTEAveFmlxbV1+3nKts7UjOk4fE769e0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530693; c=relaxed/simple;
	bh=X3UWVR5FrAiTLHuUdqDGWuSjTyf0NcWGQa2Gmhjp7SI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ou7YxxG9GLVWuhF/9ESvvglq/+TB+aeW9RICmMLKRJB3lFpBZxTDx5HcNbSmK1leSVxs4JqoI9h8SEwmUXuvY9Oc0fFIEZOM94M9Hqdkh0MIm4rLVTxyGUpfZBwEV5ZNTb/qRdSzOIDjHZ65Yl1RXD/9WLBuTzNrc8aM9Acn1oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/i+k9op; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/i+k9op"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C5DC4CEE4;
	Tue,  1 Apr 2025 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743530692;
	bh=X3UWVR5FrAiTLHuUdqDGWuSjTyf0NcWGQa2Gmhjp7SI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h/i+k9opvXNDV/viKgz+IkFJDV0Q/+srL6x1bADFHk/mNdi36uSTPuGv5g5wlUNOh
	 6nTKRTXq6KItqyV8v9GzG52p1ttKL/MYNkyBNpj8uScFbZrEjS0bNcoGAg9RXnZGAo
	 HDXCYaH9bFx5OIdBohOCn28yQ3WawNYDtNw47zX+kv7v2sdYPNQw+0wYns//VNVt+q
	 L8I+jUstMjum93FaeEfdgxeeP2/kDfqmj3ZRRoJ3zFZnmyhc17xR6h7fJsP3l0ai6t
	 4yZVNp2B0kHRdpLkiAOJsyBz7/9VtTlupu9J9HrsATz6sjr/RzT8V3wmwEDU3iRaiJ
	 2FZWVFt4Om9qA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, 
 Henry Martin <bsdhenrymartin@gmail.com>
Cc: kernel@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
References: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Message-Id: <174353068900.126969.2791062137526970115.b4-ty@kernel.org>
Date: Tue, 01 Apr 2025 19:04:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 01 Apr 2025 22:25:10 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> imx_card_probe() does not check for this case, which results in a NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Add NULL check in imx_card_probe()
      commit: 93d34608fd162f725172e780b1c60cc93a920719

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

