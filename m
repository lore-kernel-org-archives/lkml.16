Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6822A1FA;
	Mon,  7 Apr 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010281; cv=none; b=Fs2HiYXt2eMmDJZ9OcMD5RpKBD+FNnEaHPG6OCZuW99Fr9o9+3buzlvRkLAjXc+3lwyD2PVp7P+EaK5vKpyAgDCOgUguR19YwCLwX7fmIaJd2vZFWLVU35/fFgTaMJ4wkbHMJnKaFjqX+SppSg4011oLGq2LpUE4VmErhYzNPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010281; c=relaxed/simple;
	bh=nmv8OWXgTqi0EjjqSMgeczMmyJRpy0wv6rmCIXKbk88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFJESSWk1/4kn2kgDg3NvIshoiQDeumD46jh0VcA+HufzJ7Fw5NvBgm2vl0vzlmL7NfwILHEKDhcdnbw4O1tGeTfewCUqDE5PY/17dUdtrRdn205+pfyc5cmFwCge2T6PHuvGGtB1VSqJY5yuvXzfrPa9ERK7D5fX4C/wLstdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uEPwYIy5; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uEPwYIy5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CD5pkChFnmWgrszF5d2TZFlBk0vyaVCC45Ph73rxnSg=; b=uEPwYIy5GXqjN4brgbrRj+p1ct
	URMzK34Yqnbi99ZeTq6NdHSwvBZbaNh4Q+3KIcfDSZbwmqeEXHvc/9JG5ANAusPVWKgkUTnz3ibzw
	K52w/opAnmJb9rJk0pmH/OeNbddbo99JJdk5M2EmNRuAIVs0nWVUpKBuQuw0exmxW7zppZMKhg659
	kqF63IZ7DNDPxkRj5gjbSYZqLhbIIZElAjU3yOmIRGQt9ABqciG8hvYbsCebo6jcYzhX/ApD2tqjb
	5j2Wap+CpklXuFw9VwzLbKO7VTK1wRrdvMOXdVFBONkvhZV2J/ysQnKBrSNkQHW0aAGz6Jyp1xWCx
	OREEDvpA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjw-0000tP-I4; Mon, 07 Apr 2025 09:17:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: enable HDMI audio on RK3588 Jaguar and RK3588 Tiger Haikou
Date: Mon,  7 Apr 2025 09:17:42 +0200
Message-ID: <174401024399.372530.2324362238627427658.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317-tsd-rk3588-hdmi-audio-v1-0-0b8ceb9597a6@cherry.de>
References: <20250317-tsd-rk3588-hdmi-audio-v1-0-0b8ceb9597a6@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Mar 2025 13:07:25 +0100, Quentin Schulz wrote:
> Both have an HDMI TX port and can carry audio, therefore let's simply
> enable the nodes required to get HDMI audio on that port.
> 
> This is based on next-20250314 and the following series needs to be
> applied in order to reach userspace:
> https://lore.kernel.org/linux-rockchip/cover.1741886382.git.robin.murphy@arm.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Enable HDMI audio output for RK3588 Jaguar
      commit: f46705afd1aafd843e28e981447c92469e846673
[2/2] arm64: dts: rockchip: Enable HDMI audio output for RK3588 Tiger Haikou
      commit: 200b3fa574c9377ff0b4e69a6ca4668939bf0cad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
