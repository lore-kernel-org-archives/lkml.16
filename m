Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F0A33FD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743809603; cv=none; b=pRYf5RzxMdFEq1plW8C3dPiQyoEGPE3oljKaGKzoR9U0VuhWOjhEZCVDxPDyGsFSuSJih6daIwZRDlag1WOjiFNF6m9odZxAC97R6FmgyYONohEXJuZndbpAMR/2i9cMn+MTc1YRaIkBLBFaRVCm9pyLHm2n4rjF+3GEHL8XWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743809603; c=relaxed/simple;
	bh=F01ob2aLQ3liUe4JNIsCv844jx2uuMudGq8B5gfh9E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2KHGZPItgMc+EBr15tMrb5KzBq1b7DkomAIGG1LI/tJS1pmTeshVxxBpcDLolDQ9YvI4zlr/Q4qyH5TCORF06bTx3GmI9fN6HGcod3soB2zGCrsZ7jlX2VCVl07xoUr+7CGlTzOKGw4+3rMnPgIKCEAOlAbWOLA8mBNwpjZS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjfIPsc3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjfIPsc3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so4784206a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743809600; x=1744414400; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4EP4z1mChh3kJ48ZHpuKiS3iu2fY6RHMQL3FYeKcgZU=;
        b=CjfIPsc307nD5aONdSO26TccQFQmb2eObHvwOmbG+RdS7hYiYC1Y6tW5o7yVfr3GAj
         HGCpSJkEUMOkq/F3Ifz06n+gaBAE03B/o4eJCN1iaVXy2OKNncO81m+UllvuP95bgEYG
         jztQtNfp8v9/wWlTccHI2y6H7LkEpm66sI3grRBtfVEWVX16ehjZGAEqeQ+pdPpA83IL
         jEcSyfqO83TNqnwWz+/4026jnyzSPS0Ani+H8gqaAwLdYp6KllMNAa54C7lF/YxjyJT8
         w71rWmZz8oPQ0KFWepq40f9f1CeMApQuAyVQVXKDLLSE9abpEXOFP8PgotBcNDnPHH9K
         20ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743809600; x=1744414400;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EP4z1mChh3kJ48ZHpuKiS3iu2fY6RHMQL3FYeKcgZU=;
        b=wBlqpxwAfuhFkBvZ00BjrPnqcY3PtO3iXIsg1L+GydGgmhqyIv4hjxaAjeiQogKdM1
         6ZesfdvheovW5KbKmWJVY4M65ZFmtVa3adJVW5zhT825rfSF3WnL0BnN+KURh8i8V2+Y
         WOqd8+8R/Z+8m7xIepzSnq0srS/synqIjTngNYgHV9eS2IaaM4E0isx1/eVfknLe6LdN
         DiJYyzXYwLhH2XGS+vHzbxcgs6L4IRVcJE/wKbCM3cjyhmMqgqQ9pHCHlBQCOPL/+p18
         aKoVqwbNSiVSniAF6XB71JA6CCxofmp/eP3PQCfjKj/alAuqDE7x7vGyaBmA+dmLKf7Z
         gl9A==
X-Forwarded-Encrypted: i=1; AJvYcCVq81exil8Db7ZYCQaBiTzV1mlla3t2i2WGS/8+Eg+G7r0cb1EyYrKg6rw6rNx+q5QyOy7l0OAbwY+UNEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2B3RE7LR84kMnbnDMphcilsao3DtTFO8CryHXywwJUe9ICks
	QHMshkHTff438k5bYRsM4tsrZbD3s9HntdqoZx0P3iRVfNKlCj+0
X-Gm-Gg: ASbGncsxczWWFoQchjCEeKZwAP6iM1q3H7kOfCnLQjv6k/AvndTPFzYUNecE5xvfqUz
	OMg22z+HdMzke9mPfMysqirUSh5hQ4U8CqRV8EEI5Ki97sm2m8HWFUu1qAtuMd4fNkEdJjlT9Wu
	DAL1wiyKJN4DJWvIF+rMlBSFO/yIj53YRQZrjWFnVT8Y+0QJ4LFcEaxqClxXSFPwjy+cXjg2VjN
	JeRYa66Zp3pdg1+mjnc+QmG8XA5j5W4ZlNTmHCHAAr9NyCd4gC1CGJb6CO7hVjakSp6+FjX4hNG
	49C5JYiQ6bKDdTm2lpmMXbGdVH6cQpHRpahOVWFAtAyG/xifjg==
X-Google-Smtp-Source: AGHT+IGJ0ANfNXgmMJj0Q1O1O/JVYiWXMA2oa4wpweViwDI5wrLYiU1Dge5Z4oCqR6T4shEd3Ne/9g==
X-Received: by 2002:a05:6402:2712:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5f0b5d8b51bmr3718138a12.1.1743809600312;
        Fri, 04 Apr 2025 16:33:20 -0700 (PDT)
Received: from ubuntu ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed1c68sm2881390a12.17.2025.04.04.16.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 16:33:19 -0700 (PDT)
Date: Fri, 4 Apr 2025 23:33:16 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>, andy.@kernel.org
Subject: [PATCH] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <Z/Bro47isE8zhcu7@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the bitwise AND operator `&` with a modulo
operator `%` and decimal number to make the upper limit visible
and clear what the semantic of it is.

Also add white spaces around binary operators for improved
readabiity and adherence to Linux kernel coding style.

Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..630669193be4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

