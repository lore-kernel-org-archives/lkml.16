Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349F801;
	Mon,  7 Apr 2025 03:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743996424; cv=none; b=eZY7yKoiwnt1tdR+5JgxKZjfQBHs8/mtlNSKL3LnTvLL+CLb32Yo6aJLrVIn0pptE2hegi6yHEe/71AMH9Ns5bfER7Bg5juQHcPiAXTZ9lvZzlYvWpl7uy6y+eKlqBYbSx1gLDlCiSUsQrnOLk+JS5Po+jfhcOaefUTxbStSlq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743996424; c=relaxed/simple;
	bh=ApFqjXp9QptNXkQ0FrXmfzk+9tfugIwM4oMaIkdMyqA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pAZMWrqv9+5b3FL1Fj0QwHQJWYU+8nG3eP/RzafHfsMs415KTvnXweM0JJ3lTuEv2H4uaa3SpfIrqYUaFxkzBr6yHiNk64fU1T1PPYMNRCYAU6EZoEj2heuHIo15F+MCQ4TU9AxXXLF+9SqFE4s7Z19KgDoZmzRPGq/l7N9ENzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=oa9i/N/l; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="oa9i/N/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1743996109;
	bh=J2ZmuHwb+XeDs7UBxiws1r+PRFifDNGqgstKjoaffss=;
	h=From:To:Cc:Subject:Date;
	b=oa9i/N/ldJHJrAVxCZxpsKlFN/lVvfn6+mhp99DDbuUcjY7vu4+pPljAXJn0WNL61
	 IAcGrxzvcr/iFYSg7oWwrodQBnSeNyEbYSuEeTxHG1yWpMBqYLfLZH84mzn2kJ8xER
	 laik9abkUbleRNQDsq80T6DCBlLZwAi+2uWvM87Y=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 5700EE92; Mon, 07 Apr 2025 11:21:48 +0800
X-QQ-mid: xmsmtpt1743996108tvyniewjc
Message-ID: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+yXLVKDI2lXM5CHXiSfV4ucc+xECmUuw27VLHDBoszHAg5BsSvp
	 qRx42rJjjJEtHBm9t/iTwinQvbdcQ2mNBicutbYxXHg7mrn3Rf+0sh2iPjNz2mQyT9cL5zDpk0hG
	 /EjzLnqEZq/+nZWGL3zkTzwZqjj/dSIphohBC787Mp1VqWswvTJDiKlLmTo/NJqeBV3Y6ukV0QEB
	 o8WCII+ztJ7J7uIppCJ6jRIHixjKmjOPWN8qLtRnvsHd5QDLB5xK5uBdplwj6BMmsIV3g8mI5QI4
	 ajZOjY/pNHfQiJhkLW137fQ8ypcYkhYH50MwkHXpea4VhU5nI8oUyrzKA6sinB/kYFxI96fhbqe8
	 MRAT1t5SsYgFVTTZ+xdcjKGAwH0MZ47T/+a5qyTvSGAZNKZ9FbrQFhFGUJM3FNWyMhBO7Uca8N3T
	 yMW8jEHXGa14J5HdH4EtFVh1c3ZbpTkQ+EeSYhtJOtoyq5cM4x+DNpLKgSTFeRN/IHFuuNed+7a9
	 gQmn42FJonfbMMzGyQEf+iK1h9SEkKVkbexbLs0XgGO2cHQ8IIOM8x3ryuvBf5DeTPy2LrYeaRpG
	 ool/atb8Ff9ypsNSdgvPBa7f22ycT+LhKunmj+8y/+tChO1cxYBD7OPpwqwYV1Lmsv2yOw4J+wYc
	 Mvwld140IskJEXU2Qgtico8tYB/cf7Dg+sOuBbDuv/YUIk3P2t4rZMG/5pL0LRkDPYr3T/d5Z9jf
	 wjXgVB0pt/kxH0279QXXlmLGya4W9UMUQkXGZKgX+8c2N6KRPE/FjQOm2OY1oipLUuWun88iKvVE
	 je/S1jwVDW1fCeDTJPRfetL+JLGFQJP8UEQCBpiXXf9vGPWXKijl8JKyjeFw5QJtzZ5B4gISrCEu
	 K3fdtKGBo+WJN9pCpvdIshbtKtOr5Jks5BZENIuvZQytkBUiQ65bP2q+mPXFZDXc6GfeiCVgFEM5
	 7eO5Wgy0C8QvDO6jGbvhbLfx+LSHS2mqstEFtEJFDzHhR0SFZ0wnTmudq3ok3t3QoQT1htJbmmVO
	 NzR1IRpPD+ncfdoLCF
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: xiaopeitux@foxmail.com
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] clk: sophgo: Fixes Coccinelle/coccicheck warnings reported by do_div.cocci.
Date: Mon,  7 Apr 2025 11:21:46 +0800
X-OQ-MSGID: <af209151c107a7a8d43938a5dc0f4fd3f8347712.1743995995.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

cocci warnings:
    drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING:
    do_div() does a 64-by-32 division, please consider using div64_ul
    instead.

    drivers/clk/sophgo/clk-sg2042-pll.c:160:1-7: WARNING:
    do_div() does a 64-by-32 division, please consider using div64_u64
    instead.

replace do_div() with div64_*() which doesn't implicitly cast the divisor.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index 1537f4f05860..e5fb0bb7ac4f 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -155,7 +155,7 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
 
 	numerator = (u64)parent_rate * ctrl_table.fbdiv;
 	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
-	do_div(numerator, denominator);
+	numerator =  div64_u64(numerator, denominator);
 	return numerator;
 }
 
@@ -212,7 +212,7 @@ static int sg2042_pll_get_postdiv_1_2(unsigned long rate,
 	tmp0 *= fbdiv;
 
 	/* ((prate/REFDIV) x FBDIV)/rate and result save to tmp0 */
-	do_div(tmp0, rate);
+	tmp0 = div64_ul(tmp0, rate);
 
 	/* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value */
 	if (tmp0 <= 7) {
-- 
2.25.1

