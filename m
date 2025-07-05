Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F823190676;
	Sat,  5 Jul 2025 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709614; cv=none; b=qovZ6XcB4q4Lk6fF5LS5Vc+G25dUhUeQ+B1hKUB8wOxpYHF4uWAqSc9cq59UkSHiSdrAAMB3BLbrd3nEO7IUd0VGNtAe23ENnSzxqjfsqETWH77Z7FSYHnMKUGzXsOexkALmy2RfqUV20aDEg3Nunai7WeyPS4hWVe3OnfBJEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709614; c=relaxed/simple;
	bh=hECT9/EJcb82eH/cbjmMyV050Rvo+4l/7Q8hVhSKXkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ESxbxxpJ8duJje0BsIn7o14qUtOcH26S6QWMlXM/q4Dzdxu1EfALOYpQdRMiR1nUL11Hv8u8CjgLDEEhPn3MnmXp0+sL18JfnkPDZQHb0XwHR71KP9xVs6QvriHg5QnOU8+f8CYQ8lIUUDWno1lBPZ+YK4voxiC9x6xQP7lSSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PvDAJMtE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PvDAJMtE"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C3B2258E3;
	Sat,  5 Jul 2025 12:00:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13Z8MWAI8z9B; Sat,  5 Jul 2025 12:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751709607; bh=hECT9/EJcb82eH/cbjmMyV050Rvo+4l/7Q8hVhSKXkk=;
	h=From:To:Cc:Subject:Date;
	b=PvDAJMtE1sPk7O2fRyBcgAoTmn2BWvG6150Z5BNEqXAXYQ4oDvB5xMAq+jKRQXJv8
	 QBrsxReQUhZ3VkR6j4BfmljwtHi3AmZrZH61VdRDmfBCQ7/hmvEdVCzuqqfog9Kxzq
	 0AGp/1hcDN41j6lKYaycNlqyOevx3JDjHZozfnl/HOlffGi06OFPzlGkfEMiSfWzXd
	 5Jq3kDNhxg24hDA9kZBNq35wAz2Twh1uihztFek3K3+u8XHomAyROhrrKqwCb5DGNa
	 CP93fv1KNoR7KksfQezE7CA/YM10/l5A4dk1ecDSEFAtYX2/Ddw8JKwhUlmhpSMr03
	 +EUEN8gWJUKvw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH] clk: Avoid DT fetch in possible_parent_show if clk_hw is provided
Date: Sat,  5 Jul 2025 09:58:17 +0000
Message-ID: <20250705095816.29480-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When showing a parent for which clk_core_get_parent_by_index fails, we
may try using the parent's global name or the local name. If this fails
either, the parent clock's clock-output-names is fetched through
DT-index.

struct clk_hw pointer takes precedence with DT-index when registering
clocks, thus most drivers only zero the index member of struct
clk_parent_data when providing the parent through struct clk_hw pointer.
If the pointer cannot resovle to a clock, clk_core_get_parent_by_index
will fail as well, in which case possible_parent_show will fetch the
parent's clock-output-names property, treat the unintended, zeroed index
as valid, and yield a misleading name if the clock controller does come
with a clocks property.

Let's add an extra check against the struct clk_hw pointer, and only
perform the DT-index-based fetch if it isn't provided.

Fixes: 2d156b78ce8f ("clk: Fix debugfs clk_possible_parents for clks without parent string names")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---

This was found when fixing the wrong parent description of
clk-th1520-ap.c[1]. Without the patch,

	# cat /sys/kernel/debug/clk/c910/clk_possible_parents
	osc_24m cpu-pll1

The first parent should be c910-i0, provided by an unresolvable struct
clk_hw pointer. osc_24m is the first (and only) parent specified in
devicetree for the clock controller. With the patch,

	# cat /sys/kernel/debug/clk/c910/clk_possible_parents
	(missing) cpu-pll1

[1]: https://lore.kernel.org/linux-riscv/20250705052028.24611-1-ziyao@disroot.org/

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf..280d3a470228 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3594,7 +3594,7 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
 	} else if (core->parents[i].fw_name) {
 		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
 	} else {
-		if (core->parents[i].index >= 0)
+		if (!core->parents[i].hw && core->parents[i].index >= 0)
 			name = of_clk_get_parent_name(core->of_node, core->parents[i].index);
 		if (!name)
 			name = "(missing)";
-- 
2.49.0

