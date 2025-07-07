Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503352951D5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882228; cv=none; b=nQ8AUjkLvLg4OGnpMOtBcgWN056DOJsHfIBPCqRrRio0lNHcLeDRDYu5L2b0hvuvjrTgLnvhcxr8kBkgmzntTuontghEJH9Dhqx9iRUbpnmOHfXtrlBeJuhlpi//jwh5n8XDZJMKk+lRvg59MR487pp2OkzzIuQ9+jWkBQUYyiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882228; c=relaxed/simple;
	bh=Bhxra1GQ/bIjTbpqCLvfnTZHG2lw2VBVW6y2QbdTyP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWQvnqds0+OgSCiy/11GiwyQ4WkQ6HbA+RxAFbJEUjvcr8gTh0gFVUr5lcZ0x0656FODpAqYb+1d5wyv8ysiK9GSMnPxFNwfln2sO2gIbs4bAXPLSf+fAtWaz77jGXZUuMdR6M1SjsQFrAWydPhLHG2Rfd7VmdQmUI1zVE31oe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=skWIQ5h7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="skWIQ5h7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so4284105a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882225; x=1752487025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txj8WLQcO0NfnvP5FHSsYizAuFG5K7CDWtWvif6Fr8Y=;
        b=skWIQ5h74oO2xJPf/Crf1bI9apwt13P0mL0fXL1TaqYnA7k9Dlmexmr9jbU1GHUtda
         FoP0k8Fj+1H2pzBtyAE/KSNHbgEdHv7D8upNqOKs0S5dAD9ERjl0Kaba2WaVVtxCkQ+8
         zmGY2cBhSC9leULjWgvx/MsZgTRA7Vp1Nj5yDUjeTpuT13Su2GB30YnB2QrR0iy8mDM7
         3K7Nh02jxyusTIt2zRexax9DUkGIlcHkCAYBi9nonqKBIx0UMfW185bTnCVbNNFiPB5Y
         JN0pl6HUUPDRDnc3IDkLedPO6HbRMxIjnR/+D2Sw+rtKK1PobvT+c5eu7ZU6BH7S+3T5
         N26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882225; x=1752487025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txj8WLQcO0NfnvP5FHSsYizAuFG5K7CDWtWvif6Fr8Y=;
        b=Zbf1GKUem61ocLoQzyZ3XkHVNk1v3Jds3fYoiagmYVTWqjoe3U2QIQozCC4B9jec/+
         I4SjHZr3aROUJcqgOFCvo49shEZ1Y/lIW9a0Th/5Eh19Xs+k39jXYt16EplphLh5TKlF
         +cp/Eqg6+hsJanS/sHzGYNQHDRuPbO/JI/e7Wqzucw28I1kvKCrvSeuBJu1ywB/Ekvnb
         OPbulsqrQF41WZw5R69Bk2BBPS0mrPuIMsIVkStnZpLGsziEhyRiXtxZCzZUvJ8AmuIj
         3QGWrRA5GphaQWFdWGzIWuXjfc3m32HrlEnJUZ3kAl7TJMvWJxSaEXKgD4r0ktRjPCNB
         yCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmtNSJutYzNi4Cxm76cuzXA8FvRYt22zJp746yGZYr+qyz+TVs4YSmVphtzTvsS3r+wLn98M8Yw0cjnc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4czHB5S69FilkpF0eAGL8qvFg0WmIwOrsLOrCqZzROeNLHOvT
	pRjfGXzr4fae3wkP2eha8VvxZMD2aCF+2QjRNmalmHi70M1sfO2Zn4zcadQH0F+UR90=
X-Gm-Gg: ASbGncthqSxAbsm40Nt7TomtlTw0bXdzUokOE37Hp26ftcfYySL52UDZR75QsIxLl2r
	FK+nb8UxeHXXJd/Kg58xoWL3JDKpHfV4Cw1evai5fzVau+OkBTnvL+J4fgdI8ag5hYhj8UcU2JK
	MlQWf8l8r9wmswhCaEUCnDY0Ab3RBprWe3UftF8HsmzpKOCgaIDa545t4F4yRrkC8Rcov/dmn95
	IKHGeksushimnxc55c0f2ycHAld9LL4aKPs21SGytHNDofFFZ04y1s3lYMSfeKPHKX+QyHw0O5Y
	U3dPzYea6H6/WJVBWLEkFBDttl258VKFPBDfnaAjxO+FEb0nLetdqv7p081fXhaNLe3rNltbeL4
	jwrRwbawixJOvWc9D5tgg/sBSSdX8mmg3
X-Google-Smtp-Source: AGHT+IFvEBpZnYhghsTZAjBdDt8s8o37jDWwd+waPZynO8DTGho/r/xxfF/6cA2ywOE34hiVEpZY9Q==
X-Received: by 2002:a05:6402:1ece:b0:608:64ff:c9b5 with SMTP id 4fb4d7f45d1cf-60ff38651e5mr6750368a12.8.1751882224550;
        Mon, 07 Jul 2025 02:57:04 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 11:56:39 +0200
Subject: [PATCH v2 3/4] dt-bindings: clock: qcom: document the Milos TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-clocks-misc-v2-3-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=837;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Bhxra1GQ/bIjTbpqCLvfnTZHG2lw2VBVW6y2QbdTyP8=;
 b=qpkObGBLGIfyMOIJf1lDpa+W56Qq9d80/uttCqYeIvoXhRn0DVPLVUU/cPCh+u38GaLqmFsAq
 IdKFj5NjVlICuER1pEltGRDULc2QN6YqLKQIEjbnOy0/5arL+fZcqLE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) TCSR Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e8682de83fb16acaa35448545f77ce77..2ed7d59722fc7e1e8ccc3adbef16e26fc44bf156 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr

-- 
2.50.0

