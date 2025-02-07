Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA51DD88D;
	Fri,  7 Feb 2025 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921024; cv=none; b=MV+k33HOA+NW4AOJoYMdcoT+cOg1oaHRP+o1vkXfRe9v6RDQp5oqDua4fE71A7FSxyO/9Zm6P2TOJb7ZToHs/kWxiOR3wR/wb23a16QlZ+/G++0Lj4AZ7DG3GJ+an+OB7cKAp52BUqAmy1OGcYidLHqs8g315XnWiyvYfDA2whw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921024; c=relaxed/simple;
	bh=f8S5Z26MQ4v00FiRKizfZIrEOYaW+rK3aHSMP+4o0HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eYPygVfulTvRIBL5wSYQ2a4wdXZoJIBu6lpBJ+w5P2+vDJXL4YCcQu4zC+HPm5UMsrxcbY1G6rMM1FTxjBofiQLOsTQ39pcgRBu7sTRfmvc43A7GQbKHyUGzuAX+XLSVlLZsQ/H5GjNAVQm0rhsbRPeO7zVqm7JwamB3OLnLlmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+CqAoLq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+CqAoLq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAAE2C4CED1;
	Fri,  7 Feb 2025 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921023;
	bh=f8S5Z26MQ4v00FiRKizfZIrEOYaW+rK3aHSMP+4o0HY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=h+CqAoLqfWodIlcT3E1goZycS0fH2ARZzvspuepmfVQRN8e/4R6ZmXXwAD/CeceZP
	 3LKwJJISJuBYojRQZ+WFiesGfqF9yix1uiYWixcywfkcVG8PvwU9xrw13mbc8SAeBY
	 4uTGNEP62Nw3Blil+RiPt9GWTAR1ZHU6Czpp7irFkEtlBHDKiS56Gkm8+4d/Cf9FgU
	 1xv6jS/D+an01o2ehJWb40AICepUBq+rmhCsl48v4MAzxFr03bhg7qFwv5v3iW1alW
	 qHJpB6pNayqXKm3Dk1Yl2MHib/THDE0eSGTVxTKOXmev/RAhQc6xnnhqC/Zd1oC7FQ
	 uRHhvFiC02bfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE96BC02196;
	Fri,  7 Feb 2025 09:37:03 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 07 Feb 2025 17:36:10 +0800
Subject: [PATCH] clk: Correct the data types of the variables in
 clk_calc_new_rates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-correct_data_types-v1-1-f22bc7ea220d@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAAnUpWcC/x3MTQqAIBBA4avErBNM+oGuEhGTTjUbi1GiEO+et
 PwW7yUIJEwBxiqB0M2BT1/Q1BXYA/1Oil0xGG06bfSg7ClCNi4OIy7xvSioDR0SYtuveoASXkI
 bP/90mnP+AOo8U/tkAAAA
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738921022; l=877;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=kAjBoWOCJ4Ktd9GA2YrUkGuLwEKid48PkvX+9Mpiwa0=;
 b=bOGjHFE86GTkOgfuiMiFJ2HgIDxYB+nL6hQ5zLfsBT3io0i9+CYMt0vF2wV3Q9XTRoJola1oj
 HpJMjHnIE+UA0Xg1yf8L4IHfXfd+Lh0V4FU+6TNriHw4gihEglu4w+i
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

In clk_calc_new_rates, the "ret" is only used to store the return value
of clk_core_determine_round_nolock, and the data type of the return
value of clk_core_determine_round_nolock is int.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b45fa005030..e153d1901a60 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2283,7 +2283,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	unsigned long min_rate;
 	unsigned long max_rate;
 	int p_index = 0;
-	long ret;
+	int ret;
 
 	/* sanity */
 	if (IS_ERR_OR_NULL(core))

---
base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
change-id: 20250207-correct_data_types-fadaeaa46b07

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


