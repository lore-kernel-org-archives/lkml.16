Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE8F2550D0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151113; cv=none; b=ci1y2LNJDxRiFKysXi4E4wQJjOX/FgWU+dbwHWw2cyemT9mK+Uo2hnzmqd9CFVYDPYIayPJkdYuksWNMKviINFgynKgy6nlyplQW9yMwNoyYWuH7uO4Hp6URiUf9c8hdQpqVVbAz/wwFRFXpeG4DA5aKPGoa3lXhCEZbbHM/ed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151113; c=relaxed/simple;
	bh=oM57btuNW3ekRvgTbROwRISV6vnniljWeMeAhyibHMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvRC9kaMIbV65u5/2QyURLi6SHzT9EGQe3nKFzdfI/4xsMd5PnszxLm+hMlxzDjjE6Yn5pyUkBPg6NuNOl3o2ObZYS9VgKkJyn2OE3MZL4/kU8Cu3mYLtXpm/vSYovF6tz9kC8Z2AbymDxJfUEoiFQ6OCf60IrSee2QyVdNAjvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=d9w9Diwb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="d9w9Diwb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227b650504fso55904005ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151111; x=1744755911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJII3lwxwEP6btEtokn6sH1x6OEQH5WFvfcqyI8vPWg=;
        b=d9w9DiwbPdzNxtU0eNxjs1VLBTiMkcX8v9hGHn5qAxkZq2hUkILB7nAhimghcantpb
         BID8C4/fQW//oRyxhZhl46u0wOKREvq5FqBlpZIZrYX4HvODrKUvTSffBPdda7ZgAw8U
         3whNnB+tsw1YutouanREa9VnevIDJPqzfHDHBiu1Nk9PnEj/9cFCtr43EqBEenhLrbxS
         KvZzGNnrFzszIm676lsdUYTx6SssCsgCIccy0q7DG/wGZR9aieimDtR3sP3n9CeBTuQi
         Dv0jnPgwQov/DfbdX9vtLG6TWgBkGMZNF1IPSO46cGHk7NHyfG9ThEI9/f0Hw3QdyupD
         KyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151111; x=1744755911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJII3lwxwEP6btEtokn6sH1x6OEQH5WFvfcqyI8vPWg=;
        b=BThGX99JYgVtRvhjSI4mO/GNwCk4k7d3oHNaOcftSQdonC7UN8uNYfxJ13u2nZn8pL
         kJyGKuQLldwYnIK4tTCmJP7mI1otLU80cJwUB1stgCDXZKMDQwH9yFR5ZSCi/zQ+T+JX
         cwk7BoHa1HaLjmPYPaCLDABbqf7HG4vdRHHYSbAtsJMQ8RTzbVJiCr4f4vYfisK+5oXs
         /RV9jSnwR+pC2OCZB2hWH/6vwWR3KoajBij3lnn/7DxsWI3WfgVnxxbuNNu1F/huYTUr
         CsZXdtPNF5EWi/vbfUoVC3HvrnJhlS4hAtQfzTtAFZBOVaSN1/H4Hin1L4lwj10a30wi
         4BMg==
X-Forwarded-Encrypted: i=1; AJvYcCWo8FfTNRn4tnu1rAiviIY/m1orJj4/8eJ6L1yCeQhWh8fflR8PeuxsyJzBlA7xKHBzQ698+wx3vFDEixs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+DzUzO5ioLQlQ0FzJlU7mSkzfO/xwmozVqX7kEObeG36af2Q
	isz33AIDVQAMkq3TxySsdR0N53yk+3CKyc9IfADKSK+6rnR03CTVL34JUyAfgg==
X-Gm-Gg: ASbGnctRGtUa9flG1KG5cWy14xvL45ofgGAUpI5+Mnxi9E9sFO96L4V19SbHzCSbj0x
	nrU96Ru1KitlFmtwicv3491PbjLcuaJ2/6GeXDZMmzH7V1HDEeYqeDPij6cozhKX36tJwy75TPE
	IwAL+Ia52lcMMMMIkw7PUxXfN37ebwOLIVQ/UkD8dr5H9jDDAi7HPspH4DI96q+pxZFXX5WYs7B
	FBRk+vycH1R0VkUCjSwLvvZrjVziJt6Dm7KPoGiJL8dxIFX5jHMvwVlmAssrPh8uz4R++qgea4J
	5UadulVRi21ntqu5fTNkXhk935yO5TJz3ioKT6me0WWvXSfj3lDtbxn/U/AmqmONrxtBCMmOJfz
	iNqjJWrvheg==
X-Google-Smtp-Source: AGHT+IGGBaJsq6ra1J2TD6QhHEFEL49tTMqBX3rGuKBOfmUq0C4kINeHdNJZOfurJQ52gP0Ji/nVZw==
X-Received: by 2002:a17:903:1c5:b0:223:619e:71e9 with SMTP id d9443c01a7336-22ac3f2e04emr4578645ad.11.1744151111495;
        Tue, 08 Apr 2025 15:25:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfeb2sm105911555ad.74.2025.04.08.15.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/18] staging: gpib: agilent_82350b: gpib_interface
Date: Tue,  8 Apr 2025 22:24:48 +0000
Message-ID: <20250408222504.186992-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..3880d4a23eea 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -773,7 +773,7 @@ static void agilent_82350b_detach(struct gpib_board *board)
 	agilent_82350b_free_private(board);
 }
 
-static gpib_interface_t agilent_82350b_unaccel_interface = {
+static struct gpib_interface agilent_82350b_unaccel_interface = {
 	.name = "agilent_82350b_unaccel",
 	.attach = agilent_82350b_unaccel_attach,
 	.detach = agilent_82350b_detach,
@@ -801,7 +801,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.return_to_local = agilent_82350b_return_to_local,
 };
 
-static gpib_interface_t agilent_82350b_interface = {
+static struct gpib_interface agilent_82350b_interface = {
 	.name = "agilent_82350b",
 	.attach = agilent_82350b_accel_attach,
 	.detach = agilent_82350b_detach,
-- 
2.43.0

