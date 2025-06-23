Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CF2D4B5A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702150; cv=none; b=VPn/uTX4egAs/SkjIfAp9LPKgp7nQe9JS6T7tVQyKhpv9SVNV7l9XqHkHTDpx/c4qFB9A0gOpkXKUBeGDP9OvWyxlkz/heK4XndbuX7bSpyHUQDPv+WhyYCFk5qqJ8fxlK0dUa6LzkQBKj8zUVY1AT37pO9rkxovX9XUFHs4hBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702150; c=relaxed/simple;
	bh=t5gAhXcbGZrJUALl7qia8n51ELevCqFMIQiyrK+I6FA=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=bU0WAmOTAW12az81cTVHP6UMalFtTxyLbKrAvjZQXmjKg4nxbYPOm3AQ/eZBvPuvm80df/Y50BE+5RzxgW02L6WvjLEuGLQ+f8hnfebSbuWJf9nn1ai0ZbCQEFvVWWi8Wix+J8i/UsgDlX1JB8gpKomn5TTkgiQ6IRC8q4tjNLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tPQiCC0k; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tPQiCC0k"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250623180904euoutp01c8d5c633827203e74b244777b2082fa1~LvlMb38km1009510095euoutp01B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:09:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250623180904euoutp01c8d5c633827203e74b244777b2082fa1~LvlMb38km1009510095euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750702144;
	bh=trQX8cKrsBk4VTrpk3Inc8jpVfnsWnUW5rwO3OnDizQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=tPQiCC0k/EuUT2q53gZv1TUD24x8hpQQ4ixi7DBVEbVARgrYRAVVROtCIXpTRt0AA
	 Iuwe+ii0iq8DO2TPvdO/VsKTj0BN8dlZL+3UmwnJl/Ma5cCJlmr5oXGukwjelzvzaH
	 mKevpM7bCw7mq4IqpTDdxIGJTwQlsUdunRQwqdwY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250623180903eucas1p2d5d4397349bc0ed7c4fc912d243ef371~LvlLxDGlW0176401764eucas1p20;
	Mon, 23 Jun 2025 18:09:03 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623180902eusmtip123474fdb10d6d553fb26db7310ab7130~LvlKfbqwt0652006520eusmtip1s;
	Mon, 23 Jun 2025 18:09:02 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 23 Jun 2025 20:08:53 +0200
Subject: [PATCH v5 5/9] clk: thead: Mark essential bus clocks as
 CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rust-next-pwm-working-fan-for-sending-v5-5-0ca23747c23e@samsung.com>
In-Reply-To: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
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
X-CMS-MailID: 20250623180903eucas1p2d5d4397349bc0ed7c4fc912d243ef371
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623180903eucas1p2d5d4397349bc0ed7c4fc912d243ef371
X-EPHeader: CA
X-CMS-RootMailID: 20250623180903eucas1p2d5d4397349bc0ed7c4fc912d243ef371
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
	<CGME20250623180903eucas1p2d5d4397349bc0ed7c4fc912d243ef371@eucas1p2.samsung.com>

Probing peripherals in the AON and PERI domains, such as the PVT thermal
sensor and the PWM controller, can lead to boot hangs or unresponsive
devices on the LPi4A board. The root cause is that their parent bus
clocks ('CLK_CPU2AON_X2H' and the 'CLK_PERISYS_APB' clocks) are
automatically gated by the kernel's power-saving mechanisms when the bus
is perceived as idle.

Alternative solutions were investigated, including modeling the parent
bus in the Device Tree with 'simple-pm-bus' or refactoring the clock
driver's parentage. The 'simple-pm-bus' approach is not viable due to
the lack of defined bus address ranges in the hardware manual and its
creation of improper dependencies on the 'pm_runtime' API for consumer
drivers.

Therefore, applying the'`CLK_IGNORE_UNUSED' flag directly to the
essential bus clocks is the most direct and targeted fix. This prevents
the kernel from auto-gating these buses and ensures peripherals remain
accessible.

This change fixes the boot hang associated with the PVT sensor and
resolves the functional issues with the PWM controller.

Link: https://lore.kernel.org/all/9e8a12db-236d-474c-b110-b3be96edf057@samsung.com/ [1]

Reviewed-by: Drew Fustini <drew@pdp7.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d05443716eb0029403b01775e8f73..cf7f6bd428a0faa4611b3fc61edbbc6690e565d9 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -792,11 +792,12 @@ static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_ac
 		0x134, BIT(8), 0);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
 		0x134, BIT(7), 0);
-static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), 0);
+static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd,
+		0x138, BIT(8), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
 		0x140, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(9), 0);
+		0x150, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(10), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,

-- 
2.34.1

