Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA5252299;
	Mon,  9 Jun 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464621; cv=none; b=mI54zAlVzhVdjafQvSX0x8pEoBJh5WpR4wNlSEsi33zkGTexzmKaSrGXvGHkAscNh1grKArQmEMxxKCDwJZW3My0PVkRToUPtqVmpe/6Rgp9iFdO0mDVf1uorJkVnwElyv3BWwm3wUuPD7XMX8NFGLQIf3Qs7WrH+BG6bdd1DLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464621; c=relaxed/simple;
	bh=3xjVvWH3Ewn0OW5P95TcqTdOFuhEAnjIunVMbwFren8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lrANaTBW2QuHiLrobwpaMgATYS+IapYfiO7tDzOFHUbzygPayK36J99XKS7OzzT4kO5K+Oyuc3p73kEKh35h0Y4EE87fWR/eGj7cFd7Li3COywJMSEniOa48U54jT6QgKkY8m+hGFhSb6T3436Y81mSS5O2+lQQTxagqyp1CYpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fODl7cRe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fODl7cRe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xEZECS6vbso0nmjjQa/VPYjFi0sU5YUT4fgKEZQNaBU=; b=fODl7cRehmK4ybPZIIU1U4jMKE
	dPgLtOuOCi5cqZojh60rej7k5NPL0tStWG7D7HbcTAvBOSPx75B209oeP+3R/C9xiUQbioCLAMZ4V
	Zl0oKlcj7Ayafdx9aAz7rE52pUr+G7B/8A+A7LF4+rC+HVYz3JgTV8K/wi/YTZSXNZB3NlN+MfFdo
	UoyDRdX3d9wT/nJCM4E7j++YDXkkFHee2KERGEKMBXReMes3RG7P/JLpXSU3uOCZDXxB1/AjJiODG
	4G7XcJjTVB5OIdXdh7zSoWpDaczZyMak3YU5F3SnxlfThwJncTfrLnTzJ8NegrrdOOhXUnRX45WDj
	ai11mSdw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfB-0006Av-PN; Mon, 09 Jun 2025 12:23:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	conor+dt@kernel.org,
	jbx6244@gmail.com
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
Date: Mon,  9 Jun 2025 12:22:57 +0200
Message-ID: <174946455537.762051.5518711921835874992.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250524064223.5741-1-andyshrk@163.com>
References: <20250524064223.5741-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 24 May 2025 14:42:12 +0800, Andy Yan wrote:
> cd-gpios is used for sdcard detects for sdmmc.
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
      commit: e625e284172d235be5cd906a98c6c91c365bb9b1
[2/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B
      commit: 98570e8cb8b0c0893810f285b4a3b1a3ab81a556

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
