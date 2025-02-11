Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8C26BDBA
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739241390; cv=none; b=IfIUM7kXKWPeb7qhEUxLKbcl+KjGD6LUvWvLLLe/9cutVb21nEdA1ShLVzj3SRkDpa05u4BB4gpgM+yZW8fxpI3j10/YPcGp027N1N0WJCSs3hdCoUu63ikEZ6ObdBzeizagyitcgehvWSI816+ewfz7tg3UbH5iKMpLTf+/Na8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739241390; c=relaxed/simple;
	bh=SLtna6B1qX3YpHonDlOvBUqxGH9MF8Snaybun1IiDc8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=eL8l0XNNWk4lGtJpct6zTZYR5SpzqUepvd0dM2+mpkMYs5pMsDzi7X4jI+nVN5UjCmqP0ncmUfEs6LdmCBEgjnCzM/nJSLdyWFVXHtLt71+KBnYU4aM3jietG/KhDvU5qjzGgWTPayYkrwEb8/C4JkKJ4ElVpOCdbfVv8vaDnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=I1fWcGGn; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="I1fWcGGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1739241376;
	bh=CvMsgMzcbgfE0aHLjgBhhYzwX6SHe10kuTwQ4xy1QH0=;
	h=From:To:Cc:Subject:Date;
	b=I1fWcGGnsO0STnUlvsNBfyUngcWM+ZRpsGB7K1rcOVm41wQbAvXK+StRDjkIJ6s4O
	 7ULu14rgCDYfgMmx8v/6SHFJr6MdeW/YodvVlu43GSTRDFoeKV+18wrEBw38QwjOQk
	 o+CBvgqNmZjRBA0vCTZldxEYjYDZYoRI/JJNalt4=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 77635AD9; Tue, 11 Feb 2025 10:29:54 +0800
X-QQ-mid: xmsmtpt1739240994ts1ern8k5
Message-ID: <tencent_6F503D43467AA99DD8CC59B8F645F0725B0A@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujn8zIAKkUixZyrzF1c0t5ZmDIrdNwCTJtUPKHFEmt9e0gc2FgR0
	 mMWeeFnKy/a4aUIo/rpJDpJ6SY0wtec1J5MS8eQwtEa3YVcY8jLNMa9250s5hJh8q2GeyH9Ly3mq
	 OTjH4/qFlZhPPAFWvBJEpQ65MRW/Cd3EXCj/HnesqzbMyLjwYfR1re3CA1q5oF00yClAiTDCAq93
	 uzZRTGp9k97DyCuidfDsHfkE4KCi5QAqD/jK2bgjXz5qzZIdE+gvfca8NS/a9PT6iNL+WQQW+GuE
	 a/bQhd/OIclYthoeWmAtdxMaAzRqg03jCUs0WHFTc3lS+USxYSUtdsk/O5KnHioFskTH4y3/vyoy
	 /rTMC7j/PJiMqKJNzDE2IJEcrC5urLsd0zry0qw4ZmcNDIivx8KgGn8dTfmTHWQctsIpLZ3SwdJN
	 d0smXgOzmIm3FwMU93YLACBfni2fBi2GA7YTQcoswQAf/JOlAALE5KEBO7MPVxoZS6PhBwnf7ZtR
	 XqFfkYyBkiEHgnjW33cBIF75mVwnnY/qojK+SDNXRuzRsB5xpLJgajwy7a8E8k4TNuqPOEWxAQ8K
	 n+f1MWODzFsDYhGk27nUDdfj3jxlXpFlReK+kB+FcmdoGgWDDcGPvh2u73p8M8DBTWGhPfe1eQ+w
	 PSsPaO5hfgdg/9K6Hg6XnNnEBqJVoPt1QIBUdEkCsK7parRXaNPrcR7e1VmVlSn8g/km0GYb+Aaw
	 Vri/jRHfIeF23ArFugzbEX2shqmyhWWSJK2MbjMZr4MfI3/6ucHf+wZttgkUFy9cNOK6Z1f9kmVg
	 oBpCCCahFSAeS7kQhJHVz0lkz4MCm9lf3T+4K4O2tbrOVtTYfopwVVd4wUKzr04eUc+iWfnnqTBP
	 QnsMNVFL7UNcFRM9FNpJKzlY1cMPfpxt6vRq/nC7al/jOxGzMw1rsiRzOWSnuTnrRFniI6qKJk
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: xiaopeitux@foxmail.com
To: vkoul@kernel.org,
	aford173@gmail.com,
	kishon@kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH V6] phy: freescale: fsl-samsung-hdmi: Limit PLL lock detection clock divider to valid range
