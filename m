Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E11FF1CE;
	Sat, 26 Apr 2025 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703991; cv=none; b=okOy2TAbtA01gOGfrbd73a94Ktt1oN7tHhTnTJHXQWk7fBtiavVh59jDfJQ3IwbDfng1kRfVRSQ979dbr4mge3NVXUlfwdHENzWnsUrGGtAJqg1bw95VUvNmDuKGJvgzewvseL3DYZHHKrJoA3tL4Mi2S41WCEBbUbt4Sz0j1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703991; c=relaxed/simple;
	bh=cQzZgZG25PvpUQjs1ViLBmMWmXKJaMf0/X16TGKDN+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FPqCsyYIKBf7VaGhsnRMdBs5du5/RytNfrPgDOaAu1G4tbfxHlsZrtT4I7dBnfySJrHhaB7sdRXq2sS11Uxs1/cgCw3VoIChceimQjDMfzVyoRT23eAVXVul3kZCmYZtybJ79A5maLJlTISznuF90EwoBoxb/UEUNp6kROiLBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Abd1CJpA; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Abd1CJpA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NUMHYKa7L39EF19ViKQjDuDWwTrq9xKyIvYi8RpFFDk=; b=Abd1CJpAlWjkAMlngJsBMAUMHz
	N8W2BZqVYPzJuMM8KTW1R+6DTRKZNBh4d9Tts/YNSKxTOUrxKarOfZLmR8efVBy5G5Y75DYrCSwil
	zCcxn46OJF12NM9dmeSlin70yJ02lE34pdTgi2FN/JJqLQrZvBTHnAW+DHJ9ZyzuLS/ls6gQLfSPB
	Dy/gfMMl7sPfaupIkRc1b5oCJwKLgk2qWHKjEB/zSc4n2FccJIPmWc6VrRCaoq4gVSZN1tNeUC7Vs
	9M6ghrWF1PCpyZr/PItEEzImft2bvJdCgVFNE6qp7TApbttdi0OEkcASWdWvEbyrNqQ+gx6fkTu3q
	6E4dCVDQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLs-0001OR-PO; Sat, 26 Apr 2025 23:46:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Tom Vincent <linux@tlvince.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
Date: Sat, 26 Apr 2025 23:46:13 +0200
Message-ID: <174570370122.31943.10553095973503218576.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417081753.644950-1-linux@tlvince.com>
References: <20250417081753.644950-1-linux@tlvince.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Apr 2025 09:17:53 +0100, Tom Vincent wrote:
> The Realtek RT5616 audio codec on the FriendlyElec CM3588 module fails
> to probe correctly due to the missing clock properties. This results
> in distorted analogue audio output.
> 
> Assign MCLK to 12.288 MHz, which allows the codec to advertise most of
> the standard sample rates per other RK3588 devices.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
      commit: 5e6a4ee9799b202fefa8c6264647971f892f0264

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
