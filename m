Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E4238C1E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745452419; cv=none; b=nHeliMGAVFWaCKvnG9LKlaKsqFeA1NJNM0LQvW5TKLR/w58DBBeF3QO74rFNGxiFmXZBLN8+Mf7utExRTuHmQNlhHgaNlRgsiKwFCn1jGDcHqTFXRlABCVn622o7TKRZOzfloTK5VumKk12WD7SVqSXmN9Vylm5RrlpwqjryVXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745452419; c=relaxed/simple;
	bh=jaLXeHZO4CRuSfkEnW7KZDso1O1Ra9XizhBwaGnF/+A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TKyto/ZIJ8oSHVOz/18IBzTqK7k+mQsDo55l4tq/RHldYdJ1CykjevVuN1AcrAlcVEN4upXFI+x5539q7gdYXXbOf+PoLgBjlHSkODCNSdNo6TW4hkuugXWXIxSudfpV9QiTBjAP+iojKSQqV7WhkkGFX3j2uPN/NhJwv+z+kpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0FQWjks; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0FQWjks"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440685d6afcso3954675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745452415; x=1746057215; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wO5ZtydfTuZc/OeSHhlLm38Bhmnhb7Sjq7pggZ24Pwg=;
        b=a0FQWjkspxTHUMtwdnuiZHsmFKaRP9IBbvVwObHeJfrI3/+uR4dtnxGQVhvK23CtcI
         yQf+i5xMphYn8QGDEx9pEA/uLHcK3uOyDHdGYlN+tzJQGMZqx17RyaeiI27srGaI+C54
         fdYCovGvGYs2c2FgBa0PeY/X8Q0j5lmRODM4kkGbXsM5YaSa6HPu40ijsTlBqUY66QUD
         4fshxRTF9SYw7DuukB7I1552O6Bdy1ZwZY3LIJJljIvVyN7GW+LJagl8KJXyML/e6UK9
         mJPSWu6US3geIAf3tZyDW+07ZPRzIXpgXbsgEjJXOO5cCVmE0u0bS6d2s5ya09bdgxUB
         6+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745452415; x=1746057215;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wO5ZtydfTuZc/OeSHhlLm38Bhmnhb7Sjq7pggZ24Pwg=;
        b=h+epGEn2Nq+SCUxc4yTX1CzG5fQpbvTdMexuSVyanSt5JwEDSGNlm62STENWl/kOeK
         30F7fgUQELyvSKJfToog9pX3gdvtnLK3AcUjw0vXnrpIBn/vc16kmF6cc06wpM6rK1rk
         bVRwdg4p4ce7urqqImtCvJ0L3u1lWGJDhCqF+ZXdhpVOjU7oytwye7F3NsD+XDuyjlla
         mNwaHmcMnOHirWQYpGC/LJ77bjdKUZuFYQS3lzib+zjwrMlvsmZHGicSTtPbxYr31A3Q
         kHTB8BbAoN2L8yBY39lb3R1Og2MA3zb3ZcdIrMi3dLa0BpAjX95oBsPlnhbspOGQLBJJ
         fyng==
X-Forwarded-Encrypted: i=1; AJvYcCWZi6Kk3cSUCEDadAsnRgQ6alE30NjU0yFZ+7K4apKLZDPVosimL7e9wwt35tmw5ec7ODVnFQFe6o9B5z0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4c9U8sTSvQqH5LtFur4fa80AJWR+ipLC683ga7xu0f4dcIwUi
	t+d1QbeJibLsaSd1UUOIvOGqKyjji64tocp5NiQj3Pkw9P4d6e+CnMJcAsdnVSY=
X-Gm-Gg: ASbGncvHV53wF3s0h8kblZoVOtVHo4a5zJ7+nWuui0IOmtz6X9NkvjGFJKnouwv1w5w
	zfFYY3ANm86XummxxdM7oKVDIcnAQo4NixXi3RkPXZEauxG3q3BiZTIJBQu50ON6GOw//8Vq5b7
	lecJUzrcponua5HBuoif+VzGwtn6slpj2faEHHPUAvYbfsqvwUvxZqjDKe2TGzqku+pxIoZNnUL
	9rdmHKJeNFaAt1stseLj9s8feUe8Cf5yiBVkvVxwGIYDzkXnDDThVrdyLFr9Y2w0cbf0RZyx1NS
	7qjjlIfuyAVZ6q/MKLmyxy+jGQrXBHQyUeDBdPVOq4gan2OnvZM6dGDxtYZmohpBKQvvqet3tp8
	M+6qEnQ==
X-Google-Smtp-Source: AGHT+IEL7K147MPG6PBlmwpddEI+LEssXzodaiLUooF3Dgc29dngHpS4HGqJu+u7hUYFAUxsKxskhw==
X-Received: by 2002:a05:600c:1ca5:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-4409bd77e75mr2628275e9.20.1745452414836;
        Wed, 23 Apr 2025 16:53:34 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm267265f8f.13.2025.04.23.16.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 16:53:33 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/3] Add x1e Dell Inpsiron 14p
