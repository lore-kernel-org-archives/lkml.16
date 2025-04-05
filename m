Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E51D47A2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859321; cv=none; b=ayEQ4yP571N18fj33zicYXu1m385uvi6t2/2OLdLQt4M8/QEzRm+ZgbSRV2OxwJXSyaT2xEVyk9zp6n4Aj0gibEBLbtPrRJQLUnbsuV+SNJb8mT/XpNfVx+c08i28AxWJS94k+Ae0KGE+SezEDS8dAMLPPw+EwBdzGJkwv5jOgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859321; c=relaxed/simple;
	bh=AcXfO0TA7CuyZGUY7wAR0A6TkpZyJhEUtb1u7nKFghg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIe1cY+9ulKbO2o6TQF78luOYpx1+hsPKHkP1La2kySCEZss11OpNwtwxUl0XRP9MCPeMkECKLmfxahdq6Is7wxH35e7lQAsc8pf3EyTOMP7hbKaxcu+J2xqh3DzkB2c7aGUmNZ4GCa9Vd53VN+B/WmDd4IrzoffuHQa7ndNgu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myoHDm18; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myoHDm18"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so470639666b.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743859317; x=1744464117; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1GAF1aPCvVcJSW85GNnW6pXEVSfQN39zL3/eF/KMRk=;
        b=myoHDm18ojTeMEjDVj4l7VN8LIeqPqf6B6c/IYdGB681G0BdxCqaUjUKVyWpIJB97b
         RQ9WtMp6rZi8lU2JCI9y9FKLdZT+qIuUMu7vfi1D7GamBn0gpaZYnXA9dmt3oJYXX5TR
         A8Wx9bnr1l/iW7bcR7NmzT5gH865l8x84ZGJbC4Bh26YJ5JrV8hJJqaoYbq25Knz2k7H
         EYPreifJ886HzDV0pzO74TNcahtA8N3urF0/2d9TxaoDbfR/wleGtJZeI989U4KcAhYS
         kSCFAIpW1uvM/y/tsDOMWbdyWIllYRuX+w+7TLhQAENxdTuca8AWhwd1wTvO77fypdkh
         RFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743859317; x=1744464117;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1GAF1aPCvVcJSW85GNnW6pXEVSfQN39zL3/eF/KMRk=;
        b=OCPmAm8LgnmB81yevpYiS8UJ2zDFa5m1TxqkWtbngY1IlqiV9mnJnxTesrVytMX8bt
         5KeImhLLt4zTSmt2E/rahVaODpRvowIbhjus11pjqf8Ni0GSdkY1lsKroBdy6Ebx0xkZ
         IptD7ApiSad7tlJroQUWfATzk25f8MuG7wQNfRT5TAHh4Li86LmHFQHya9OoUA25SUB+
         spcCnfVsSoHZcsvqgp4y7JGxI5OHA63+qMqLLbjWmVO0pOKGZRIWgMkEl3hZLFVxIpDA
         1mSn8/EwasoPoHxJD6wJQGJ0FQP1CrWvMLkXoZh3Kkno0clzhXjg/YSGCnL+6+U7OGUj
         kr4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9odaS2uhQyEYxRDPELaq34IU2syKjL5RfKUFppro+Lz+FKuo7ucoEX0ktTcksJwQuRDU1sREuzTAtXS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1VdpWqNxvVfJb8mh9kxqHcRG63RrARIHHltCFA4gpNP86ZAH
	7lmeukL6xArrHv14Tbj7DfyuBngRu1L7AiI1DOPr+Fts0SrfkqUhEhV9wCCC
