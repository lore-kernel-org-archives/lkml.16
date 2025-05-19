Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8C1DFD84;
	Mon, 19 May 2025 02:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622984; cv=none; b=urxvAsWFHGTjveG5gYStVPOtZTqegQt9URRBFwermrxZoYWlsYWjVxbJ1AWp+uMYfJO+Sj5/bjO75cvS8Ji7UTSt86Ursos71KnWLQM09emowsdqipLXVGHASpVVAd5AJhNprx3J59M/yAufKnUFZtCkX695Kg5EFWimxou0H1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622984; c=relaxed/simple;
	bh=eg0evPTK/0FFGG5C0b4vTaJ/DknuYFTxJyWdgeWB+JM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kXr5Q6f+KoLRjRfjfZx3GMEiEJLRhPVYqQObi66IJXWMYU2/9qhwC4m7ogXUo47z9NuCmsxtltzwBp/KfOHXJwZthkkiUDNU4ThEdoAlUvhW98+Z6u4rV8tF5W48ySkSaAhBvihrLGpkkxFZvtq7zwmOyz1W9Psj21OjMo6OsWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=JRDn1dtT; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="JRDn1dtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747622934;
	bh=0WeBfK84XKo6BwGaQIvaiahY5jByMMmGweFecshqHhA=;
	h=From:To:Subject:Date:Message-Id;
	b=JRDn1dtTiYhLuG7xQFbderMkv/IA9BZR7XV8vVq385ZYvI+w5mJQkZQPu6oqTFVYX
	 WLAHCpS2xQ/2rNzMVboxH3MQ5XD5WKwPRoEpRNVePvid8ALIRW6Koi1qCX8GKiEtoM
	 +KFnAT71yoWF5E1f7BYPENhlCfbB+EMJUFRFLOhI=
X-QQ-mid: zesmtpgz6t1747622932t38c3880a
X-QQ-Originating-IP: 1qM8DlRd+zQizFZjrQ/zm7WNDykiRYLU3hqETrh1PeY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 10:48:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16466651914765562108
From: Chaoyi Chen <kernel@airkyi.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Diederik de Haas <didi.debian@cknow.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Remove unused usb phy prop for rk3399-eaidk-610
Date: Mon, 19 May 2025 10:48:19 +0800
Message-Id: <20250519024820.194-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519024820.194-1-kernel@airkyi.com>
References: <20250519024820.194-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MsL7hwqo9bYs6xFPPVQf+2317wCUReZlX8UJmnMpumYccPCTQR4BF//5
	yctCfsppGT61BNj0eAsqu49sF9ARRw+2WCiIJ55LaQCxIsE4vWl7ekJBD0SevKjH6OoOwY4
	LMCVUdMEEqN5J9H5w+A1xZV6QIJPquXKjRTd/BbGASLtVZMBiyi99mp0L6m0ZAroV1srXIf
	aHTkZsrFyCVPI3JMjpYrQsVhikid7F0fcbmBb7rsvYEfa2ufQSaHpQ5U1EmRPTM2NmpEe3u
	g5WbppqeWhKMh97bj5qOJpNKcQArr/QhKttXG6t7wvCuHrRSxjufOBb1KMVN1jlklWwJpJt
	DmXbRTiDIZGcN2L+nG6TH4ZXL+1dWlJ5SSBqz0pcsjrmKwZRtehbtScVWUgo4ls5BOxjrCT
	TeYja9iTujgCL/WAKPdIxQ8ssPPOtabVMMZSE36M951po/Wx2vj5YFqJVZU7z8S0ETkXbAJ
	wUdggdV8Bv6I2bluy7p7FKPJ+eyHoAdaEKZEwQMybEBQemXtbw4dmUuRZuxI7MssU9DexeG
	/a990lkO6I/PICfPJj+FdTXpUa1jsc14Y6QAGAc9U6CeM5qw78BoXDl8gru3HfdtnG89xpa
	hyll4mDGuDyrWWK84SViS9VH3iTenvWR9pMXwMnRqnE01uY11sWAx3zILWxA686gV1CKeej
	vyEK9KQH/D6vECBHmd9fgGnCYhTYXAQLSVjKR9i3bFs9Kngr6eVEF+9cQYoLjmd9WWqtu+l
	l5PnkUsyhfkUIaJeA30uA/VjtRSWRO9CDIpwHMco4oUa66TJ4wp+GxBAvKlmIr3JW82MR8l
	CcP+Up51DHnBfacGd1dLDygmtq1cd+I8jHRGI6uTCdpQv/0BAZ3L65tYUKIL9OAaApifLoL
	hrS+V6oU0wzYfOMKkhR6MpCk79mrM5WO2VBnA+VOKFyK0gO6kwugnS/Itn4kHAyvtkOb88e
	QA12LCJ4bijj/PyQSzwBE8xpZ0grVIqzf1oBqzq02t+dlONmxJNUZHp2F
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The rk3399 tcphy driver does not use the "orientation-switch"
property, so it has no real effect. Just remove it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
index b90bf26b58be..7b5b83bd90ac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
@@ -803,7 +803,6 @@ &tcphy0 {
 };
 
 &tcphy0_usb3 {
-	orientation-switch;
 	port {
 		tcphy0_typec_ss: endpoint {
 			remote-endpoint = <&usbc_ss>;
-- 
2.49.0

