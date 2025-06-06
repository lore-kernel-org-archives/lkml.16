Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A3528850A;
	Fri,  6 Jun 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210412; cv=none; b=V4WWM95p3Lfy6T7s/E24ekY5QttS4O/owC85E3NeURerSTAgx+o8wMyjyBiXVcBYvlF0rxWj+ooOmTYpHUcWhulrBF578aWpfC7vNZ/Xayr66ZnZe64qwJskpizkKwIoREHrZvDTjYNhVVIhLQwebzm+byjYH2OBj60SF7aGQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210412; c=relaxed/simple;
	bh=r9w2VcCjqCXDI/4xPjTNUSd+DNqUIaS8kE3Bk3poM6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rv/TJJqFvYk6Ipt/qm+GI59p07bz4ju1Gs4GjEhdQHVSXnBt1XdTiGh+8FTYS7UUCXqMb5oBWa5wZEgXK8CDP69NNM+Lvp0CrQNMIHLL4M1p0tYDCX8TV+zWQCrLFOC5O0wiL9mAZdMfmtUKjgsjayxDpG0P16oo8udD2qnE0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icsImklL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icsImklL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a3758b122cso1298066f8f.1;
        Fri, 06 Jun 2025 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749210409; x=1749815209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq7te4M6ksKrUogTjln81xegJnlcm6VPFCDyWm1hQ3Q=;
        b=icsImklLSfTYV16EbB0jGCgykKsPmJjUzrZH4EQd1PyPZZ6ViAsRnzI0/HZGQlYmE+
         w6Cud3jC+YNY9sumPGxO2iyXWFdC54Vp9+Ijf6JbtPmzRShCi7IPa1M1EBKKBd1OD1bL
         XLmZwYExLv2Q2hykPDdw8lkeMw/zzuwOevGCk9bADWhg4JgI0mgfNCaB4L5Dxxntsepe
         bdUIuDmwsufizJZmplkCYSl1o6Py66yBNFTuOn+/uokz444VKtaHx48c8LAcDW+UiM8d
         etLu4yXm8CUYnjnnOk9jYa+id9z+WH3duQeVbnjl1y6ctjJG+dBbOLcBEWl09p0Gy5r8
         7r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210409; x=1749815209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq7te4M6ksKrUogTjln81xegJnlcm6VPFCDyWm1hQ3Q=;
        b=NBLhz4BIRmVBeUz6sUqYn7TLy3yWIV3CaZClrk9f2krKZ/dgvtVKwmFNG+1hFjNfGs
         GBNdnlXAUFnFFYmHaR5h7lnv2gwQGzWCS20sIN/zfSHMz6s0XBLZQClR0oLDrgJLPwp9
         UJSet9sa/Bgwj3W2YKRtpOYzDY+V/knmYjT5tKKjvChnXKWjGldz01xfq548xUz4giqq
         KvGPkX519Isy7BH0XBwzb/QgUZtXJYdoWyAYc7Bns33ygn9VTogo3J8glgW46N3V+zcX
         bJyHil95GOUf+rr9VVe7R0+94LWsAG0sgj0PXS8AxYOouFl7wd2TvEr1yl2bclSCd0mr
         YlZg==
X-Forwarded-Encrypted: i=1; AJvYcCUcQoL+cLrsBuDytc2hDU2Z1qOlGdtF1S4DhezD719nssfDausibYZhQHgxXwqnWQa2KtN+wbbT4edc1HSf@vger.kernel.org, AJvYcCW3Ejd5723Gatpfz19rq5LKSRJWGLcu4sWVILoKy3iZoDRiw/uRagXze5J0yjZXlioLqbGlJkxvsjtW@vger.kernel.org
X-Gm-Message-State: AOJu0YzHe083xwUoEmVRyBFkm91Qm56byMYcdUdcNDeblgBGrqdyxduP
	WeAnqC3w/AKNnZtb4jv6AeswcTkgIa4932hbWg2eDjY1l0Kih3mxHPRs
X-Gm-Gg: ASbGncugWn8x9TWj8TdCzp5VBdjzzkuV7XogAFkunR4KwPY0LRyLGXWEymjp97zpUG3
	y/2BiZUo2OHFD1mjR9IJb16St89zbU4MHPW1NX/UP/AHVitJlfFetHNxTzQhjb0fOUcvDDUOE/e
	5kp4wy4UPjLH9COxWMpu5sP3Cjhsswm+eJnukB27LfNT2j4IJo9PiGpM4vYnMtFKDpuNZs4UmKW
	BoETdIMtqh1Jivc1CEPqntCF77eRO3FmukvmDmzt/R+lUQk0F81CT4C/zqTd+ZBg78Em85wCNAy
	cCWA5k1OHWGgzBiERnDV/9dzRbVLwJ3kUSbqWKb8F3ghNVuS9vojazh4
X-Google-Smtp-Source: AGHT+IHIwxY+2Gv+A3gO0jvWkNwzl5joDzwEBMVaga7g/Sim5ajXaO+xhytKcBVI7iEzcoAbo/MoDA==
X-Received: by 2002:a05:6000:2088:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a5319b4c74mr2219624f8f.2.1749210408898;
        Fri, 06 Jun 2025 04:46:48 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:4223:e58c:4c9a:459b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464e7fsm1630480f8f.96.2025.06.06.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:46:48 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: jagan@amarulasolutions.com,
	neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel
Date: Fri,  6 Jun 2025 13:45:51 +0200
Message-ID: <20250606114644.105371-3-eichest@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606114644.105371-1-eichest@gmail.com>
References: <20250606114644.105371-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
resolution of 480x480 pixels.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index b07f3eca669bf..1e434240ea3f6 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -29,6 +29,7 @@ properties:
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
           - techstar,ts8550b
+          - winstar,wf40eswaa6mnn0
       - const: sitronix,st7701
 
   reg:
-- 
2.48.1

