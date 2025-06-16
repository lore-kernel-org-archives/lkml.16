Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD502BEFED;
	Mon, 16 Jun 2025 21:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108944; cv=none; b=g4Cre1QdAKHqZkm1PavV7Sj52Hu6zz8bxFlIy6uOW2AdIjZ46XK/2Di/4N4KljQUBnDzWKzcPgPRmHbioFLgQQNWnUio19ubsqbBZfm1CGLOrbO13/VxKf1A6PyavSQ2EXzuJDOlyZA4zwk1yiB4I/gTqfYm6UTJ3AK5a//16Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108944; c=relaxed/simple;
	bh=5tN7X1W7UK3zZKB4vPlpS1QEaHwjxdsMtbLGW2YjRc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=crAAqsGwvMawFoye+3vLAFjLJFWeCZ87GNkH1tLCXdlX1Z5bR1oDBk4ZK+L4BBrMAKS49Kj62Ht51IjFp1ooBncnXkoxZ5DQq5m0HYRqSoZgKtktj0B9YTeI5JYxYNEZmycWm/2loIZ7ZLlcM9uZ8odJWHfi/20HVNV++q7IIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6kcPQDX; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6kcPQDX"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-708d90aa8f9so48363817b3.3;
        Mon, 16 Jun 2025 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750108941; x=1750713741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=U6kcPQDXYPz0uANrOE+H1ACTPSyVm9vXZlxBt4zQg1buVJ+BbI+tJ8jDs3gBGTkFtM
         Nyxu3vPB/OwIIVYURbcl8AcyLsNmzeysBumskohMZ0OluGI2rodvjW9kBMrAjvx4GS4W
         zATC5iesKxmpgxi5Bx8zlUf31b+CobCA9O3I/5AR3iMM9bRj5FGSTDQFDpgjXCYb4ASs
         3aQVpcmJCBIkgwyoujZWHs8ZHdjcV1g0LTD69QAQYENyI9MoBIo9Q1gbMqvxBaIa0ddN
         8/QI/P6F+p+U4N0CWBy2BRVejwkQbaUv1eojoZieJ01QaDM9lEIIboJlmyFiOZ/kTrNK
         j+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108941; x=1750713741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=uEsdrXpjRzfrPhXRJ8d7+0Q+JiQFqdGGDSMWIiUEb0JxtYVATQvz0f8JdqLq+mMevT
         taSbphnz+W6JKs89MHapMBX4js7c+KXbBKXlRAEZqfbO9u+r6K0mT+ZiZXGgmo3IknGy
         soU2BOVBRgYho6lMlnai35vJzu/Tjl1kR5HgtVvBYmIbp90QrPSYIOzeBuRC23tzVSIH
         ekPtGxO/MPE83Ceci1rPfoRrFAHA1KxWnuCAW/asHxanRlpGK7iR1V2CvetNaHARskj6
         CKQaw7NHFhh+f0gyPkOyBYQ0LKBxa+YBBmuXEu6OmFE1HCY6Tjse8mFQ6zJd4/oj5zM9
         ZciQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJwQfTuxRlBM1q22a8IXpInOxQwbu7Dnuw+HbgZw2HXYPrC/kscvWPfsxZegDo/Ujz5jLyZlAMN39FDis8@vger.kernel.org, AJvYcCVo9vXnxOxrH+C8v53RtMm0Bn8e45HH9S4UHF+JQbZel+7ZxB2vFJEDYzjYyHyRhm1u3hF4huTZ5Xrq@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNkqc1rphpZZYFhbGoy6ln6edpCKWXQM7unRosMy6PJDG0P8v
	yMexqDfX9BkiP6kHtAQFjjnTHVUYIdBkUKRtGhUTNi53SzTvAGt5tmqU
X-Gm-Gg: ASbGncuiKm+7PvhbIR+uCVfKB4BVUzuODYanh3ZnpGLCMDNLlMRDcCI7VHwgy9rbfsx
	K8ecUwMPy2Oa0xXhXG1JIMfDVYLAN2RbdQHlDVlPAiYUYtFRd2ZfOCy95hF+ptVi11RoUNW/971
	4Hd9mQLMw1tb+bHK88ZuX4YQ9apgv4Bd2QqDF8PeymZua5+j84s5YCPBzUYM7KYrHysLFyhzFv1
	L/Xj2rxvLNMMWLYNvrljHOPd1GCQfWMoAvDWzXHAnHGR/Moz++bz0CofYYFPE4Uo2HPy4NZtBBz
	suu6k/xc5lKzbvj4Pd4D4uLooHtUrNW9oSIoJIb9zzFIHx003KxyDO1zKfuDMpYVxhs+8hc=
X-Google-Smtp-Source: AGHT+IHrTtKrQOUmpqpsbAy9Nyl4AZw8O0q3D6eTzQWBBmEHWN83LKSepZAj9afOX0UlwItAjwq80w==
X-Received: by 2002:a05:690c:4b12:b0:70f:87c5:5270 with SMTP id 00721157ae682-7117544ca15mr151939017b3.19.1750108941650;
        Mon, 16 Jun 2025 14:22:21 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7117bc177d3sm10418837b3.44.2025.06.16.14.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:22:21 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Mon, 16 Jun 2025 17:22:13 -0400
Message-Id: <20250616212214.139585-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616212214.139585-1-inindev@gmail.com>
References: <20250616212214.139585-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 59b69c4741c5..10de9b7bdfcc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -295,6 +295,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5

