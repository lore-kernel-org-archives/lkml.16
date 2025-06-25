Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B95C2D662E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842800; cv=none; b=T9LfR6kNiQDusldXsewL+P0nGQMsHjmMgM7qrxV4mYoCftdfW8d104cHMmun9nz6ZY7MFCqPDqlhGDIhDRnJs8t3WKgSuqovTwhknVmEoWDYYxd0uKW/NG4FRSd9DukXwsBYCmB2kHjM6T/tHSElMJlgynG3dht82Oq3pO4Ofu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842800; c=relaxed/simple;
	bh=1JOfni8ZkAlhqNEZCQ4qgaOEPo7rOylqXJtAkm0jXyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7C5lnmMID9M24XlgcXFsaDsPwo5Hld1dL/dL5/A6MuEliksYsgw3DtRnMnJY+JluEl/vykpTAWN+7bvd88D2UC91+vNE5qWO7YeUNqiR6k5gN8fFVvM8LZTTfP+HUUWWN5HdyqyvzNp0iHv1NFLRE3YoFaHfiLNfotbHX6IUFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ffu9byyg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ffu9byyg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad574992fcaso1123632566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842795; x=1751447595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lF9jCYL0fjCtKteHdI1tv3/oJ2GPGAyZAnvXAOR5VA=;
        b=Ffu9byygsxI6mHBEtUUCTsq0r3/XKSJ3KBn63XdwsE+bqWWYwk1yZNn+4PBZoaVjRH
         UxjZ+NFDFbHNm8eygTNLnHw76P/80nOP1eKPo176p1/4P9LCXwKhpJWVsMaGmsU7nTSt
         zqK3PjArsoN3gb/mHSeQ5sbmESn+xe0VbnMRYtYtPU/EUoB2aFzSbr+qwF1g/zqAjM5S
         LBkpbPRjQkuyQtCMF1z6NV/SC4mgkQwhqhC91ldEBSoijQFL6YV2lC/2GoQRQD3Y/ws8
         kdqHpPXl0ajXG8TJTcNjDUVoxD9ObD9B/Hd/3hXz5qd9L8cMvIFulCx5EWjcK8CbIJ2U
         RrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842795; x=1751447595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lF9jCYL0fjCtKteHdI1tv3/oJ2GPGAyZAnvXAOR5VA=;
        b=pqxB9BMlJI8b0bx6I50p6BLj0gtqkK525j02CNLv+tTw103gGfkiQJnXivNUW0Hix8
         kXMCM2Bml6265zIMPw4HBcGyDB6No1XjvRBMm8DtI6M0ngFmKGjgBklg+R3Ezwljt51Q
         ur9LAGE/js0Ah3Q3ZviKSnHRYhYhZAcfwJz9moiXM1/vTI1lbuK1BQnaBt8JejFP8XjD
         mhe1hPHeIn9aUWv+MaYCfvvb2mCT/7fsaorx2NEMPxF2/3Dbh3vc/PL4LAQhXcmIficc
         QNuIX5IV3/Qld1GB32WsrvkRiktwmPY56NGrI+6KtwRD+wTt3v9p0JGs23oi5IjRJFs6
         9gfg==
X-Forwarded-Encrypted: i=1; AJvYcCWRUf8hMRW+810sLPyq+utV/1pFiglTyb8RMHzdVed+w8ARbqui8rFRGZ+gqcQFOE/sTObXvYmWKT1Fv2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPA9hOt8535jTTuiHYeadd+LAK4s83KdW2/QnQxF+7O2SzW22
	xUB2AHHwjSfrIjXih9sxcmF0u1q770yhCRbpCe5wRoz7bp5reIx/V45Mu7+0LVU87QwVL+V3B89
	u9fHc
X-Gm-Gg: ASbGncvTIFfH82V0mg6bvFbZCOF2DAkZWGz+5F0x95tfmVJyxkz1ALZZF9kPO50BnzK
	ft4qmM1qA8wtFnqvi+DOswvBnEosoFjW6fTH9NvjLFcwMh1jYNjaztN7Tx9+NDH1bD9Y6pEiMw+
	mMSXC9QpFi17alQf2IqV8v4+srQw/u+S6if2ocqDYhB0hHdwuPdga4jgpIIkQEHVutdSUTtwqTh
	yduRKlrwuwSImIZOdTlXEo08sqOhcDlbmkEXJQJqhBt2DrvfXVrmX5PlCGYqBiYTUeQFD2m7pWC
	uif9mNXgYAm/yVfzNOQRZj9K2GFk2uWYgWOqUi46BTiNR2KMvPMrGP7vv0D1eYEF7lLpRaLh65A
	I2MweTPjuZSSNiDTF6Mx3AjNH5MXOsEFx
X-Google-Smtp-Source: AGHT+IFPf461EnwzWCAllVo6gIU16fYgAoPXHUvYcyIX8YNtmHi+yAzHTOgZmKCIoR1P6uPVIJzgLw==
X-Received: by 2002:a17:907:3d0f:b0:ae0:bd48:b9ce with SMTP id a640c23a62f3a-ae0be7fb932mr201771066b.5.1750842795252;
        Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:49 +0200
Subject: [PATCH 3/4] dt-bindings: clock: qcom: document the SM7635 TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-3-45fea645d39b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=839;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1JOfni8ZkAlhqNEZCQ4qgaOEPo7rOylqXJtAkm0jXyA=;
 b=ZN+/dA0VomKn/kWmMDuNthqZKs1tzKqyPNj7BwrbYWGGfV4zAo4FR1LtEZ+SjLFcTk3tItRzS
 Fj8DufRZWs9BEVqAeHiZwe5w6NuyuoICv8vZnIzrY5EaUZHi2qp5YER
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 TCSR Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e8682de83fb16acaa35448545f77ce77..f23a32befe4e860336365a17fd56d3ecb32ad44d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - qcom,sar2130p-tcsr
+          - qcom,sm7635-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,sm8750-tcsr

-- 
2.50.0

