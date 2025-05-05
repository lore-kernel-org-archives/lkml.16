Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004E3103C9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746488803; cv=none; b=CE70UneVOX+1cGJ2CK3gJcK0zspAZ0dR8WT82iHxvQ/k3aWfzjuzUh+wyWG10vB5W8vyvx/ht0a798MHpTGSAyUf/5hGpzbH0/jqNYOONJjn7eXIjY2KbYOp8K232QdTD322DXSmf+uuTotsmabs4NNqnmb1SHfgUfW+h0mP/xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746488803; c=relaxed/simple;
	bh=6SCyv953aa75ulub64dVCUOrvbY/zNpRCQ6rDTOZqJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pcGR5vxwuJ1djnd1XpYEqEm1tLWKQ7VDKMKT8D+Cwwkua9eSK0NADNvc5uGrcIqw0OXYMKvt1iZw0qOxfHMJGVWn/D6BNUCYGmPTgxMBpEqTLIPqOP8SK0DY/WFHXRhfFixTR/9inkbAtG2WuWeiB14GDvgnjmRsMqB4Wct0xm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMIa0oWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMIa0oWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E9CC4CEE4;
	Mon,  5 May 2025 23:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746488803;
	bh=6SCyv953aa75ulub64dVCUOrvbY/zNpRCQ6rDTOZqJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kMIa0oWA7QIOQVyd5uIbkCDz4q+xTxAPn7k5BMeA0tmORxREHDqj4ubrQheffD3jv
	 tfmV3iP2GP8vagfsiJYceFvUegjfPA2yKsvnINYgNKDdSZlYgDPPUnv+ADxWBp2q1X
	 WplnpHxdU/VYI4CD0LKn6KQ8/ScYlAGIGsC05qhzgIF6kwNOsycq8w8rZFOZIVbfeD
	 6VhSvIe7OULQHCNK+KJC7UXMZvmgfoVuprOZVeVmt+Gl7BZ2KQl4IeKKsLeyAK1Ft4
	 mnvofFR8XL5PFLFL58iEzhQxQZ6z5/0TEkC5LP3xCDvI0OlUAMGn8lM9mg6niUHmGj
	 IL8i2W29nKvuQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Sperl <kernel@martin.sperl.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <37ee1bc90c6554c9347040adabf04188c8f704aa.1746184171.git.geert+renesas@glider.be>
References: <37ee1bc90c6554c9347040adabf04188c8f704aa.1746184171.git.geert+renesas@glider.be>
Subject: Re: [PATCH] spi: loopback-test: Do not split 1024-byte hexdumps
Message-Id: <174648879977.4120313.11711906225313425747.b4-ty@kernel.org>
Date: Tue, 06 May 2025 08:46:39 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 02 May 2025 13:10:35 +0200, Geert Uytterhoeven wrote:
> spi_test_print_hex_dump() prints buffers holding less than 1024 bytes in
> full.  Larger buffers are truncated: only the first 512 and the last 512
> bytes are printed, separated by a truncation message.  The latter is
> confusing in case the buffer holds exactly 1024 bytes, as all data is
> printed anyway.
> 
> Fix this by printing buffers holding up to and including 1024 bytes in
> full.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: loopback-test: Do not split 1024-byte hexdumps
      commit: a73fa3690a1f3014d6677e368dce4e70767a6ba2

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

