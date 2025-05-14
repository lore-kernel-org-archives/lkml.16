Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917A27F74B;
	Wed, 14 May 2025 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222679; cv=none; b=DLN5iBCUzCrP0ep7172Xg625lUZlHFclvIGqHGAICxL8DDuUyRCfygjfbevuv6i1uq2SCWTE+xRYlJgVaNIbzAtBXD22H4sGhwzxR8vHUTs4nRu9x9C/nZuOd7GBXRheKuWhkBgUHaWfgnRnAqP0i8WZG4tvPowBzmbrR8xy4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222679; c=relaxed/simple;
	bh=5OwOl0Bj2Q2twGH0ZMeTDbcw2QPkZjXjJHWmhXAwipc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nOxZXvECXLk6KAwLUlNXq2pHTGCGdqlT1QNzl7B5UeKKgy9betLFu0i4T2hE0Fqepz/TXlzJkZxt5wy0FCwBwp0vf6yBR53uxA38JNlfNOeEo2rVhD3BJ3wpVJ6YdMCNAvIFhGejGQCyBnexkLuSa0Mh4/rIvOqAIBYEN5i1RZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0bNqbql; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0bNqbql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767A9C4CEF0;
	Wed, 14 May 2025 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222678;
	bh=5OwOl0Bj2Q2twGH0ZMeTDbcw2QPkZjXjJHWmhXAwipc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r0bNqbqlC5JKePKXJVnTj53Jae5ZjZmPeBrZacpIxwF0CYDc8vf0SpIBavb9mdh/u
	 35gySRlT0LCrghInfjVP+VQeD0dk54kkYaa37CWtAU9KZETXpNelWjbS4eiHwC7/Lv
	 GfR7TePORiH8Npk+FpmKuwWP+kXvwvWH3CZresGMquBfYdI71XImcigraaIfQROS8g
	 nzbT6g+zDosTSwr4LfXYBMARRt69PmRRyUlVgN0k62diJ92aNpvaJfReXYsfB1KRmr
	 ny8LDEp8TOogjo+hLa9UjgCHtb84Ix7e3wkXsVNkpMiUuBVJs0Ztpv+l2OxDM8Hq5A
	 f0RB++qjCNDug==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
Subject: Re: (subset) [PATCH 0/3] usb-phy support for the old rk3036 soc
Message-Id: <174722267614.85510.13471013929246898806.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 03 May 2025 22:15:09 +0200, Heiko Stuebner wrote:
> While trying to resurrect the rk3036 board in my boardfarm, I also
> implemented the up to now missing usb2phy support.
> 
> The implementation is quite similar to the rk3128, except the not-
> supported charger-detection, so its addition was quite simple.
> 
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: rockchip,inno-usb2phy: add rk3036 compatible
      commit: d78b565371314e48242cb9383d0f9d331119ab2e
[2/3] phy: rockchip: inno-usb2: add phy definition for rk3036
      commit: 3ca48b955bb34a3b07dd915318d73a23740de282

Best regards,
-- 
~Vinod


