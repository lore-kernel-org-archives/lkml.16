Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ADA28F4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724432; cv=none; b=nHnCCf+3rf87IzAtR3YPl/6rDNXA18X1InlLcp39eOEmhhhnSRNnOV88EuSfeJHMHpCmQozCqIilT91joZIWDFcw2kmSg1mtIrGZiTjfkQJgc8tDd/np4UUJKyQP/KYw/KGTnMZCR1T5DEqA+fbYXHCxYBqW41zv9CqZaY66qXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724432; c=relaxed/simple;
	bh=n6HXa/sf1p+SFqWAo1aM9scyMSHVU8I90Zz3Qpu/tAg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AdxrdkP+qKl3sjJl0AQCoHvrrgd6KvUIYmWxUe30ONuRhrvT3dDytvm3nC5BSIRPv3kf2rZ2n3QWb4FBgeXHWw9nMc3LfJFnggldsbAOFW251fr0S2HfyFJgIFqkXtNgwWj2D5w5D9aHP+fTdG5m5I0N/l7sL+zx7rG0Adl85ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg4WS9E5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg4WS9E5"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a44e94f0b0so23649091cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751724430; x=1752329230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=;
        b=Yg4WS9E5H4wuIYQb4bvQitAkBEYXOmmmJWYHvOzRmmvigSh24G8Rpti2uEN/W34U5p
         VsYUZl1xSNW88KNa2HPUNgHvcT77BIwhI5muamaLw5Qsa2WFtayJdRj0pZ7RmD0USWbH
         I7vNzY/GXcKck7adp3dFABdHrAD/vQrFaSe9qNu8eCbc8+hDuylHN5HyWb0fIcmZOvwY
         l77cKjWABXkiZkPzv+uG2X8hXZQX3PrD0pRGB0XYkFubutC9QtOKjMvyNgyftDK4L0AK
         uqBDlR8smr580U4Vb91qX8f9GzoUPE3/PlybdimI0MiMpumbZbEUvuEna+7ac6q4KnOC
         nCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724430; x=1752329230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=;
        b=helIqHxmlXij2LyIluXsVXkiSlT2oq0sytERoTkrTjKQBOO0KAU544/k6mLnKf3XJj
         lG6bZ7//HanV5schWseKVKFBywHrgQ7BWGhB6wIjW6wxmfPMrclaoazRu6Xh981M+4oS
         rWqmBZjt3ReJ+yOpHJbBns2R9wnR3yXm1l+IrceyyfMIlyyOF/sFNnGOySID+L+vtEB3
         tpkv6A9VdV0u2oDUXGD0fyYvtRlUyjgAiZ5elm71QCURbliFK5b1Y0BUZwlmcalzQiMA
         +BqtBAWZYznQ8MS+hIquhhM7fe+mTiVMRxEjpeivbTn+2E/z0QuL1Bnqw6nI/BQtGk/W
         v/lQ==
X-Gm-Message-State: AOJu0Yz+124LBCZ3GJcw3f6eZZUFYM67n8dbUz2VtMfUL6vPrxoHpq+5
	tLGp8wQH9CutFLaanl+cR9fAhaxnt+y+dRueC3k6BDZ7n2/xTWXao9iUpbd/ag+g3YbrWs5SzTt
	oktW4jWEy51juSCs8FkVgLufQAP+IqyavTNJCZQY=
X-Gm-Gg: ASbGncv3J7JRy9RcMY9uTRpyscHEyal/QB48jljfN/zy6vUBi33CEc/HvfGOjk0FSjn
	cZMdtMGUSCaF7CnXJq9k9sqsZt+BkyvW2WwoDe/hHVtg95N7VT04Nq7T/OT73aB04H6CJUAoxpT
	RqwldPby0Cjov4UXvWTz6q0iS6ObzYwGTH9lLrOBOyOslmJYr+oqCCctDePevlvu5W4WgEkJLIT
	hBdbw==
X-Google-Smtp-Source: AGHT+IGsDdoQUx+rSGSzzxXCkVQDODMY7OH1HVs+DAsqxKXPp3PdFxseodwOcARcUr09rHXKr9lxP26x5Z/74k075ZY=
X-Received: by 2002:a05:622a:8c0b:b0:494:acc8:b4ce with SMTP id
 d75a77b69052e-4a9afc199bemr12740321cf.11.1751724429590; Sat, 05 Jul 2025
 07:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sui <sui999924@gmail.com>
Date: Sat, 5 Jul 2025 22:06:59 +0800
X-Gm-Features: Ac12FXwxhjoOA5doABq9pXsHKKNI0Lm9-AgrhCbufh34BRyNbE1ih_yh2bJvRwM
Message-ID: <CAObhpgi5uBNYOygBi3E-8H=XrnyrAqgkS5RwjCTjOUh+aq-zww@mail.gmail.com>
Subject: =?UTF-8?B?W1BBVENIXSBhcm06IGxhbnlhbmc6IGZpeCB0d28g4oCcbGFibGXigJ3ihpLigJxsYWJlbA==?=
	=?UTF-8?B?4oCdIHR5cG9zIGluIERUUw==?=
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts the properties =E2=80=9Clab=
le=E2=80=9D are
misspelled. Correct them to =E2=80=9Clabel=E2=80=9D so tooling and bindings=
 pick up the
node names properly.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D205891
Signed-off-by: Jake <jakecontactxyz@gmail.com>

--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,14 @@ hdd_fault {
         gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
     };
     bmc_err {
- lable =3D "BMC_fault";
+ /* typo fixed: lable =E2=86=92 label */
+ label =3D "BMC_fault";
         gpios =3D <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
     };
     sys_err {
- lable =3D "Sys_fault";
+ /* typo fixed: lable =E2=86=92 label */
+ label =3D "Sys_fault";
         gpios =3D <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
     };
 };
