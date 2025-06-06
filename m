Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B57286429;
	Fri,  6 Jun 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205689; cv=none; b=XMMfzeQYlSY6Dqz6nJ2j03jRa/QM5ewKEuBCoXHJlfGnJqPauyCjiCxiNpSNF11UfqE30iirOfBOqnu54Pm8FodsPghF8jizvgrXmX0J3qlDXAKWbw8rDqKGECYo35KejbmsJp+C+4gOPtxCi6qAGE+vbtLUdxmdNQXuSpU0WGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205689; c=relaxed/simple;
	bh=FMzX1ASQKqkQ1tt/369NITjzbVxz4J5tb33XHDzXWjA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EAotq3tLL/CTUw0ZJDzCzDwDPBCcmK0s98+m+Hmm/oYm2SAKEusiB/r1Ql1lBqfekukKAD+Bm7dubTsrDn1JdA6N5OpBeTPXooducso/i7uPLZP9Xlf/BcH1Yg7Kjl7Si3hNaCLUrIENwJbk6qp1sYprq9wWBpmwRUIRGapHBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfYixcle; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfYixcle"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235ea292956so19742175ad.1;
        Fri, 06 Jun 2025 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749205687; x=1749810487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq75SIqPsOJ1DQd3x8jl/mu37HxVt1wTwstMgXOJ46M=;
        b=BfYixcleDyBWI4HRlNMcYxDzBq2wxphfwZko5RtzshLqs30R/fnUw9dcLrkynZFSWo
         wDAyZKyvPYd4bUfA+kNg+L7p9CWYuK/hKGBw0yikF3u57wqQ0uaNhLOFw581hQQPosj4
         s8ucO/bLrgpIgjquFG5hGuAOUSWt7L9uKwG7EXhj9s5CbMyu+2zhyZsNibbxufgTcvht
         +Kf+ak/dPF7/cSxn1+/lZpxtqHfBP+75fFwi1jlybOHOsjLxgpMbeOwZ//8ElOaSKE0O
         58YDzfYHYHm2hjpQ3MfKHhmmEIABaWUhstL24EFJUAvfi8/cHaCSybpDbGT6jv0MA23W
         RAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205687; x=1749810487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq75SIqPsOJ1DQd3x8jl/mu37HxVt1wTwstMgXOJ46M=;
        b=dUd4m93fghCkantWuqG3GIFNfyF7Z4IkSvnjpM46Wjps1w6xNC97pqEtbVJeUHo/UZ
         tpgdf6WILrCfGHB7XoFx7O67kbZ7jV5/ibIMchb1b/Mm+ewH6ROmtzBtYSd0yd79Rhyb
         PTDc4MNFhRl5QQI+EuqiZJPnM7EbhVoZ/D5We6HDa9gmSho3XzWiDPZBWRMshwLwoTyq
         HeHA+ZpD1PA7etFttBBdTOLeYj6YkLFPdC7iwF7twtCmWRlhedth8xo/UtYLuJ8qhXcO
         isZIIf72rIYdgKZkaDV+HMqN4s5bsK1sWXF1XlRC1QHsMp4yOleXZpG6O5d6j12ttHTE
         zCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCURlYXW4kygtC2xycb86BW0ssBiAY/sULOwcNg9gUN2pqdlvSRJo4p3IOk4qE93oCbfUxXTZNtBqw3lo+7h@vger.kernel.org, AJvYcCWe6AHIRtX5LyDPSq3EcqKwrsbAUquFP79tkOnaXE14RT5kABjTn5xl2QF4ZyLwpnLhI4W75GSs9OVI@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYIn1ttMqOICpVpqoMnOlakdhqCPk+Tc/q2LTrSQYgzLfpfKj
	E1IT7gFKoyWZD5nve/wOBp2WKakDC9CImM9KmLbSN6tQ2qX6mUcG8l6+
X-Gm-Gg: ASbGncul03+0HM8sHpJpgTx/Nu1S/bES/4Vm57hSrZvCIdT4c9Gc1NCekpeIiCziCbX
	bjFh2V1wvr7QQGK1/ALLH6JFdArbsgtZy/5s5DMCH+uEG09+K8144p+PklB3qX188HJj40hMcOr
	vJm6VqOe4WjEu5v5ew0tdPbw/mpEwDBMsfocpAIjS9cTFZvWKJfBcUVN75ISuif8QiOHnJ+F/vG
	euA+z+dAHt6crTAj0Z88DETjQaJ2iFhmmNdyfV3wG6/JpgTmseiQdrCvks80QVBbbCd+8UlkbJn
	vuO7/Tm647ifTjRyBuVjB+G3USv2nnQUSN2j5VnPWcyfx6w9sjzuCFIZfqyCU4O9C5JHs741yNk
	TqWdIYwHNW92aUpfroCDdWr8KeR/A57Wn5cmHJfHNZzMyFnByZB7oug0xUMzDN+bAWfq+LsD1QD
	o=
X-Google-Smtp-Source: AGHT+IHWIRzmPF9hBfCr89nWxfu/OXV/L7N6WZrJscNojX76/huWUu2nhvxP0kFj4o42XVFggGnTGQ==
X-Received: by 2002:a17:902:f652:b0:235:779:edfd with SMTP id d9443c01a7336-23601d97820mr40085765ad.39.1749205687155;
        Fri, 06 Jun 2025 03:28:07 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e35c-06eb-80f3-97a6-ae1b-00f8.emome-ip6.hinet.net. [2001:b400:e35c:6eb:80f3:97a6:ae1b:f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360307813bsm9632885ad.22.2025.06.06.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:28:06 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add Meta(Facebook) Santabarbara BMC(AST2600)
Date: Fri,  6 Jun 2025 18:27:52 +0800
Message-ID: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summary:
Add linux device tree entry related to Meta(Facebook) Santabarbara
specific devices connected to BMC(AST2600) SoC.

Fred Chen (2):
  dt-bindings: arm: aspeed: add Meta Santabarbara board
  ARM: dts: aspeed: santabarbara: Add Meta Santabarbara BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-santabarbara.dts      | 978 ++++++++++++++++++
 3 files changed, 980 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts

-- 
2.49.0

