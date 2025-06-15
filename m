Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A781F5EA;
	Sun, 15 Jun 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991216; cv=none; b=m1Eg3tkuJHbXOFD2F8lajKEWoawmoX2D1Sz4VOuAsthoVXx/5lEukMylp6p/2gTmyWvKZoepG9XxHI4uxSSeYaYjoc2e4/R04utInWnm7R0fegv5py/7e+MG413kxeaD8lS4eTqtdauiIkCI6FTChyE0YXwoECiKllZa7s6D9JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991216; c=relaxed/simple;
	bh=ZLf5T5Ol5CCMA4U4BhiBhJNcGyDW7tXKHw85gt3d2jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxuzxadyWB9DYPy9uXtiqebj/+qil2FgzUNC0pKC1xvSeg7K9AeU76sramjM2SQWmqRI8EOG6UGzFl38SFgDi7XqeWeXuTWfkfvO3zMsXLITYMV5URymFM6s7FuqAV0ipOoIugStnKo4aBCFqIQSBQZzruFIPvREZ4/tfOGq9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=B7Fh0gch; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="B7Fh0gch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pu
	EzzfIfWwzRJ/zNxyRZDGcoJnWQ6eEJg9eSNjAqfo0=; b=B7Fh0gchsrav2ZLM62
	gpStOygzS84AztvKTh2HoZtAfe41g52/EK65LqP2GmoW0ljaYRTVPli3y4NBAsNO
	3WxTFc+M7Cv5u/aVYZgnEu1S7h+ZJgLSg0VWQ7d/cb0q9/rAdq9MAA0aO7Ql2bYL
	3ShaNhucLKduCTEguYhDdLAqQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3L54Dv05ovyaWIg--.33417S2;
	Sun, 15 Jun 2025 20:39:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: sboyd@kernel.org,
	zhangqing@rock-chips.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] clk: rockchip: rk3568: Add PLL rate for 132MHz
Date: Sun, 15 Jun 2025 20:39:05 +0800
Message-ID: <20250615123922.661998-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3L54Dv05ovyaWIg--.33417S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw17Aw13Ary5CF47Cry8Zrb_yoWDJrbEgF
	yUZr4fGw4Fqr95K3ZrJan7u3y0qwnFvFn5Ww10ya15Ga4qvF9YgF4fXw1kC34UJr42gFZ3
	KFy5JrykCrnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xOz7UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hJtXmhOtCzZuwAAsv

From: Andy Yan <andy.yan@rock-chips.com>

Add PLL rate for 132 MHz to allow raydium-rm67200 panel with
1080x1920 resolution to run at 60 fps that driven by VPLL.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index d48ab9d6c0646..97d279399ae84 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -79,6 +79,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(200000000, 1, 100, 3, 4, 1, 0),
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
+	RK3036_PLL_RATE(132000000, 1, 66, 6, 2, 1, 0),
 	RK3036_PLL_RATE(128000000, 1, 16, 3, 1, 1, 0),
 	RK3036_PLL_RATE(126400000, 1, 79, 5, 3, 1, 0),
 	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
-- 
2.43.0

