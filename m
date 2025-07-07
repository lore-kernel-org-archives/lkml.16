Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD12949ED
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881778; cv=none; b=Rk+RfWvZOjTes3LzbnYra4JlW4dcnHBv8qabVsJOlmpKRm7Q/yrjGeiYyGaW6k3u4S4w7jt0JNOZh16GgLe+yuBkH30ns8kGXYbdvg/BDugbbJ7hvyYxOsyP+tEzcMs+pju3gObEUM7wVnajSLTSKH2pJBceCsbjIqd63UJJAsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881778; c=relaxed/simple;
	bh=8oTAUzxmjJYIKw5Joa+cRWJz7tviXwysA9SB/6sHSyo=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=noWYz06JcmEEYOh67tJtPp7iMRjXEcVKatSMDInt2jBxkzUPGnEasnonnCa+BFkZajUG4oaOM2js7cOHkELJkOImEvGbnbjfKoV9nRTiTtks67gzgJTv567BSbRz4AiXPXAgujtU7GwIl04yn+utx91vmFOxyEmqYtXdUJ4vpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZPniYePg; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZPniYePg"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250707094935euoutp02950f2249bc7cc654c3d02f26ff6c5afa~P7zFKSaYk1604516045euoutp02C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:49:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250707094935euoutp02950f2249bc7cc654c3d02f26ff6c5afa~P7zFKSaYk1604516045euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751881775;
	bh=i2ffb5TRdqcFNdp9wQmKYm6oC/yh6BrYkPG8pSNij+4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ZPniYePgFoNUEd/ml9vJg3FtztyjhE+Zi9DACBFW+eeFloR0WTNbsFJCMoeIYZWmL
	 +Srb62nkB91IEze6i0JMmowmVJxp7BT5t7Y9tsQAPRWuDN0cOcXEQFhXQLkhEbgQ8B
	 Iz/tXHfWrUCfgyS+swV9lPL7exmQfAObojODJgW8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250707094934eucas1p156403009dcb9df7e9466c3418aac738a~P7zEl3rWb0070300703eucas1p1v;
	Mon,  7 Jul 2025 09:49:34 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250707094933eusmtip1de685283c224c56fadb03a5666853030~P7zDlFeIw2054320543eusmtip1F;
	Mon,  7 Jul 2025 09:49:33 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 07 Jul 2025 11:48:34 +0200
Subject: [PATCH v10 6/7] riscv: dts: thead: Add PWM controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-rust-next-pwm-working-fan-for-sending-v10-6-d0c5cf342004@samsung.com>
In-Reply-To: <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
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
X-CMS-MailID: 20250707094934eucas1p156403009dcb9df7e9466c3418aac738a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250707094934eucas1p156403009dcb9df7e9466c3418aac738a
X-EPHeader: CA
X-CMS-RootMailID: 20250707094934eucas1p156403009dcb9df7e9466c3418aac738a
References: <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
	<CGME20250707094934eucas1p156403009dcb9df7e9466c3418aac738a@eucas1p1.samsung.com>

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

