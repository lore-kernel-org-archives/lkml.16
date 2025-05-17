Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAF4C97
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442695; cv=none; b=O5f2elLdnzDJ6do3jaSu6DH5peiaczdn0ObQ6nUqn/i8WLzmtwDsaXGW9yVqL0PDvKz26YM9LHnZt4ryNMzHYiyRFf2esVWMQip/m43jNOr82+B5jHPEA1RLH+6qROFsV8AK60CGwEeJbZNDjnaHyYn67MDfOVeGvXt43MVMGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442695; c=relaxed/simple;
	bh=/+by3nXhLDhd4Fn1kND0TF0mFnJF6MSO/SS5g1gaZ1c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdoArOo59AQxkUAQxqvRKLXrR0t6CcstamZL4X++tfCLfSJgaVInR/ECOlxiSYSH4Anne3G8QHOtTtGVQJoHWTuj8np5NNGWsXL3A/5UEGeEc2btRIQKu11tAx+Xu+hbmmSO9Lbe6PCy4Kz5NG+g91bCMssjPHhQ1GLcYU8cU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mx1ey9Da; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx1ey9Da"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a361c8a830so156576f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747442692; x=1748047492; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFi3hXb3LnVeh0HTaO/tFr2ZpFuhWH1qSxdp9khZGqY=;
        b=Mx1ey9DanYw+bs0F1YdGHL+HWUHcI5mCrQMYzP4e/NXn3ibCOTfI0MLntGw2oFXNzQ
         hswlHUbIwEaOcvGoGcWnoM+BYlxhEg79CUQRDfmoqOkdCk4NSD7ufiInLBCVWNlyunBq
         aqmN9yJcw6ka1ieGMdhbJHGoXEMh17mmn/NNzeNF4URYx1qzfYuaU+0MVAMR8EheS9j9
         YlTWIjmRVFrKVOyOTR42rGRXFLkBGngovvggFs5PhfA8oyNwRAlw/eQa0LvTrqd7ULKF
         hx+ys3HM/D9RMOKpLxd8GVj+G0Ss0JXEqCIjwpnzkzWWjlkzo0dRYeIrSTWo3IGUCuVC
         rp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747442692; x=1748047492;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFi3hXb3LnVeh0HTaO/tFr2ZpFuhWH1qSxdp9khZGqY=;
        b=sItRadHBdeZuWFzMCaAwawiT30IqV68dOdREv5nvEFhN2dGK3gEky2czwiHABUqEV4
         RJ/mQmPH4GYfxJaDug0FLFMkCiO+s4IhyiFgkCEdSbD37GlPvFX0Ozffda1rcevk3ZjG
         EwIRMYnQNGmTwTYd/7jhkp7gAdFqX5h7hatgjV7DHxmSOSfr5hTwcf3OXeXQ/FEfWLCE
         jG9rY6GfyicX3k3CpO/u3flfCmBa73ZBH2YTjTAlz3MGHmcG/2bAVmENr0R5iqUAWU5R
         7infgqIBxItZf8VCy1irb5OZMTpKwt9vSKVSRrugEWlaztyynwchR/bFR7umWYBLrTvs
         SpLg==
X-Forwarded-Encrypted: i=1; AJvYcCXsrceij2cKiSWUtRixLq+laKyizdb6e6CQ9+OSp9oYbMjDux8FSSxjIDhqz1QW4AHSCqVoy7Z721B2AHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTc7tNW9FAD3l1w/OcMoK1PQnVNgC2hKcojy8zP/KmeUs6c8BC
	qv+IAFPmYBDN1pzdBzUH2nRasDTN6GegD2wS9wpfAUvMXnsN0DAIixYL4v6viqoit9WnUg==
X-Gm-Gg: ASbGncu9MCtfz5RrYOPsEKpJ2UTgtHXrrDNi7MV9M3ARmgqqlpL5FN1Z29pk5r3kwch
	y8JIvlvENGMRphXsNbPYY2QrT1UrQkYEKtHmclI2A8i0xMMwCbUwAdsxHcC4O3h3Y14K+O8sOEU
	TWyQ7dIZL6jKWZMm5mleLEi3zWvhjkvPE75wixtft5pKSnoyiYC19zka6sXRQH9NLPNKBWkzfJG
	Jj2ZVqnHABc94I6YAdx4AcBnm+E3ojfx2K1NizmcUhxd+uCJw6YFZzH4MM99XLkX0AHgH961cF8
	Ug/6b0hOhyXsul4yjmPf+t9qEeD/GVVtilM82sJBMOWViUj1HR9HszKTPGCllapl0DT+PHzWP6l
	QLkvJxwxKFyq+l2nXlSBwk/8gIULDV78=
X-Google-Smtp-Source: AGHT+IF7M0QjmcH5fM4rPfAaywYSX4Aye22dDXl+najl/T2IKNfDsnLuCvDvrs73TdZFi6lL5IR5JA==
X-Received: by 2002:a05:6000:4201:b0:39c:1ef4:b0d1 with SMTP id ffacd0b85a97d-3a35c8450e1mr1882358f8f.10.1747442692288;
        Fri, 16 May 2025 17:44:52 -0700 (PDT)
Received: from milos-ThinkPad-T14-Gen-3 (global-184-11.n-1.net.cam.ac.uk. [131.111.184.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8896dsm4417289f8f.73.2025.05.16.17.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 17:44:51 -0700 (PDT)
Date: Sat, 17 May 2025 01:44:50 +0100
From: Milos <milospuric856@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Align next line to open parentheses in
 core/rtw_xmit.c
Message-ID: <aCfcAsM5OBo7HcOg@milos-ThinkPad-T14-Gen-3>
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

Signed-off-by: Milos <milospuric856@gmail.com>
---
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

