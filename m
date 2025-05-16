Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D11ADC90
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414017; cv=none; b=kVBZo0eLPJfxhBESOvaaneP5ufqTF+K3NpN9evwmbt5zBgSDkmkj6racMyVATqkQusQ0z4j9WBnZ1SvrM+gJyFhxdz7kPIzBRMJ96TwE26xrpODABlCzuAMGsyDe7wrA/ecRLMaTtJLAnjSNreeO2llUuz6h1y9zMLDJCNo8rMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414017; c=relaxed/simple;
	bh=GdgwDP/G2YbRSycSz415s/ivN3fJsMLeSCALtGmBj4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hj5bMrEZWM+NvvfAJuVCartwhgERkawyA7tN+jVUuX6fAfZE35F9PNOCQbeNu1RS9gjSaAOAioZGilfy6z8MLez3afPbMYbT1pBMxdmHbdMb9SuB6A/Yhr2K8q/0GR6LmbY8k0DCuUilqL0j6M8/B7mm7it2MNFxnaoJr/JEnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJMZwbGO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJMZwbGO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426159273fso2555219b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747414016; x=1748018816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=QJMZwbGOk6J5TBNeFfsRY83yHpKfXJ5LcdKDcj4Ptf89b7mlHFBaKdBvXy/p+wyWxd
         zLiwgN31r8vyYm/CMTXRLhhpGHv4wta2J8KaWdTq5qC0tnVlCn2UlgQoj1JDS/+NG0BS
         gS3Rk3tMUAD7B1AZUWsxsvkxABJY3a3aTVPBruuQGGQJ+QtHse/ytOgRONA2yCbWy0BL
         YxdWp2Ze2G6f3wAaxsvRsSmDpg6EVXeC7ONshKaBL8aFCDvrGPjV56Po2IuDPyacyI9o
         eWH/Hfei6Ngr9aH2qmyFzfHS4FSf2dlKrysmaIUFha3bjIVdSeS1+1HQqayoC8/9hOHA
         GllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414016; x=1748018816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=XrbPV7PgQwn9J3bq2M6Jo2rj19/Ft+qy7VTQnY3oEDACLdaVFH8zJ19niifGfywMCY
         Mf99I2/a35996Yh5LTKKkCiZ+MbL1VHRoFNfP4o4IJG9H2LdMSvjXh5B/4kjEGtpFZt/
         lMVmDhqmR0cYvDVHaxnuu+L70RDwzlBOA5PErAzDUgwCPd55OMuGyoKaHDtL3qJAfaC3
         7vcQNyR0xXsm7ayIutrdnD/ycWXO/976gv61nZ3WE9TLiECu+3ByZpj7xM87CmmslDT2
         XECHHtDuIjVZUiuBGL8LjWlbJJDSUOIaFkqhyNhaL/arU/IYXnRDTVVLs0I0glS8WiVL
         RANg==
X-Forwarded-Encrypted: i=1; AJvYcCXTTt6Lym1GMyM9NT3eGc5uSM6ZauJE8oyi+uzpNUwfS3wuKTMc4aZwEfrcSzOgEF2T4qJ+BYUIzVsvqLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuPGG/zrEufLbYSxg4Q7B6XKYRtIUd9DWoe77olNb+OUd+sIs
	691HOiCSdx9Fclz0ZJAwFrH/pSeB1aDZjew7aLrpI8U2OWf9BQ/Jh9/P
X-Gm-Gg: ASbGncs9OkMG57R84oXjtdjIM1oF5/1Fhf/T2ByKGpUUI5cjcp5BHLTK67t4sz5iTpc
	PE9jBmQIMr3f23TJSjeYHsaV5TIkcMtltzgCrxna/yotoxPlnDH4Q7PlDWGBJUKvOLCw+LR8O8U
	a7UAj3eg6byhJzlWLOgzN2kSfROOjvhV2MK2yTAJK04vFZOonJvWslGTd9tLy33qR6/jAclOwTT
	Z2YiNCa+PnY5/OqWSM2IRGEni1zc4jUgTxz9DlpQY722qt0v1yGtfzPdsqEU+N6pF0L9oOOG+g4
	gN0CfSlJ9jb6zqPxFxBrkBuaXs6r5Z27UbJnVgMMKGdSgMk6J/48
X-Google-Smtp-Source: AGHT+IE7BWc1FIRYbVEI+k1bCx13USqZPfGcgw7ksFwL7J0sVNYerNVONgPi2LwWYbdG9vKS9dPfnQ==
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2170ccaf4e4mr4769760637.19.1747414015546;
        Fri, 16 May 2025 09:46:55 -0700 (PDT)
Received: from fedora.. ([103.102.144.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a32f8sm1791702b3a.173.2025.05.16.09.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:46:55 -0700 (PDT)
From: Nidhish Chauhan <solemnsquire@gmail.com>
To: skhan@linuxfoundation.org
Cc: Nidhish Chauhan <solemnsquire@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: filesystems: removed repeated word
Date: Fri, 16 May 2025 22:16:43 +0530
Message-ID: <20250516164648.15396-1-solemnsquire@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed a repeated word 'at' from journalling.rst at line no. 96 in
filesystems directory.

Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
---
 Documentation/filesystems/journalling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
index 863e93e623f7..2825f6c030c2 100644
--- a/Documentation/filesystems/journalling.rst
+++ b/Documentation/filesystems/journalling.rst
@@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
-transaction. I advise having a look at at least ext4_jbd.h to see the
+transaction. I advise having a look at least ext4_jbd.h to see the
 basis on which ext4 uses to make these decisions.
 
 Another wriggle to watch out for is your on-disk block allocation
-- 
2.49.0

