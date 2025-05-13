Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959D1E501C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133620; cv=none; b=tM13RqOLVlEYx3zC+6yvTduv+/JF5OxVRmE9Hh1Y7KGTFZ2GYuE8dKt3znF5nMhbygKI4CNRe+ryNbSpuGNH4zMTU6/T5paPLsidGuXVZXvkI9tx5khbqtSc7mr9fesp+tOcNXxbyJiti1WQp8Do9xY/vXl1KBZIvIJ9em7gpBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133620; c=relaxed/simple;
	bh=Yp/hYUcUbaXA8mTp0WHXUGzdIO99wcOlTKK8WPeN2j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MthY0ordxCFTHnWUPBTLUIy3VWp3qD4j+gB+NzQoJnFoz9SFWiPHYkTuuIvyvY8+GEgqjD4Mzr33azSOFSoa5Rekixhv9nAk8IxxkdeOt/K6ZgV2/o+0b2deA8pSDOkovSAu9225QApMMvKtWoUA3ltrLljsiRcV0Sx15OREbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roInpxQg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roInpxQg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so6638725e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133616; x=1747738416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nlKWNB2PlyE1woD04U0eE/T9QpSFzlntnQB/EQohvE=;
        b=roInpxQgBpj4y2a5ZEBfawPS7Jz2O3h7nf2T7ynhR52tPuRXV5U6KcCJnOtPzPlG4Z
         uDtFX7dav8Kq70FrK/1R39LPSea28HdslS7Z+jWopRxEvBkv0GEoD6s6B1/pH85AoHiB
         EqvgDfIXqNHNTe8KvEg4wiGl9/D4isMJvWczhVUQLk6fPfGrjQIROo4rHCi1M6kR+Vm+
         04JpZqNHAmvKa+v3ftfJ0qH+BQmlRH0NSVYwUxIViDdE/jG0ZFqOqybuaIAQfdSmuSgq
         cmWcy4wQgeg6yb9lUJ+d4eb+zcjwep1ePCgCj9mb0jIQgKO0nbBEMbETxc3PkePJxluN
         gt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133616; x=1747738416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nlKWNB2PlyE1woD04U0eE/T9QpSFzlntnQB/EQohvE=;
        b=rgPP34KgcRQO7u5EjxRvnzKJ35LtYaxfsVGQ2E8uP2ClIWb1EZrrrk7VB+fissWZ1z
         Mi/w7m5gDf9wrghIKSfzm1w5S6iLS0t/1wj0uZTL1upOu6FKRWA4Bgwl9BF1CDaiESiz
         I4C4thQTnlBwfQOcL/++0psGdxX9dtxWxXvzBgJ0LxkjLHk0oyo2anPilW+3MuM5SLIy
         3FUKWiL4Y/u7l5BUxYirUDNuOM/p2NuHGEnMxjnwviC7SBhAzqjrv81jCYQ/PSCiZy4M
         6NScPYiJrUOPwWwlgU6Qm6MztjsmABHpk7YF8iRpbitG9MqZ7KXAYsGdl8OMypRKnADP
         cCYg==
X-Forwarded-Encrypted: i=1; AJvYcCUG/DFZ00rFhCFHA4tj7G9SCYLsB5lnOZpDFavxCFbm4rZi7JL3a+Zd24/FIv7clroKnPKeMmdZdky2YcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+zrfJFG1fRwBTjZBd0xX9kxGpX8RWSsr+w0Cn27d24WonRfK
	KI2HEABilNkOOEB6+U0PNR5fDZywYNIA90mJM4EzkiAcGkOLgoLGbMESr+0t3MA=
X-Gm-Gg: ASbGncsNySrGC7EVGjRESUueZoH0dq+NZqUnZJlId01Ga2q+7kzFx7s4Ggb4u3/6Qe6
	mI1WzGA9gIQgprhAS5yUA5Bj+eAjs3V4NuGCKyhcnsLvDpbPiOGq59Xx/hX5UOwJCVyhHXL6z43
	kKQYJlUWJ+4cltRhWGdRsCBgekTRuxC6RcCsreDBA3F446cuTeTLhr3taxmtl4L6wfWjb/1+toB
	j0z6DZOebbQ5umGJGS3/b8FfbXOqDrSVvqwNTgVXnyHxWBMQkNcPgNRpFeHINTAuVNIUPu1FO9u
	CacrXmpGjW7rAlNdWqJ8Sv6/E003xC0AFEAym0kCBK9Y4Xw8gPWOOq5nvwjMxWf1lyPgqOn4ESv
	K4MWst+jdTYrGuDsVs9p6I9DFCtos3KyzFeBh7bw=
X-Google-Smtp-Source: AGHT+IGrLjlMN+HSS6W9CAcu9TnxEK7i/2OpzQuZ6rgKWjvDQgzsaVI87MOR/tabpLsGT2de4cqQmw==
X-Received: by 2002:a05:600c:4691:b0:43d:301b:5508 with SMTP id 5b1f17b1804b1-442d89ca4edmr45217935e9.2.1747133616384;
        Tue, 13 May 2025 03:53:36 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d6858579sm161803955e9.28.2025.05.13.03.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:53:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL] w1: Avoid -Wflex-array-member-not-at-end warnings
