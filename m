Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7E20E310
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751802379; cv=none; b=Pj+ANw+XOQN5X1kuDmsLD60/8Ph4ThKwRmZkrOiPvPt65mTIL/Uw4XxQf9Q+SlmMgQs+4Bw1/YFnfCgbWAHNe4ptEtI3bch8CVF3DFC7Ac9t5ZXhnoj/F9KrQ2vsNcDV/lgB5O/ovnxto3DnLzfkl3sMr8MT1B4P2zgYaoCp+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751802379; c=relaxed/simple;
	bh=8oTAUzxmjJYIKw5Joa+cRWJz7tviXwysA9SB/6sHSyo=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=pMpJ1H/s3iJly9jl9D8gOZf4bSuzNxnNapr9g9yPATIsARiQJM+352K2D6B6ANpPPKebSmTEAtHnzp4EGerNf5+x5RbfcFc9yTZbX7RO8BVMeT/X9XnuShjaqFzyzM+Am4hQpxEGsIU3yHTIdQnFgcuzZ71w9x4rob+ErSgjsQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IkIvshtT; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IkIvshtT"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250706114610euoutp025711f16418451d5b34e0c235bf71e680~Ppvly9wb_1127011270euoutp02d
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:46:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250706114610euoutp025711f16418451d5b34e0c235bf71e680~Ppvly9wb_1127011270euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751802370;
	bh=i2ffb5TRdqcFNdp9wQmKYm6oC/yh6BrYkPG8pSNij+4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=IkIvshtTZnSdpAWwXMGnD3B/9fLpU8poXsiO498kX5aT8jJg07ZL6Mgq6t+VesDp4
	 u/1ycii23+4lMOGMzO/6jW5opF2PGJWQJRLyHtVUT9cT8TdJviKCNEn9oS4qbSue4S
	 EDPJ/YldCX9z6PnsewvZD1mq0VxqIcsQiwYbl6yE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250706114609eucas1p18598ba94ded6b6ea1664aa8deb552138~PpvktRxQ52941029410eucas1p13;
	Sun,  6 Jul 2025 11:46:09 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250706114607eusmtip2d14944d9dd8c8eaad73ca964266b6216~Ppvjkpq1E0959209592eusmtip26;
	Sun,  6 Jul 2025 11:46:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sun, 06 Jul 2025 13:45:16 +0200
Subject: [PATCH v9 5/6] riscv: dts: thead: Add PWM controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-rust-next-pwm-working-fan-for-sending-v9-5-42b5ac2101c7@samsung.com>
In-Reply-To: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>,
	Benno Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250706114609eucas1p18598ba94ded6b6ea1664aa8deb552138
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250706114609eucas1p18598ba94ded6b6ea1664aa8deb552138
X-EPHeader: CA
X-CMS-RootMailID: 20250706114609eucas1p18598ba94ded6b6ea1664aa8deb552138
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
	<CGME20250706114609eucas1p18598ba94ded6b6ea1664aa8deb552138@eucas1p1.samsung.com>

Add the Device Tree node for the T-HEAD TH1520 SoC's PWM controller.

Reviewed-by: Drew Fustini <fustini@kernel.org>
Tested-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..513dc6977b2633503515ad260913156fbe57d92f 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -493,6 +493,13 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		pwm: pwm@ffec01c000 {
+			compatible = "thead,th1520-pwm";
+			reg = <0xff 0xec01c000 0x0 0x4000>;
+			clocks = <&clk CLK_PWM>;
+			#pwm-cells = <3>;
+		};
+
 		clk: clock-controller@ffef010000 {
 			compatible = "thead,th1520-clk-ap";
 			reg = <0xff 0xef010000 0x0 0x1000>;

-- 
2.34.1

