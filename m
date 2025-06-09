Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBBE21D587;
	Mon,  9 Jun 2025 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506107; cv=none; b=r4matr1ZVy6RnOvWbPO4RXOrwKsy/LaogFAg7hvMv3QAaLceYVqAiWZ56qHrHBWtJQbXDGHfrJf9EFcWdhTP/LmPSUmX8Gd57kjHE7z2sgJCUEk8KBqssuKFB2Mf6d3ss7eWO50oCn8KlqhCWk5yVIQWkoTCWxsJOU69uREESu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506107; c=relaxed/simple;
	bh=tEg6PR5QER8nznaQf7QFJoHg+OzeWOX4wO8uqnYGdc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oi92qOncAt1BwpPA9QLoriWfjdjdA/KHe/B838nVEoIrtx5rf+tp5cL6s9Bab7HHJ3hKTCKcjbB6SOyWZ6a3R06aIRDPT12NbbFBTpeytuUk+SP3C/tGVTAI3++TZTh62jWDUgb/hIMZdlJFLry0qX580iw0wodUmbYFBn5sbxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mctYzr1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mctYzr1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A6BC4CEEB;
	Mon,  9 Jun 2025 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506106;
	bh=tEg6PR5QER8nznaQf7QFJoHg+OzeWOX4wO8uqnYGdc8=;
	h=From:Subject:Date:To:Cc:From;
	b=mctYzr1b6Khssu2nuC9T6oTY4Wv9Ij2j01N71eP93PVIafVh24HP4ThErGwYQgmAU
	 DpCX11HIdFJT/6CNTzyZ3oyE6L0k8vAaIOcXMK4PyPGQv/uODIdrrFEfyazJAZxJEH
	 Wv5F8T2eTRalwVxuTMw74l1DIq5btwGE8PcbOCoV4fYA5BipxJy9wn99+CC/b2E83F
	 PXrVb9FYZs1aYIhGRu5xMPGwx7er6YF+D57kDSUtx1GjSnhYrmeP74cgfAS1P4UrOP
	 bhQc38u9vavH3eAmG6OfKX1wWY/gNYgBzznH2R4AlOhLXVt9sZUY0PeCQnQ++TjdSX
	 Twx/jrXTLWFxw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/2] arm64: dts: lg: DT cleanups
Date: Mon, 09 Jun 2025 16:54:55 -0500
Message-Id: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9YR2gC/x3LQQqAIBBA0avIrBtQQaGuEi0sRxsIC40IxLsnL
 R+fX6FQZiowiQqZHi58pg41CNh2lyIh+27QUhtp5Yj+xiNi4JcKOq+CtaRWIw3048r0hz7MS2s
 f9O1Wml0AAAA=
X-Change-ID: 20250609-dt-lg-fixes-ad1f66e1b505
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

This short series fixes some arm,pl011 DT schema warnings. I noticed 
that the lg1312 and lg1313 .dtsi files are almost identical, so I've 
refactored them to make the fix once instead of twice.

Arnd, You probably need to take this directly if LG maintainers don't 
respond.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (2):
      arm64: dts: lg: Refactor common LG1312 and LG1313 parts
      arm64: dts: lg: Add missing PL011 "uartclk"

 arch/arm64/boot/dts/lg/lg1312.dtsi                 | 324 +--------------------
 arch/arm64/boot/dts/lg/lg1313.dtsi                 | 324 +--------------------
 .../arm64/boot/dts/lg/{lg1312.dtsi => lg131x.dtsi} |  35 +--
 3 files changed, 11 insertions(+), 672 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-dt-lg-fixes-ad1f66e1b505

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>

