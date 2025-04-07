Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379CF204F77
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041249; cv=none; b=ndbVRtTXZM+boNMvr8guQ7rFfK62uZSpt/hQOEz0MfDGchRAFcpT1fedqTPz/LUN4xdm0Z5jZLtu3AQkwL1dyvFoxs+VWKAeGd9S4wgBa7NSvWA6Ko5toF5jfHqxG9IO/21oxje+Zp1PUKafTzZjajLmSd7Udf4AIUmueQ4/WWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041249; c=relaxed/simple;
	bh=WDaDUGwmEwERewTKyabJp/z9rCF2mx3zI4Bzn0WShS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8mm6uRUFDjJu4BMHqUbrJf9M2Q9LmyWDg0pjvZ9Ol01Kr0pANkyvdl0+4NEuRBkHr3FjyA9PJghtJ61IAgPAHyNyDqji/0ECByAfIULy7TCxWskxAlm2PkaC2BAPx6bIWh8wnefklLnXFozaaHiA70U7uB6G3eq4HcRKbcc058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADQf/COk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADQf/COk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so6613789a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744041245; x=1744646045; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7zpBmQSttWP+7fm7BnZXVdnmr4f6nnR4NTtCIBva+0=;
        b=ADQf/COk/cdjNbDchmwkEKdlNGijKKyrFDINo8l+ukk/LTvQe9v82EEMCMh5XZGc4O
         zenSXu55Bj5HUro4mHyou+qb4E3G0EBDvV5rY0L6rBNKOxFhrNw3PmqegyEE0AV01j5P
         PN7EB9hf455OnarznAmU26qRcgukF6IVyttEDXrIKXFDl8C6jhTjPh/ihPoDWQgmK1qR
         L9/zScxGeQJO4FFO6clsP3DY2HwYzaqV9NY5GEiL8JOsxxIBW4Fi4kjl+Twt6dCf8XVf
         0JCMGIfmbmEClyRyiZYq5BpX7wyJeIp5sZWPfY/4KXDe8G1nxtmYdXudQ+5mnpTNDOGz
         PHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041245; x=1744646045;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7zpBmQSttWP+7fm7BnZXVdnmr4f6nnR4NTtCIBva+0=;
        b=iJ8qaFy4+79vaMAnboZCmNOSXQo+vTox1mSN8v/f8F1YHVEp3YoOQ2dD+Smg+pmsj0
         hAvSR3uuEccv8G/ahDBBYYCYsEnIl/Ou0fZ6wrMgaW833OIKI22lZcbpcYMyKF1eckEi
         SFvQGbqdTaXbTDOQADyeKho1RIaev3Bfdwq6BPRPEGn1ZUneImAXEGpdeih3Y/IaYtrx
         T5JcnSHi8cR/k6fIn55g4x9wlbNDTeFGZCt3wbH7tNYN5i8Gl/2shZkiC7jOdVaZ/GJs
         5XAs/QBSdXpMkBiw4vvJmJZ+DKegO+xuJ0vNRWUVQ7F8PtQovKSdNDLE2KOGXiUrYZ4T
         J/ig==
X-Forwarded-Encrypted: i=1; AJvYcCVVXGohSVgrCJ+GmuC6LVgObNQF9yQVy3qGmptVX5x8VFq05dEbRF1esE++DFYDtSljRF7ZoOsOan+JTaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0w6bE09Do4piH0d6DgtQNyOGwSLMmL+pVtdY800vzl4mSlWy
	w2l9LNRONEkfd4ch16XXXEz+bGgdihPPLr3hiToulmHJY2NlGKdE
X-Gm-Gg: ASbGncs7K7zBB5tsGqHYOPiWAenDdLN6HchqXPIpVtvPDa5zsTMU6AkLpHISbc518Va
	q5WYRqk+59lQDRJ+P7b3SM99zRs8qVzVJM1Jjr3tkfmjbUq8OLOX7oxGza5oRdLTtJc068cuAs7
	kREGtn3eq3c4Oy6EJHYsMjcRz3Xj4dbUN7uZ/vtsKy1UqfeCkBeMTQzAx5bqq8GKIqTPLWvkW3T
	T2/LgS+kexW390g4J2JI/4frJwrIEXuHSFl4/kS098u4gNSA9cKfXT0vj2K70DnS8ZxAD0GrKvk
	30qQduqcJpqbFV366yWnT6lGUWuL+4anQyDomZKtvSJn3/+KfwbCp6133EM=
X-Google-Smtp-Source: AGHT+IGcEDBQMZ6NJ63PN9jaNGPysR18XtEQVLoJ9mJjYIPbmqYOBpKf30iNgs0lzXrb0qCoFmr1nw==
X-Received: by 2002:a05:6402:3584:b0:5e0:9252:3550 with SMTP id 4fb4d7f45d1cf-5f0b5da540bmr11079775a12.2.1744041245290;
        Mon, 07 Apr 2025 08:54:05 -0700 (PDT)
Received: from ubuntu ([105.112.123.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0d87e272csm4551681a12.47.2025.04.07.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:54:04 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:54:02 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, andy@kernel.org,
	dan.carpenter@linaro.org
Subject: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <Z/PyMXTjCHduOhKX@HP-650>
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
upper limit, especially when it becomes a non power of 2 value while
the AND(&) works solely for power of 2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v4:
	- Corrected patch to use '%' instead of '&'
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026061b464f7..548fcf9968bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)%4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)%4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

