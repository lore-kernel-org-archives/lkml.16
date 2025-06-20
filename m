Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD371FDE14;
	Fri, 20 Jun 2025 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440110; cv=none; b=Vi/RDsGxRCrMV5Bf3ktWxXti+6pHNnzjwzEUPy2SFGxc8wZXlxrBSi6T70OB5GN80czGLa9MQVqxv7jEucHhQxbbJkUwArhAY2jwjmyOyicS7sdbz3rUxRcJodfsfP8ycZ+Zmtldm3VACevah7ATiEpn/ZDYg9Ej7fcLGM73NVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440110; c=relaxed/simple;
	bh=5tN7X1W7UK3zZKB4vPlpS1QEaHwjxdsMtbLGW2YjRc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u2W0qc2MrW3xZUS2Djen7q65F3EUPPZoNVCbLbf3itOuS63vr1sdg5RNGuporcpX1+wvQsSpOQSO4ThUYL+zWXznfsBu4Iqto2Te4fQqEAC0X74kOp4cWu+N583DYI9dgP8GkqIMs5pzgCaim1Jt6V6bzcRL8TPDsHYRXrBq9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRytAoWn; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRytAoWn"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70f94fe1e40so22152377b3.1;
        Fri, 20 Jun 2025 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750440108; x=1751044908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=SRytAoWnky6KQgknCB74vXni7Z/q96bDEWfpFJNPpj8MOJTqkLjBCnYmA8nZtdy4i+
         nJGUI00WX2jTx0Rlwu9bKnrRwCLS/4CbSshbXsaVf1wSrVepq/J/iErXheQaISgAAru3
         X1kclpt4AFGqPMNIKN0IcPYUSwr76VBKNV2hAvaMp7hQ8pIalJTrWYLt4985eCmx6dof
         30X3/q0jU2SEA8NNg7DYiYZGxFAl820QreeDaUdRoUcR0yb76YeIlJ+S4BQEve6Y4i+f
         dR57Vc1T3yW1RvK5DgoSb2NGIBmWgo0juR+rShSBqxhk5vAMDOz7HCt7NrJVxorbfeUT
         pliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440108; x=1751044908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=be25//JV+gCw0+loLUADP16Y6cD9cvkcOLj7LAQYwYN7AHN3EjA56LHDtZw+deylbv
         QZzJKs9zW9leCB6dji4Aj8NofOtWrXp9WsKEXYpIKgnBkYyOMjvhQfZhCAu44eKjz0oE
         dTL4/MbrrNBng/51xQqfR5r0M8ydjZSgMeyEzE6sjNLPD/+DJE/ZwC96tm2/b/7KYCyy
         pvLfYxwRbxngwA2PjzCHsx/xOHMYfekuJPvtEc8/ijRUcdrJUojVY2/MgOMAchxvHFGO
         oTa+qBzmKpF+w6u1yD8MYNYW3+gyr2oc8WOaXFG1+b2fAAi6ZLuyf+hSmsPLNha5Ns30
         TPrA==
X-Forwarded-Encrypted: i=1; AJvYcCUBI6Xd3gNRRHVaeO7UdbZiuE5cqlEWIpedyRMTvgCs6WfXOWNNy/dZYuQC/k9KMG5KPTu696Z3xeedsZEc@vger.kernel.org, AJvYcCVlyfOGKCVpP1nacIRrgDdTgYS2+wgpkpGuNbsz2YpK5cIYwz0nW/62bV57dnRxVrM1XY2NTA4hCGfB@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiM3I2Cc4Z/L7yRZHYgSwXR69nUWmDB8u9hX8xZE3Y2JpKbGc
	J8VmL+Uxse0SxCeSlhdbC5fT2s2W+zIIOWEMs6uIQVRIiwR9NAElgfDH
X-Gm-Gg: ASbGncvjHDDwWvDpP4Bcoa54rbZti7Gobob0EtUqMveC2Kp3DcghYzbw3/JpFuEw+vq
	xizqmuYKYpTnLlBujmJ+56KNz8guN452mep7o7uvHmixg7RAqZHUHcWXj9fORnROgj+KtOZC7U/
	xDE1stBoCyCC8fA+kMeSuOQ6llOmQD/D7wmj+3h11xa1vmvqqmGD7kBBw6AS4ON5KcHzL8+/Eac
	UdVA72h9/O92bmpYsHtuQiNe9hoYxpzP2A2ydQBAcaViyTQpE5qadbdNiK4+b+urJbd1ldZFxa0
	nfa7tPetjkwTbgE6F9fyqVQnpBfs+h9CcSIp/2YILQU/ybf9U6xvj79Vk0dvhbzwuHdowGc=
X-Google-Smtp-Source: AGHT+IEKMfIKxqzSxlwm/b6Pu7iU5cqdkCqXdmQOfZnLOU60LHHV6vXUt5Ra9c/TlNbBQZw5gq+MNA==
X-Received: by 2002:a05:690c:9418:10b0:712:c295:d01f with SMTP id 00721157ae682-712ca2f7576mr27493007b3.3.1750440107847;
        Fri, 20 Jun 2025 10:21:47 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a4a7besm5004037b3.52.2025.06.20.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:21:47 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Fri, 20 Jun 2025 13:21:40 -0400
Message-Id: <20250620172141.173266-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620172141.173266-1-inindev@gmail.com>
References: <20250620172141.173266-1-inindev@gmail.com>
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

