Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0B170826
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792486; cv=none; b=qGj7ztr2I5YRdMP+2e9+kK8f/t93mv3+f109BA28749F31WjuaH8OwvFlvqsvWBiOlpAFhEWoGiekNnTdM1i6HTtgnoMVTkWCT/P4Z3vKIy1O+Uv6O37YWLlucT/5GSQ784QBopepGYw3oZMrPmVoPqLijUkqvmNOcSrv0COI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792486; c=relaxed/simple;
	bh=cK7invMTv+9Zp7Jn4wlj0VrbbXjyQPoL+BsvlYDJisg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PIMAJA7+qlA6c0qIP3alyK3gH4C0swsBKwYhIT2dj5OZhdSwni8oKTcNOV0jvmeuCYq1OQbiqRpLno2tgWtRCdSENlAvbJnzcQGnIda3hzqSnI9kI9BM4yc6FJoxdeXWLzrC6f6dKz2eeZmnNvjfOGzMdIVJtEABFEtenYSG8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=2RSihIXY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="2RSihIXY"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so148192966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750792482; x=1751397282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i758Ky8oE7yqylYD7uxqKekAUdnnIo9/om6cPhIxexM=;
        b=2RSihIXYBaARMmmAJsJDzbRT0yLw4QdNW2T3Rsu92AEGdG7uhAPc1BYJnCDPPyAcRz
         G26wW71Ihexpl87JCL047vogM0cmt3fz/XOkUqlyhRDt1vsCl4cIX2lYJJDGVS7HJbAZ
         M0wkr8+CbSJzBrg2Lp8ySqOuPkfv8HVAPjEKrKZePn7supzsFiGA9e+yw2UCrP1DLvJl
         BOMxMe+WACJsgy1Mg18kZ61k4BmVAD4QnXxFgsvKBUzbjqd9K/PR/AqgL53vXzP6i8ex
         eCyJ47Gi+rigFro+n57xIjtywkhvdSYyKEEFeM4y45YpMz6So8NNxVFiBsIfYLlAXsz7
         hJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792482; x=1751397282;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i758Ky8oE7yqylYD7uxqKekAUdnnIo9/om6cPhIxexM=;
        b=GwarIh8ysEnzfyv1azASIvTKTSE95p1eXePzj9pwaQDSWT79F+7pwS6mLQDeKTTqje
         PHBPRyI+BhiSD6wKDwZosXjqdmWoVnSz7cHKR5zNEQqcxl+RpYa5+4lv9mlg8BdcFQrv
         2t2pb/LGWCLPhcUbs9VCnjf6DyC2pEumplrI8llCuq3JrGDVjCOsSNt1Evm0eCBeEpUx
         gmxYwjwxlnSzwVuLOlmueZvN2kIkcS6etNiglBdBwUFChz9tm5KjgQB4VzLs7vNalxpj
         IVNNh6BI0hbhCF5F0lZ9GOnPUrXmNaaUzzPSjDZHZlwvgebwOfY/kHwmA8I2LddOatE/
         DlUw==
X-Forwarded-Encrypted: i=1; AJvYcCVHtomPKPTnnYrYIg/8m0VB8UFUvY/pvbAH4VznsfNtw2UOGGr+WhmZBWoPXTAL8TTK+FHWklrr0rHoy+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLbJw4VIlyO7PRK9cIoyuwm7Hd03b56GDuXZ23qjesEtopoZH4
	Nab2bGw2SsAuKQqkU5u53oMW5Mscd5xU6VEYE42IIZlVUMYYpeSRy8D+UHq0nIyB4g==
X-Gm-Gg: ASbGncsuwfMBsYdoSvQ2WxZjJc2RJrUhMM5P+UdlmT02zbJ1XYFmKg+QTflQVViJAuR
	VXcpxam01t+ZYHvMqO9UVxzAJB3hP/Hc6H2IRO+vyePemMP5LvJYzwuQVr46mDDqDhkUjFBSEI6
	uccKD+LFmTedVQyGlDRVZOcv/72E3YyiiYF4dYTnd5mayAamUO5rdeLme9L7w+OC/6FfwGM9WBB
	o2zisnMACJ/gcP17w2CSVuze79zrlc3SnGuFDfopLxw2NDIaUHUJ1j/Lvw/UtQED00uS70Nod7B
	pB3QCGsrWTYSGcXcTjLrn45u3fUR6ScpQZ5WC9Gg58wBlPKBuEQF95iO+RSoZQTr
