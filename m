Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C172211299;
	Thu,  8 May 2025 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706124; cv=none; b=OF4kyVOIm6co1cdobumzUryyYK6VawAG9YAjnebEw2EKERKBICk4Kp6GdWIlLnXsaY0VE7xrbfgH1MeZVgZ1vvoq923BiUOCb2d59IwvZaRHh0JqcKNuU3zDB8I8XjGHF028r4IjEsJS9S6vWIbftlPBz96sCRTw94hX+6lSWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706124; c=relaxed/simple;
	bh=nmF/BzooHx85nShAbVCN1OTVN9Kqh7sT27fiyG9mp74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=etllKScofBoYwuN/wMtfL+2rlgIJ7h0jJeIXiEMbqEZyeQrHzIJ5LLlYUmxWcZS3PzXs1GlRSGUrxcqZovWKiLBAlCiQXT7kQbP05yEDTFe/HRg6scXYegxuf2FYl6MQV9SNZMzJb/4+4lEqKf5nbGQVHjLXQNmhneULcmYfjmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9m6OZ2d; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9m6OZ2d"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e4db05fe8so9753585ad.0;
        Thu, 08 May 2025 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746706122; x=1747310922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zbm5yfKnm40Bfo3jtTHav26k6DlFOXP0hDxlXCkESA=;
        b=a9m6OZ2dZfBaRUqIbbP/JuR2WzFBtmFlywNoOsC4GVBeWO0tqW8Z8Jsau35gsKsUy2
         zRUtHQwVuYRlQDFr74yfCn/1Q4UQGI8d5AvuHNXHwTxzmyE9WPc/HojjnCk/fpcfUzxu
         0Y+i1deSp/7PMjFGaQt68Bcj7WU56kKtTK93WizMu5KddeK0+q6mxTRKbEakK4D1Eo3r
         pER4eA8PfXvtqSAhmdWQBYJdW88VV+qCxntW2MFPRCYAcupgGOuE+p3tBncLUATdPZkk
         up+HuQ80oFj95aPY49cwZ2eqRsbyuqhX0rwgoYpSbdeh04Fcrsi5J31nK6bobChwVeKz
         NDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706122; x=1747310922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Zbm5yfKnm40Bfo3jtTHav26k6DlFOXP0hDxlXCkESA=;
        b=MY4JS9UGHDzjmPLvKptqA/nhgEHYrwLSzkr6c10eQ9SzdGXN2Ev6cbKEmZsSp0Yigb
         JoDtmR99eMtsOPFu49vW2VEwEyFbgpBLP8vfWafZtBQ80yo8kh8eZiGe24uActo4Dzcj
         Co5RpEx6JxqMekvQ03P/24bRB394UBI6QLZKdW5oAw03T+HeZ0Zg9GFROP25qgIHBP1g
         rueUWQs2RPypo5/dHXgkcHy5J3xaw3njyoY4Zuv0cN9oA2uqcTk0+FzzY9jW8oM3RN3T
         7MPO+FDvhddSW64IcpVmkOGUKu4U0VIdv6+fddAQds1IcMc2pJzolDnYtPdEvdN8CODF
         Mb/g==
X-Forwarded-Encrypted: i=1; AJvYcCXwXL87UfDNE9RZptZfXUEA8JMxYLPZwYA+UhuqD/NcT+mZ4NjIiOc3MgWxdifReT58UAqhPyN2C9UZp80=@vger.kernel.org
X-Gm-Message-State: AOJu0YweFZW9jRTKHzmV8hTooxMGn9E18KJCveG0vO4waITGZbHTmf/Y
	sWtLJaQ5Q5ayHdjH7ninpIsijejta3M74vk5MqIoZRkQIDDEF9no
X-Gm-Gg: ASbGncs1mUyTgOHCypWJlZGPg1lFGI5jwja4dMSqAzTvZngb+ZmTu+01+airL0lKpcI
	2WmC5jgpAtR5f95wNEmQyuC+SICHkkJi/sYdZ3LJBtW8fOa932QnjEDIUv4RSS/bQiVngcrujQu
	uiLclW4VcrN5i+Qm3DgLeDIgySgeogvvEwwjjI0WUqxzpNdq7Eavwr4VcyZ9kQThZH/ToEFzlbj
	+m7SvyD3nibmiRYXu1+qyi+W9v5ARmWlM8eMmyfWcvMw9W8s8OUwGYSshaLPnAoF/QdIaKga7+v
	0S0rEFpmredEjsSVmnKYgAWqVqJNEeeoL3IMZP7oJDsC04MM9y0wxoX8NpkF
X-Google-Smtp-Source: AGHT+IFC3Fg3HUEUP5v2I9E1WXE+88nKVYpzMx4sH8Kmnzw8SUTWzj2FahdTuxc0/VE2LHWIAUFZxg==
X-Received: by 2002:a17:903:2352:b0:224:e33:889b with SMTP id d9443c01a7336-22e5ea37ac4mr112478465ad.12.1746706122366;
        Thu, 08 May 2025 05:08:42 -0700 (PDT)
Received: from localhost.localdomain ([103.205.130.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e4534d7a0sm49602165ad.66.2025.05.08.05.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:08:41 -0700 (PDT)
From: Brajesh Patil <brajeshpatil11@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	marcelo.schmitt1@gmail.com,
	dlechner@baylibre.com,
	Brajesh Patil <brajeshpatil11@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add 'qst' for QST Corporation
Date: Thu,  8 May 2025 13:08:34 +0100
Message-Id: <20250508120834.114164-1-brajeshpatil11@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Brajesh Patil <brajeshpatil11@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..b306950ebea8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1236,6 +1236,8 @@ patternProperties:
     description: Shenzhen QiShenglong Industrialist Co., Ltd.
   "^qnap,.*":
     description: QNAP Systems, Inc.
+  "^qst,.*":
+    description: QST Corporation Ltd.
   "^quanta,.*":
     description: Quanta Computer Inc.
   "^radxa,.*":
--
2.39.5

