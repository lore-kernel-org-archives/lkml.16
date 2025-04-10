Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB670830;
	Thu, 10 Apr 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296766; cv=none; b=ttX0UzrHDUxJUupWRnzoWZRUgjgpQ2vFic0wkPbbJTG/avk8gYGzVbTxFPouca2KUvyXA6cymABADXMSMkmCLN1JNwNJrLfGrPWiVNXlWThs/uXeBGuc7kOFWN6nRZKnIszYS3LL2VulpmQLhAo403AXPIfj+PEvM+gXmLVBglw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296766; c=relaxed/simple;
	bh=jZZF+frDp5+VyBgznrFlS8mxHlXDlZcGkvFnL8IMNig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1laGORpOpeEYhjKFt8FkmA658LmkgY5PvklnD433CzcDMibNdJWRIE7Ui9DdNMfabO5hJ8XoRZ4KvjkfUxYhKZSHyr6onCNtqKVNArI3SR/hUPcytcO9jep1oIg23b4MVILgCiZ6UivFrO8w66aeOrIashStYXnBoaQZKbXzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EZSOnlko; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EZSOnlko"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LP2MrA4kyJJF7nqkw6ZY/203xCtdrQPU/4NP3oP3G/g=; b=EZSOnlkoyN3gXhuJQQNV8cyHEy
	ze/dE37vB3N+UPsQbU3lU1IeGJIy/3BFKh8/iHrsbFsIjmyP/xQulcanGcKqo4TWj/rASERCmC/4C
	apQWRspn2hQQiDTlifjCYBpgVY0IGzXyask7/4vy/TdnYu1C75gqBPVbmuLY1ZMVi0vkoPG4alBkd
	AOgK3uZOoCEqgGKscMKVvs3VU6yEKbMlQbWU4uhxyowttMwlO657VYbL1eRtAiWRQ2NBYTl/k0RUz
	anpCdsZuEbqjGEjV7Uh5miGmvrnZibSu9plpEaWA5H4KVDHdMLMeTvFTBxFIRPat/dyi5C/8lB88G
	Od0vRQhA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGi-00012N-ES; Thu, 10 Apr 2025 16:52:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rock-pi-4: Fix mmc-pwrseq clock name
Date: Thu, 10 Apr 2025 16:52:27 +0200
Message-ID: <174429674408.910874.12009966723443982772.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409205040.1522754-1-robh@kernel.org>
References: <20250409205040.1522754-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Apr 2025 15:50:39 -0500, Rob Herring (Arm) wrote:
> The defined name for "mmc-pwrseq-simple" clock is "ext_clock".
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rock-pi-4: Fix mmc-pwrseq clock name
      commit: 6833cbdc733c9e1088fe9936b2dad95cc7d4c580

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
