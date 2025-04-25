Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2A248879
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583194; cv=none; b=rfyATrh4ElPlzloibCHbDks12kt8cCv7oN0UjLF3DnGn3eMCrFYjyemO0fP3zLehehSgnmo7b6RYoGtwYD2+bJownyUuMiNRBE/E3c19SIPGVd6OhMQ9wwVZZSbJlMS1MpDBA6tuPDiaooF4/K81N4x22jqd0BRH+AWwf2bx+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583194; c=relaxed/simple;
	bh=5Sgz96HXWiPE521VgZZk6wufk7wy1Sa4KmD8mFjEnEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEobv8Rn3PaN/uztOoVcws7Bnd16SyadUrpvy47ZcOfiRuu28NQkEAryqzDnElr4r2rAEv/nRWOdVEP2FIvVF8hGnc5m4riJXuY4V2r5UZJq50VR85CyWOBk8ap+Y0N2pN6PusLFdZu4fDRuJ9VnL0HmsxWcvnVRvabByF2cqUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pBDWhVdw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pBDWhVdw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1613314f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583190; x=1746187990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkenvBJAYSjNxPpsRyZb25skaBdyNzOYdvt1oK1G68U=;
        b=pBDWhVdwVLVcgqYCU09ddrTmOFlTcPKxUthqleICAMn2Oc98gay3r1kWT0tqMRxOBb
         e1v9txkoGLVnWzuZqTvHF9CUSiSafi4TJJ87aBn0j8sLwxx3eeHyRDAEyqLgpJ6B9Uw5
         e7y1O5Uw0/g903cXREhAxEsN+RVaOpOeUTA1qKM+Nc429ZpEvDr45140EastVxZycIDS
         cDIhFyuLXyouo9Dp/R93zpdHnN3vvx6zHKbGLvE+noOCLahuYTl7hl7Qs45NPJK7KlNZ
         EW4+4NofVThpiVASh0X32G+t/hk/nsEsixvRNJcoGA4x5cOIZ5H+RMBZNNi39u8Cp+jy
         ENPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583190; x=1746187990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkenvBJAYSjNxPpsRyZb25skaBdyNzOYdvt1oK1G68U=;
        b=qG3niBbeWJEtYZTYJZtMt3Xuk+dIgctYnMd7GbH8CUPYF07H1iq+7jTEaLGVygorRo
         WC8pkyzDE+uB1OLSY9/FwH5E9+dd0s7GNxAHJ6ZG5s39eQJNaeGSL6kvBRSQG+j0FoBx
         JXWMDGoyP+/ykJZ088VUz7mM08RGCK2XslemqxkLKsggaaWjM736kKGlJ0BX3G7/2rfh
         XqWuLozGtZf1mpqERl+FhyXKdUvhwy2seccAHxx5e9b1xHcXPE7HXK5Uc0c6NeIhyZgE
         RRjjGvSNrVmBFRAq7QabnZxZpPVdWXYcS2pDOr1tz6uAkqHj+riiHksKBEKh5+KyPA2o
         ge4g==
X-Forwarded-Encrypted: i=1; AJvYcCUd9COhFbJF7opANO0EkCwkMAdSc11mNt7uU+1NpKrW6WECXK9WA5d3K6ENzt1oNHTX8PeSfxPjlIhUUt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbusdz1ar42rmi1NsHl+s5rhSHE95N7bU/vwZ9yAzVEYOyMVyK
	fj3v8tioSknFPHu4l7xWbO1SIqtsD/SkIVtWf6Ik5iK47vIayXdrZ82U2KKpMto=
X-Gm-Gg: ASbGncse6im7AB16vYlaaalPbhlv8JTyIxXivi7VyLjvCGNi/w99JMhy1pg3FFEjDaO
	nmQy06Vp8KJwIvtThqFEI2ULdyLf5+CDDb5NBbmFCOH6Y2OpaL1oyJ3slr5nbdqmU9Q68jpkBf5
	Wvwcnl/GuIyFxGuesX8z32tQDFQQsqZ8PYOjPW/Hfk5cNAJH+YKz7dLsMW9gJROSwJu38OuudnJ
	BzxqVhmpkR+fGdQKfQNN65DoRWnocKzOOWWO3o/ekMgZhy+NMrVGpDA4ACNXpQz0fPQ1FgUF9ZL
	CIoE6FmrEaKkfbD0PWmOQQfWA7hOiHMYxQxvvXw6P+0QYc2YnPP7ymdllFFmWAXg8PEzlPF2RUd
	6npdNPwUgLOZ3PdGF1gClyhniKuILSz6V6IZ6t+IaWz5sEZeigT879Ecm1TMRR0++E48=
X-Google-Smtp-Source: AGHT+IE1MUEZ+wY7kq2dy7WUq8KFQHakKlZlBrL11IN8KwUQF/X9OnZvlk7i/MahfxdsbRyMwkcNsg==
X-Received: by 2002:a05:6000:1848:b0:39f:e37:1733 with SMTP id ffacd0b85a97d-3a074e10474mr1586199f8f.2.1745583189752;
        Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:56 +0200
Subject: [PATCH 2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/dispcc-sm6350.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index e703ecf00e440473156f707498f23cde53fb7e22..b0bd163a449ccd2b27751e32eb17a982facf07d8 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -681,6 +681,9 @@ static struct clk_branch disp_cc_xo_clk = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x1004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},

-- 
2.49.0

