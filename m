Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807EE2BF3D6;
	Thu, 22 May 2025 20:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944606; cv=none; b=jAkOAtUe5ithigePh3pWguc86yryBHNrIXZt2HXfrnm+t9XrQjika7i/RDzyk4wPgjt2RiVZ9wKXcptFlmTclzt/QaVXKWBW4DgqOtptgMoP7H2FEe6Viu/KATWnh2uQp7m1LUyEuJbBCgfAO2XyMvGFLCEhtzx8C8DKsSH2zQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944606; c=relaxed/simple;
	bh=HktfipjCtbNhdpQdjG/jx9IyuttYJiKuu2cQchPP5AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVyzCIU0ibG6c4Zqd84i+oYLg1mYFQrAkwl7uI09hBCArq1zvLWtQa7uXhfCkr0GLbNObGm3yw6sNm1zHSAD6SG7qJ00lNBurIiuIE4s4UD0/Cymcsw++KJS6IrLl2lJMzR3aZIYZsmJ7CRWiEBH9BXnt9RSdDP3AQWsS8JLlzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO+oBvOX; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO+oBvOX"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so174457fac.0;
        Thu, 22 May 2025 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944602; x=1748549402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80W2fxDPnqr3BsAdMQ1F8twH1xONkZpWztd0paXrfPc=;
        b=AO+oBvOXJWnxGRh2lvUL1o76YJG6HXDwsDfycZ18jMCiIKtsIo8o5AdTXfIjrKij8P
         hgrb/b6UMOk3YE457bmmTNyLm58HW2dfVHk7emWvVyIOcADxangWSlpsbgDUoku3n3ot
         D6ZYFeOmRZBn2G2zuvcQ8gQVdiQBVsU2bPs676iTJg2rLVwhXe5yKqeATYDRU3bF3nnB
         T5/m5T8E+6H/P0opv/x4CGqYLtStwxB8pIeZHSkZg0L93VyMArNc4FuxeH/MOsP0TNEV
         g8peueMICTIYd9fFkVtaovi/bMXy1Q22JO9W7tW00jV4Y4kaY1e2VSxIVYoiqzgAVUIy
         4knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944602; x=1748549402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80W2fxDPnqr3BsAdMQ1F8twH1xONkZpWztd0paXrfPc=;
        b=adtej17ueCQpxMjL5kJqaMNxHInCKZzEZAroQQrbH6uWqyM3UE7IIGEstWS0w9C1Z+
         vEKOXMw/f1Hlfc0swq/cDUlbzrTr2nSM9RvRF80ztS/KlsOpsFfMemeC8tOPxPBe8E1F
         a39jispnAHRSyB/5MFOrddTFXi3uZ7PDoJky8UOEL8884a9a1bwdA4/5DW5SIMdXWRQ7
         VdNwyGr2mleeI4IG6vaikD0hJdYNZFgl0Pd6tAZ/2XgZJi5NG7s8oy957AgyyT7WEM0b
         qZBrnl7Yt9H/KyvKCzNEsOlFjhoflTMPVwM1oZE8EOS536eGD/Ajx9n53wQfHcp5S+Cx
         eVdw==
X-Forwarded-Encrypted: i=1; AJvYcCUVCLQvjuqR/HalgEiallaZqG4tef4T8/P6HuVevFKSYAZy+DFX5/WWLDo/9bN8Xt0HiyZMq0z4nYGA2nCardrZaDml@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2GlU+1vjrbIDNrHbu8lHXGknHlECvu/Jlgj4GCx7HAx8Xw5n
	frrGGZc7WMFehSNUGioLrZN5E3tXR2xaXdDuF5AsOQqm5daKlWrRw0NSJI9zsQ==
X-Gm-Gg: ASbGncvQk2Lgsi3vV0PJ9iSlg/bdelMbpnpDe5fiXPnbrf+9ITtlgFda4NhYqCJ/9Fy
	vppPYtXaJAh9+XQra8qCY+N1Rr2P7hkMekT8vB4GUgxYw0FFSKlq3B/YA2fViJOv4pbsMh1iJRy
	3AQhYkoiOPmw7uTNYiXOxo0RYxNmy0if5F0wpGv0FmfMB/4ubgiibXCqNU+JHYEcfICi3yqfT+q
	lxjAAJHVFz888L3rdEam63PWpOlEjOBspVwdhME5ZY/0oud0h4Z3Ct/2t4W1hXqWovBPb9o1L49
	BNF2Ov3bTZNpnOIwQno3y9uhMLxoWBbMqcBsDvskZLgDXzHyr51wrUZfABXcMZTNR7Gk8Ss2BIf
	1djfMjpkbmVXgCsbluA==
X-Google-Smtp-Source: AGHT+IFNCaFEUdw9Q4Lhho49woOnZgOAPI9sRkEj7PjLf8sh5yHUiQTPttJdPwuecHTOCzVefmBBWg==
X-Received: by 2002:a05:6870:600a:20b0:29f:bdf0:f0f5 with SMTP id 586e51a60fabf-2e83e9186cfmr427048fac.17.1747944602528;
        Thu, 22 May 2025 13:10:02 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98b2762sm2651046b6e.32.2025.05.22.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:10:02 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: dell_rbu: Fix sparse warning
Date: Thu, 22 May 2025 15:09:35 -0500
Message-ID: <20250522200937.9578-2-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
References: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a sparse lock context warning.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index e30ca325938c..7b019fb72e86 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -91,7 +91,7 @@ static void init_packet_head(void)
 	rbu_data.imagesize = 0;
 }
 
-static int create_packet(void *data, size_t length)
+static int create_packet(void *data, size_t length) __must_hold(&rbu_data.lock)
 {
 	struct packet_data *newpacket;
 	int ordernum = 0;
-- 
2.47.1

