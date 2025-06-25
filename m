Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482029B229
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843102; cv=none; b=oHaokZlMyQEGbtF8pqKE3Zi4o1YeHIT5qzEUDdDk7opqV0yEkkk26RwBFjNHLmPVbitadB2FuYOvYg+CbDw7TMhPRUgZ4jI/O1L4z4/tjsondCCc6RkVpkKZtJ6/AdakXPwFCDQInu3/qqFClqGIWRIwJdlCSTshfvjJPJMdVcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843102; c=relaxed/simple;
	bh=Q3TGw5jKUPEUtYzxcKC8T0udP0qtpvhm4VtR+KWN6RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeijXPDfYl3QQt9efxTr2WOWKxC54iV8nar69nmBkiUkJqou1JhfR89tUPNsYre/dObFvYei6Ai7TE1KQtXZ+PVUSwNa1mB1Cvbg97Cr5RqX1NBR01mozUxXVYiBHoKWsrQUzjQyIffr0YtmHCev7ZsD96W2MUMwnVgBiKvRYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=q/Q929zu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="q/Q929zu"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so9621922a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843098; x=1751447898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQxJGrv8Sfeyse/iafOS7hEMMX9eU0Fpgldk2ORUTk0=;
        b=q/Q929zuX4RKUnUDTWrhdJzrNbhP0slBnLwSKFEsHRQJxJGQ7/dpn/+XtWETDqZO8K
         I/82l2h8J5uiCVBQXeQXeX0wyjZhjoPqap2J9lFCblWdQ/g1XAyYaxcd1Eq/RRZ9G/gm
         4XxFqai49qg82ar4ehgBbxmnvZ8OaQcU17NRMQHUxfRaxwqlqc95xbV8JtIAtk0+ArYq
         qXJyI1QWIOm+YHGua20i7d9xkxQdtC2VFDRwrYL9BvDivKBp897Zu9CqKgm2pDENaBtg
         CWlZYqRZC3EIL5XACiw5CtkfCskGy+swsDR7mX+Qge2fORD0dSmT8xvUOxkt8XvVdP+N
         z4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843098; x=1751447898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQxJGrv8Sfeyse/iafOS7hEMMX9eU0Fpgldk2ORUTk0=;
        b=Ll7FV/8zdjB/JtFekfiEuRHrv1tzVV59l5OB9Y1Sp4KNi7rOqnJPP+CL3v5QumbcbO
         lbdbPMNM3PJv5Ih7G6AhQxJfhfId8WdvvC7bmGdDpVhbjYZrjjKqZM1Fqmps+W/jbs4U
         32HLXc0DqXoJncB2Xz2Y/aYyBEwELBg5BX/qW+IprOJ2XAWLA3ius1tvDlXiHHgP4IdO
         hdjz4Pf6TkaXZSwdz1Pu0pTAORvHp2eG1dMo7h2kqLWDRv5ni+VR/AWzrFmZvwAEGawz
         HEh0PsVhjohdeBZvSfptMnExdYTIeT+pkD71EBLxEC3S8+NB3Q3szh0qJsyeNItx+8DM
         8qSw==
X-Forwarded-Encrypted: i=1; AJvYcCV862JhBBEwiTUWxfOOm8a8vEKtGTtBqvXN+2B9oiqIhzBbG2gKSl3i7IH26E+0aB95JDlYxjs2eYpLQCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwragrvUDcOjvWIC7C+JXfVWzw16JvkXW+mBJ09x0UBmNBk0g3c
	iD65SPjQNXP4sObVgYQNzg4kBN8N0/iincU3ocN9i8NMV6vfeMItqGmuop2/TkOmO6w=
X-Gm-Gg: ASbGnct9H4JDezHCn+fCFijTSi0GbMWKuBxNj89IzjxgM/wPoKReOuesIdTzWUGaoUD
	jqjXBfmSeUjMa44UO8chqP8yazDyB6siBtgJoRY7KG6ywZdF+3ulKRGpyZbnnSEr2LO2Yzk2zpf
	iaaGgSduHaCFqSY9ViNm7xFV18lkSG7Q30/DLilQDXssUYdgn4/jVPzzkbNjRVSZN0x8eFnvqMk
	tMH6SfthH/HjmUXCw+zVsFEwN4H0mdNoKhx8/p/+BcY9q1JrRK845y2dHxoWUtiPmQHK0aoTKRd
	mQtMVtFKndRfwsB3JwhRbIKlFBrim7o0A0x4HE95qyCwbe+rNVc/88dtzObekEimfxFJ7B7AQgY
	ShV7tzQUKMuP6hbV2XZZ+HQuJ1ZvZ+TBf
X-Google-Smtp-Source: AGHT+IEHp5KgbVYQEPDjHDMZCYsZyCxSBmN0Q+/INM655tircC+AtoU2yigxwjTotLgnk+tU0Cxf5g==
X-Received: by 2002:a17:907:97cc:b0:adb:1eee:a083 with SMTP id a640c23a62f3a-ae0bef40ffcmr206735766b.47.1750843097562;
        Wed, 25 Jun 2025 02:18:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:03 +0200
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-2-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1190;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Q3TGw5jKUPEUtYzxcKC8T0udP0qtpvhm4VtR+KWN6RM=;
 b=UFzRWgGItjDN277ZvG16U7Qgw4i6csFwyEmLDECaQSkQKOGh3ZfZ8uRI9WIKgcp4IXQfoJ+Yi
 rNt6NRee2WRA/kgILpUgp174ERZd+fljyCY4IkyiYVR/dxw0WOtheXW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include the compatible string for the PMIV0104 PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 055cea5452eb62ab6e251a3a9193d1e5da293ccb..e8a1f524929a710a6a65ba3e716c697f24524496 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -64,6 +64,7 @@ properties:
           - qcom,pmi8994-gpio
           - qcom,pmi8998-gpio
           - qcom,pmih0108-gpio
+          - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
           - qcom,pmm8155au-gpio
@@ -228,6 +229,7 @@ allOf:
               - qcom,pmc8180-gpio
               - qcom,pmc8380-gpio
               - qcom,pmi8994-gpio
+              - qcom,pmiv0104-gpio
               - qcom,pmm8155au-gpio
     then:
       properties:

-- 
2.50.0

