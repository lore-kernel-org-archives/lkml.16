Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60343ABC;
	Mon,  9 Jun 2025 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464629; cv=none; b=ggcUGRZd9KM1oufb50UtHdLCpdtvcuw1wdodMjQMzF973X8xd+goEOeB+vdIX1iPJ83SvCOcVAOSJsqFwbXgWFaeokdhfSUPBv6NyST2ZTyLZ1km+h8Pam6OVpluWOZY9MnQNHn/3NpE533gwI+7LkHNniYwozHUHYARNifiJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464629; c=relaxed/simple;
	bh=S+5kY6sZ+JqRLkDv5nWmHUKJsyCslFIPHz3pnLMKqaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxyleiveMsmSGP8JaOqGRwOj/l010dgOHSM/RNYrfZ/kPcXWa02/GaDu/KbsOhYkVmvrh4dF1kOSMZm1L/8a6E0ZmtjWaqaKQw9U2iZONlVZ8HdFgg2X3LeAmgm5qcKlnPCXzXpDN9z6SPirbMDbi/VigQqKZPcnCg4bgauBUBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xQTOOOFm; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xQTOOOFm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9DZZBoO1L1NubxqwTsP9P0S1RvNFFvaVbeuY8SW7vA0=; b=xQTOOOFmh/dtLrEjDsctBH7j/y
	pD1laDGhi64UEgCCd9fITSym0B9M9yimLcFc1LEoy1qGYhgP7yMkdpwnXJfjFIiE0DjlRszbv4/BP
	V06HVi1GaisKeh60uyJpgvd7WR1zKyKUfAvxkl2do4AafBOnMX8c+1oLoFsGXChYxhUiw8ymWDHZy
	Exv1L9b5/96KAjNZisfLiNVMHZ3yE6ks6/3D75ZvGSszuMw+orc1BoycDlV+3+IUC5a9nt34p5Cdi
	1qYrGRQRQZg8M6A6KxA4E5kvlU8HGrGgayBC2cleBva57EM+vpR5lDuKCbyQ1F29VHY04joEE1zXQ
	ry9np+Fw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfC-0006Av-Qe; Mon, 09 Jun 2025 12:23:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix cover detection on PineNote
Date: Mon,  9 Jun 2025 12:22:59 +0200
Message-ID: <174946455537.762051.11927121098980951801.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526161506.139028-1-didi.debian@cknow.org>
References: <20250526161506.139028-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 May 2025 18:14:47 +0200, Diederik de Haas wrote:
> The SW_MACHINE_COVER switch event was added to input event codes to
> detect the removal of the back cover of the N900.
> But on the PineNote its purpose is to detect when the front cover gets
> closed, just like when a laptop lid is closed. Therefore SW_LID is the
> appropriate linux code and not SW_MACHINE_COVER.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix cover detection on PineNote
      commit: 3f391123e2bc88c570f148cc01e923e4740c5173

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
