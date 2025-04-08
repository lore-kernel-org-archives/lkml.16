Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02F1ADC94
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119151; cv=none; b=ZM4NegR/+h5Hi9WtN9EOqv0+1zZEH7t9umN2YgmX0CCwltqPI22ZyIAyyCxEzsD6ofhnVuxx2FuIiUdkuZBIL/Fvg0qqtBZj32/dG2DMBAXddQL6uPskAPIg3c7VXVTPWdxsKwFNHqNR3bdbAFUIKJ+2tKd4cAPKhEuT5WAIKPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119151; c=relaxed/simple;
	bh=lWsrQEzNqzjBfUgCQgg/t3kJreBAVX3Wp1jmrt3C+VU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hcZVQryYX2DHKDAlQCIPy68bmxYZvLSHLFJk1ZZVlRNeTw+YfTS4t84QL6ipuUtW8cVjCGethSjMLUxuagjJ+iqCZcuAwEbhcttqU8NRolHzu2TBldXy5NqZTZADM0m3NDvm7/jErUqJjksBNInSGXK6JsCY3IxBmbKvHx5OZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf6GQz46; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf6GQz46"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5b8d13f73so583843385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119148; x=1744723948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfztqMVKNg0/SZeeg1Ddj2nw5qVrzuwCYVhV7uuKNoQ=;
        b=hf6GQz46Y+wjMGA7/aO7iPpX96ai+xrut1qF5S4/AN4HzmHJKV9qaeadKVY+B+nxQO
         vVxFpWiZcQMMG8C87K0wEx66hC6BrI9wa9h6K8M27vIe5XkYCITb+GjOaLU7WuZ0dO6R
         iF5TnPtWRXFkXgkuBBmaSXcQ16tpW5DXSU8/ESd9bkuNUoP2k3zUsmsHMUj79T5CPi0s
         fq88aAko7S0eBUhT8VIcO/bMS6vWlbRF1bY5NR8EBACiK+Os0JkzkYgiNO1zZP5muKSn
         Fl9jcporSrptq80r8Kge4hq17qi97S03H4opz1G4ToYIbgSBAvM5bB7Ykl/5Ec6BBszf
         hWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119148; x=1744723948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfztqMVKNg0/SZeeg1Ddj2nw5qVrzuwCYVhV7uuKNoQ=;
        b=a8GB68veTl4L1e/PG6CFt2g9NdNboiBVLHX/pxRFv+9yrs1yXDeYMdjyiej7BdInOR
         r0aHpHtmPp4F3Po4dbxGLbMwXAfmM4Iasr9c/cytL/ASjJSC4eG++uZk+dR7PHWaJ0oE
         3O4rzJW3ce96PIa0UZJVHjw38sGZlpZZ3skjwSl2nDMUDgUYBqDd4ILyKQ268dX9irIO
         U49deQAKm9LCFDwrTPhUE4u3Rvsb6wC2aKEjWtNF0EEDza6qwdUEG0YrnZun84DExLkh
         lPewPyyr+kYTHT7y695mTpmMoo5Dv563NBG8AWqG1GZjr/Rt8jNMbvcJRPoTGPkq1s55
         RUDA==
X-Forwarded-Encrypted: i=1; AJvYcCWBFr9qYXVVHGHGjpoKb+UI+0emUNBwkUZtAvIqiouC13NHsTXLYsMz5ulnITJb74hq7luxy5Mr8eQVS20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnV7QNTr/Rto3exZwgk5ctLtkp63bTiuQoZ0nuPZBOeUjS9NP9
	vnvKsXyswMNO/+B1l7Fwt3820it09Fix8zQSxpf7mG3qm52pM3gk
X-Gm-Gg: ASbGncsFInvxmsx+COVpq3g73efEcZ+GLS6zTPwfGrH27cQWDAFzjelfiapMtJVWh+I
	uiJ/wlL34fsiocVM+wGIQBg89UpcY6+2eDrlFNyBKQEbU59bLe4Hj8RCQ+ml97OGHOXV1vxaVqD
	uoC2CH0vy0413QS/3Zn1c5zHXBzpMnrarIiOn0zfpYHDjVy3R9GZeo9A61qM/CP/G8q3w89IuZs
	a3jm4DYmBvDw6opdFbc1ySOWWn9Yd4VLoshnuhB7Gh2C1x/FgeTu8jgX5WjoEQZUJPRW2q49lvh
	6h7pCW3r9guh3XPzWCFdMvulEGHN6ffDMEXDdVSx3qIvIPI=
X-Google-Smtp-Source: AGHT+IHRe2pR2pJowlyrKsIN0u6V7E88s/zkQejK6Cne2C22r80j/QC+KoIH7VUQQ4Mi/eo0ECKN1A==
X-Received: by 2002:a05:620a:28d3:b0:7c5:60c7:339 with SMTP id af79cd13be357-7c7759ea8b9mr2362665985a.9.1744119148274;
        Tue, 08 Apr 2025 06:32:28 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75b72csm758082785a.37.2025.04.08.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:32:28 -0700 (PDT)
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
Subject: [PATCH v7 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Tue,  8 Apr 2025 13:31:42 +0000
Message-Id: <c71ec1f13a2a5cc38a745314f134f6e7eb935227.1744117091.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744117091.git.abrahamadekunle50@gmail.com>
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
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
upper limit, especially when it becomes a non power of 2 value while
the AND(&) works solely for power of 2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9ba3bebfc8bd..db5f1b931530 100644
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
 				}
-- 
2.34.1

