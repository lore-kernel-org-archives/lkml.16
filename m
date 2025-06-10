Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DEA28CF68
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551791; cv=none; b=niN7aCPiGWCjbgZ4L+6JM4fclQt5SEyVCSPkoJZUQbachPRwH1mYDFHyXegQ3DkRZHa5PSgxZJ/cwKyOsgttHhfJU0FscWWlhwlBv3+5SJ3uLRwhItiUQ3bSlOWri3aSiNuiR3E36NaY4iVQzuyTXZs5iGCvaUl4k52IRZfLY74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551791; c=relaxed/simple;
	bh=DdIhTy3q8p6bXogIHoQAqq/ZvjVwNbGYehglCiP06dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KukeRhKoz1JFIfTRhAeBQV36z+57DMCSdEmz/WH8zNOHVycxflpRJHuLbx3816J3EVCSAGhUw6PxrfxRE2cAu8TxQ3NjgxIw8W3fGzZvqrHMEN2SkaMrnVdwPVbNuJK3Zur5tK+/JNSJUHxISTyYJtHek2UU1H5Da8KTB8ClQTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=TRxj7Ibj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="TRxj7Ibj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-236377f00easo7708125ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749551789; x=1750156589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrcg34+lsviAoAZUAGZxbxbJA9K//cWkgoq+Xni+Ow4=;
        b=TRxj7Ibj2DtgPA8FIaTSjDb9U6iV4eNJdIFHXLg9XiVI4j09fL4dcDfd+Y3B4D5lC6
         r9ZDTnQGoQoc216/tEcmm8u3o93V0aGz3k+bdhNwWalorifgdRNrZV7MvRjlh1tE8YOF
         +wJhYfoxATNp7YRJNNqspChji1ElsNfGP0RXSxDA5FWOPDEB0o1h3QXASCftU9E5dyhp
         mlzsCT7WKbWjWSJ2YYGCC9VT3Xni6DY+D6dSabaTLcJleW86fOEccndaFTviPBsy7cgg
         UoPmosBjyKvwE3Uz48pvAstiYBZb/8FZV0s22Mg/NhT+wiZSDdw9ia8HdEQVXk1Hwscx
         Aarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551789; x=1750156589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rrcg34+lsviAoAZUAGZxbxbJA9K//cWkgoq+Xni+Ow4=;
        b=cShscLvQpHlLUYtztr6tttPDXl9zgY1Jr9yDfoIcaSRUjBS9/FEO8shrRHTD2JAkTB
         mEoCX3VvrZqEdjb+smLpOV3pOC1PkXjH5KtPsnvxoC4tGsta+kd7ShMqeKJ7m5bFgUAK
         KcAHGrkDwbpIY8G2B2sCozMg/aEbiXmCI/gdslko62D8G8grp/UtEeuHiV519xBgqlLw
         Lt3+V56NvuPW0x7sEbxrDHojLb7L/z0owcpi8VFtekAoMFIbaghbOMz6XB4a4G/zWdBK
         RMQ7ATRYV64a+IdNHlGweRdNNaHbJFpAOifBRAII+52Jc/8t22ONxJ4T4X8w1Ue8AUIX
         1rdw==
X-Forwarded-Encrypted: i=1; AJvYcCU5G/OTHzLNa9WCqeVYfVdfd1PxKTIohhPVYoUWX8lft/6E1GnF3tRZAZ5Uwg4FFTIyMz/RbhrLHBmcDVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yychkq2+eNMcsyngYcsQwkMNJmkAIMKCOp58x9R0azzHmZBlipM
	+6dtC+K97t4gN1Pn/D3ahXEZewApqdQ0Dp4R55Mnp6TFCxNbb0MNOwSllsc0qVKDOuP8EA5FMS2
	uIDBL
X-Gm-Gg: ASbGncsMRKTsVekkEXkLkiLoZ0X+QNfIK55u+Ce1VaP/bF0a+hL+HYCq1dj7Fz0N6AZ
	PBrdnoJHqPHb82RtMILY9/pXkAUczw3amM8TRi1nUb+AswDMsPxPhKRINOnIdjZ9qXOCAB2zggh
	xA47xXJKgQNgM8yMyhFm4vmHdk7SzAJ6c324IhEDJmd5IR+tC3wFC7rMXE53hm5szTSAdJ/vQK5
	1+I/6gkbfLMIhNFQMEHMhE3nxRmnF9exi66HamMXMHqJs2vKstSxyvmVj5yeLIh9fbCjLErgP86
	WD7WZMLW83AKxYoZe+DFxufddTdn76RxLZvf1DogmPt/UiyHdPYqpyhs1y0EKLLv8Vzqdqe3OOk
	AHFCGoypZgKnlZ96cJlVAF5GAVy9+eK0Iaxpe+lyLwif1RZd/AwT6OA==
X-Google-Smtp-Source: AGHT+IEXd1Hcw9c3aT+Co83iBRXaANe5QdZsyUaTImfUlQrhm5qcc9u+SApj2W2xKK1ATcOsPs45wQ==
X-Received: by 2002:a17:90b:2ecc:b0:311:e5b2:356b with SMTP id 98e67ed59e1d1-313472e9005mr25567000a91.11.1749551777007;
        Tue, 10 Jun 2025 03:36:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ff7e14sm7800595a91.45.2025.06.10.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:36:16 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: trivial: Add tps53685 support
Date: Tue, 10 Jun 2025 18:25:54 +0800
Message-Id: <20250610102556.236300-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610102556.236300-1-chiang.brian@inventec.com>
References: <20250610102556.236300-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for tps53685

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v8 -> v9:
- No code changed, correct the order of Acked-by tag
- Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/

v3 -> v8:
- No code changed, included Acked-by tag from v2 review
- Patch kept in sync with series version
- Link to v3: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/

v2 -> v3:
- Fix the order of patches
- Link to v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/

v1 -> v2:
- Correct the subject and commit message
- Link to v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/


 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..a613b9c3f6ea 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -396,6 +396,8 @@ properties:
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53681
           - ti,tps53681
+            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
+          - ti,tps53685
             # TI Dual channel DCAP+ multiphase controller TPS53688
           - ti,tps53688
             # TI DC-DC converters on PMBus
-- 
2.25.1

