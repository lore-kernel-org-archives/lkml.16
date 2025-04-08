Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBEC255E31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151116; cv=none; b=AO2nyHtD6o9vjWFeoS2i5Fko5JrJqggCH93/pnLN7hWLcTWsAkFM8rdNtM9JqPCQatkSNGBUlXAy/MhIcg5Uz8vkyjHMzl9MoiFSYdoqwC2ElOUgtAs63/kZyCM0CaBOoi32aLMOpnfDjLbsjKbr8VTnqP9F7FwXYL4jTe+MaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151116; c=relaxed/simple;
	bh=XpQnO5Ofq3tGrrrR9Kobf5JUhGGWsse+RF8ttHkWB7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qfj1VfyXcizRFfqpb3m0OLbbqVbQUZ0Bxh3Uf0isUUSqpWLSq0naaNTzI4wtXhTNa5Jx7eAYkqY+O/9EeruZgwCnsV74D1FiTEjHvROXHnrY6SsqW7Rx2g/0eoaLvTU/Babvfd3ypwMDhNKLwnw4LHrZ5r+Yk0Lnxh+szZQdf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RAEWgIHH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RAEWgIHH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so5288751b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151112; x=1744755912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyqM9XA3qJ7OWA2S+2KUpQ5OJtWynztvm40wi9YyoYI=;
        b=RAEWgIHH53j0MKlMUuqigddEtzloFH30aTms6eVC2EoTTyAjDJq0vlAE66/4dh+9OA
         BxbUc/IGerFv3u4Os0Ata5oYUGvbNbiD9C4xzC7bMocXv9SlHrbZHYZXGTnYnsFwYqi7
         VuSEGy+AB/G/0ymkHFjfF4/lqYqxIElID19Ni91NM+1ILTrDn7BSH5oBtttoxjh7Y4/R
         0Y4180Idyr7KWsx2VV90oUlLkybSaLd3VlKsntOsoVZHrteirN4gsvSM8eu9zIFDRyEM
         kXaZV7EcZGtATDSuTQCWc/DorKHNBTNW6OzryJJauqTTeYu1UlZl2uQvK5iH72SiMkbY
         VwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151112; x=1744755912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyqM9XA3qJ7OWA2S+2KUpQ5OJtWynztvm40wi9YyoYI=;
        b=GO0N0TlxWsSSD47zGCyzQy82Po+e48IJPs0/Hp0qxCGgfeKuBQcVcb530Nd3OKCRlP
         5/KsAeSdlIoK9NHO8AehMxoH4krVzneJnEXjbVgd4MqVDLfE1iC8/p7jBM8b1hwXxURI
         Z/XJ9zQvfT17hyx0Xq/yXwzGO5BeF8fXOsiE3U2PNVU9HmEdUAjDja+NRzwG2+I7FvwE
         p7B7tBrB8UQcj39gK1i7r5l/6EtUULpQwlprizskf0EdNPRZPgBJnoA9t1LqhyR1Wx/w
         ej9Q13CzlsiMV33PwWpprbrahnMtu5pNqiHzxcPvIEdZi0oTeM7KIt+/Z4yMNPNydo8b
         RrLA==
X-Forwarded-Encrypted: i=1; AJvYcCVuvXJjX2Bma/p7pXYD4Il8luUMwkCW973uUa1pXHEps7ChPVS1IzzDep56mP2yooOTh9a0gkQhxuzuqGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDBcdPDM6IsvRR+TkClrp5no64j+8L5oT0FsIDChkU/Pa0AgZ
	c9kRE3LhwiGW7O9LslDJBNTlRtuIHhO1OoNYEvJNR8OxB/fHq+t7q7ymI7w8JQ==
X-Gm-Gg: ASbGncurqJ5zKH/ILIA1/UwWxpOgvSUlB2cXubGDcFUe5532sEJOgie7aboBmhAoTTu
	oufDg44OaACEnHpp77ce18MjDHhEkciVrPmBLUoUlGPGZT5LGVQIUQ06U2c3vKu4i/9xZZao/gQ
	YkMD30fENQdjXH5TMLGu7KZn9zdquH/PFezMio+PWfw1qjRUnKx/0Mxv1cSzcvq2mCMFrbukSrK
	pO+X6nAOoCHCK2c8+GEsXABoOt/W8Fyni+ZHpPNU179Tx01e1O5yiNgUVczZ2k0U7v0LtRuY+2S
	6EclT+Jqb9fTQf5tWFsma3K5gYa8QSKtaAA/TWe1kMpdEVsOqix0yQ+EEkXkxJNVLA86cIRBdUv
	5lHWAByShBOPjNgQypF3T
X-Google-Smtp-Source: AGHT+IFo5C/bNlvwWLyFe/tTHf2NO6zN6WDrzML5vLTbWDntGXERUV1aoOEuI3e6EbBITuA5yljX8A==
X-Received: by 2002:a05:6a21:174d:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-201591ca8a0mr889636637.21.1744151112694;
        Tue, 08 Apr 2025 15:25:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfbc9sm9615323a12.9.2025.04.08.15.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/18] staging: gpib: agilent_82357a: gpib_interface
Date: Tue,  8 Apr 2025 22:24:49 +0000
Message-ID: <20250408222504.186992-4-matchstick@neverthere.org>
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
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 16cc5333beba..29c390b4f4e4 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1432,7 +1432,7 @@ static void agilent_82357a_detach(struct gpib_board *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-static gpib_interface_t agilent_82357a_gpib_interface = {
+static struct gpib_interface agilent_82357a_gpib_interface = {
 	.name = "agilent_82357a",
 	.attach = agilent_82357a_attach,
 	.detach = agilent_82357a_detach,
-- 
2.43.0

