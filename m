Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA629CB32
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927148; cv=none; b=hAMvjRRoRigKTCxZ35/TWcx02KXIOdIiyfLasYPDJ4uv5fGXIQd33891buOI+TFzEVuNFP1h0A8D91UeIKR30DRBJOYpN7j9m069q6cSvI0WMhzk80wlxWxgQtSr4xjhrN3fmyP7aLXQ4i1qVzNd/F0K8RHQX+OjkJ/fXUMN7KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927148; c=relaxed/simple;
	bh=HSfhsMUTIEeNXER3GX24dEAFcEBa65RyFKGAcFfGniQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=TPXsDj03M2CqMevkWMZTavsBugPvEokV7sV0X1LVv7tU4Y9cMaPvhvMAUGE64l+IEUuXjKlcm74oIpxdNXpu3ej6XzlCQqPSfcnDKP25xwlmB/c++TmJS+ROAfHjAZQdQHjMOS/ZUDXx42d478GdAUMCFXhUgJx8n7YUO6XgFNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AeVpE4SM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AeVpE4SM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750927145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NOVgOi9q8hphdneYXIZpnIwxycB6I6Mf0iPTX4mv7ok=;
	b=AeVpE4SM6nUiVHlDwC+9YBB7av8ovLMng2va+qxpO26LDT6gUD6/NOTXsrsekEF4ArY9xy
	KUTBM+4+Cf7F++jboNMae0n4TsDU9UcefKcjqQlk27w6qig+i2eTrEpsCCrMMbTdobFxk9
	77ZCeeXlKRxx15jGYYesczNaUegQEC4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-MP2qlS6MOwqeI_NlnSWlYQ-1; Thu, 26 Jun 2025 04:39:04 -0400
X-MC-Unique: MP2qlS6MOwqeI_NlnSWlYQ-1
X-Mimecast-MFC-AGG-ID: MP2qlS6MOwqeI_NlnSWlYQ_1750927143
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so2946055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927143; x=1751531943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOVgOi9q8hphdneYXIZpnIwxycB6I6Mf0iPTX4mv7ok=;
        b=HWClnymSlUDzbmWAA06rrih50krXHEi0I0rrTgJeg6LeRkkhC68O4ACqkBO4pwRaxm
         Q2z0rivCOgbC106FtRQc710/RHEVLOGxo133tuyZNUW+Y/PzMfwCNO/sXstxZGQq3C3Z
         a6Zk5mWZigMW5Vg74zIjFPCkFBdEYUinmf52vD2qU9O0q6vWeqU+uU7Dw1yfdLSz7Vva
         uMpGCAykitInnjkBKmk3MHnRvQibyVRyXnVjaFUb4264jnlq2nqpsCHIdMXU1I4vtY6k
         VjjXKFdPDzXfSVA2drVCmWfezzuiSawLgwEz3wCblgSPKhTsKGFdjSzX1WUCLIFtvPl3
         06EA==
X-Gm-Message-State: AOJu0YyB7GHAPraok/MdNvCUjcYq5uzvP+3pyXKp231u5s6YL8rWANCj
	atQwoC9FDZN3M5nxJ8UhGh+yhVOR4iXrJV33io0rO0SKPpytKzcky/iKHRKJsx7wT21xk8TgcWK
	ceU5o9KCa25Ijq//Tw2G2GGm7DzOD6TGCvQSawbcjpt8FGffOm8SKUwOJcvAeHQtE5g==
X-Gm-Gg: ASbGncsCnNdN1MLfyHhO3vLhVQkeGsrRAqOAcZscS1FRhV/8hyJe+BBrWi3BmRVYlyt
	JgJ8xOWX5ts0zbVXrSMpMWfDetrr53/KqQI0i7HpI76J0tT966VASvVDBUHtBGJy4OtafG9bDn8
	lwaCN4EAL3Ot0N99vwVeBzWkYfk7Yo/M7mUvxajf05zg39qgEQU2OIokgQE8kIIJu5ltPT1DDaQ
	8+rweglctmmbi9M4HujzPLvUy8XhtwZyxLVgMSRA26fDPDnTO0VywBsVShIUW8jFWIMZCwJBC34
	lAQDiZEsp9V7xtCWixdDh/xJQEI=
X-Received: by 2002:a05:600c:3b12:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-453886ecc6bmr27801435e9.8.1750927142742;
        Thu, 26 Jun 2025 01:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhqjNyC6ulr9vBF1aI7RMGdUMF58z3nn/X9iHP+GUGyh3gq4Bxy5W7zVXa3UwHMyhVwcH4eA==
X-Received: by 2002:a05:600c:3b12:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-453886ecc6bmr27801235e9.8.1750927142388;
        Thu, 26 Jun 2025 01:39:02 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm20000505e9.21.2025.06.26.01.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:39:01 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Osipenko <digetx@gmail.com>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] regulator: core: fix NULL dereference on unbind due to stale coupling data
Date: Thu, 26 Jun 2025 08:38:09 +0000
Message-Id: <20250626083809.314842-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Failing to reset coupling_desc.n_coupled after freeing coupled_rdevs can
lead to NULL pointer dereference when regulators are accessed post-unbind.

This can happen during runtime PM or other regulator operations that rely
on coupling metadata.

For example, on ridesx4, unbinding the 'reg-dummy' platform device triggers
a panic in regulator_lock_recursive() due to stale coupling state.

Ensure n_coupled is set to 0 to prevent access to invalid pointers.

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/regulator/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7a248dc8d2e2..cbd6d53ebfb5 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5639,6 +5639,7 @@ static void regulator_remove_coupling(struct regulator_dev *rdev)
 				 ERR_PTR(err));
 	}
 
+	rdev->coupling_desc.n_coupled = 0;
 	kfree(rdev->coupling_desc.coupled_rdevs);
 	rdev->coupling_desc.coupled_rdevs = NULL;
 }
-- 
2.34.1

