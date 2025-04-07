Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F25A50
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 00:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743985679; cv=none; b=eHzkuoSaSiPF10FUGQHEkorI+nd05aanGUE2aB39uJ4BFh4+5cTEMzKMrQibnEJclErUqzS5yJdMKIFSyUK9n6y8I23XUg6qKpThih+gWfVTMdHUbYy6CQJVbIHVPkQcB0StzwvuM0VZAjq7JmZXvu2DRtypkUiSLWsN8NZ9Ll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743985679; c=relaxed/simple;
	bh=/FBJUEuiNZnf6+4wQekulaqENCuepfWHig7ltnni628=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tm8O4rrv+8d1mG3Je7FqBUh9cQBo64RueSBUM2C0mRaB2trtVXN7eHUXi9Zu8K0mMFHHcO3Al1NEeG3yNfBkT3HzmRP+JRZ/nqHLQgkwi16CBo5iFLnFmSv59PaYQwCusiI+29TvuV0oyIXjSSe/wFw/uxKHTdhTnXZG3f9GvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz4UAwZx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz4UAwZx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so550194366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743985676; x=1744590476; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0Kj8uLmrietvObdF0qp86X5EUoKWCpxBDnwabchfu0=;
        b=fz4UAwZx2lUDhHOMkwdShKwb6kEfRHnFuxdVQWqLM7UxcgJMdyU7xcf7kdCeGewsEb
         F0HDfVpk6d/gkT6r620oNbkv4e/o4161oM90kBcFvmEuQpgTyyBhPi3f3MXXrW9/os9A
         yAqf4zcF8hS3CKtapwoDT5AL69WcEwgaecp043qjcJ5aMhDsICMl7tqtGkmB0LujhCK9
         uQ7d55xP9VsD9280kIMb5h5O5FOmkrRJWMv2P0CL3G7Kt+i256UmJd9oX5YaNH8l6R2g
         RHe2LF3jNh9qlV7qCuBZnGFLhTNKxsA5KV8bv52IS8el30e8iKOYT18HQIggFw7VLCeI
         fMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743985676; x=1744590476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Kj8uLmrietvObdF0qp86X5EUoKWCpxBDnwabchfu0=;
        b=lZecriwOZroE9aMAoXXrOP8kdcUxrYQzJp6pSTZPFpUWuRTHH1Ek1InHKIf5Sbdvky
         jHtf53Yd0Pv562tdjvh+uj78yfnbUVjvL77D/H+ogwgmvo1VA8JHSEGnLr5eRwc+wYGH
         YTQdlU7uqexfzUHuOXsn1zhmBGDHBbjVrXjUqb9ZsvPVUd6mG+GLusIZ6oui9n5eMK+M
         yIelhFFQfXSKDXjUtxHrKhQeYzDkdqI8J06qVKHWENO59hRoO5IJEmmQwcMTnz4JuQE6
         lV3Axi9mIDKAWpmNftGx+GkcB/GBptQcpKU0JpqYM6d/Q0pr8lHo+5Jpv4vGcvV74DQd
         XzHw==
X-Forwarded-Encrypted: i=1; AJvYcCW0MMUvvFi9u6oBCjx4wq3BoPGoONDBxIA4v7Ml4V7G0NvuF1XPcaAB/tHrj/uFpANhIeBEuLY8UmVvBr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEQVPlIdPtELc0zs0fV+nFtprbbDI8rPurTwNWv4DzJSQr2wKd
	FkD6LjK3ON5FpEV38tnNRtEkha/7YYPK30EMXjMaYzcMvhI3QM7T71kwCksu
X-Gm-Gg: ASbGncv9dxtK3dTfZHaSek9kv477LeigT/gtlUD9f4IwfUD3i+46X6oB03N7AtjL3U/
	vAbV4oAMnG5oZqbGpfHmLq8kqvozBD9Aa0QoFLVOtSAXKVXqnsgjyCW0yvDcAbUexB7OXdbFYpy
	szFip5VX3/zjwjhjOe2yBHrPsJkmynafx11FcWm/QkuwwbBpMdn3+INn0RSWA+95sOnezW5gLik
	F/7av3ZvjZIAqF9Wxfd2LkscHQTOHJFkD3w/qLhfSECm3yjplwKl4e+oG6aJz7L4d0s34X/8Krc
	uS/Z5sxXKibgQXgIBlkefT1YXBggcquWWw4iKmjcYo0LcLVx
X-Google-Smtp-Source: AGHT+IEWd6+xIkKF3Jfn6HvYe3Wp3/JAclOqHUw1FW5NG1aE1ovoFcH3tcF//AH1B2uB6HLE8nEvKQ==
X-Received: by 2002:a17:907:3e0f:b0:ac7:b621:7635 with SMTP id a640c23a62f3a-ac7d6d8f3d7mr990391866b.36.1743985675875;
        Sun, 06 Apr 2025 17:27:55 -0700 (PDT)
Received: from ubuntu ([105.112.123.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2ce0sm657201266b.178.2025.04.06.17.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 17:27:55 -0700 (PDT)
Date: Mon, 7 Apr 2025 00:27:53 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev
Cc: andy@kernel.org, dan.carpenter@linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <Z/McCdceSpyL2A2p@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation with `4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the sequence
number cycles though a range of 4096 values.

The use of `4096u` also guarantees that the modulo operation is performed
with unsigned arithmetic, preventing potential issues with signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
David Laight <david.laight.linux@gmail.com>

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v2:
	- Changed the commit message to a more descriptive message which
	makes it clear why the patch does the change.
	- Changed the subject title to include `4096u` to show that an unsigned
	module is used.
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..f534bf2448c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

