Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D88482F2;
	Wed,  2 Jul 2025 05:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432667; cv=none; b=b4UsmKgLVBoZ10fFG+iiNcHWhpfoGuBTBvf7w+N7uI7lyXKsLMkVhMpnPFkLzHR7ydlXJdC9HgoKhr0/AoOsOSXDg6l58CvFeXByApT/8R9ynerrNl53jOnLeHA7jye5FjWxStszrCIv1Zv3JbV3eLWYTrRg6CjD3VuYlL8dEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432667; c=relaxed/simple;
	bh=b+WbW+NMHzk6x046M0LGgPrIsZLLquCdy5YS9WPvJno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfgRI9mWbgiKdBMimyyTz47cyFwGtmQVc72dDr4Hb6oMYce0RlI06HkPmlqkEtFeqsd/QuYK29SWuIOwn9ChJcApluB5QjSVs9N45tjfSh+SMPn6vCubP6LiJHCAkk2hvHuL8ERDvFgnscHyTc39cIOK50Nke2VV3iBLYclnoHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqQQz+T5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqQQz+T5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b321bd36a41so3539339a12.2;
        Tue, 01 Jul 2025 22:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432665; x=1752037465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EG55DPXz8+xtKpQRKekjwgyGLv4dODZAuNPTQZ9Shzg=;
        b=BqQQz+T5j1OLcmYkpnS5aD8OTeQIYl2ivnrjhC53pFoz7pJg9UiJaK6lti06qvC6yW
         okftx/vlhGKRVkwDGpmJanfgObp9gUY+rJWn/vVUxYYHYh481wdvg6kuziHzyUsAzsvP
         LIeyjpD3L/ZuAES5raScxmlb8gIz5Hsp4Jed1vvzhfWXKpT+K3lFfRjmRZ20iPkcTpsP
         zGTtsuoWjhXpBxoVB+4shbEtxcaI/X0VN9tJ1QOIcUyI7AddmBEN3hM4cTgCr3DxUX/U
         g86LPObjBR0NH2hLpPaB1ZxAawMhCLcg4f80+fMa++R/BXJyTi0EFvtFatOfWp0DthKL
         GWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432665; x=1752037465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG55DPXz8+xtKpQRKekjwgyGLv4dODZAuNPTQZ9Shzg=;
        b=wCnlIKlAla8AuP+VFVfYpr/vNeucha7zIXeVDqoMmYZE1j8Kl46yvsruatZ42cJnP+
         dXXwW2AjHRnY/EJsgBMIwBMkEyqkh0te33F+L17y+pY8ggO1KOYsKDYUsyKKWWNu1WUS
         +AvC5ddP7YJqDDPuUqIAbJYc5tri8bh9JIh/upYMOYMHncqijtVqFNz8X5+8R612NlRx
         ltGHID1dRkJn4Tbc8Z0HXSmL0WV2XD00Ykocdvb23EcoP/E6faRYvFyKPyIlz6k5rkto
         bTmogzmweKM0YON0O8BLUNqqAKuNkwhbqNNF4jWZqoMQwW0qfvM3Cm/FYD8hVKX9haIc
         6Eqg==
X-Forwarded-Encrypted: i=1; AJvYcCURFZKImVb/EiTQUUegY38ziZCed4S+cnVvEcUIN5K1D6Otl8WI5xbm80D0lxdvh0akiXfzTbVBUhSo@vger.kernel.org, AJvYcCVLJc7Zz3q50oWi3bCNIuCws9eIGaFy0vVL6icMl+4K4jSAPk7QNepv93YW5mODbIfmvluzX1qAbOjWPQqV@vger.kernel.org
X-Gm-Message-State: AOJu0YwLsJcQKo31qtcVWuecSxx0MSGHXD4YJgk0anz1X2Tee5UkfOfA
	U4hXVZrKg8nPs2pHADd/dkIAEDh3vZDQy4KY+nJ+viHsE/wSnqSfR1kJ
X-Gm-Gg: ASbGncvNQ0rsy8JD9chKn0vXiz8ACdm7w2sUr+Myjt9EcueHTFy4PDSQpz+gVZ7z9JP
	3exmHYOP7iA9yf48j2foSqDWjvU18ZF1ldtwox7Y3wvpT5rox9Db9LJjwD8z8PWFTrZYPkhy/S5
	eqG3edUFdcD8LYjuixh9T7axGQ9Q5uud1I/9FH3O1oKlbuIf386XRL8kkiztI2c/FbSPyfaxh+k
	LsKE92NDX1UK0yLkjKucBYBXPN4Ms5Sk7TkjEmxCROx7W2U3rdkKN3f2ftOzKpbxQ4Du47c0HhJ
	Vd3rhcGPbtWFw4IFcD6ok8P9rk/R3lqnZerlBcBbmLWZiDDEMpXwvTC7V0M4Yelh/C9vDgnXp7o
	M7BLFhUOpax/PEk8nvjTpS3w2FhOdOb3i9J8g4cR9vhuxBAqd1Q==
X-Google-Smtp-Source: AGHT+IFAFsQgFBXHekzpj5+jLpvS19bLZNwjrzNUfqbzyt7jsiYooA3Z/RS1UmpTIK1dgo3CN2kBvA==
X-Received: by 2002:a17:90b:3d8c:b0:312:db8:dbdd with SMTP id 98e67ed59e1d1-31a90bef8a1mr2126382a91.28.1751432665347;
        Tue, 01 Jul 2025 22:04:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:24 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 0/5] ARM: dts: aspeed: Add Meta Darwin dts
Date: Tue,  1 Jul 2025 22:04:11 -0700
Message-ID: <20250702050421.13729-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introduces the initial device tree for Meta/Facebook
Darwin AST2600 BMC.

Patch #1 extends data0 partition in facebook-bmc-flash-layout-128.dtsi.

Patch #2, #3 and #4 move eMMC out of ast2600-facebook-netbmc-common.dtsi
because eMMC is removed from future Meta Network BMC platforms.

Patch #5 adds the initial dts for Meta Darwin BMC.

Tao Ren (5):
  ARM: dts: aspeed: Expand data0 partition in
    facebook-bmc-flash-layout-128.dtsi
  ARM: dts: aspeed: Remove eMMC from ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: elbert: Enable eMMC device
  ARM: dts: aspeed: fuji: Enable eMMC device
  ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC

 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-elbert.dts | 12 +++
 .../dts/aspeed/aspeed-bmc-facebook-fuji.dts   | 12 +++
 .../ast2600-facebook-netbmc-common.dtsi       | 12 ---
 .../aspeed/facebook-bmc-flash-layout-128.dtsi | 10 +-
 6 files changed, 122 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

-- 
2.47.1

