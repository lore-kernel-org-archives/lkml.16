Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76643277008
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982043; cv=none; b=XL8keC7zBNB56O/MEKWnj2onh/ldx7Gt/bWxEPHwS1VnONfNZyZKECXZg75ZXkpkg3Ucio7F3QIRzbeVzzvNNYe/sH857b0fwev7kBKen3GHb2OCBpA8J5Vby0GteFWaUIOuxbyIbmRxG8jmIONp3cDcokOzr/ODmwrJ5am0eKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982043; c=relaxed/simple;
	bh=wzHHP2feP6wHuqFLANo3CTLOjrw0/TxeFUFRj7B0ILE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLiMZ1z3WHt6hBQBN+QOI4vygPzQ6SIelRRv8j3uQiCdfaW2ooRC3oENg8W8Ah+kXwTh0Ms/Lxj6Qn4ou6+ECM7gy3OK3Ywqewyz9vnAOLavUPaY1899/06yez/H/NCfXPlWEBVY4PePhnq6YT843X2iTGGIZlEjD9Pipnfo1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lRXLUmeE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lRXLUmeE"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so1522391a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982039; x=1745586839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seRyYYSYhDxZAINukYkT14l+opP0XSBbrpJYZxHqS48=;
        b=lRXLUmeEL5AQDEvjNFCo7nX20BT818ObDRsW7bNGHHmmn996HXjOSBgMA/gX9/4QXY
         ueNyKPDPQjb96TUsxT6bdpoEMWkoD4REzIe1WonQlqiiX6RbyVKaGJgaw7XGEl2EZNLV
         R+LvQzeUTGfXEo5xY+ehfFIshlJdnYK57PeaOH8OMRIZ8S5IsfwoXGruvPanWVZTXEkG
         hmEi3bdMq8tCr5A7nsHmItE4B+rQj+d/S/NmhfjvoSARqiwtMBRDihgaPPWjJYY8Z3c6
         fAmwRKI5JlEM7tihczRUbWnbPufqngK85hEgSsZXl0MmTiKD12iIu8/JIfDR45q3fKXa
         mUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982039; x=1745586839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seRyYYSYhDxZAINukYkT14l+opP0XSBbrpJYZxHqS48=;
        b=w8gMJq2nJBMHruUjL74Ugjj8SLfoFJmk/pLJUepQ5f2XUxrM566sJYJKCDjBRtkcZP
         dQOL6rdEdINyUj8YCvclp2iT6rFkF334oD7G9lR10tV2oilvivLpW9d/IQxiA65ydqoF
         KMkOe8iuxB3MFhjQFK4h5Z0Oy5wJBOxkP3nEYPUATzKZoeDZEvQ524K4LdyUGUN7ghXh
         2uLMiLEkVHsg/AMWw+ZKU0r2s7GeFL1J7Yt56Igf5Lwm9Y5pgvg62SOD0HYQj9RZA2CC
         LWqXSR3/EZeSGY73l9cSTbv/Tm5ljC2GNFhxsrBw8AdKT+ddFBF7V0dwFHipXBW2uQa/
         PrDA==
X-Forwarded-Encrypted: i=1; AJvYcCW4uLu04sQ0M7orF0/RfjmuDSvI0CRPZ46dNGiQ73F5zVtBCYZ56a0gtraJ5xcyljLoW95RiHiiO79GViY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15+x4f4Jjs0LvkRP+IDUY50H5+8GWkR456aDLIoP3lz9vRWR7
	HrWtP2XPG8/80zlkoz/kpnbStNrrUvZmIccwQ14o8KVjVyAbGpP4Yq92pLiyX78=
X-Gm-Gg: ASbGncvOYYluQ2NPTu8ggWJ01GnN+iWoWXOn2klGHeMCa8dOeYYJX9mWXdJIrpicAMR
	RChxKFhDdpktRHK871VNEkvS+z0RD7yKwldWrwMQhvws4YgvU8H+6lDPZtnBn19+GakhoOwWa/9
	+QmWyjsr8GbRH8ILyrp6+8mHbQgjvhf5AJtPuS0RXKcqcnlL7g4PZxo1KzGY5RTJOxNCxDJB0i+
	Hd2nCW09kh2V83ik0I/tRbGhI9m4Ri7K1akH6AHy5sLNtaivcK4esAlAf90UQQ8k0whFqsYd6cl
	vg95WU6w2AXYp9WoGcocIUZhvT7JMe0SWiFB1+Nby8VqCFkuO+wfiSTnjDBaWJeROLzznlupQOo
	oEgnXBOOO1AbDdQ==
X-Google-Smtp-Source: AGHT+IGK0w5o/tIazZ37+NXFgqNftZQkULjK7rkiUpRoTJsf3DztGjPOr0fER0jSN21I7Sk2h/cvdA==
X-Received: by 2002:a17:907:7247:b0:acb:1908:6873 with SMTP id a640c23a62f3a-acb74d65b95mr270159466b.48.1744982038650;
        Fri, 18 Apr 2025 06:13:58 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:13:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:42 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-1-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0

