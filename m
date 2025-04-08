Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23274255E27
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151828; cv=none; b=Cmx9lxW+oKY52M+dTnKpUKUt6BddfgODxMU3NMQxcIuZt6qpjZwYzMwvrtjTYJwyA+M9oBF3vINqLMBsErb1kUo2sDVy2TTmOHIYXpDRlgjsyo80H9FH2xZFGanGdwoJMUEraRctZAl+qeA5/saIMHKPrIOhXsObA66ZAW9hrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151828; c=relaxed/simple;
	bh=ZLk8GslpxSlsrtMxBElb3wimefBQ759wHGmHWLKEtjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENuKvyTHaA57TlngEyrCDDPTgFk+0mWJ2+c31dt4Tprd2hB/ZcbGtn92CkPHESt4Dwqxbxx1uG4So494zDgFwDL8mCcetn1sXyyqXed/zOoac2GYihPRuJfiR/QCzcR1uGZGZgQCVokMLpb9GoLlKvBSx1AuwW0jiFTeQ7l9R9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=SdQCLOss; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="SdQCLOss"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so7232877a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151826; x=1744756626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GaKb0l6WtN6m4tMcZM1SociJ/kaCRWmZW8SSNvMkBc=;
        b=SdQCLOss+WrElcHFB7xaU4qsAQZ04NOENqAuCSuyEkuD5527BNuqMdPuzV6KJCxdog
         uy8gzmVIdu2CJiDHsfUBzsYBJrbgxZNe5Vux0tpC6PcYJ7BpqfTNZB6fwqud4GrZhQQn
         zlzLe4kTOM7U7TgXy43EDFW+BYZVpC54V6ZfnXlYJi+4urexg1NrkpfQffABAjRsG1mS
         v75cRhHX5xjzPo3hxGcE1VWLeUBFoyvg0kT8ddGOO2u/UR7gX3LdxE6oZtl6cJhhoHsX
         isVFi9d74TjLOWzBc8zo2B+AiieocU6giHfh8NMlVP2VzN7x/GkORz0BnWp8irgOOAaK
         1XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151826; x=1744756626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GaKb0l6WtN6m4tMcZM1SociJ/kaCRWmZW8SSNvMkBc=;
        b=LI159Z8tgvxe5DejJhinSNlyfB0s2DedLk67XGlKzLud5VM7/GKoocqpp2cWtoz0ig
         1H2CKJHbrz6EVPXvCufEJKNbb/LZdrIwwEMuKpQRwze3+ddx+7qFQNdcpXXJ3WIBxv23
         cmr1UhxmYzKVuAQkvFU1H1/sX+AmEYJpfqss/GmaWeKMbNyXgbfcJgzg/fiKo5z63yI1
         tlm4/YAVSrH/jIf6PmKZiNaF/I1Z3fCKoYNBLRKJZdTyRi0eaqP0yfcs4Du3sb122Yj4
         X0O4Fk70RUB0SGJW9bkXeoOkbGqjwLthk5KIqHYa4WHpKWkFdj8UT/DbGA627xwuY8as
         eDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDZRW5yGzxGlFtgDBn5QLmbrYSUv53M89Px9GeVMCXWb3mpYLR2Ax7sNHcADNX6SGOpZimtFoHH22Hn+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGs8UNtseisHHdSmqdq0isSC8egv7q8dNq9NBpYejIHDMdspH
	F7IZtMlTBYpCtR7B7l769ns525QZX1Ucu3uYiY+hdB8qBE1Casly6TzO0pijLw==
X-Gm-Gg: ASbGnct4h2+Q+EPqlAUhhdOOU3mb8+df3UGmmRpvLUP7VuygXc/4vyQTWqlYJVfh3e1
	a129/b422HptJZMMXEdo3biYfeH1S0pXgqeA3Of+GR+RVjTaR2Bc6OOA20YjquVDpE5Rv+JukXQ
	TX1LCAXxCycmnkPiCh/MSF2OuLOBeLv9GG+fmmm3HdX+dD3LNNI/ARwYBnX5/6P8SRM/fmwgQ4y
	nGecK/r8oD4VWAlY0CDU+XgUM/SICmvr41ufrR9kxlxdxT02wl7ZgcvxcHufL6JV3HWhcN7i8b1
	IvEL33c0IQY8HqiQNrSNdj+LU5uSS0q2g+2iJw9JGdtzSB0v2P9Q9w5aliNVQ4BVKdKQCszxgf6
	I3yPIYbPilw==
X-Google-Smtp-Source: AGHT+IGrPMXPOwwtImIdhnJkimYrLfyFGrVUekqyPsAsS35wEYdQ6vRnnwJcB5BtTLUD6D09rfpyfA==
X-Received: by 2002:a17:90b:5241:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-306dbc2bf38mr1120900a91.28.1744151826420;
        Tue, 08 Apr 2025 15:37:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787778c7sm106350885ad.255.2025.04.08.15.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:06 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/18] staging: gpib: agilent_82357a: gpib_board_config
Date: Tue,  8 Apr 2025 22:36:43 +0000
Message-ID: <20250408223659.187109-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 29c390b4f4e4..baa8f149024c 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1292,7 +1292,7 @@ static int agilent_82357a_init(struct gpib_board *board)
 }
 
 static inline int agilent_82357a_device_match(struct usb_interface *interface,
-					      const gpib_board_config_t *config)
+					      const struct gpib_board_config *config)
 {
 	struct usb_device * const usbdev = interface_to_usbdev(interface);
 
@@ -1305,7 +1305,7 @@ static inline int agilent_82357a_device_match(struct usb_interface *interface,
 	return 1;
 }
 
-static int agilent_82357a_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int retval;
 	int i;
-- 
2.43.0