Date: Tue, 13 May 2025 12:53:26 +0200
Message-ID: <20250513105326.27385-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513105058.27028-2-krzysztof.kozlowski@linaro.org>
References: <20250513105058.27028-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3184; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ZeCz8NmYDPn45dL8+r9xe1Mjm/VfiPxUJsBvaIZAW64=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIySmVWYuWxA0dvU3ThpK5f32yAyxNzqN6qqMh
 f13op3rXi6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMkpgAKCRDBN2bmhouD
 1wD0D/wKrxwmcq8c5zeikt3jc2cdiSJaoVWM6+EjF2Cn2BDb/y6eAkal7S7Vvr+iHq1jl+K/n+H
 xp+jHfFfFTVjkxeHITlOTbxK9/h1Mf18eXHFwj83YM8OssqccNba1Hgpy37HWjMrkslaoCwKGea
 PzffA7n7Upih0MkWSjvqtmuSmDEOFjSuk21rTRuI9pnhSLCSMVAj6vZgW8BKSxfAWDUO6hZDQcl
 lpmCq4/l/hgn8y0udwYB+zWOdgvwHC5PcIazp9Q5dFTgyIuUmix7+79KosAD4lzTJl9i9YBsExh
 MJbcTDtaq0aC7QG2ZSPtRjZyURKgpz360LZqbbJO/9+4dKqgyiTMFCU1dVchDORVQR0XpaTduIB
 tKI2bMOr+ixUFZq79B0wKdk9ENoVV7m4xgRu3ti8GQNOsOD1yUU0pwEkuSfgB6+BCLHY/XV6d8J
 RN+kDoq95+8fSQSEue4sk0iYgi5320qIXMOlEoVmgQZ/ccyabHW+MytmJSuuAt1Sm4zq7JQ26fx
 1X2G9VVFG29dwIEDvFaBBr3DXJaSyh4PM3tOXNaS8TO8HPRLOR0rRIHRni8FZeff0T552zsEpz+
 A/MhjzfqGiORLP4YLaDvnQLI6YLNUXmLGvZnz7h2mkwyFobKQR7T4gqEyqrS3EfNQLkixqTyjHX UjlFtKgcBlm/MEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: "Gustavo A. R. Silva" <gustavoars@kernel.org>

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for on-stack definitions of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warnings:

drivers/w1/w1_netlink.c:198:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/w1/w1_netlink.c:219:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Link: https://lore.kernel.org/r/Z_RflBe5iDGTMFjV@kspp
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Hi Greg,

I have one patch in w1 tree for you for v6.16.

Krzysztof

 drivers/w1/w1_netlink.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/w1/w1_netlink.c b/drivers/w1/w1_netlink.c
index 691978cddab7..e6b59d921076 100644
--- a/drivers/w1/w1_netlink.c
+++ b/drivers/w1/w1_netlink.c
@@ -194,16 +194,16 @@ static void w1_netlink_queue_status(struct w1_cb_block *block,
 static void w1_netlink_send_error(struct cn_msg *cn, struct w1_netlink_msg *msg,
 	int portid, int error)
 {
-	struct {
-		struct cn_msg cn;
-		struct w1_netlink_msg msg;
-	} packet;
-	memcpy(&packet.cn, cn, sizeof(packet.cn));
-	memcpy(&packet.msg, msg, sizeof(packet.msg));
-	packet.cn.len = sizeof(packet.msg);
-	packet.msg.len = 0;
-	packet.msg.status = (u8)-error;
-	cn_netlink_send(&packet.cn, portid, 0, GFP_KERNEL);
+	DEFINE_RAW_FLEX(struct cn_msg, packet, data,
+			sizeof(struct w1_netlink_msg));
+	struct w1_netlink_msg *pkt_msg = (struct w1_netlink_msg *)packet->data;
+
+	*packet = *cn;
+	*pkt_msg = *msg;
+	packet->len = sizeof(*pkt_msg);
+	pkt_msg->len = 0;
+	pkt_msg->status = (u8)-error;
+	cn_netlink_send(packet, portid, 0, GFP_KERNEL);
 }
 
 /**
@@ -215,22 +215,20 @@ static void w1_netlink_send_error(struct cn_msg *cn, struct w1_netlink_msg *msg,
  */
 void w1_netlink_send(struct w1_master *dev, struct w1_netlink_msg *msg)
 {
-	struct {
-		struct cn_msg cn;
-		struct w1_netlink_msg msg;
-	} packet;
-	memset(&packet, 0, sizeof(packet));
+	DEFINE_RAW_FLEX(struct cn_msg, packet, data,
+			sizeof(struct w1_netlink_msg));
+	struct w1_netlink_msg *pkt_msg = (struct w1_netlink_msg *)packet->data;
 
-	packet.cn.id.idx = CN_W1_IDX;
-	packet.cn.id.val = CN_W1_VAL;
+	packet->id.idx = CN_W1_IDX;
+	packet->id.val = CN_W1_VAL;
 
-	packet.cn.seq = dev->seq++;
-	packet.cn.len = sizeof(*msg);
+	packet->seq = dev->seq++;
+	packet->len = sizeof(*msg);
 
-	memcpy(&packet.msg, msg, sizeof(*msg));
-	packet.msg.len = 0;
+	*pkt_msg = *msg;
+	pkt_msg->len = 0;
 
-	cn_netlink_send(&packet.cn, 0, 0, GFP_KERNEL);
+	cn_netlink_send(packet, 0, 0, GFP_KERNEL);
 }
 
 static void w1_send_slave(struct w1_master *dev, u64 rn)
-- 
2.45.2

