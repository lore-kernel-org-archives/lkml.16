Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B551DFD86
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849982; cv=none; b=KmgDZ1gBQxZhhLCgEFPNWqpF24XXeqlJJMq8bRHh5nVkeKDGQ+aQDNrogjtONVFbrtpOt895L9xrbEQC8IUDk3PLqLW/Z9OwEAMBlA/vV+ye14QLCoZz6NC3X0ZmwFOPEvqejxuGDuscngl7YjXdiF47uB9kh7zlqBRWWMbD/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849982; c=relaxed/simple;
	bh=sm89KN7M+N+cjb4kBf0tDv/avTft4wb53ORjh52ocFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzODEJleV5kb5kYbOjvP6xtaxbBUKYLzmANairKFDqsmva0S5w1IF+P0ynJJQqzjOXv0nSvkdcBYoxintFd73sGur7NOwbVvEBRBYQpY28qE+DEBEvZ1KHZe2QU3HATBNf2k1aSynIkMpPD7gTyyKy051QgWKUrp7ZFhnCmJwlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=SZFYKNOm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="SZFYKNOm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224019ad9edso3827285ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849980; x=1745454780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=SZFYKNOmJl6gyZczjHl2dxnxnkRvw4FLHKb+i2RPZ7mDU0AJeEthja7bvMEl2Uoon8
         2Gp5LllHJ0Hf2vjTB95OhxJ2Kj9/IiCJe5rdfoPw6RJZ1vrDOEy7wBUuyotMChYk84Bh
         E1+70Euw3Tw7Y9Nc1HmMDZ10JACj2lDVBu7Q8TV2rQ2+6LFC/X213OKD+BXt9UQsQo0U
         ktzbUR2OilG9uDu3EFw14Bpyr4l72yGpn5VoxwpunxZsFF46CmmPqtvx/Ouj3vACyiVy
         8payntzyZhCx+tx5/dvM8rF1YvIfswWzQlibSMUGf5jeNFDGcPOXVbONrFZIacRqD2pV
         YZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849980; x=1745454780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=vtqc+SZHgqu3qn22Qr1EKDpm2bfzSvtR1/nbhRCyjcsv47QfZYnWWsO9xZuTUh8R0+
         yq9pIQJl2nrC7fg76lw3Kb/dGW0ZoOT+319f4ABrRZmkRwkhvreQXDlpeoqozGSXpCCc
         39QgZASzlwdgoIteZwGDshLMJnjZKn2i4f6zN+RkAqaN99/rEm+GEtouKJhk0pP4s6QN
         qQ905z1zRj6ljxZRJeX2u/K6Bh/Pk8LR4zo8DmiwV1zvsdUXovFodUKb5V5yz/MtLiBV
         2L8saz16AQH+11Y/1r8zcr5MxO6Cazw0P6qyBrOp28VEDnuT6SvP2d+mFpUAChyUHfVF
         +F9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvkuZ74XJ6Z6W8AsRa9QWw/dyizX0FXcuMgj8AP/I/PuwdoHmmDL2CBm1+ygcVprTLpyGr3/MthY7Dlzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGB8ZfAbUvpV6nR+U8/dC4cxU5ymkfpDRy33Xwieh3GQjE4zg
	OWJZsVtnvdDIf53hLdw1ddA+o28lEqgG1nk5jzM8D7N03/C/5qz2tcaO/FyKag==
X-Gm-Gg: ASbGncuhRPR0JnqHY59fmdfwrPz90tHdUPHPpzSkSqW7CbV/LX+l9QQEpQ6YSDYecmb
	R7PVCVypBZJFwRPfeDvyvFWeqleSR2as2XlU+Uv+ohTXVKuxbbgvO1Kj2LRjBlnjmvm0/ux0XWz
	eUWCZJpfXpuzv2t39ekGSZgiHYPpntn49FPyuMP3AdVH+XQG6+kCCNowTv5GhQfyQxbUusJT8q5
	YPmP7rtjyTjP7ew5brJOCoOU/BQwICNOd2H6FvZjYKUTAIyOb2K7+ldhqd1Gghqau2bTMoQiGlf
	Ml/g1Loz/ikVjYmlRHmAOedaG+BnwO9Vtetn8hd7//lI5IDICDg6fqgbokicyBPpTtKWCzwmo7K
	QMipNpA==
X-Google-Smtp-Source: AGHT+IHkdp8wFb8X5ghxYt1BgBUGd+xhpS4xA2g6f4odxtiLr8qfFM+odDvBRmuWhMfWb6VoY3cBNg==
X-Received: by 2002:a17:903:41cd:b0:220:d078:eb33 with SMTP id d9443c01a7336-22c3596f812mr53036595ad.36.1744849980355;
        Wed, 16 Apr 2025 17:33:00 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe8dd2sm20829485ad.246.2025.04.16.17.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:00 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 10/18] staging: gpib: hp_82335: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:38 +0000
Message-ID: <20250417003246.84445-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 319b7f6e35ec..7f14ecb46026 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -180,7 +180,7 @@ static void hp82335_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp82335_interface = {
+static struct gpib_interface hp82335_interface = {
 	.name = "hp82335",
 	.attach = hp82335_attach,
 	.detach = hp82335_detach,
-- 
2.43.0

