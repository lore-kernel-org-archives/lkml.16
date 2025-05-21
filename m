Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75EB25DB0B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833918; cv=none; b=IIzXueFyPLo7emhhhYPMtrFgcyXhTaat82mLOqMA4LE5nf5llX+HqKo9u/bR+3NPEEO4IJO3Nrz7ySU0mDkaD7USLAFVGcsbpwJFoCbxOb5IcbMkjaO/EPI4+vZANP5R93M1sEpcz2FyPml66EHr3/UofbhdMd7XBhb8BqO4iK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833918; c=relaxed/simple;
	bh=KaE6+o2aGnDCIXUMVFpEenjktipp41SjDhYjR6qnzu4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MerJKEOGigoiHQS47jxNZ05jvbMrja+Jtao4yM41PvZK6gZNb8K84AX30CKLhaIkmqTfi3G3HZ50ewq21zfehai/GviBnKAly1ENhVSMBHCEea0Ynpn2mi1BQDxclZkGjVfIZYXE+Coal9ur2qpmFbFjYE1am34Vs5fAyDWCaws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWWBBgGW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWWBBgGW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-444582310e3so1950495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747833914; x=1748438714; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aD94Cyds9PidEz6jUW1CAFksapgbj4DqOx2OqS8w/gA=;
        b=EWWBBgGWOt4+BI+cUEGk4IxpVs0ULkXNrDRXV4hPnOnPFNCH1y+eYQg1S5tzz5fAyN
         ajqsk7ECG6LGfw3l/EqUm5HsF+NEwg6KFGEObHdLJP3/XpL9DW3FzJ053taTYlef+DKV
         23hCQjl/ZpcBNhn7Q7VE5Uz4bTDUS2KO9fn+qBkMASdrap+XqhKjRg5n9Ci3YuRpjKf8
         iBRI38tnHon23mh4rafi+udjH7YdvOC/z3VpjtqvC3qeJIUHh6S2lbAzzmcIgpnz+Hj2
         AkCSzM8lGjnGF0ydxLVr6ob+KNYip3+GKPvT3R90G7y3myDs3I7kyvwlz5hQFVMTmgW7
         3Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833914; x=1748438714;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD94Cyds9PidEz6jUW1CAFksapgbj4DqOx2OqS8w/gA=;
        b=OIFrg6CX9qROuwjl4WMU+ZiE9Q7HKLcHM4dywSY4AyyO5H/hHeDA+qe8RTor8Yz5UP
         hvRB4HAYL/5zRKf1fXwr6DEwlqbBVRrdscmQ1KCV1N6adUAq5bo3nwnlsW3yCgBtETDd
         ZMh3RIb50wVai7JkTeR3pxEeKW7jdlW6IBwmup2ZeIpgnri3Oci3ZaULYYbluu21VFgk
         u9AcKUxUKCltyk53NORh9bs/uadLLlU7sK8unC/xe61OAXHn24FrUebHlul1FPc6DeSt
         rUK2frFJUorMXeiMgDMYNAMDjsBBDWsnuq9qMVaROsSz0Mvm1vky7udhWFscQYKH/eUh
         kRdw==
X-Forwarded-Encrypted: i=1; AJvYcCWrQ+m3uUF0aip+kdZ5ZNgA0uRfxSsA4oINRhkToouGDUMr2gfIk+Fz7lehwEd1w2b9+a7KWvyLh6Ymsfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YylBQhgZIAK44X0P4iftqC0TIET0HHdSm2lqnHXB81xcAz+dIGG
	ZMIKbsPdt9ML6FBCcpxIYJyI4YSSS4dW0UViEHSpZJrY1YGevbfoU2t2
X-Gm-Gg: ASbGncsm/TMrWHEnUCuz3H0R6slh0zYsbKZS2U10EKZNJYThPRTQQwmYYYQqWUKuaSr
	NQjAt1IgCF7VdQCtsitmF7cxhTjv1Sep7CiTQWGpmjStC4Z95MMicvKFwHdhuTFg9ECEnDItyuS
	xjtSKobrxWI37gn8c9orl88+ik/az4vJZF2f9kRiO63M/drfXsdLVmlgUv9UAyMGuJthYtHn7uR
	Z/wrrSxyrHfRZIWTe326gbDJv3MA2ZBqIr9dBWDnvF4ctMrV3dxwQkx1qnM6HMG2G2fWVrbQMln
	lJOm/KVmR2NsoUK9ykb97LRd/fdSziXrooS/oZDQm9xiHLfKTF4Ji8jNXXBY4vrZ9a3KAK7fG7M
	fa+ehdPOvi6g+wVA3tyMUDvvf3EUma/s=
X-Google-Smtp-Source: AGHT+IHCJ5eTLFeP2ll8ttDks7kJdJ4nSpWPbjGCtqHqI22EbSubTX0w0gXypEMPHz50PPHd2O6DjQ==
X-Received: by 2002:a05:600c:a07:b0:442:f97a:fee7 with SMTP id 5b1f17b1804b1-442fd6770e0mr73698685e9.6.1747833913804;
        Wed, 21 May 2025 06:25:13 -0700 (PDT)
Received: from milos-ThinkPad-T14-Gen-3 (global-184-11.n-1.net.cam.ac.uk. [131.111.184.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm74461595e9.4.2025.05.21.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:25:13 -0700 (PDT)
Date: Wed, 21 May 2025 14:25:12 +0100
From: Milos Puric <milospuric856@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: Align next line to open parentheses
 in core/rtw_xmit.c
Message-ID: <aC3UOPYv8HmzRvij@milos-ThinkPad-T14-Gen-3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parentheses

Signed-off-by: Milos Puric <milospuric856@gmail.com>
---
Changes in v2:
  - Include author full name.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026d58b4bd7f..8c6841f078b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -381,7 +381,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		while (true) {
 			/* IOT action */
 			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
-				(padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
-- 
2.43.0

