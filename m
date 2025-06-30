Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5A28C03D;
	Mon, 30 Jun 2025 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297823; cv=pass; b=CTpz4K5y2o4pV6cG+ynDoYsRbpIWx4K37jgnXom38ubhPNX27WBLHQ6d/IDPb1TOQjRLc5pFH9Vf4u11IWXxjUVKyrusbfiWEX6VcRk7rEnz5tG+0pWVhyzXWuf/fYKYIyaIXK1LDTS0DE/j0trsP+cmX1zRGWc67uYgUAVKbbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297823; c=relaxed/simple;
	bh=SPJ0Ppx5B73YSoF4KCwpTgjq+rbaUKCQVXitWb5nNSs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZsfqpLw7infj0qNKzOargRI2fVcGf2nOJZpa9+uZdPjEDspTzYw4eJE76N0bRNApjDGvIepbfC/qnWhFuDPLKOcNiP2nGnK7iSysOXwTxlQ6q5TG7oaJi5RHe0XpdW1euaqc4/wDOgoJrhNg0DTMGyixq0c0Q5kQueDY/KtAOmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=BPFW+RRT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="BPFW+RRT"
ARC-Seal: i=1; a=rsa-sha256; t=1751297803; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RpN4bPtZ/jvsadHm2DKR3O92hYxkU+pZGr4rL83hBf+iD9+QAa8btMKs1hoNQFAepghj/6nIT0r9DGuBnDGmYhc/Z8rhY+n/qXdgikB13Et2nWz53YxBw4fVkzSBb+USnpJSCuKx/sDsAm1T3bIR2BL5GWTkW8j+hUGNuZnDppw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751297803; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oEjLrRG0kfXtUXwN04MYTgoasYE6yNyZK3tKgOletsA=; 
	b=Sq0vdmUvI8ggfRtRuc51NIcpYBdvItCxeRr/IZvDCsCe5+UIzHkiD6mBnnTVKtpHWVsIPWYkRxxkInN3T1paUsvg7M5CVeqyZOjTekhWys3lyjFYxEbMNF2iwbU1ikIOXhj+nWGr64HciexHGZIpIxbPgGwIMmQcdAoSC2DGSko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751297803;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=oEjLrRG0kfXtUXwN04MYTgoasYE6yNyZK3tKgOletsA=;
	b=BPFW+RRTOEgl/Bc4viTeOL0Fb2yzea9PwpJpvydHK0if3G0chFgdyAYbmC7z5Rv8
	+4JBJgmDO/2NrlW6U0QOxB1bx1Wr2hkVfu5mUCsWoT8z6c7C9FDI8+M2BY8vc4UwkPk
	86EM7+fWT+KmlFIa8B3hro9QPL33p4lsoLobotaI=
Received: by mx.zohomail.com with SMTPS id 1751297801452461.69521897601544;
	Mon, 30 Jun 2025 08:36:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/3] ROCK 4D DT additions: regulators, usb, rfkill
Date: Mon, 30 Jun 2025 17:36:32 +0200
Message-Id: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGvYmgC/zWNQQqDMBBFrxJm3YEk2hK9SnFh4miHYtIm0Qri3
 RsqXb4H//0dEkWmBK3YIdLKiYMvoC4C3KP3EyEPhUFLfZW3SmIM7lkPGGnCJVn88MiolKkaoxt
 pagtl+Yo08var3ruTI72XEs+nBNsnQhfmmXMrPG0Z/wfQHccXh/DjQpYAAAA=
X-Change-ID: 20250630-rock4d-reg-usb-wifi-11839829084b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

Turns out the ROCK 4D DT in mainline right now is neither accurate nor
complete.

These changes should quell the fires a little, since at least we now get
two additional working USB ports, plus the Wi-Fi chip shows up (even if
it doesn't have a driver right now).

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (3):
      arm64: dts: rockchip: adjust dcin regulator on ROCK 4D
      arm64: dts: rockchip: complete USB nodes on ROCK 4D
      arm64: dts: rockchip: theoretically enable Wi-Fi on ROCK 4D

 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 83 ++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 8 deletions(-)
---
base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
change-id: 20250630-rock4d-reg-usb-wifi-11839829084b

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

