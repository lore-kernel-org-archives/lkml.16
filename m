Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42441E282D;
	Tue, 11 Feb 2025 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297927; cv=none; b=j0q558zq13njNPvGkC06lUwhhy7VzO/lhA/CL/8K73ib85Q87Dp+Prc/WP6KYqpAOuSJYmLC5nB5eq+CjHdlppw6d+c33/68OQmfdJyQrwY+AhuDWoH7I3x7QboxyRfsoJfwf1G9bQG9qXii0hCYMMDYoorPR0CipNXeSYicawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297927; c=relaxed/simple;
	bh=Q8rjcpdw76Tgr/ken+ANeiAYiZxjB6PP9vcvsER2mJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxB6HZm/rB4unom0+tma/JcebAzWPYiulE9KdgZlwYePK8kdCf7sJauN83spJCMHmtqtOCo7xPWpeANpYEBnrS2AzEWFEBOSTi14tfhP1nsOqxHngqoVtyKTD3dw5kr/x7n+vmbVnk/xyVhi3qRLMrpZSOgs8zBNUtWKxOjiewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR0NkFPW; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR0NkFPW"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8552ae0fc4dso173944239f.1;
        Tue, 11 Feb 2025 10:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739297923; x=1739902723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf8IzMve9UruqqXDdyuV/W7aGzB8Bcp6OKBilUu94Gw=;
        b=GR0NkFPWxuf6Lz8iQqA/ZNpWgYHBBN1yQL+5LgHRCgfSXuHFn7DRH3pTgvVpnhuR4x
         v5PzKbMFcCjRUVX/d20K7gi7jGGfK+ozQvw7qTz+N3Q+AJELBBUtu8mYpKea5EMDpMhJ
         esStNfs81ziDe/ks6SRgOTJ9ffMHeqvmcaUltAM9fRsKLcZwu6uFfZlyCNUwWLK9QwEV
         aBJd9kd34KVuuImQRLcvzjqNUg0WbMkFwl8QihNAb9e2N3eiQgt+RSwIvLFiEjcNq915
         u1Y7uZedwX1LBRLzJFh9ko/PL0Ik5RWXrvPyPCrFpfsLxHsI4UcFiYwLJBXKjViIBi/u
         0IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297923; x=1739902723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf8IzMve9UruqqXDdyuV/W7aGzB8Bcp6OKBilUu94Gw=;
        b=F49wczCnQ/KqeXu8RGwHI0kjUVQfuEHPflQB8zF2oHEgSUOv35zma5qemJsj63YPBb
         2W5Cf3W6MZzxFOcQcn7k71+PonpJdh1nWwHnlER8w+CT5LsADQQHDwWLzYni8ErW1KTx
         snKofHieRm+pvs2rtCB6SqdfnvQ6LyX264E4rQe0Isa6NW0hrQaWvFH4BBWAVzuNoUzM
         q7OeLhxlJr19YX6M84Pqwf8TpS+RYqESgnj9QlYo85VC1plboiCXskoRShaww7tohl39
         i5wIkiphrKfa6kmo8oQg61sKIpBISMAyt1n+ltzagKbObVn9larrBTb6zLYpwT5HpOxz
         xdUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkGnC74DCnfEBF0isqK+zrpb8tMb2LuW2dgfZXLRQn6oiwgYBUuZYFz27dG5rMsz9xVOd0J2s/090s@vger.kernel.org, AJvYcCWH5F0Dh5q/JcXRK7Sd8r+you0kn7QbymEuSm0UJj1FvmGNMqVsrQAxd3gdH9gmzQGwJUy5NgbGsgSYstr4@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3/4EuNcz3aN0IyZ53UyrFBn4u/jwykAh0ERyXUwmXPeo24xE
	Oc4Ov4X3YGRTV/WJ3GkieR2QUKjfZlrDAtbEh7r++wrOMZjDUZoN
X-Gm-Gg: ASbGncvRnQ9e5Bx9yZYBLCHbrol3yygSXvk/7ub2ECQLqhbnb1TrIkcfHlTIX+Nrg1Q
	5TEzsPXwubEEETGjdJF9e9C/kCpZzqwYzcSMLhXRlAMuMHI8OC3D5ayO7S0pt1Hm85LivpKXLsO
	R1eU17ELmgDeL8efxOle7Fz6utxvkcX9SxeQ6BAY5/UPA0ifPJi3+2AaKXpFhH/nIFf+vyH3sW4
	WD5pJ/tRulnVbgfRQkV4nfwKcCRne8Pq6FnPw08T6VppLv/pI/cbeDuGU4rSzSqAgoyj/fJzBjI
	0MLuHe1/nsthZ3YVHtYjhDOce+BSWknW/IotCl5Y1f0CBCjbDPw=
X-Google-Smtp-Source: AGHT+IGcIyE/tZiKdR8eJMFiZgsnRwE5Eadm6DDPm2IiuJCYrjQqDwUUtTIZwzZEQMZZ+0j/yDuavQ==
X-Received: by 2002:a92:cdae:0:b0:3d0:19c6:c9e1 with SMTP id e9e14a558f8ab-3d17bf66cb1mr3706065ab.13.1739297923599;
        Tue, 11 Feb 2025 10:18:43 -0800 (PST)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d152519ee0sm18017875ab.27.2025.02.11.10.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:18:42 -0800 (PST)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH] dt-bindings: arm: ti: Add PocketBeagle2
Date: Tue, 11 Feb 2025 12:18:38 -0600
Message-ID: <20250211181839.1575497-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This board is based on ti,am625 family using the am6232 variation.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
CC: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..b7f6cd8d4b9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -46,6 +46,7 @@ properties:
       - description: K3 AM625 SoC
         items:
           - enum:
+              - beagle,am62-pocketbeagle2
               - beagle,am625-beagleplay
               - ti,am625-sk
               - ti,am62-lp-sk
-- 
2.47.2

