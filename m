Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127228C2AC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924515; cv=none; b=HSJyLDzabd7UutvPeWne3oO+y3e8pbtkLabKCXYNh8mEdLeB5mu2p7Q4CWi76vA8utvbPdpeLewRs5C7WhOKzjQ/2oS/PyxEIRgoGJ8MXK/wUreNiZ18U0uG3BRxrpNeOruFGIUb5Q4PZunwq7VJFzoWXTt9t61CCmKV0tM+1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924515; c=relaxed/simple;
	bh=iCWS6Ge/nrZYt/8zzT18q8g/KBu6jtUFzfgZoWpwQVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pq7GS7Xzj8pRC5BN1UsCXnRGH6nvtqxHQW0bna4UmAZI5jduaNb4ELFGjWFV1Ua3bKqkuC2YljX3LkAN53zPbUio6250tFilzyYDxxDVHhcGEGoJ7VCv7U76jZ6wJUtzEneGa5lZreEpfecpYCy05fPiAGV0n4WgpQlodOvLbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cStICk7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cStICk7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5014AC4CEE4;
	Thu, 22 May 2025 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747924515;
	bh=iCWS6Ge/nrZYt/8zzT18q8g/KBu6jtUFzfgZoWpwQVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cStICk7awncWXrTp0J5CQlH+qwR72Lec0w3MKf/CJsNajHoBBw6R5yaHPPITpe9r5
	 dHv2B79+d8WAV7FKqbclSLf+xM3mVNB/4S2Une93mva1xxueCGMU7a2hnJgRNF06+i
	 z9H9auIxgDHfIpYzR0oi9A0D1bkdWyEdxW0ot3S9LVH+FwGaJOzO9IFOIdssYXqAwy
	 SrwB7/fF2DxrYbKgd9MNPRk6SzQbsOshf/IJALblOitTuOmsvhMyfwT3woGQpy3+w0
	 KgoO1yuivwnk0HsarVDuWA4g9HO/tqz0+R+NsPvNofon7iDqgD/ukRe29lv/zGS0OG
	 tLuxoUOM3AcKg==
From: Lee Jones <lee@kernel.org>
To: cw00.choi@samsung.com, krzk@kernel.org, lee@kernel.org, 
 Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250519232025.152769-1-sumanth.gavini@yahoo.com>
References: <20250519232025.152769-1-sumanth.gavini.ref@yahoo.com>
 <20250519232025.152769-1-sumanth.gavini@yahoo.com>
Subject: Re: (subset) [PATCH] mfd: maxim: Correct Samsung "Electronics"
 spelling in copyright headers
Message-Id: <174792451407.1382892.14033158712212004120.b4-ty@kernel.org>
Date: Thu, 22 May 2025 15:35:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Mon, 19 May 2025 16:20:23 -0700, Sumanth Gavini wrote:
> Fix the misspelling of 'Electronics' in MFD driver copyright headers.
> 
> 

Applied, thanks!

[1/1] mfd: maxim: Correct Samsung "Electronics" spelling in copyright headers
      commit: 07bca1e50433b558bf7beb9ab21c8941df19be48

--
Lee Jones [李琼斯]

