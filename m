Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE02054FE;
	Mon,  3 Feb 2025 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588312; cv=none; b=jN9PpfOk6EVVZRAwtOHgdxNRhcaAfjYNq2q+m7nIf30VA4irytw7Vsy4szvFVMRlDO44ME4OlgeYTgsqP9CdbFQ0/tKlcRWWxzTUot+gzYLNe2OqhtAj/cdA98JhrSr2GIdM2sjbCleIs74b80gNImcbApoCrCDcV6AWah5GdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588312; c=relaxed/simple;
	bh=/kUKPWCuiO07PV8wX+eiL75OEyrHSx5RcfpFsjZDG/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbmD7If0GBNlwMAJjuljXSN4cE8+Pqm6dec36O2p6TDJe9n2xOARQ7agINVBRhbcvRdroNM7rB8LZ7sbTsHHnBrVopwp95RiGB3OedoSzQjD79taScO/rfXNvXl+jz9sV41BtYCqUNLEGqUQPEH4ZNb84xJVcu09cAYQtKUtOZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/Tu1xXv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/Tu1xXv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21661be2c2dso71411685ad.1;
        Mon, 03 Feb 2025 05:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588310; x=1739193110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDJizsvXaw9+teo3wUwPkWJCqORZkNmTQyuSkt5H4CY=;
        b=R/Tu1xXviQ7NcPSxGHEdzVPunZZ0m6slMxzZimLBpQGtcuSS2+/UbH3MT0B4ktBqNk
         oTBsN7D3mJlfHNsSappFQFl5oQbTBzh8ArTnclGGudV8ct6E771OlfB1SnCowjvQOrU2
         OmZ7f7Pn2IBPqMq3hlHLpeOoiJ7VsjUQyrJ97XXYznN7pMmZ8rLHEFjRsbkp7oa3yqFR
         Ys9K6oy4Lbyxhbf89JVvElTx3L/XzcBD15hGTsNkMx95qLYxATKTxVvd/52O5O0p18FY
         XeHYWypTaQ75scY8S2gwaT053U0kX4J/tX6WNky5YhVyQ2Y6pwJ9aKvjgCFDMa74rLjT
         DfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588310; x=1739193110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDJizsvXaw9+teo3wUwPkWJCqORZkNmTQyuSkt5H4CY=;
        b=OcENpwby9BzxMPoDwCHaHMNZeoJBZTp9d2o78x6S8rr9W8atLBXpyqXj5gH0fsAmZ2
         7Qo3DexvW4d4fAWneOZlkFCIpte1NJ3z5lDbDBD8GIITVqQchr7W9uqfYfa2gY/LnDYc
         Uisp53wkpPcUrX8LKR1vz5ZmygqiG0HOrPI6kkfy8tf8hpDLeGMVdUkaFVKUWpX5X27R
         llQyGjJAxWJeAAqm6+4344YLYQvpqxWd3CCzenyy0Asafr0VuLRjpwC242bgcykJOPAh
         ejRQ+fKckwm8hDVH01y5Aa1XNjAUEIBSORKv1SK1wKi+JGFoJ6jSSkAPlYlFpPEEAvuZ
         m1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtZOv+XPO0N9/hsQmEb60lg8fiaRawI3ngDgSPW0eZSXFpL9mU5Fn/8TTsaY9A64LSbW10eCxZ3G+b@vger.kernel.org, AJvYcCWqStASMFhENLP1Qcmkc0N5mckBW8MWEuG/gsT1mvA4eC3umW74EVnTQQV/mQAU61LadE5d0Vlq0YDAEu+V@vger.kernel.org
X-Gm-Message-State: AOJu0YyNA7dNkwxxbyslh7KBTGvbB1VIPsXmETrLp2cT87N/5wUFHYXA
	PQ50Dvol1GKKkPFEEZtplu+7NDkaW6heWnTL7DdnpareXQncpvCi
