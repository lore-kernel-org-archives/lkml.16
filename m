Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236D223DD7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213468; cv=none; b=H6cjEo1zCyrFBlLmxKVJ2BOsYVN+BVhp3BNXTgNdsdcpDQ5PhA2iufqKXl03JE+vmHW9zk7M76qtsrveCnFs6jniGozu2cdJP4glgy67bfyJCLLDSJ3hEBmwjekC7oronDWq1NJq0E/arvNCvM0HDMkFvfEiXCWxRAOZswZtT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213468; c=relaxed/simple;
	bh=z+fJpQEL5tFLNSD56mZ7hzkqnnnTts2E8ZIBSo41csY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJhe5TgF+TEohFkSqkQkZSD4AxJey3OLrPAqmipb5V+SwrE5x1V5gt883oKZYQUkqI70151ehkJ+oBxL3wtfynsOfGUCJQlu1HwXjL7nMcRgVpSa57LvCzN0z7XYrPN/qjRMKvulxZAcufBE/ICRZoMPLjfy9wWksde94CcqQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Iz2+4r4E; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Iz2+4r4E"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0ac853894so5729009f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213465; x=1747818265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z4P+OmufwJtvHe7VRG9Qw6SM4vHtxH+ac7R9RSX0Wc=;
        b=Iz2+4r4Eu5V/lFqPnHj4frmkf/324unyRDZJJaUygSEgSf2AOhtmGF0WsEkriLFWqk
         kJMDOMO1beyR4oZOMhDHdH30r6GRzJcdnXlvfy5pGSsXOMPXM172ThBUg6wnNlw78EgC
         7UqvrCoJ+aTwAgkh65S0xVH2pSH8DftaiCnJmKeu41pSd1y970jDd6bTh34hHmB/sHoa
         2EKTzeA57MfSqFwH9rk2UOkFPlAhBadcGYk2vBSyuT9c6LJ+us1VjybBI2oPa89EfMhh
         3kbN9CRQPvMrLuMjG/+D+VVnIfMMe7r4hR9D4AvmbGYyBXjzNqf9oVJ9rrcr7AFyBVE8
         9uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213465; x=1747818265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z4P+OmufwJtvHe7VRG9Qw6SM4vHtxH+ac7R9RSX0Wc=;
        b=nM5XLQF4K8P9A5NPRQI9yPutChAectYcCPrJxBRd+pyrcloYHVLi4jVMUcPfUNMd1+
         kmNK1o3JB/7LhR7Vj1L4xwijSkQJ+MOgSvA4xzWrhPv9SUJX9XQb4SVhS4yTfzD7eMPU
         PtfYE2jA1smmMhyxcVUhnrl/TEliZQsFhMV6GsIg2/jriW+793zFmdR4NSTNk+tjGdgY
         bvQQsyCLdQQQOXcVtDzTulGOfyQ98And8dFQxHxsJJdHOngof5XrGpDLq5KUSDE7/7Hw
         zIviFaW6qtvxkf61vmXsr8H5tfEvywqPLQShahBF6Baes/wZohjMdLPniZKyf4m7640n
         /JPA==
X-Forwarded-Encrypted: i=1; AJvYcCU/wSxz+vBUIJDbD7D0S8KF1Od/8mO5pUiI7GEzarRPTYbkFibW0J8sVGW8xg+gS1gEKuexjZTs6AY/9w8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVVc4qJMxAs2gfZxrhWNusPDAW1iImsYXLGbzg0JmAcsDIxoh
	jhS4WmIIZ0c+ZtgGmgUsrRj//8B4MwSoYX8jIqXdbQqh5B+8ZxLhaZonhu7xx+o=
X-Gm-Gg: ASbGnct0mdfueRfiUMI7ZX8YTo+VbHDeD8xQPahOJ9t19y0L40q/C5ucXn+FUngyRlb
	hSyRccn9gbE7Yd+IoFb1TcePIC5IkJwRCbXJteolAEmBot2Dh1hRCAxBLK2Lyc1S4Xi77Jj2KJX
	BEsnI0GcfflXlSphcFxNiAYj0UFIh7lr8XZFrENNwC/cVSwLPRu/Bb9odFsAmEc4hSNSZlz8Bql
	/KMOSWq36vuGzlcBnlPOGzAb+G2rWoqxBkwBMPdPh0wlzlwcMsQFNJcs0iQslfVlAOs/T4iBDgn
	PTr7U4c22zKrhfArlkcRA8PMbc/jFOEbi5OeywZPTnefkZl36dFw8R+YWdz5F97d+GUUG/xDWl6
	MDmDD
X-Google-Smtp-Source: AGHT+IH/xnJf8OhD2UyddPs9fn8NZYZRYKnhkQGnPGNMx5KbE3arsLz1J4F7/4sXv5p5DqIDl26u5w==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1851225f8f.22.1747213464674;
        Wed, 14 May 2025 02:04:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
Date: Wed, 14 May 2025 12:04:09 +0300
Message-ID: <20250514090415.4098534-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder the pointer members in struct mstp_clock so they appear immediately
after the hw member. This helps avoid potential padding and eliminates the
need for any calculations in the to_mod_clock() macro. As struct clk_hw
currently contains only pointers, placing it first also avoids padding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- moved pointers after hw member
- updated the patch title and description to reflect the new approach
- collected tags

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c87ad5a972b7..767da288b0f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1185,19 +1185,19 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * struct mstp_clock - MSTP gating clock
  *
  * @hw: handle between common and hardware-specific interfaces
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0

