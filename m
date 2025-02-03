Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE742010FD;
	Mon,  3 Feb 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591927; cv=none; b=VXTfrVG06rBlvSPITJk+GRZJzrOw+J9dqpU93X/EffTqYZeewPAjNczkTPFZeahMiTeFf2PoI8jQov5eKioNfSgTw5w1tqnMLtiR+/Yg2HFgLFqsmfJW6lQH6yYCI87H8Sk4+TYFraDipxIfZuTVcya7jTtjqYgzw0t0zZttILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591927; c=relaxed/simple;
	bh=OOZV6cGnwytCGkUmPkipRump1HRxP99C2VbvSgsVbU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kjvfe+lMsrH3D8DJeq6nt5aMjr3fbPYsSO3X2HfFrYDnmkIVYoFREvwNkSwVoDpfCKX8py1Nr0Sx00EXzV7g1QFj2YKLKivuzwKFUgzjbWruTVEfySVk0hZqo3mMGmVfzaY7NknFQeu2oNKXa1pG8ENLHaX0Djvk67PCf3bwcCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tw81QUss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tw81QUss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DD9C4CED2;
	Mon,  3 Feb 2025 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738591926;
	bh=OOZV6cGnwytCGkUmPkipRump1HRxP99C2VbvSgsVbU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tw81QUsse5F7LjTFMnuWgKK9xTitTvUpvCngnoIoPaiPCVc0hUN9QjR9nrKlivkIj
	 E7Qyv7N6lAz8mG/Q4DNhxKxNPpTp8jacGUQFm0ZIet7OXRF/ZzxHWec/IIi++M64Ym
	 qComHcX66mpckO+8qAVu/y3/gD0JY7y9VDbZ5RPdZ90dGhE7gp1DDdf1AeM6Zs6Kw8
	 Qj6bs1RaNxtTp6/T+5czWyFQkrJimFJkE1P6sRxt8Ikbv2uGZ9+D1krTh93dhK05Zw
	 3e7kiUS7WUsUwgpa+AbnKMIdPIsjIhVCuioPT3AG2cJLhoSqXY/reQr8SrlFpLoj2A
	 I1Ij2YJiXaigA==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <f01f900d15633d5cda5f27763723acb307c0d22f.1737725820.git.christophe.jaillet@wanadoo.fr>
References: <f01f900d15633d5cda5f27763723acb307c0d22f.1737725820.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] regmap: Reorder 'struct regmap'
Message-Id: <173859192471.164939.14221359396991942917.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 14:12:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 24 Jan 2025 14:37:58 +0100, Christophe JAILLET wrote:
> On a x86_64, with configured with allmodconfig, pahole states that the
> regmap structure is:
> 
> 	/* size: 1048, cachelines: 17, members: 78 */
> 	/* sum members: 1006, holes: 9, sum holes: 35 */
> 	/* padding: 7 */
> 	/* member types with holes: 2, total: 2 */
> 	/* last cacheline: 24 bytes */
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: Reorder 'struct regmap'
      commit: 995cf0e014b0144edf1125668a97c252c5ab775e

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

