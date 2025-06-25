Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D729B23C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842797; cv=none; b=hVSx1IjnRYBre6BKArbMYE3/6dRUFZiqC5dzZujoeyTLgFGV0BMlebNBwqjzZjZoGUszaKNzmL4n2a1/BIDasevmBa9SNjj2yBva0saymm7bd9eGQZ8/QL6/87+PDwrUG4HFWTSDg0JyQn1RWaXRx5RqTwzq7oslUAFeaEyHEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842797; c=relaxed/simple;
	bh=Gwv86YaLq4nMyYuk8Ga+pLFqTHUG/EjtEAyeU2iFtZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH98yHNXjyQLxNU4/Kju/gOyDZbG7zGbtXgh0CUy8GKkzVQLNv8yaINa4woJVlnc6/+aj7ivWcshAJsMPzeclGiJqha6zmew7fzUOZ8RlkeJo47nfpz4ZZpj7JjxZkN3NfctBaGct3F/MJyV23XM+kd9qwTHrLkIjqp31YfGtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w55maAI2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w55maAI2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1055526166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842793; x=1751447593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIonQPzr0yW+9KIT56dpfw0JEE8zh3WfbxaXN1wXE2A=;
        b=w55maAI2ViAGgCOVeC0bOEilvnyX84oSsNpmx4XY9AGM1IiE/Iu44HnvawufvNk9UP
         stlQ21LmVzeSpgmjsc5rHL1P0Q+VOdZvDMWMNi4Crs9+4xZzV02o6KpTO5VLU6wmD3cj
         dMbqX2xmjeFp5ukWbjn9armAmkORYRJWKnifczORnNiarvXblkkzydlFt8gTlYsPFBIe
         6jf7KImXkNG/HmF0xka4Ks5AjTSm1mRu12muq8Isdu2lLhbOL7X5hxtGQh7Z6iAkAnob
         WwOsaHtSoBoGnGvRItx4Mr1kHmSWm76lWPiBiPkR5G991S/DERb/CKYppEB9MvoozwWE
         uNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842793; x=1751447593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIonQPzr0yW+9KIT56dpfw0JEE8zh3WfbxaXN1wXE2A=;
        b=LsH3IBLlqdt/qEqJlspkaP0nGk8lA56OGRfvR9TZycEvHjobM3gAEbSXvu98dVycSL
         HB+xP8+hv6r3NhGD3gmxTA4VPPFJ4NCjk9htUQowBO62iXo3GufeZvbgYKUHqgqokov2
         UNNJhF1azIHelzeFBBF2IfDV2Q+r4kYddWjgkGtYSN15jhuUfZUv/+/txHRXZtIKqq2M
         YjMWrNLIPaSHk+wjilnLG7dqE7YM3rZJzQGfO0i3OjVChEx/WQTgWatBuSDV+zO60z+H
         OKXgwi8f61a52B0cNHKomClThHD9yIJ5xyneHsSwk8I3N6MQUoY95ldTAxWjTQO7pdaC
         OSTg==
X-Forwarded-Encrypted: i=1; AJvYcCUf3ga0YorUlArtx47gnnqR242haPJL469oL59totXe4dZHitIEJF5wGLCRUpcQohKeJ4wX6yY7cR9ybqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqIsIynFhhcln4FXLRxHrSzmsy+6qJCQj7VFhxHn359LgcBxqP
	+JttGpWxwFNBgXdWIgEMpxvLFQeQdqKNsKOVn29kO9szXIzquJsO6sFPQWEjkHxPf847hZ0M5HH
	0Fa+C
X-Gm-Gg: ASbGncuYiWALi3xKL0LHTNpKtV0c5ZEUdZgm+juvoAIW2cATDkgPEXz8KXZccAxUyWa
	umFdbn58XJLyynfswdvWKYslRaKaYYWh0W7WlLcnLeVLGPChibHbU7YM8q4MfgCRiqL28MbmS5q
	D+0t10qQ00SDD/uFP8U7GIBtwKlU4W0AlbPXU1oQEo7gkShts6s+1E3nc9HukB2WrW+21njGlv+
	lwMye01DUGNSWLOBlEkwLGpeGTQzSVsReUvEWaxUExEWc2viUkBGsIjIh5BGuCSg88x0dKfFVsY
	NoOlshN9o6W5J9qUUpWdWWBubdxIKXRDLqv90CORsZEACsZ6B3bATZ35JUYA4C08VPXXYZbkXzU
	qpsCuxXos5i2P8gKh+fQt0Hge7N82/LBf
X-Google-Smtp-Source: AGHT+IERi2KHtQmQ4ho4DAkM8LuxU28cCOfHg6BLub6/yIICgropn78NU/dR0TfXuDcxZ6KxmKngVg==
X-Received: by 2002:a17:906:4914:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ae0beb3d1b8mr209242166b.54.1750842793405;
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:47 +0200
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Document the SM7635 RPMH
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-1-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gwv86YaLq4nMyYuk8Ga+pLFqTHUG/EjtEAyeU2iFtZE=;
 b=dykpNwSjr0QLGEvzyK2lLZvCnvMi6GOSDRyxweW5VB0Oy8wkfDV3gYnxPAlaPGhVjMQEC9I8M
 gVc59G4W7/IB05nJrDZCgmK3yGnOuYo7iM0Us/OIXDZgypH5MsSxULX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 RPMH Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e01f87d4fc546311eb758ee63af9a..340dc2613c9d8c6d1c5ca4fc74801ee6d4d197d8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7635-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk

-- 
2.50.0