Date: Thu, 24 Apr 2025 00:53:29 +0100
Message-Id: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHp9CWgC/x3NwQrCMAyA4VcZORtYRxfFVxEPtc000KU1RRmMv
 bvF43f5/x0am3CD67CD8VeaFO1wpwHiK+iTUVI3TOM0j96d8R3Liln0s2GwlTwuxZDQESbOGUV
 bFSvqfEVOdImJZn6EBD1YjRfZ/rPb/Th+QB7pT3wAAAA=
X-Change-ID: 20250417-qcom-linux-arm64-for-6-16-dell-inspiron14p-ed68cd65ebad
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=jaLXeHZO4CRuSfkEnW7KZDso1O1Ra9XizhBwaGnF/+A=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoCX17JDDl1Hv3g49j3MkaaiHt5iGQ+QUsf8d0k
 GwcUksRJEOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAl9ewAKCRAicTuzoY3I
 OqgLD/4nN0vlwAieibgBh5P1eCaSWbaXK/2xFzLXm/e5rwoyoWy52YwX6wAwLRQq9pnd9O1Xxm9
 MIkbI6PLBfwN84Ho//C7Z8wrztm9ZqsiWkO4Loi0ONhFcPAjz4pI/lMocmiwxfeCs+Gz9+Z0fRV
 ME2+//nLPeCHEbH4wIZqcexPLqwtCjnwFnqZ03JJA8H7EBuBYB+jjclpYOrmFWTjd0P/BBgkDJ2
 EPB0CuhozaKn1OwhiaW+04oFrz4Vvr7/ZWmA+ouU6V2yXQp85vduc+j68q2SXz6b0HvppCFd7HY
 0VtyqW9EMTK5qHCKqhJD527Z+c7JPRUujgqhzD9XnkUP2Wd2esm2vtOPFDXajxZcB8o0081r01H
 pPX5iPVcn2N7n65ekKka5syM7IEzfbv73Xim4neDrP35k4rfFsuL5TOH/26eSlZ/2DjC/8YxQgq
 D09wnkH2dPQHvvKVTRrN3gIl/ZwmMXMb2oD1nCLHAknEgo7Zq0WSJ03ptLJdYkQcuI3h1ZLFZnK
 KJ1/AJNh+OQZovve8x9HNFRErklcqcZbKe1PvmMmxwRHRIk4atPoEnB1/FWVUO0YAIC73PVsLPE
 YCI2C7ZCUs0GB8j1vxb/Y0Rh4BRtLWBkX3UfG1phYGwIq2VVbKygr1wX7F5w9SabSAYfP8fbj7K
 T845M4n11bV6yOw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in a dtsi for the Dell Inspiron 14p.

I'm currently using this as a daily driver including sending this series
from. Its reasonably stable on 6.15-rcX.

The first two patches can be applied without dependency, the final patch
relies on patches staged for -next in the media tree to be applied,
presently.

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/2ab7f87a7f4bf392e3836a2600f115a1baa1415c
https://lore.kernel.org/linux-media/20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org/

Working for me included in this series:

- USB
  Both Type-C USB ports
  Type-A port
  Fingerprint reader
- WiFi
- Bluetooth
- RGB Camera
- Toucpad, keyboard
- Display

Working for me but not included:
- Audio jack
- Iris

Not working:
- Speaker output
  Still WiP haven't touched this in a while

- Battery
  Dell has its own Embedded Controller likely from the x86 platform reused
  on Qcom which we need to reverse engineer or get some information on to
  make faster progress on.

- cDSP
  Haven't tried to bring this up.

- EVA
  No driver haven't tried it.

- Bugs
  Occasionally when resuming I get a fencing error with hyperlock and
  freedreno, TBH it looks like something in the GPU or SMMU according to
  Rob Clark: https://pastebin.com/AWjCyaap

  Ath12k has been splatting for me up to 6.14 when removing a SSID.
  I switched on ath12k debug when going to 6.15 and predictably couldn't
  reproduce the bug, either because the timings have changed as a result
  of Heisenbugging or because a fix has been slipped into ath12k.

  Other than those two I'm pretty happy with this system.

  The DTS is based on Aleksandrs Vinarskis XPS, Lenovo T14s and Qcom CRD.
 

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
      arm64: dts: qcom: Add support for X1E80100 Dell Inspirion 14 Plus 7441
      arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts  | 1490 ++++++++++++++++++++
 3 files changed, 1492 insertions(+)
---
base-commit: f7570505263aff2b63142f0d68fa607cd60eb060
change-id: 20250417-qcom-linux-arm64-for-6-16-dell-inspiron14p-ed68cd65ebad

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

