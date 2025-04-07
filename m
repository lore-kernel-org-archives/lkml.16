Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC522AE76;
	Mon,  7 Apr 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010285; cv=none; b=CRlXpUrzZg9v5J0HhH9e8xoRLDDVITZZnlv/CjejbeXtqJ1aXYLY0uodffC8RkjOzz+GROwkSOTD+TikHQ4iN3L8G9daxgmDTvfnLaC1FF60ZcA1TaxWq3VHRsNKLmNUpMs/b4HbGt0cvMCbsHV/HkrSpLRzPTNgmRubuAHQYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010285; c=relaxed/simple;
	bh=6EXxpCbapBoN57dAJRHeYJrimOx3QJPKEcmhW+Lskuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U0OqGBtyhzC2oELqYNK5S+0RPipAgRcOjyryXD9XTDuGqlCoh4i0zxlSoLUEdkug0rM54HeYYR2qwn1ZCnUr2xd2SfhwFJM7dh30smRB3Q6W8TXndhx1xetbaouE+MI6Co+b62AlDKdD8CTtwzdljTUv03wA3VL4/NR9ohz3GHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UbfjnRyh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UbfjnRyh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4VmBqyKq+yIiEc8KQ9+sRwBtfBe5CRaZLqUvC30Bq0U=; b=UbfjnRyhnyK7j21mLA41RABWbI
	E1b5z1vi32IAOPu08i7tpzQbGlRg3aETD4y8Ulwg5GRUVmrq7ANyJOiq6CB7yS7EgGWXnoU5opwz1
	Cs/q3hDnT8lOZILMhHP19TILENOa5rllsJCa1xH0RefE5eEijt2a8bj4f+BzTyTIVc6jOtyMbJa7x
	mnPA5/TSazHjHE6qVkoHjWVXfJhsicNbabOsEEeMNLzR2SoRu+CYWXAI998WPmZcb8p8EeOXV8CJZ
	TWWsiIEyFT4eobtUNr3yujPnz0Mab43mxO84aMKhaYaUtfvP1gb7LdNP6dtpsae/4p+v7odsCvCPl
	Zlscb4Ag==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjx-0000tP-GN; Mon, 07 Apr 2025 09:17:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable HDMI features on NanoPC-T6
Date: Mon,  7 Apr 2025 09:17:44 +0200
Message-ID: <174401024395.372530.10209184803682823778.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250325-nanopc-t6-hdmi-v1-0-299a2ed45878@redhat.com>
References: <20250325-nanopc-t6-hdmi-v1-0-299a2ed45878@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Mar 2025 20:51:45 +0100, Marcin Juszkiewicz wrote:
> This patchset follows other SBCs and enables second HDMI output and then
> enables HDMI audio on both ports.
> 
> Tested with 1920x1080@60 and 3440x1440@60 displays. Worked nice, audio
> played on both monitors.
> 
> Would be nice to have an option for more than 60Hz (larger screen can do
> 75Hz) but I assume that this will come one day.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: enable HDMI1 on FriendlyElec NanoPC-T6
      commit: fc1f5f5bcac7df327a20f4bfbd4872e17d38601d
[2/2] arm64: dts: rockchip: enable HDMI sound on FriendlyElec NanoPC-T6
      commit: c0898e6881f964ca831c407c7019cd7f307d4368

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
