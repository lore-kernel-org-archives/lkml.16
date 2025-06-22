Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308A13635E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750581009; cv=none; b=OpKhDcMoJIuG6JDoQGzW848QB+vWrB6t/9K/MoaQw4lsEvJ1oqB9Dr+eC/0wRtdKFo6vjw1zO5Olo307ydysHiH5SAPU3pcBWxCmFvNuBwaqVAiZKXI7aiXT0FHdFyU1YsFnTXiwXN4fe3kNm7OsXgiYUg8irrmIS5HdHEO9Lvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750581009; c=relaxed/simple;
	bh=30Bof9SMj8rzwo80Esa2+ETn32On9XCRmAhjabgKWXY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d5BB7D2j7G4dDV2mkWiUan7hQofmzLH6JKfNUZV/pPdtd0PvmSwHX9gtfjLcdBPknoQlZUnl2vfVg3oENpRCc56y9hO71bhiWfYEyXWShqdCn47XZNXXVSxTLi/RIg6QXoAiQeyt8Vb2aLv/PgGJPcfod4k3jQWNvTFEtQiYjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjydGwdU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjydGwdU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235e1d710d8so44058115ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750581007; x=1751185807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba4y9rSMpoG3drHbVgM/Q62fZ7iIVMVCegaFnhMECpQ=;
        b=cjydGwdUKTaH6vK1XRe25AY/2WMJsoC8zNBP3fdx4iwlHeA/EHLXC3BmdWBP6k9cDA
         N70Z65YVsTe2fBqCowmB4YvLDQX6tv7zf9AAJXx1i4EzarC1k2KnLPYfWqNn3xGMH1JB
         CMy+an2lkf59FXBdHrPwF+n1CwoLxV9P1OVDaYQy5hqHdoVNi0/ZrXVfSKGXDiNFZROo
         DMAa/VJZ2oMbsjLP27FRd5PyijjBTamxTqNtmjVVQCX+0wZ+j8FKBYuiEGS2iQXJXUym
         g5jHQPsI6yKkYL3q9PKIMot3xqCoad7R3F3DNnpYwBfl/XEoHxmCPIVGaY3PatOGU/0m
         FIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750581007; x=1751185807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ba4y9rSMpoG3drHbVgM/Q62fZ7iIVMVCegaFnhMECpQ=;
        b=QG9KZ+eo3jDaGE/288/cSbkAF4LJoh0e2qGELzsZ7zztjCw+jfBuFADDsY+7r0lHi6
         u5wLpCwMdSPYcL6bHrPmFfy5OsDs4Utypu0VRQdumETJuqd3ZQqDXIqiGWzrszWvQQlM
         fcYutrvDW1veMooA5bz5u+x0yHnpwuRMJKmlkkOFs90I365JDeRawqjgD5xEkkRlIYEj
         NW1/E9Qw+pculCrpaqxPCO9klYUUDeMEKIasexrJybnDOMzQdF1NE7vIaYCqbIR79Eku
         m01rIYdI+hfhc/pq4F/GdBd1pwsqdu8T4JPHQ8kohswL2snRN015KUvA0zlAcvL3ciSv
         5tZA==
X-Forwarded-Encrypted: i=1; AJvYcCWZarxn0222NrM4ol9gQAeBzjjw9nL5uUjocm7EJGYgP2iALaku2+xo0pCziWmiFKeleOgQ9OkUgaDQWZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCkIKvdvXHjqnsl0CAM1dJnhVk5puraEFNwt+AIdVTw+EmOVx
	4BKqZw5WQ6CY2bKf/NNPE0OsFf9gz1SaUJ+a/RfooRzXDdnsjJiPbcyXHT48FyJh
X-Gm-Gg: ASbGncueDqVJ6CjDoDDdEmmiXI3nk443feTdHZRam8BnGGEhblw15aQ0EpUYyookuAi
	HZ6rRCL+r73pzwVlWKhiY0H35wnVwVIJI3iLgI/BdUJuY4F63E+baNrZ+CwfZcRiLQM71cmWekq
	vfNrR9bNh4A/0hRlGWu6nHa/HHOnaXiW0B0g+0dfkZmVQd/fUoMXmB3aftdksKOWEpT6XWvF4uF
	K/O3tfxOWMzvfI5j9WEp/GdB0NHFo/rItu9JFVxEXAMdnNYg5e4iaBrR22Os+4akSxOHxxh02Iy
	dIH8kdEGRfcRSgAp4aLoKbIB1vEIiY/Q7shZ8SbwyDXZb/zJ1c1WBhDgV+fkVYlp
X-Google-Smtp-Source: AGHT+IHCOpphmNin6Qqhtmga/k7CEZiwYLnGk9Mf4C1xbYCMX71ZPFGmqeVUra6+85ZXY5SOGNhzQg==
X-Received: by 2002:a17:902:d50a:b0:236:748f:541f with SMTP id d9443c01a7336-237d9891ca5mr140646365ad.33.1750581006806;
        Sun, 22 Jun 2025 01:30:06 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c94:78d8:20aa:360b:188f:5bbe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86f7cb1sm56520595ad.222.2025.06.22.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 01:30:06 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: jens.wiklander@linaro.org
Cc: sumit.garg@kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Abhinav Ananthu <abhinav.ogl@gmail.com>
Subject: [PATCH]  treewide: Replace scnprintf with sysfs_emit in
Date: Sun, 22 Jun 2025 13:59:11 +0530
Message-Id: <20250622082910.13897-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit() to format sysfs output instead of scnprintf() as recommended
by the kernel documentation.

Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 drivers/tee/optee/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..ce44e3498d37 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -72,7 +72,7 @@ static ssize_t rpmb_routing_model_show(struct device *dev,
 	else
 		s = "user";
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", s);
+	return sysfs_emit(buf, "%s\n", s);
 }
 static DEVICE_ATTR_RO(rpmb_routing_model);
 
-- 
2.34.1

