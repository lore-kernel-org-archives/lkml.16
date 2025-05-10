Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4937160
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893630; cv=none; b=bccTKoeoSRqB48/yvQJZTW9jAt5PDw0vWOEQzN5NyMgBRb7ZoIKLamImDasoqpyFYXNVUMQzrVmGPMgQxfOFEx5it4mJVjsvgEMx6/6WhlWoqfohgDVtX93v0kuivclBWPy9Pacl2D7ErgZVnSohY0lDbjlhIG0qlSmDx+qlJgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893630; c=relaxed/simple;
	bh=HOmWtp8v4wsorQqYx5/caIaCxJ3mgOKZ0x/dDvS1+iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYcrrhGzwGmwi2nKUXIXxnNYz9/pwI+ITw0VIBdEF69lRG3NnXBbDcGuJk1yCwYpAzoRf6fIKcFSuYkb/4Lt3p8PDi+w6+ljziyhkHNBDo3veKh478S/NQ7Z2vz8Ir4MsGl+SBAH4gFc7+3srvFDHvLlv/LcPCNhVekgwIRk3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PIDa3Whz; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PIDa3Whz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4LiBJgpx1JPuJVPFYxmFK8cSpH55Fx19FbdJD4Cvi6U=; b=PIDa3Whz9bpYOxtN2U+zVEa9Dn
	KI7xDNCGrd7kxy3ZlYu1wsD+nWHG43N1h1Gvhcvo8mmZTD77Up4mFpEypxhBtqpNMhiGiRBTuVmAI
	y4TW/2UzL62Ya/m7rf9AD33dyELNnP7LyQ6mg9QMMWJ03KbQNTDtVhpzVl9HpuYoZEx2WiyQMT6mL
	P28Mb1f5Z6ShQhcPozcXndAptvzLAWTrE2piKZ9O/MVr2j8NlmEgf85V12WnzSbuuPImMr8R+LsY8
	nmLazI+xVhFVpnFRey4K6JoqAVwEBRgWl/xAmcVswNRID/OM1QyA1VWABHfcFnK0o9pE1j5o0dLhw
	N34NOISQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmpY-0000dK-33; Sat, 10 May 2025 18:13:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: drop wrong spdif clock from edp1 on rk3588
Date: Sat, 10 May 2025 18:13:27 +0200
Message-ID: <174689356074.2086280.14230309672508886390.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509152329.2004073-1-heiko@sntech.de>
References: <20250509152329.2004073-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 17:23:29 +0200, Heiko Stuebner wrote:
> As described, the analogix-dp controller on rk3588 only supports 2 clocks
> and the edp0 node handles that correctly.
> 
> The edp1 node on the other hand seems to have a dangling 3rd clock called
> spdif, that probably only exists in the vendor-tree.
> 
> As that is not handled at all, remove it for now so that we adhere to the
> binding.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: drop wrong spdif clock from edp1 on rk3588
      commit: 30f98e934a094b4a2de79ffdb877360c4289b8d6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
