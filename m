Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BDB13BAE3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745456943; cv=none; b=VvbahYxXgOwd+Oa4SXgsuI0jN0w2I5mYqklce2d+3Y3c5m4DRE4hNpRlUmB93DO/GHKr46PTROmeNdBHxOlUUvcfDS2XvM+a/sKi5JwkVu5X6Yxw3xJjptg3yI+q7neN0UMC8ovL7M1IoJJuZa4kJMvUE5y7I3PkeiUL4HUUTMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745456943; c=relaxed/simple;
	bh=gDUi3x8HuhmFJYZel1+EEr+q6ixkvA/Spjy2z5wpC2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QiAeCWw93CVfEYEKOedFQODYyescjb2Gcyk8978lbd9rRPHvIWaACPX0JNhqzAs3TW73AxQwXDYGAg0dpWkqPyBLd8F5x3qn4dZhdPS5Bx12vkLNEfQcxjU49m8L3gv6yeLYxt7Nzr0vivHlBy7ObjDcyevTCUdZ5BLPBWUTQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=HFJzLmlk; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="HFJzLmlk"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739525d4e12so365988b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745456941; x=1746061741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=;
        b=HFJzLmlkFGtXSkB/dRHoiQuAgdinGs1ggYoITGlixI8Pd8w7AhW76qILBS6FEGNkGl
         3ylcizowrMXMcSFy89mdsBTfWN4G1YlA59rf+R5bNn5jpCQgREd/0kbIpt3Rc8litRMe
         FSjAo3MkuSDW3feYOe6mD0CapJy91FPfE8tQnvtpnX9d6kKwA0r/oAV0czqPpEtjqrkj
         cjuMycOyvcla24f26adENAhX00QoppnAyaD95+uDhRMLCOhQGpPeErCcowxSw8/oWOcp
         0S8jz6l0KqS3nprN2MeY4Z/zaJh1nvTUA89hd5b4lxvA5LkfhBte9/sVw4a0v6LvMiBa
         wTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745456941; x=1746061741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=;
        b=UWKn0DdJl4z8EQ86tFjG4ZhfNOkGYp8nDCbzybOvyC6fzF/HStJxnrz5ncDngy1/2E
         Y3fPcy/Xxs+tFEQ5tOY7xcbz2QSWMBbrkLyGy20m36o8Ad7J2me4qu8jkOxRzUbI5GAG
         xkO0HZpD4gRml0FpmuET1LhjYIbj12sR1SNPTs6WAYjc7jajUur7J1H1yoGqiOsEsEZc
         yxi0mdPA3DZWq0OGpY5xdTN7uKpuwlnhHaKdkpRzYCMrm8y1X4q8xdZD/0UBJMs/xd4H
         tm/Y+ufGdPE95y5io36sqCHE10LB8CB/xr+Vuo6PLU5WzG9GQLYuMkSRDT/HeXD7N/Ys
         qw/A==
X-Forwarded-Encrypted: i=1; AJvYcCVfdn05NS80ryihGkDHUAK3w9S3P4LjlVAI3NG4AnQ4Eh9KzwPkAdsheQmo0ApDaOKCSXQZBvvkNalTRc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NhdwuZidv3dQYRYbeIkxgLIX6UPnHg1FryuB3qsj3xsadmf7
	QvQHvWVVtZ7f6sYE3RRQMmqDaruY/7dMSzL2QXNP6nXURzH/O+QAo24B2+1ARvQ=
X-Gm-Gg: ASbGncud24q3nKST8k6kg7lh0tchu7bJAWQVOnakISbNL90ttTYAa8JjyOF+berVYPc
	N2HgXY5wmaJsfET7blxRvMRWHsDGWhAoyoIcgsCQFo9CdOcsCrUCCst72Dd0hVCjdm1BUyzv9sY
	57V3sL5/doWoBhcbwn1YSmNTN8eDjehbsoo8/vm3xICOmza49daDZTy4qrorAFN/j7LUL0Pgrau
	Za6flxKzmMO7hfZwc6pLWtxYQAQBFTGVe4VILsTlaKzX4x94tbxH99W/36uqbI4lIQy+ZSZpFsn
	DnKI5Ah9sPmlX9Ta4ON7F41z3COmehjCW36e35XbiG6d1ribRB1C7MZU3/CWc/2TYjpQ/kTMrzI
	=
X-Google-Smtp-Source: AGHT+IEtg9+UM1qgOmmMcagcoC25vt6k7kN9IVgAb2Yi1Mg8BWfSCaJvnh25Radzm1TcN726SEaGnQ==
X-Received: by 2002:a05:6a00:1947:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73e2462f2b1mr1025718b3a.11.1745456940726;
        Wed, 23 Apr 2025 18:09:00 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941d65sm236071b3a.63.2025.04.23.18.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:09:00 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Thu, 24 Apr 2025 09:08:49 +0800
Message-Id: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v11:
- PATCH 1/2: Remove redundant items.
- Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Chage in V9:
- No change.

Changes in v8:
- PATCH 1/2: Remove custom label.
- Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/

Chage since V6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..fa1646bc0bac 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,13 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - enum:
+              - google,ponyta-sku0
+              - google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