X-Google-Smtp-Source: AGHT+IGh+3ym/VJWtnmWq08iSJurV2ZoLlMoR+D33CMj9G53fcjK4wozO3Eitkg2sk8zbnY3++b52Q==
X-Received: by 2002:a17:907:9622:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-ae0beca03f0mr44977866b.0.1750792481952;
        Tue, 24 Jun 2025 12:14:41 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b5b764ecsm83597666b.5.2025.06.24.12.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:14:41 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <5c75ef9b-12f5-4923-aef8-01d6c998f0af@jacekk.info>
Date: Tue, 24 Jun 2025 21:14:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/2] e1000e: ignore factory-default checksum value on TGP
 platform
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vlad URSU <vlad@ursu.me>
References: <91030e0c-f55b-4b50-8265-2341dd515198@jacekk.info>
Content-Language: en-US
In-Reply-To: <91030e0c-f55b-4b50-8265-2341dd515198@jacekk.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As described by Vitaly Lifshits:

> Starting from Tiger Lake, LAN NVM is locked for writes by SW, so the
> driver cannot perform checksum validation and correction. This means
> that all NVM images must leave the factory with correct checksum and
> checksum valid bit set.

Unfortunately some systems have left the factory with an empty checksum.
NVM is not modifiable on this platform, hence ignore checksum 0xFFFF on
Tiger Lake systems to work around this.

Signed-off-by: Jacek Kowalski <Jacek@jacekk.info>
Tested-by: Vlad URSU <vlad@ursu.me>
Fixes: 4051f68318ca9 ("e1000e: Do not take care about recovery NVM checksum")
Cc: stable@vger.kernel.org
---
v2: new check to fix yet another checksum issue
v2 -> v3: fix variable bein compared, drop u16 cast
 drivers/net/ethernet/intel/e1000e/defines.h | 3 +++
 drivers/net/ethernet/intel/e1000e/nvm.c     | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000e/defines.h b/drivers/net/ethernet/intel/e1000e/defines.h
index 8294a7c4f122..2dcf46080533 100644
--- a/drivers/net/ethernet/intel/e1000e/defines.h
+++ b/drivers/net/ethernet/intel/e1000e/defines.h
@@ -638,6 +638,9 @@
 /* For checksumming, the sum of all words in the NVM should equal 0xBABA. */
 #define NVM_SUM                    0xBABA
 
+/* Factory-default checksum value */
+#define NVM_CHECKSUM_FACTORY_DEFAULT 0xFFFF
+
 /* PBA (printed board assembly) number words */
 #define NVM_PBA_OFFSET_0           8
 #define NVM_PBA_OFFSET_1           9
diff --git a/drivers/net/ethernet/intel/e1000e/nvm.c b/drivers/net/ethernet/intel/e1000e/nvm.c
index e609f4df86f4..56f2434bd00a 100644
--- a/drivers/net/ethernet/intel/e1000e/nvm.c
+++ b/drivers/net/ethernet/intel/e1000e/nvm.c
@@ -558,6 +558,11 @@ s32 e1000e_validate_nvm_checksum_generic(struct e1000_hw *hw)
 		checksum += nvm_data;
 	}
 
+	if (hw->mac.type == e1000_pch_tgp && nvm_data == NVM_CHECKSUM_FACTORY_DEFAULT) {
+		e_dbg("Factory-default NVM Checksum on TGP platform - ignoring\n");
+		return 0;
+	}
+
 	if (checksum != (u16)NVM_SUM) {
 		e_dbg("NVM Checksum Invalid\n");
 		return -E1000_ERR_NVM;
-- 
2.47.2