X-Gm-Gg: ASbGncs9cpD6WmXAsBzQ39cAtkwDi6uFbWMRucxkkAU5Sgg/hz99LdIu7E36x5PxhkE
	2+7ZydXp2Nu2X3QTUd/Yu4e5j0UJWpP+JJgjEhbofGIcy5KaIhH9Bqza0k7WUmHxQxOKJ5VudUh
	Ch8xpJUOZfE1s+01JDShzU7Ev5u1Cu+sDb1R357gV85uytJkkPY9nlsYslu31R1z9j4K/plnVeg
	KFnxUmwDTyPwZVEWteRmSzbrdPUEWzu/Qp0xnlr3KE6wyOBrBZp75kBLP5+3Gr2eIYn7ByKwG8x
	cxGdjY23VZOmi9/VsJ+6tyIhD0I3cj0VPN/Yu0dJ2p7PixXmrrCDWx/aTren+9mHZY5L
X-Google-Smtp-Source: AGHT+IHvk6/UEgPuUarQoM3QIGf47jIEwUV97FOhse5NsNON8UUQENswlYanuyKROZD7+6+YsdUArQ==
X-Received: by 2002:a05:6a00:244a:b0:725:f097:ed21 with SMTP id d2e1a72fcca58-72fd0c62288mr30218643b3a.15.1738588310373;
        Mon, 03 Feb 2025 05:11:50 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be3csm8377629b3a.7.2025.02.03.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:11:50 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 03 Feb 2025 21:09:14 +0800
Subject: [PATCH 2/2] ipmi: ssif_bmc: Add support for adjustable response
 timeout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-ssif-response-timeout-ms-v1-2-6fe279740181@gmail.com>
References: <20250203-ssif-response-timeout-ms-v1-0-6fe279740181@gmail.com>
In-Reply-To: <20250203-ssif-response-timeout-ms-v1-0-6fe279740181@gmail.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quan Nguyen <quan@os.amperecomputing.com>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738588302; l=1887;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=/kUKPWCuiO07PV8wX+eiL75OEyrHSx5RcfpFsjZDG/U=;
 b=6Osmui4mmnSoBdZ1gq0ddokpf1z0Xv5oKdw5ZwDKeeh07nb1EchIXM0IDY8TT+h+DkK/rim1B
 L1S67E8or2BDDYV7xxZSB+Phz0qXdRGzMx2ulkUpkk+1OR2qQ8mhX57
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

Implement support for the `timeout-ms` device tree property, allowing
platforms to adjust the userspace response timeout as needed.

If `timeout-ms` is not specified, the default response timeout remains
500 ms. This ensures compatibility while providing flexibility for
platforms that require longer timeouts due to BMC or application load.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/char/ipmi/ssif_bmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
index 310f17dd9511..8f0fbc941936 100644
--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -87,6 +87,7 @@ struct ssif_bmc_ctx {
 	/* Timeout waiting for response */
 	struct timer_list       response_timer;
 	bool                    response_timer_inited;
+	u32                     response_timeout;
 	/* Flag to identify a Multi-part Read Transaction */
 	bool                    is_singlepart_read;
 	u8                      nbytes_processed;
@@ -331,7 +332,8 @@ static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
 		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
 		ssif_bmc->response_timer_inited = true;
 	}
-	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
+	mod_timer(&ssif_bmc->response_timer, jiffies +
+		  msecs_to_jiffies(ssif_bmc->response_timeout));
 }
 
 static void calculate_response_part_pec(struct ssif_part_buffer *part)
@@ -809,6 +811,10 @@ static int ssif_bmc_probe(struct i2c_client *client)
 	if (!ssif_bmc)
 		return -ENOMEM;
 
+	if (of_property_read_u32(client->dev.of_node, "timeout-ms",
+				 &ssif_bmc->response_timeout))
+		ssif_bmc->response_timeout = RESPONSE_TIMEOUT;
+
 	spin_lock_init(&ssif_bmc->lock);
 
 	init_waitqueue_head(&ssif_bmc->wait_queue);

-- 
2.31.1

