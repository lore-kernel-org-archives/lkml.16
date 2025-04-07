Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3772422A4E9;
	Mon,  7 Apr 2025 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010286; cv=none; b=sY3cvEPdLm4a++EgX2ZHyRip8NHpG/Of9Max3XVDlSaTeh6knjpzVrUymZsyNrHq9VMcGJtF3dHF7IIzrnaLRyPgN/KYowDR2BPzHZ3S8KuEL9RP1MDSjwJ5HrBYf2ohFy4ipkVY0msfmfsN3kkd7o5ZQ6Dw9m631AAbcsxQ50M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010286; c=relaxed/simple;
	bh=yJFAFYNM56x+cSMrgDOAbDyGHyxwarAZGTWyMaoYHCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cew1srVtjCAIxGPeiy5IBlmgaWyGeDn+pIDwW+15dH4r4kiV74PegoYn8jFrmHb1qkvFHwRowgCCHwXkzTIMtVnSgRYJOFvCCtl0OSEjbkdBu0YhTAiT1RcmzeGf60gDul0GCy9iN7OWah6wTTLSkQ6uIwMPBhMFUsTesTiYujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2klBk91I; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2klBk91I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=E4xhtBk1zbp0lmzvNeEtXeBgukjshEfh4UTaJs1zTAw=; b=2klBk91IQ5W38Y0AhP0QB0s5dt
	zHqMTmLh8SRS/ShbJ1PqaTtztFfDP4qGWhri69ED9g2S5BK+rTV+P90/oQDCK31tEmk6G2OkyXGXG
	eg0/6IFWIQXn3j6KL893B29q0VWPXHrHeaSFSFLPO+TN+RXQPSwfe07011kS/4NHpPmlkEKMJLOPp
	lOdUhd7dJoK9l6DaH3+yOJM3hODvqCIB0/S8zaU6pcOBSll3t9Ac25JTEB5FlmSmXCndf1rR1qHI0
	pn/lLUJfZfnZOyospOebyFpBFx2I/q1Z2hg3xj9XNYignQQOH1nU1MbfzDlqPBY5y2RWSELMUCaEM
	3DRy12Kg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjx-0000tP-0U; Mon, 07 Apr 2025 09:17:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI ports on ArmSoM W3
Date: Mon,  7 Apr 2025 09:17:43 +0200
Message-ID: <174401024398.372530.8692340789444388220.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317163240.3083908-1-liujianfeng1994@gmail.com>
References: <20250317163240.3083908-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 00:32:21 +0800, Jianfeng Liu wrote:
> Enable the two HDMI ports on ArmSoM W3. And audio output of these two
> ports are also enabled.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI ports on ArmSoM W3
      commit: 392275203af1b384fd12df2cef6fb6ee8b3f2b68

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