Date: Tue, 11 Feb 2025 10:29:48 +0800
X-OQ-MSGID: <48bc37daf1d703f28a5216926cb4de5c5e89e904.1739240824.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

FIELD_PREP() checks that a value fits into the available bitfield,
but the index div equals to 4,is out of range.

which gcc complains about:
In function ‘fsl_samsung_hdmi_phy_configure_pll_lock_det’,
inlined from ‘fsl_samsung_hdmi_phy_configure’ at
drivers/phy/freescale/phy-fsl-samsung-hdmi.c :470:2:
././include/linux/compiler_types.h:542:38: error: call to ‘__compiletime_assert_538’
declared with attribute error: FIELD_PREP: value too large for the field
  542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
__COUNTER__)
      |                                      ^
././include/linux/compiler_types.h:523:4: note: in definition of
macro ‘__compiletime_assert’ 523 |    prefix ## suffix();
      |    ^~~~~~
././include/linux/compiler_types.h:542:2: note: in expansion of macro
‘_compiletime_assert’
  542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
 __COUNTER__)

REG12_CK_DIV_MASK only two bit, limit div to range 0~3,
so build error will fix.

Fixes: d567679f2b6a ("phy: freescale: fsl-samsung-hdmi: Clean up fld_tg_code calculation")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Changlog:
---
V6: modify the title from Vinod
V5: add return ret from Geert suggestion
V4: change to use if statement
V3: change to use do-while
V2: change to use logical AND
---
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 5eac70a1e858..6817ceabaab4 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -325,7 +325,7 @@ to_fsl_samsung_hdmi_phy(struct clk_hw *hw)
 	return container_of(hw, struct fsl_samsung_hdmi_phy, hw);
 }
 
-static void
+static int
 fsl_samsung_hdmi_phy_configure_pll_lock_det(struct fsl_samsung_hdmi_phy *phy,
 					    const struct phy_config *cfg)
 {
@@ -341,6 +341,9 @@ fsl_samsung_hdmi_phy_configure_pll_lock_det(struct fsl_samsung_hdmi_phy *phy,
 			break;
 	}
 
+	if (unlikely(div == 4))
+		return -EINVAL;
+
 	writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
 
 	/*
@@ -364,6 +367,8 @@ fsl_samsung_hdmi_phy_configure_pll_lock_det(struct fsl_samsung_hdmi_phy *phy,
 	       FIELD_PREP(REG14_RP_CODE_MASK, 2) |
 	       FIELD_PREP(REG14_TG_CODE_HIGH_MASK, fld_tg_code >> 8),
 	       phy->regs + PHY_REG(14));
+
+	return 0;
 }
 
 static unsigned long fsl_samsung_hdmi_phy_find_pms(unsigned long fout, u8 *p, u16 *m, u8 *s)
@@ -467,7 +472,11 @@ static int fsl_samsung_hdmi_phy_configure(struct fsl_samsung_hdmi_phy *phy,
 	writeb(REG21_SEL_TX_CK_INV | FIELD_PREP(REG21_PMS_S_MASK,
 	       cfg->pll_div_regs[2] >> 4), phy->regs + PHY_REG(21));
 
-	fsl_samsung_hdmi_phy_configure_pll_lock_det(phy, cfg);
+	ret = fsl_samsung_hdmi_phy_configure_pll_lock_det(phy, cfg);
+	if (ret) {
+		dev_err(phy->dev, "pixclock too large\n");
+		return ret;
+	}
 
 	writeb(REG33_FIX_DA | REG33_MODE_SET_DONE, phy->regs + PHY_REG(33));
 
-- 
2.25.1

