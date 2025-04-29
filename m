Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A853255F50
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970430; cv=none; b=gdkfhRIAOQE0y16iav5BulPsfJGf2E3TmA1LAU/oqkKE6ky33gpd5msd9N2+0v+JLLn8v/0bkTyf77JRN3dXFYxZxO5Tciv8viXI8TbBidFkJfJo+dlpAXhI0QgU2iitCDXVcW1WNEO7toZ4Mqq4D5zUuyr36z+0JVX0sINt594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970430; c=relaxed/simple;
	bh=lqFpTzBKH0n+hLPP3D74zDTrtj3ZCOQgeEHM7+9pKZ4=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=AQEnRsf4mfO3eTY9oOk9k2z1hw7Az+Aoy+5+I325DPLuRFV0V0w5ogHa3M49csnk/c21e6zTo/MtxL9QeHbLRSVk8gwFHb87Bhukmmj0LGbD6AV9LMBGThJxEfoRdyIxFSZK56zc0QgP2CT1Q3SHFswdhBTdEAh0gu4JcC2xGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m2Oten3T; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m2Oten3T"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73c09e99069so6555692b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745970428; x=1746575228; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rHgN+FCfcpWxKWmUBcvDV+CDR/OsUBfRs2x102Mf4zk=;
        b=m2Oten3TacdjncZXnZwfYz/0bAs35CDRIRa3B6apFcHEWS124i3a4+mSgrLAn186Ca
         8a4rjrF0qHBNKhWXPolP+HnFxqd61iHlDF0Rf/SNdzBi7KhyBcdbrBWTUQDQ2u9a0tbZ
         6dWtN2wg+cmeFSLobbRs7cxj5d9B0nUC6/1EpteOTFcGErTne1fNHzHZ7f8a0GlS83WC
         2O/we83avKo8JAQGU5KnzomJviYacpgJGH+mc+X0hi7kLGlYDmak+UL3eHkttSVSusx8
         oer7vkXC3D2dfYB65q0q2HwH94Hf98L0hVnDaL/1dsjZ5nGwso9MzlDMDZ5NE5cfkiRe
         syqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745970428; x=1746575228;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rHgN+FCfcpWxKWmUBcvDV+CDR/OsUBfRs2x102Mf4zk=;
        b=bJmBvV2VdLhAuMdHwyvb1RkD5mhaQ+hUeWQVSnKd+TO5MFVM+bMIsdpCtCAhcz4Agc
         ADpyDHqnX+cU91rrkoMylb0TW4/A6kCNr0Ki3fZgyjtJULdLh/FA/WweuMTRYDcUFb6R
         hd5BNyV5EeOf9PLynzM9fhSdUXOCn6QHiZSfdFE0yTGYb6LA7fSr4ozN15Fwqyp5DUVi
         hEA0ii7WsMBEwR8pqYEvcd5qhssfV8pInpfXXvEXVAeQRmQWLs6gAKp3eWcl6/+roEYq
         /GX/Dw4tbPM2BxfRRBlJWF3H8lxAkC0UVXhk3J5o4RS4MTnnxS6JxwOzGb+yu+9Fsb+K
         c60w==
X-Forwarded-Encrypted: i=1; AJvYcCWMZHJ6LMgSAH6HkjxTrGtg2Pa2cbo/TcIVcMTh8+WU+L9z/oJFgIeLcC9l/WvhBmrw6knNdu497K8l8Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxLT3Z10wnn1tU/FCG5QJEhWuHvtNzfAwsdKP0kZ+9YXlR/JX
	DCeUYIx+62/onIrU2xaNU0sjgHI5NzUL8SYO5qLpgW9nxEN0Bek2nCUFTgTHkc5E8OlhaH7GiC7
	DoLCJ4QMBc8uL8Q==
X-Google-Smtp-Source: AGHT+IHJSCSltg+/WIvPA6Nl6fDGEhdVNbCCtrD4AIszlnjDqDNJCFlblYduUzbVm4fXKSyRzxB9EK7JCUQkCWs=
X-Received: from pgnm17.prod.google.com ([2002:a63:7d51:0:b0:b15:84fa:ff1f])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:e94:b0:1f5:7280:1cf7 with SMTP id adf61e73a8af0-20a87c542bamr1146783637.16.1745970428604;
 Tue, 29 Apr 2025 16:47:08 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:47:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=rdbabiera@google.com;
 h=from:subject; bh=lqFpTzBKH0n+hLPP3D74zDTrtj3ZCOQgeEHM7+9pKZ4=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBmCKd9jVzPEWE+SSrfKeOVlefIr47ZZgRELovtfTD78I
 zOVdXdlRykLgxgHg6yYIouuf57BjSupW+Zw1hjDzGFlAhnCwMUpABP58Z2R4Z39tc+rWv++8FLm
 FvHh9P/j6cJSI/Uy9HDYjEsd03i38DD84c25lzGD5yy3dIz5rdjZusJGkve3vA/pufQr/I70Zd9 1nAA=
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429234703.3748506-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: tcpm: delay SNK_TRY_WAIT_DEBOUNCE to
 SRC_TRYWAIT transition
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch fixes Type-C Compliance Test TD 4.7.6 - Try.SNK DRP Connect
SNKAS.

The compliance tester moves into SNK_UNATTACHED during toggling and
expects the PUT to apply Rp after tPDDebounce of detection. If the port
is in SNK_TRY_WAIT_DEBOUNCE, it will move into SRC_TRYWAIT immediately
and apply Rp. This violates TD 4.7.5.V.3, where the tester confirms that
the PUT attaches Rp after the transitions to Unattached.SNK for
tPDDebounce.

Change the tcpm_set_state delay between SNK_TRY_WAIT_DEBOUNCE and
SRC_TRYWAIT to tPDDebounce.

Fixes: a0a3e04e6b2c ("staging: typec: tcpm: Check for Rp for tPDDebounce")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 784fa23102f9..87d56ac4565d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6003,7 +6003,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 	case SNK_TRY_WAIT_DEBOUNCE:
 		if (!tcpm_port_is_sink(port)) {
 			port->max_wait = 0;
-			tcpm_set_state(port, SRC_TRYWAIT, 0);
+			tcpm_set_state(port, SRC_TRYWAIT, PD_T_PD_DEBOUNCE);
 		}
 		break;
 	case SRC_TRY_WAIT:

base-commit: 615dca38c2eae55aff80050275931c87a812b48c
-- 
2.49.0.967.g6a0df3ecc3-goog

