Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4A22DA08
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748537636; cv=none; b=kI8DaI06xRyQnFtKbYWxYWjwSM7f9boZqDmOKWlnU+/bTjtdgvG15xudcoC0B2KRDiKms+1EcGIptTjABBPvZvz9QVFscpzgu1/hHOyh0Yuhx3Y3x45rXyORZ4h4l9Ec2nGpPdQsI7HefAh7v6OOc8K8KE+5+yQlbJAPUOA8l/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748537636; c=relaxed/simple;
	bh=Afxwdef0Jf2HSBiCXGtNVmL7wJWM8CS0UaEkxk3+CTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4HpEAFMnc5Zhs93d/Y16m6KqpaAzSlTXwTGUHtLlOG9wQk+beu9DAj/a3z6Uvi5TcOygJ4RBlCcdTVRnBfun6XRJ6bSv/NGYp9Oghrm17BSZu2ZNBNVOYtBg4M3EUo8IdLUjPMZvP9oamPBM+8M+l6FoL3xiwe0AwcKbaoaXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TNansi3k; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TNansi3k"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c09f8369cso469628a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748537632; x=1749142432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp00wL1Y5X4So9ecfuqEeP+KnSz3366qtgJ3q9p0wb0=;
        b=TNansi3kvunjDYhhwJte4ByprBOf69V/NWg/iMGC9BdsLbI2Pwls1d//fJPZdctrrK
         0hWt0WXyJjfUc5umsH/Mtyk4VfcRCin6HMAIi5BnCirvRuqi9hWGYon0SLuFf5xV//Yp
         N/SHJuijKNB6z8LH3md8VVkFZYkVcS+Y2VzLCdR3IgSOvLF1U8CIXaL5UYkixDK/DqLH
         wBKqRz5eicWoMYt1yhtGKLtcolN4UW0DPRzY0OUa04Kqsy1owROJDPZ7YTbJcPWs8dOT
         Wuc/Uk1l4sm6JrCDZK4Ay752UEc+fSiBQkERW0W7oExeE+ImOQkI5X/PRFJAPwWWZ8of
         SI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537632; x=1749142432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp00wL1Y5X4So9ecfuqEeP+KnSz3366qtgJ3q9p0wb0=;
        b=Ra7bWjiri6ne3I/BQSj4bM1d9ICLp7nCMd/IJEmz0PPoCCEugbfgpBC71HXFFkqE+Z
         /yrngvQUrN4e6+p1feKDq629imtNTgzislj41NeXjMM8EuqMx/9bCWJ/VACPJb7R4rJk
         KW2ljQjwIL8spPLuxNNxmxQM/UK+ewgiovfuJxoWG8Mtb/iapDLOFE6oH5xqC5tnhXXj
         gZOhNZ49a7HHjeJ72vDNS5IxtFKRpJm2w2g+8Qae0rdaVR5w847SmOYQ//eAX5dip+l7
         pm2lXpI/JSIxHQqUfxDFeH0dClUKOru0ybNOOadTaricz3vg1UKhSK05pw6ETW72ZEzQ
         ox4A==
X-Forwarded-Encrypted: i=1; AJvYcCVNgD1q9qDMJvetVEY2LgdpObMGgokP+cX5PUQ1VQicL8PN0dvDV/p1s3KMp+pvycyuP9ymZZrCHVz5KXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+3jKM0Ii2O/JXaceIgwknNahxLkCmhXgnezSFdOGfX9yjoau
	6Nn1yGCf4N2JxsS9hxok80hiV70kjXzq3paMJYQ17tGqB7O13VvF4AxiCH3GGBctDS1anYmHyQs
	Sq740
X-Gm-Gg: ASbGncvC5HERsfSEH2lwPqu84xwzzQAsi/zrvWfC7cM7LKZt1kEwzHQvE+DhVipSj1/
	mF/ZqwfMezLcFrJ8RP31y8hu9HSgibOzPRT810xuhaawt06EkBW6FEZ4wZTyGEjuSRg7E8VcisR
	W4mqwvPNeQXaN9OyAwgMYaSeJsNrYMts+2S4V1/rAW5mCSxHOiHl6bfCZ+mVTf9/omYKNPOGqXb
	mbKRhv+3I673kuj85AyJSdbgALzxjIqU9oLQg4o1K9RQVlirdUk1qhjuwOxsJAADor1Sf6CLOCt
	5dPWQvSby8roN6vHtTYswxpXSpFGGRVgfKPMs50Ixy0+LQzzHB1ITKLu
X-Google-Smtp-Source: AGHT+IHWfANHEl60ub2u9RCYUO+1dYUXWM1SqhmMS0Cv0T9+qohTtEh8OvWGwFgekQwnTfEnL0Xe3w==
X-Received: by 2002:a05:6830:63cd:b0:72a:10ec:3542 with SMTP id 46e09a7af769-73670a003d3mr58025a34.13.1748537632570;
        Thu, 29 May 2025 09:53:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d2b8sm303265a34.3.2025.05.29.09.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:53:52 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 29 May 2025 11:53:18 -0500
Subject: [PATCH v3 1/3] dt-bindings: pwm: adi,axi-pwmgen: update
 documentation link
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-pwm-axi-pwmgen-add-external-clock-v3-1-5d8809a7da91@baylibre.com>
References: <20250529-pwm-axi-pwmgen-add-external-clock-v3-0-5d8809a7da91@baylibre.com>
In-Reply-To: <20250529-pwm-axi-pwmgen-add-external-clock-v3-0-5d8809a7da91@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Afxwdef0Jf2HSBiCXGtNVmL7wJWM8CS0UaEkxk3+CTk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoOJELv3klzplmJWe7i8nFoiNwHuoSes4VI5M8o
 OKFFE59XzeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaDiRCwAKCRDCzCAB/wGP
 wM52B/0f7SuexXaBLZmawRIBtmajfHckBGAw7+J844EWpdy8urMrJGq58sMQdSP80Bts3mt69mC
 y4BKnCuogI3N0m/EWTcQx5AKhUwSSGxjluIlbDXgRxZaMSrMY2ZZBURUjHThpU6AT7dDZ9O5ETR
 EgOAZnsHvIShlnOznLdDHbCfIwPX9pSxW8ZA8VJ96YkH6BPSA3fs1MpGDmn+KuQDMXLOgQv6b7b
 5y0cDrjRIHuIKaJMjzxfAZAG5H1lL2RHpakwS4Jz42QnEyZ7ydceKvuiQPO3Mkwt/+dCNkFY0yi
 Vmv2RRKX2qXmIiv7RCpsrjwCvSzoZ7jIel9nc2R2gWqmhqsv
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the documentation link to point to the location with the most
up-to-date information.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
index 45e112d0efb4663bc7fbb3a25a12d66aa8b7492d..bc44381692054f647a160a6573dae4cff2ee3f31 100644
--- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
+++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
@@ -14,7 +14,7 @@ description:
   The Analog Devices AXI PWM generator can generate PWM signals
   with variable pulse width and period.
 
-  https://wiki.analog.com/resources/fpga/docs/axi_pwm_gen
+  https://analogdevicesinc.github.io/hdl/library/axi_pwm_gen/index.html
 
 allOf:
   - $ref: pwm.yaml#

-- 
2.43.0

