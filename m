Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CAF26ADD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725039; cv=none; b=BiVd7Q2z4fcuHFTaRZrn7iUPQVByXgbCyvpqTnVOskG3RqtQZIGCN8CHKVts0wZa201D8ySCm5zAGWgyMOh8D56SBU7Y2fEvyhAE/i3qeRdW+Cmdzt6wj9z08/9uMLqXJqev4w7Rc7UNQBYhsbIlaXXxDjvE3zyM0eBrYRmIUio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725039; c=relaxed/simple;
	bh=m2F57u8l9CcfwoMZCeX23UViyjA9E828q9pBgxiHLoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r3q/eYduEuT0nyHvLJJriNvfT47NSZ9USkHH4BQhlxXmZLkohcWb1mpSsBhvpLDydZtZLpkJ8wglckRbBvUqtzX0XmUYol1ByJfmZkHQSVbmY3M+I6bKzwVmolqz1xyrbi3SKZWTqE1QDb0Ck0DXcNh3uavW8Zx68QgLTjoEPz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vskhie7q; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vskhie7q"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so25287546d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 17:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743725035; x=1744329835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy2OXo7NzZVl72EfjvZRrLBB8/XSbfcP58qqUv52zsY=;
        b=Vskhie7qfzYomCA1qIoMC+8lasus39+90AarOJ3hKLoyEf6TXM6Afurhkn+rFt31Sd
         0LUFc6sdNS60H1Sl0tdtUkKoamq7L4ga9AQpeMaonGeezLGUI7jYk5g5I7GOXQcGv+BF
         jZzbFDkI7k1ff/PjD4YQYd/d+QB0f+0noxUkLt/B24JsnFbCJlXNHL6M9+EwRRA2YN4h
         A6SQg2aLyRDtuxaAP6bRocJSHr1UAn+RQ3m2YfefA+whJj0q7nTEzXAp8Y42BfFvAj0J
         tWSkNGQgq400sa9N9N4LWN/ZfBvijlZ5XdAJoEmmm0E1wNByfYKNaHIBTpYXWQKi4c8B
         LJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743725035; x=1744329835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy2OXo7NzZVl72EfjvZRrLBB8/XSbfcP58qqUv52zsY=;
        b=TRuuyRcYwwwQfRFpG8fnlLnggCy04CUSLzKNNm5qUHVY47/IJ0UqUU1a6dr1s5dpiC
         TO6FNpWCLEnFhPPYCFvPfx3NPtCXD9kobMD8N07yZxJoVrVu7wVmEwr0C+FLUD0PshWX
         E8uVpmq1RhZ6Q53a3Lw8SL6o7+XVPzoAwC7TDNzWbFuYY8l1R80YrBnpG+to932xvrgr
         UYBJ2xus/4irjhJs8GhvAANb7YZbOP/3bFQaXJmdInbb4v/OSHr6c6d8xW8mRUz61xAD
         RRXHAA4qKfkUt1aZ2BFaS68wXQzcmwjjQlo/dd7k7Kn/V2JJAKca3Kftpzg5vaKgooGO
         Dc+A==
X-Forwarded-Encrypted: i=1; AJvYcCWDRBAr70XsGth2dBqMEruaDD33umHDcJPQNXklz7Ax1luicBnGUuRzKtNvsLieuY7milMWSWkgFRUn55I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWLbsIfJ+yDOszgHBk9EgwqIDEZSFeXE0AQ2ztucqSw0PrL+2
	jIil6JzFAyBCj9fCv38b22nGUFaOR4DfeiY4H8tnN3bLzZMi64gx7k5FkXXv
X-Gm-Gg: ASbGncvHLOQ8cxx+lblUXk2EOzEODndi7HhEw9BYA042tciX8RelyjRV5Xm7F6aZ1Iu
	4p0I4EjywkXJ2ed6d6HrScCsARVekfU+61Twz2VnWAkdnZIECt7exlyjRhrvj2LnKXH8VslZJzW
	N4VvkMVKA2NnhfIT0pO8qe0EZvx1pZlraS9hg6Iu2ay7Nb3Kpc1uf8DlfXd+pBkQbqUzdY8kIq2
	IGlzCl/XikxnGm53DMjlzbCcT4gcq1PkLTnRnybIlTfVwrYrM2Ec1k3Z59FFkmFv0mtYajS4rjU
	bET7QKdZsjiMNbBlJgdux6e77m01b1H9QRrH8PKQXUlQ12uL
X-Google-Smtp-Source: AGHT+IH0lE+f7I3vQYedfhF/yT+vf/DVVALZOAfOgkWOKX9NEf+lzxOG9vAyjG9SLtREfHZmKjQFug==
X-Received: by 2002:a05:6214:5086:b0:6ea:d604:9e4f with SMTP id 6a1803df08f44-6ef0bfc8138mr83897806d6.19.1743725035304;
        Thu, 03 Apr 2025 17:03:55 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea59acasm138884885a.75.2025.04.03.17.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 17:03:55 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Fri,  4 Apr 2025 01:02:20 +0100
Message-Id: <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743723590.git.abrahamadekunle50@gmail.com>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 58 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

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
index 026061b464f7..ae268dda4c4d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,35 +941,35 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
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
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+						(tx_seq + 1) & 0xfff;
+
+					pattrib->ampdu_en = true;/* AGG EN */
+				} else {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+						(pattrib->seqnum + 1) % 4096;
+					pattrib->ampdu_en = true;/* AGG EN */
 				}
 			}
 		}
-- 
2.34.1

