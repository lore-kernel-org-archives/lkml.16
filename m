Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C92F3C26;
	Tue, 17 Jun 2025 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195905; cv=none; b=GXb4pvR8Pdt5Bku/tRcTK/uiX1zVqbD/U/fRhNOGnMOUQW0AexXmrJWv8dtTFTfAkHRuOp08fGDuMLKPpb4anrtwW5QFR5nHuDh5RXF8hJFrPFKYstHDky3t5J+4frhaEl9DyqWFkUnF/kO3/cr4APJ/9sapnNrOch7F6hRw8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195905; c=relaxed/simple;
	bh=NT7M7j9aB6aePj5CbZFLDDn7LGqCaV8n7k94j3/n5LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkaNe4uCs0kU9r31rWnaBJNFd5pFheUtXE6DWVICpgGqRwcVRYiUkbJxwnWnknaUBxZhg+C+j/SIsgT7bLX8ZvpvEIJiPAHxZceyCX2MwOJdtG5sbjcsWFXHsqW2DKaW3jeDi2Wq2Rh0RLWZeZMFCv9Dy2Hx1kIr2y6Fz4BO8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dl3sYCKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dl3sYCKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753FDC4CEEE;
	Tue, 17 Jun 2025 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195904;
	bh=NT7M7j9aB6aePj5CbZFLDDn7LGqCaV8n7k94j3/n5LA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dl3sYCKyUozT3U/2oJYxWUqfvullkcUJn6bX8BkD4PeFgZE1AuN3jOFPfODWsKspl
	 4od+mwlDdn57MhH4M2rmASYW7gSUiuc8yTji9XoieYZqSFZF82gQxj/8jHeTw3f4SB
	 kWZ45sbVFSSBlygyEgRV5cUcifyvN2iqObIworsqzODqQzpg4Q9RQmsiGNizenmS/u
	 ZvhKtHdjqrTeJPRj8k9b6nuQt/DBozHmcAi5bWKxvD/JkV7e5bPKFaMOop0UnuvmSJ
	 hZw4eZvSkQYXNZiDiP/RqChWNnXipJessF/YmItg0geO5D2F2wsryy4db9glrYXzbc
	 u0j7U4z8YKBCA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Add support for AW8898 Amplifier
Date: Tue, 17 Jun 2025 16:31:28 -0500
Message-ID: <175019588868.714929.11356929679548081810.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Apr 2025 15:03:14 +0200, Luca Weiss wrote:
> Add devicetree bindings and a driver for the AW8898 Amplifier, and add
> it to the devicetree for the Fairphone 3 smartphone.
> 
> Note, that this is the first audio driver I've worked on, so please
> complain if something doesn't quite look right, it probably wasn't done
> on purpose.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898 amplifier
      commit: 87ab84799a90bb73f3f42ae636b213ac4564e237

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
