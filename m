Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278F2066DE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224489; cv=none; b=VocFmiDeTBMcTHkbNZYv1kjATJ9KcC7HFwcWHhlflK6uwsRZVMS+0OxOrlgldcr15frHeEPxEQANdWa2C2NrfNS1PWfU8wqA9b4HjeU/0tORmN2rlbzVhQT0E26n697rZ/ndQ5NEmPAcQaTaVVrBZas/s8z73Auy1v/7ugCQ5Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224489; c=relaxed/simple;
	bh=1H4eNwZl+2uYtagyQSgjMNSg+hVnARPITcSVUtNRMzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+lQT7Dn4QfZqJX8Qqamgr73qX5ZLd4VFJ8Kpv4kS2HG15Gvi2OfXfJVIHyk71xfEMqNGNHtRo2LmctQDjSmNySmdLtZUQjLbDG4QwyDBK347DaH19TAhU/B6G4IijXOcmBlCb1cOqLPe8VyU7a37Wu6UbPP9aGcJHhg6F9lG+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXI6Ceef; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXI6Ceef"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso51292a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744224486; x=1744829286; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnX1vda44PaMJmaZeQb8qZYsmPHm6NwVHNkMrOpfUIo=;
        b=fXI6Ceeflzv7k7PwShTEbtkFb7ALjFtYIEN9VuoCoQkciaeAWpCZsbLqsBe0itwsdo
         gCs/mmUMaaeI/Lrdtzwd6F1pq99UfoF1Rdy+8+M4hyOwR6ZZwjNOwRWhN+u6eZcKYH8m
         jlIFKHcFvubdqaz+wAOQDBzSQzlUjadPfasYCBRXLvRRUK+TKSdl1m0hzJJplg4E3gBt
         oYL355UVeP0SfnfRmRnD5nx3JGtkP2OvJn1xnFF78USPZwU6OSmk7hdwvJCw3iMYI8+c
         U7gcDEQ4bukwUWtMzCBEDDkkbalFGVJ2DJjf7TAFpoUm4nh2wZ9sWt6I9suqFo/pmHLJ
         4mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224486; x=1744829286;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnX1vda44PaMJmaZeQb8qZYsmPHm6NwVHNkMrOpfUIo=;
        b=us65WM9iMdLPGQ9OA/DTIvcFMwbEHAqCdjQ6Om/s2UYhw9wQwUI+44G1FTdEJ8ujnf
         MSNLnqgxmrJXSAmI7fm/IDP5hyNkHmL4O+jTReU4t/hLpwvvedrquqMntqf/gJ2yMNgP
         LyXTZc+49bEb0EjXZH1Fq9x9aMrxxH/fig9tvq5EwOHJGt3+JY7tx6JtkcBodQpqBMQE
         XzAsBjJe6fnPLlexhKek1zwQr2vf+fKHVhETi80iCfjuSWUwHFZ666Sok1I4O41XjYlv
         Z8udM6OJ85vdrEWmwZUnm3bDVrYbi5xI+jqyLfc+qM7a2+5LN6oosROKVDg7rOtKyUR8
         cbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMvmUZtl6VJ62dl1MSjObILZsyzkUnIABz7cBngtHndUL8bU5weC4Nj1TqxrOI1PaVEqyzFzrAIipmUC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelmjtuIk85lmeVhCKOpJeBobNmnVsFSk37nOKoaQy1ex1P4cT
	xoTxLOMYnPJBPZqS46DJKCWOjh8TPQCb0hoB/Ys1RJWOQbPTvN4v
X-Gm-Gg: ASbGnctwn69vHzhJMzPQ2OPwSlsUVMNFC5czhrucy9Js7Rj8iorx3zPzvjvWxFXRMe2
	Ic/76iHtd+Nm55KAF411/rl/3GhQSDqCYDEWlez7xF4CwVMQXEyT5czkIdge2d/5oeVFwKYl9Pp
	578ffiiEXTrf20r5rgLk3INe10bvat6AmRdf5fa6qE3to/IrWSDDmGN7dM7GOGMtKM09JsO8Dab
	OEjSttItZF63jJENa5S9UReks1jdgVBh+KnfJPQyngoOtKfo7pI1Mi3fatb8oOrV7xeePWt8Szp
	TBE6WCIAu61L2JBs0MJ9G9D3+Lim6zf7480GgbBBVa/vBw==
X-Google-Smtp-Source: AGHT+IEMEJ+hDivWwYiY7mrjTZW5ePRCHfloRQGu/cGtiSz94x8ChLNbbLPeAY94qm2w4gF8WXnwTQ==
X-Received: by 2002:a05:6402:35d2:b0:5e4:a88a:64e with SMTP id 4fb4d7f45d1cf-5f2f769cb6amr3380822a12.5.1744224485652;
        Wed, 09 Apr 2025 11:48:05 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0851asm1135294a12.23.2025.04.09.11.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:48:05 -0700 (PDT)
Date: Wed, 9 Apr 2025 18:48:02 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev, julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	dan.carpenter@linaro.org, andy@kernel.org
Subject: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
Message-ID: <Z/bA4tMF5uKLe55p@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

Suggested by Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Coccinelle semantic patch used to find cases:
@@
expression e;

@@
* e & 0xfff

To ensure this change does not affect the functional
behaviour, I compared the generated object files before and
after the change using the `cmp` which compares the two
object files byte by byte as shown below:

$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
$ cmp rtw_xmit_before.o rtw_xmit_after.o

No differences were found in the output, confirming that the
change does not alter the compiled output.

drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
drivers/staging/rtl8723bs/core/rtw_recv.c     | 6 +++---
2 files changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.34.1

