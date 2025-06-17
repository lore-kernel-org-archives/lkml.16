Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8CB2F433E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169331; cv=none; b=tMgkvr5FQO6FyQLlltzHm69AGwNP4dPqvQ9c2ClVsYVW+nopmTPTjedh/0/U9cVaI88u17AUhXdwAvbF6xBNYFUTWJAIKzSTQPpP76AOdlWCZY9ES3pFIdmLXfw/Tf3pBHcNRE3ai6aK+aisbjt8fYCRzD9hkISK7Jfkgf77R9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169331; c=relaxed/simple;
	bh=N+2CmuFEvaFrCFvEiZxIZGe87T5yZ+GUUMGzk60ZImg=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=ouP1/GXldzOatfqqO9eiTAb8HgCrsyR5/BDg2r8tHfElXBkIXVlZ/GRfT4HfquQoEdSvgkRwWBggOqwfBCi5l0zyPqXq0k7jU6JleJS/8E0ZSyEIAw8J3249MLV6wUVpZ69FY0JAdeRRtEWGWEA2Qnu+9/LBfPdywxVZejFHC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NLt0IGUr; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NLt0IGUr"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250617140845euoutp01ca040f93ff99a2df1d8500f42850fbc3~J2bqUo21e2798127981euoutp01i
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:08:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250617140845euoutp01ca040f93ff99a2df1d8500f42850fbc3~J2bqUo21e2798127981euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750169325;
	bh=ZbpbiGCkq+bc/Hnq9ouJryKcDkGL17+XHPFX3q85en0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=NLt0IGUrkhdCV21WBpKsTA+V+/CN/O93MjfOgOr0bNGbC3rtHkEJnpr12fg3zmxun
	 8abHfrba09p+IeXYopaAJ8d7L6TzS66R+eq2TVjFV2UEqDyJxk/9iYIZ9HPX0ZTuFE
	 vwesuei4g24HKVPGHXVu9GNyZjblpkDtm5K7pEa0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250617140844eucas1p2ec26280d366f9cdb4c7846cb2690196a~J2bpr16ft2865928659eucas1p2h;
	Tue, 17 Jun 2025 14:08:44 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250617140843eusmtip151df0a7a6e746e98a4069d02c042c444~J2bohODD92540625406eusmtip1O;
	Tue, 17 Jun 2025 14:08:43 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 17 Jun 2025 16:07:31 +0200
Subject: [PATCH v3 8/9] riscv: dts: thead: Add PVT node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-rust-next-pwm-working-fan-for-sending-v3-8-1cca847c6f9f@samsung.com>
In-Reply-To: <20250617-rust-next-pwm-working-fan-for-sending-v3-0-1cca847c6f9f@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,  Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>,  Marek Szyprowski <m.szyprowski@samsung.com>,  Benno
	Lossin <lossin@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250617140844eucas1p2ec26280d366f9cdb4c7846cb2690196a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250617140844eucas1p2ec26280d366f9cdb4c7846cb2690196a
X-EPHeader: CA
X-CMS-RootMailID: 20250617140844eucas1p2ec26280d366f9cdb4c7846cb2690196a
References: <20250617-rust-next-pwm-working-fan-for-sending-v3-0-1cca847c6f9f@samsung.com>
	<CGME20250617140844eucas1p2ec26280d366f9cdb4c7846cb2690196a@eucas1p2.samsung.com>

Add PVT DT node for thermal sensor.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 26996422e1efe5d2dde68819c2cec1c3fa782a23..bef30780034e06b07aa29b27b0225ea891a4b531 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -669,6 +669,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
 			thead,pad-group = <1>;
 		};
 
+		pvt: pvt@fffff4e000 {
+			compatible = "moortec,mr75203";
+			reg = <0xff 0xfff4e000 0x0 0x80>,
+			      <0xff 0xfff4e080 0x0 0x100>,
+			      <0xff 0xfff4e180 0x0 0x680>,
+			      <0xff 0xfff4e800 0x0 0x600>;
+			reg-names = "common", "ts", "pd", "vm";
+			clocks = <&aonsys_clk>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1

