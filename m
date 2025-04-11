Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E12586FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400487; cv=none; b=slbORxMRjJgz6ojCzq98juNUpHfSruF/FnJhvNbQQNmxKB0PjDaI7RZAMUC7DlUmZb9JHdYEmt3jrNRjKmk7Lg4uHuJKTiDv/nCVCtfBo0t09qWIOm5no2JAMJ5KXTk9oaX8wYOxDhEgAUi/mGJeYSvcM1CM6yadC+Mx45LQeFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400487; c=relaxed/simple;
	bh=DxkK3p7GrM5By5DQbHXpcXd6g3kGREUwSwYkgTkB/7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMBwRl7/NRTIIvN4z/65zby+ae0bZXLht5KsBnjV06JPYjRadfLoPmjHtSxyWw8fkcb5Dz2iwTDQBGlotPiKi8OWR7tH/knSPZYOTgHNdOGoK5a7Gh1ZHXEeqEVrfdyc0znUYJHERQRw3uaOToU6kGTRdaXS+D16VLYR2uZx4ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaM4jxfR; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaM4jxfR"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so3736128a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400484; x=1745005284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdfbOR1zA1/kD6+1UpkaIMBm10oYcWCdLqCqPrs+E94=;
        b=AaM4jxfRk+cv7QvEFKIX5FcAPMO4Ws7/arXSfOEDV+P5bH8Lp5kslyjtylQ1VVplDK
         pAAbQ4CWWzcasVFxk6MQ9fItueZuInK+cQA2it7IJ4lZMMEARjJJLuloktFdWv02zxCQ
         FlWeXZKizVQUXxenLRccOnkZUnPe4GWhUKkoIIR8b14d4E8Nhf4ZoONBjE+IQlU5P1Tp
         bkmTt6HsLMNBkh0PVi6WBFshzk2Uz0wyt7AEsaFPPGzacwNdQw2tw33tQ3fADlFMbHB/
         +KHEM1pWa8zYVXCw8A2NID6iYKJfXuWxB0wvRTcaXYbB6WxEiAPmzh1o08PhJLlgvAbW
         wpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400484; x=1745005284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdfbOR1zA1/kD6+1UpkaIMBm10oYcWCdLqCqPrs+E94=;
        b=R0wlcjrKaG5buBl4ZyFIUNFAXqgGEocVNupEhTUgkALqzfkTNMl0GbcF0RIi8fyIpe
         jYSkkx6GhHxOTwcbIhGnhOqFFlaXyXgDggXWOmct0/kCw06za9tL0MlgiQrEiGFZWEL1
         MebsSFEUydDzVfRyp0MCon3SMjEeub5K/NsCaWCRSmIpE1/5AMUoYrYwS/1xBeG6XRId
         EHGarHashKXp/TETDM7DRF/Kaf3TM7ZZKtzyCzyuwUYhFF8Sdo4Je05hI9cGsGhlvYYR
         VRI6/2ld6Mb9PnXOPjPhLgyrTTRVQv1GtWLYvdlpCV2Vv3ur8umkAV0MGMRv4U8EgD6I
         Nd6A==
X-Forwarded-Encrypted: i=1; AJvYcCV71XPeMaI9Q2DXC5MBry/1qdBpUDaslQXitOT5ULtJwhPo7MXhGMerUW7/QhheG4DlnUDoI/RWLh/TqBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1O5+CvjdZDAqic5o2E/I6iFjSVDeytu0OHfkkkO0bflST7zFP
	QBSmxqwqZTSeh4q2DGMHOOHGuz/dJXHCuHGOHNkBTna25AoUIoW3
X-Gm-Gg: ASbGncv/i7GgA0XG9hXPCbXzSyMbbPBADva0bzyzA6LpOOo5b/xyqHGkNSQQ1lj+UxB
	NmxSfkvfRDZQQMZ8R4AysDgHbR37jqRz5ip8tO0heXgBQcV0CuseDHXKkpVy7wHXVwxJZ77qLz1
	Nl3XHFYi8qNzukUfHCpH+t2bf6KFuz1hM8bss+Kuw3CtT2WrF+clyPa2NQzbbcepdza+ZiRjTJ1
	mJZoBWpcJBxLPyGWFL4D9bzuY4M7LCSJ0IM4eK6tNVAzNkxF03tUFzXKe7/n/V+bNq3ojy2Bcgc
	R5IuKEdlRHwT75FYvb2VYZftp1WIN61GH9BJ8ZyOswjdWw==
X-Google-Smtp-Source: AGHT+IEvllGzLay4ZKzFchDIqRhxdPXE6p7ZIVrNDdvHdaszU9NSSxcJ5ArAQnSIdgUuAJ78j4JQMw==
X-Received: by 2002:a05:6402:40d5:b0:5e0:8c55:536 with SMTP id 4fb4d7f45d1cf-5f36f52517amr3626159a12.4.1744400483912;
        Fri, 11 Apr 2025 12:41:23 -0700 (PDT)
Received: from ubuntu ([105.112.122.132])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef5653bsm1434995a12.20.2025.04.11.12.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:41:23 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v10 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Fri, 11 Apr 2025 19:40:24 +0000
Message-Id: <e8d515539ba560961003eae15d301d03e6cdd17d.1744399612.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744399612.git.abrahamadekunle50@gmail.com>
References: <cover.1744399612.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `& 0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation `% 4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the
sequence number cycles through a range of 4096 values.
It also makes the code robust against potential changes of the 4096
upper limit, especially when it becomes a non power-of-2 value while
the AND(&) works solely for power-of-2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Found by Coccinelle.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..f712ea0cabee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3511,7 +3511,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			/* if ((psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address)) != NULL) */
 			psta = rtw_get_stainfo(pstapriv, raddr);
 			if (psta) {
-				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07]&0xfff) + 1;
+				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07] % 4096u) + 1;
 
 				psta->BA_starting_seqctrl[status & 0x07] = start_seq;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a389ba5ecc6f..25411cc5c738 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1641,7 +1641,7 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	struct dvobj_priv *psdpriv = padapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u8 wsize = preorder_ctrl->wsize_b;
-	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) & 0xFFF;/*  4096; */
+	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) % 4096u;
 
 	/*  Rx Reorder initialize condition. */
 	if (preorder_ctrl->indicate_seq == 0xFFFF)
@@ -1657,7 +1657,7 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	/*  2. Incoming SeqNum is larger than the WinEnd => Window shift N */
 	/*  */
 	if (SN_EQUAL(seq_num, preorder_ctrl->indicate_seq)) {
-		preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) & 0xFFF;
+		preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
 
 	} else if (SN_LESS(wend, seq_num)) {
 		/*  boundary situation, when seq_num cross 0xFFF */
@@ -1772,7 +1772,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			list_del_init(&(prframe->u.hdr.list));
 
 			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
-				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) & 0xFFF;
+				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
 
 			/* Set this as a lock to make sure that only one thread is indicating packet. */
 			/* pTS->RxIndicateState = RXTS_INDICATE_PROCESSING; */
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 5def2467f42b..76f25ab6a779 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -964,12 +964,12 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(tx_seq + 1) & 0xfff;
+							(tx_seq + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(pattrib->seqnum + 1) & 0xfff;
+							(pattrib->seqnum + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
-- 
2.34.1