X-Gm-Gg: ASbGnctBURJfC+ZCEFtBkXWzWExQ6w1HPXJHosmb03yhUJCPWa04l3FVi/omakGKAeY
	M4Z93nXlbGo+ikGyriDGjrRNyGidzCYeFkVAQphQ1VJYJsrUsZVdzSoBonYxWSdSUb6wrGkoviE
	u3FohT2RcKvbXEO480F71iKapjFRBF33VCM8T9r11AqbeGmRJaNfXXgDOZzZw1uUPlJTg6+3+q0
	0K0OaDRPeCq5nBmdB1OEd7dtZFrpxiKoJCxglvcVhmgmrIfg4MnecAsbH+/So4KqSZOe4jXXTdN
	j1U2r1tZaYRdqhGtaj6eYAv2rr9J9Wx2ee83oa2ULWDQ2uhWHQ==
X-Google-Smtp-Source: AGHT+IEuJ1jCs5lLbeZPk7dMSX7AGKDeD1AsWwl/QLtrHRYxpxUMnE17PiDNTeDM7alfgQo1hpW+oA==
X-Received: by 2002:a17:907:f1c1:b0:ac7:edfb:5210 with SMTP id a640c23a62f3a-ac7edfb536dmr165647266b.20.1743859316998;
        Sat, 05 Apr 2025 06:21:56 -0700 (PDT)
Received: from HP-650 ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe996f5sm427498966b.64.2025.04.05.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:21:56 -0700 (PDT)
Date: Sat, 5 Apr 2025 14:21:42 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <Z/EuZuvGyQ9QBl6z@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned to NULL.

Remove unnecessary duplicate NULL tests on the same value
that has previously been tested.

Found by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changed in v4:
	- Separated initially integrated suggested change
	 "use modulo % 4096 over & 0xfff" to a different patch.
Changes in v3:
	- Changed other cases to use modulo (% 4096) over (& 0xofff).
	- Modified commit message to reflect these changes.
Changes in v2:
	- Dropped patch files for media drivers from patchset as it is
	  not meant for outreachy applicants.
	- Added full-stop aign to text in commit message.
	- Made code more readable by adding a line break.
	- Changed cases to use modulo (% 4096) over (& 0xfff).
Changes in v1
	- Patch for drivers/staging/media/av7110/sp8870.c and
	- drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
	  is split into two different patches in the patchset for use by the different
	  driver maintainers.
	- Added subject title for each of the separated patches.
	- Patch 1: Removed unnecessary curly braces {} initially inserted.
	- Patch 2: Unnecessary {} was also removed for v1.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 56 +++++++++----------
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90966b7034ab..675226535cd1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026061b464f7..f817cab2f831 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,35 +941,33 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!(psta->state & _FW_LINKED))
 				return _FAIL;
 
-			if (psta) {
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
-				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
-
-				SetSeqNum(hdr, pattrib->seqnum);
-
-				/* check if enable ampdu */
-				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
-					if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
-						pattrib->ampdu_en = true;
-
-				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
-					u16 tx_seq;
-
-					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
-
-					/* check BA_starting_seqctrl */
-					if (SN_LESS(pattrib->seqnum, tx_seq)) {
-						pattrib->ampdu_en = false;/* AGG BK */
-					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
-
-						pattrib->ampdu_en = true;/* AGG EN */
-					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
-						pattrib->ampdu_en = true;/* AGG EN */
-					}
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+			pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
+
+			SetSeqNum(hdr, pattrib->seqnum);
+
+			/* check if enable ampdu */
+			if (pattrib->ht_en && psta->htpriv.ampdu_enable)
+				if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
+					pattrib->ampdu_en = true;
+
+			/* re-check if enable ampdu by BA_starting_seqctrl */
+			if (pattrib->ampdu_en == true) {
+				u16 tx_seq;
+
+				tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
+
+				/* check BA_starting_seqctrl */
+				if (SN_LESS(pattrib->seqnum, tx_seq)) {
+					pattrib->ampdu_en = false;/* AGG BK */
+				} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+
+					pattrib->ampdu_en = true;/* AGG EN */
+				} else {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+					pattrib->ampdu_en = true;/* AGG EN */
 				}
 			}
 		}
-- 
2.34.1

