Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12161E4A9;
	Thu, 15 May 2025 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747267357; cv=none; b=Q8MyAzsIdduqZR8kjGxhZ4FqoU+k7q1PsJXi5/X8/XYZAoSnGmO1fjiSvQ8pdcnDuvqtRagiZ/1SGsFVGGIS7OYQj69+3I8hDE3POYDk//H2TTcdbckbXX6EwmuhFZ9ISF5F9fCkoDyqgrGSqXeVGs89Lyb4O/czriALEQBZAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747267357; c=relaxed/simple;
	bh=asmxBTpBb2KXRUzN79QYfkEaEFl6wHhva1H0USBnkDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXwdaq3JZiddTboPxT2OqEo+pwYPClSKhx5LB0fuSM3b32/jT7DuaTqqi9y8ZJD0OWVAte+0heaL7laLY6lY+oOwckpAP0sbNGEVJkL7y+TyH2J/aXNJLuCHe/hSRlTpAM9NRFgo7rGD2tPr8sdURRuKuD4/tapq3mX2xquS8Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+qKEH7J; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+qKEH7J"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52410fb2afeso191376e0c.3;
        Wed, 14 May 2025 17:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747267354; x=1747872154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7u86lU2SJu3FVEwuxJYQzIZ7z0Ry8zo8T8rDI5ciC0=;
        b=D+qKEH7J52Yn4QhJQZDp8x97V0AVT2XE5TYIKA5+rNyZwg0yeZWPX/AUpZv6vQ6Huz
         FbGU9/RgllGO1gTsrijH0a2ICkhZDWi18+4U2l2MG8vdZq4MNqU3szFR9XnsCyouzv0l
         kSVmeM1/nXzYFFGRKV3SENOzSsLD087P95TXnOnd7ofudJR7KfBgsivQ2rXIfgoA5NQ1
         MN0D/jo7l0gRnr9ic/AqiA9mm3ugtP7TCPv+IQlRoHNyTgr4Jk5XEoSspjVA+gBA4Rha
         i7DelP/5FYmqiT4J/kor41HGDQBZdlr5ilKvQkXICO4we3ZKyK7IB75BYFxLNKmMqd73
         qxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747267354; x=1747872154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7u86lU2SJu3FVEwuxJYQzIZ7z0Ry8zo8T8rDI5ciC0=;
        b=giIxPeQaS9/p2lT7AOJzCfpkSPXikYcVDVbLQIjHwxBFPOdcxEnV2M2+W6/WbCsJXz
         W+6cj0rWfPNDZpVsRlvL8a2+TY7I/x+EffTm/m6CXwaa1AH0Q8SdzeDvcQeVkkwxk5ys
         DeYU/MHqAJovFbDmJgv+N/D8CbKQxz+Iqq+Yc01EwKRjHrCwo1wgdy/otATKGC3Ojd7W
         Ze2y6xmTJp40wMRdJGe5M5K66eEt3JyzlMyYqgFVwl0a8e03acsLz+oAYcEc8I8KnUI/
         EHxJ6jdcfWYk/pQW3Rd27Bl9qftj+TweS6M1hNmluKYdFAz3s24ISFa/ttgcw0cr/Npg
         +3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwRO4ZCBEUfEJe9RrLF5dQWMy1RNqGb1utJ+JoKE3uSnI2N6S4LQ0enH9vPU7RbrZgFoQ4EhmnGIdbPIhB@vger.kernel.org, AJvYcCX/+tNEFSOGvJSl3jLM3sS63wCnrhulG1RR6fzAhTrpPVVpKiS0eyWmBktkPJA34XMVO9VKsSULtUEO@vger.kernel.org
X-Gm-Message-State: AOJu0YzWe9M/WCm7zsoOW1HOHT1wNsYGploFv+wDJ9nmkDxw4eDNFUqX
	Bcor6TfYp8GaCmcCkEKKorcw3bh+pp9Nc1qKbzt6VepOKIdaR9zW
X-Gm-Gg: ASbGncsVdLb/Mh1Le8HlFffIgEt/Dy0burAkEoPPjejguf3RAzgZDRXkIi4K4RwyZJF
	l7gJp+YbDVboQOiBArJKAn/nTIh7dm6/9gvpvci8f9ESUMod9bWmh+EeU1EenhweaCHo6MlZbL1
	+KMOFlbR/yNE8nWAlOKSidjzA8szFTn0Bgv/2SAIWE6Xe4uXwXDaj5IT8sE3kw89bhFvBnGrTod
	x7mfjp7XU251hgcf/Xr/qZRAnd0YK06FNJ35MoCVN+p4ofzAACxBP7KraJL/Kdzqx6ESF+xji9n
	jDHVBGf5fmvm1pB+vBFV84xZvPPjs6/8r/aF6Yop2A0j8fzG2a505xLMcEYfYflc8pWtya1L6MQ
	=
X-Google-Smtp-Source: AGHT+IH/Lqt6SNh1zC111E7mhc6QwfLiTX238mXDCVkGWFhtEiusE+b7jc34mriVgZ3WbkfPUeUihw==
X-Received: by 2002:a05:6122:917:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-52d9c57f415mr5816811e0c.2.1747267354491;
        Wed, 14 May 2025 17:02:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375af9fsm10442978e0c.23.2025.05.14.17.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:02:34 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: trivial-devices: Add VZ89TE to trivial
Date: Wed, 14 May 2025 21:00:40 -0300
Message-ID: <20250515000225.79239-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sgx,vz89te partnumber since it is equivalent to sgx,vz89x,
which is at trivial-devices.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
At [1] "add support for VZ89TE part" was added, but
no binding were updated. This is similar to a existing trivial
device, so just add it.
Tks and regards.

[1] https://github.com/torvalds/linux/commit/0a735aa07f2eb5bcb04fb022b463c70cd1cf1399
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 377722af6c00..6a49e8efc0f7 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -345,6 +345,8 @@ properties:
           - sensortek,stk8ba50
             # SGX Sensortech VZ89X Sensors
           - sgx,vz89x
+            # SGX Sensortech VZ89TE Sensors
+          - sgx,vz89te
             # Silicon Labs EM3581 Zigbee SoC with SPI interface
           - silabs,em3581
             # Silicon Labs SI3210 Programmable CMOS SLIC/CODEC with SPI interface
-- 
2.49.0

