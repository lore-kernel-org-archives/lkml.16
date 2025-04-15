Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F62DFA2A;
	Tue, 15 Apr 2025 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727168; cv=pass; b=HFJw9yhXGpBbASP4Jp7UO0KIKwzvWU2TRFDMrRvB2yrB0rcVyytUHnwRFmXBqD7duFehhpJ19Nwv/c2rQ4JZGyyYMpp0ylHZ9gOwM0PZM2fue+tmiZdwLO8E9VAyfiJ3+Oy+qac6JpEpXg2yf8andOMmRaEW7aCxiNZgpVDfv6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727168; c=relaxed/simple;
	bh=RfQjTOk2h+MMiV/jWOACwsvNf8ebF9EOBaFtD7E2klI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rz+boLZo8AgZmon8Tvg6MX3ZqeLHhT09Sv7zzZ3hbm8lSgL1xd3fu3roFeaI27Y/5nfvyd3VxgkjJMyCmzbw40+HiAzG4ojYQOqvs3YLDDwzevJQu5krRL+Mw3EgLaMQUk0MS9rCjLixziLjeKVUFIf55Pc644FcgdlFmSbwo4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=L1tc2PCe; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="L1tc2PCe"
ARC-Seal: i=1; a=rsa-sha256; t=1744727148; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bydLmRRKEgFdMpE9ZXf5afrMy8QOIFAFzerOaELbS9WE9CKPfKJR6XgVsxDPiRFnOlSbxYE+bDdmQ/aBKJoCJ83Gx7CTqay3mYl2ssVQ8Tb5z8uZEpfa7RXGQbeZJR08qYdnvoEhLZ9bzU4oUcACgcfgz9Viewi9216A5wCoEEQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744727148; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dBl9h9+5RK06EkJFUF07v61OdZMhQy05YJJrnV+R6g4=; 
	b=cGWXUGM11o7fNAplMA71PbhTq/rFGpPfnZRx3MHfY0WfRlrYuBp9UOS8JIop4iQyU8QEumbZPYzzkFh1lI6UP7x716+GZt3DgDQB5PCzVzsI2p9CUj7NJ40D+8RMuLavIo1wDD123PHqiCH2yw/WZA7IgVOip9KthFTGlVtLL3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744727148;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=dBl9h9+5RK06EkJFUF07v61OdZMhQy05YJJrnV+R6g4=;
	b=L1tc2PCeM8Guv6lGwFWWs4D4DNsxdvdHvo4mGewV961rG65AElx+0LON7w2/PvvP
	S7CY2Zhq9X1DXtRsqI0uy94dUbCZKt8qBxLmW4BFvhq5RA9fApmPGaIUhj1jViiE9xC
	afgWZRHJJdu+pp7hJvweixPIFKOmgT9NCssk+8ZY=
Received: by mx.zohomail.com with SMTPS id 1744727145609468.14311435062166;
	Tue, 15 Apr 2025 07:25:45 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v6 0/3] riscv: canaan: Add support for K230-Canmv clock
Date: Tue, 15 Apr 2025 22:25:10 +0800
Message-Id: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZs/mcC/3XQwU7DMAwG4FeZeqYosZM62Yn3QBxS22EVbIV2T
 MC0dyfbQKys9FRH+uzf3lejDp2O1XKxrwbddWPXb0rR3CwqXqXNo9adlLoCA86CaerW1U+Apub
 npzqCz4hZpWGoingZNHfvp273D+d60Ne30nR7fqzaNGrN/XrdbZcLo5piIBNCAhBCCVZjE0QJH
 bEwqY8u07l12vKqZFkuRCUhO4JsypezOMMiQpwbwdZr6SSJhKtjglU3bvvh47TeDk8RvjehySY
 7rMtPayl6G4IS3X32q36duufbkvYYoDBvLMA1a3Mm7xNHzjzPwOA1wwaYogXnCabsGHznLsJaN
 +WucMsmcmpadCH9M9XSNfMp+oTOhybaman2YirEKbeFA9gULWkwKjMcfng5lQlTDkdOLZoEnDz
 Mcf/L8e/JfOHkgpRrQEDF+Z0RzDUzGsWEyN6F8Gfq4XD4Amd6EjwDAwAA
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227b09006c05aa75b0c9d736a030000f32b64051d3c08b79d3d38c5eb0114e090c9b45f90ed8ade69:zu080112276da9e4a4986656beec2ce86b0000a801a177cc17b2a86ff2b82aee5bc645428b306935a070549c:rf0801122c54f699f0d34be074e7a9255400004462049d7b670f236f193908597ec4048b2ce1f986f7da2dd336bb2a69a1:ZohoMail
X-ZohoMailClient: External

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC and 4 internal
PLLs, with the controller managing these sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Changes in v6:
- Remove some redundant comments in struct declaration.
- Replace the Vendor's code source link with a new one.
- Link to v5: https://lore.kernel.org/r/20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com

Changes in v5:
- Fix incorrect base-commit and add prerequisite-patch-id.
- Replace dummy apb_clk with real ones for UARTs.
- Add IDs of UARTs clock and DMA clocks in the binding header.
- Replace k230_clk_cfgs[] array with corresponding named variables.
- Remove some redundant checks in clk_ops.
- Drop the unnecessary parenthesis and type casts.
- Modify return value handling in probe path to avoid redundant print.
- Link to v4: https://lore.kernel.org/r/20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com

Changes in v4:
- Remove redundant onecell_get callback and add_provider function
for pll_divs.
- Modify the base-commit in cover letter.
- Link to v3: https://lore.kernel.org/r/20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com

Changes in v3:
- Reorder the defination and declaration in drivers code.
- Reorder the properties in dts node.
- Replace global variable `k230_sysclk` with dynamic memory allocation.
- Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
- Use dev_err_probe for error handling.
- Remove unused includes.
- Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com

Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock definition for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   43 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   25 +-
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 1710 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |   69 +
 6 files changed, 1846 insertions(+), 8 deletions(-)
---
base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>

