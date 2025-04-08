Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CDB225412
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123991; cv=none; b=ArN8Q57ypzRZmx0if8HFX7DFgkMGjBc2P1onMlAl2E1B/JFDu6PHbrEK0d07ngGX1mxnQSF6VR+n/z8wn5GEyqqGJj4I9M773PChr+GDKbMi4EYPctdDxC40UP+MhL9Xnte1pOGYTcjdacaX7r3J7WF4DfIMEjBB3lUGEFKZfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123991; c=relaxed/simple;
	bh=YzcC/8IF6WlBpTBBJmagM6VLu/QII2dkapejxYRXF+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T37650OgOEkdDcOvnXjYnSqTuFn8OoxCbUpOiQxAWcQsTfpSGAUjPAPnvqgRQB4Pz6buldn6BiSTF4D9g9PrQkZqxnLwMMdZwvRvd08y8APbIgW6c5wkyWL4cKUTUDoTF/xfyNJovyVeMSAKK6OUAO3rUaBaxlfYk3H5247W0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=oalffeAD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oalffeAD"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 122683F82B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123983;
	bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=oalffeADMe7W0N7uCeuIAQWqpcMEzQCE+3NyT5d1pKMdwqVASDiazM9V72k8ikodt
	 FC1HZcNNTpk3/EJ/tRNNmVnDwgZI9nNx0lWZ6UFKWNbo40IaX55sckj21bjbVrs5ds
	 k34Qce5ViDQu83S+UWNBxTQnuLpr3D/u/FSI8C5pFp5K3OAURwnoT8tiYBkUMCowu+
	 jpscNS4OTGwJVgUJkCz+8Trr4LqXQqRDwecyh8ioblrjpvxWrwPI1vgzzKcPGrvbyO
	 jPOsb+50C4jjAiiZAGKSHNtYGJTZZ2RGxri1E0UZzgVQocUqLBp89NuaW6qjxHjTRy
	 +g3vFWrpb4VLw==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5c03580aaso4479155a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123977; x=1744728777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
        b=H1a35chs9z0o7ODdShqOcngMlaRv99tmztxgEWulrlTWFC4XLcPTDfTDf6dSUXpfzm
         PlxiktuLRqh0iW+i9cRi8dj+XwVPUjlqFHN6y8j9jWUwt0uDf3AF/Q1rIu0fG5Mow+W1
         paMtA5t73dWgWg6amJK+IfTr2q61qV909ZJqb1TWw/inF/JJu7Jcjpd+Q/ZY6iSWYjZn
         b0ozaFdjwmuhJU+uC4Q+GyAO05kTi7C3CauwsUElnANvEB6BYrljZlt4dpSw/0eP7Tv6
         zYErj7ohDV9+pz3sOIgQ0C5pb7V9iDHjl+xdqJLM9QDbJaw5ZtvY6GX7fV8fYXpEgCmm
         wzNA==
X-Forwarded-Encrypted: i=1; AJvYcCXB4xgqKy/YGNL5B3eL77LV5Nu4vuritX4fjUr54DxcFnv/RoTmEyNTMGk5m8XUKExAh8YbKt0Gjnvj9cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5U+MvPlBogASOssScsGneKqOKZYA4Y3FKW9FklYfg7DtAkII5
	XAxCF/F/w4nZ9Fo3IxrjrISP/PXVwTGtqvqk6ByvFlj91v1nNuxxCqANQag192VtHgeASFdcEb0
	TRzl8ARSOdeY3dW++VfQxdrJ1CP3sKfrRf04Tvwfmg+4a/Oy616j4A62KvPp88haQLH0+Ev8IdW
	bmCg==
X-Gm-Gg: ASbGncuohOsTW5vwTJtC3f241rAE4D3V2lcg9P0No9YrUiV9Sqfa8v7D0b5RQiCzAsg
	5Bf3TmHL9GdiWf11mFhjDU7OxrAo9yXZeUEXMtYoB7sxgmV9guXB+o0JyTCNNvyKQLqNYp0EUdn
	A+dYxobyCiAWzYFkJal6dAVaXKTxU+OG8COuql7c0Xk/6x7UMo7GMkJWvYX/pMfuDNRN0TGIIVa
	awMlxJMa94adIuwkrm3Ia4rRgnXyup1yw43Xglhq9rw4jHHRTIRRGWinpw+LYmF6PeZDJ1FSQp+
	x9vb/YqCtWeMDYdoNFhj6wK5P5euSCjO7IReg6Xgl4vRd1HqlnueEPxpx2fi
X-Received: by 2002:a17:907:86a2:b0:ac7:b48f:4cd6 with SMTP id a640c23a62f3a-ac7d6d567bemr1490493866b.24.1744123977084;
        Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1rJL2oh3cfUJLk5my47t8hoQCjxMJuINUXBfM8HYiul6ras4kK+imNaCIKqnjSFm48aaaEA==
X-Received: by 2002:a17:907:86a2:b0:ac7:b48f:4cd6 with SMTP id a640c23a62f3a-ac7d6d567bemr1490490666b.24.1744123976620;
        Tue, 08 Apr 2025 07:52:56 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c1085sm916323066b.183.2025.04.08.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:56 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Tue,  8 Apr 2025 16:52:50 +0200
Message-ID: <20250408145252.581060-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 6260839fe972..1f2a26ac33b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
-- 
2.43.0

