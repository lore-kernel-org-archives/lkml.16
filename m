Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0826E21CC79;
	Mon,  9 Jun 2025 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494841; cv=none; b=URLQP+9rARy2WY1WBPrfda9zR7qsY8LtxB9WV5rHeOIrnQMcyO3EVap7A63CcGkEa3nC+U/05FR5vxJve+YTGMg1gNc4wB4Lmimr17W6CZz7TKeufpNbtjCrzyEwS/cQCqdy5Wi60uCGs+LHwiTAR5mobA2RRB0jm3Yj6WnXs1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494841; c=relaxed/simple;
	bh=HktfipjCtbNhdpQdjG/jx9IyuttYJiKuu2cQchPP5AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3zmlZxRNTzm7IhkmVUsA9pGdAlgoX5xrV0qi/euCqiq0YmdvMolS3MHw770Jr+MKLknQ+t72DKPKv65Cv2dbnPbjq3O+BYR4TR5lwQe+4yzXtqBwr/Clp19WicB8cLLqX1q83ld+zsThup0FyDP3XTseZ0unP1dVD31Qy/0e60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HalJ2oHG; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HalJ2oHG"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2cc82edcf49so1412363fac.1;
        Mon, 09 Jun 2025 11:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494838; x=1750099638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80W2fxDPnqr3BsAdMQ1F8twH1xONkZpWztd0paXrfPc=;
        b=HalJ2oHGsZqbMPhU4otjW0yuVymQ0tfBoX3Lh9qVN6O88uez2WcQQRRLK4eKX5CKkP
         VfjwmWqQxbEm3ODTItoxtlf8lsTVYM6mepvwoBMSgszrllD0tVGUUBCtYgR7S/zacd8e
         MGVfCKjxYYivGUizxHwx/iiiAMZ70v6BsbropD0mx1S9BtPOz/sdei3A37FSO9ecCOat
         rEn7cTJJt4LcAmTfb+ZS3YEHLXxVNFVHG1Q2SGAmJlusPPacBJGaZXhs4d8RzTmu/kwA
         QGU37A4hQ3eA0b76z9EXoG1LkpTiARdPksZRMUuKM3GaVolMoagf1Jfv5dGT2XscOjF6
         ESjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494838; x=1750099638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80W2fxDPnqr3BsAdMQ1F8twH1xONkZpWztd0paXrfPc=;
        b=SX5CUBbE32KVyofHU6ea0R2DGD/nRG54jdBxXRzkVjzqnc7t0JNdNcuCcmsk2BOONA
         hBTBHZKZmXX4LRt4MRKnKzoyociExtfjmySZeHxtvGJg2HygauBL1Gkm1pDJOJ5ncCQ3
         BjownoTjPLvOXYX/PHinI0BsXsfMOMIV/efje3LzVspCt+ipSWfl3Q+QGo79tN3PX3wo
         59rGTs2BvDHDNTTGuBPucnjI3io6CnxSoBwoPL2nZ65gU9a3Gou0OGrUteUtmZIJelF+
         4L1l4VXAQyHB02N+5BBAN9u8FG5PsdNoEpdUYR26x1pE0NpzDv76OwXfQMNc7LdQx3qy
         sOmw==
X-Forwarded-Encrypted: i=1; AJvYcCX0ByTqxUcIj2I6Ecq7baNYqDbJm9FlbMx6IHUZ63BlV7Njio4n7/188dsJ9gfaDXGhLvBJVi4G61Zw5zU0s1gPX30E@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPdNKLVbcdMMN8d0LBFpw0F+1vTAWdin0jdItLNvk6QlfsfuO
	jaHkxs13OwevCiJldLW0ykPkT03k59CA4lCZ1Y5ZnkRY+8nhNRqi/nB9fCVohg==
X-Gm-Gg: ASbGncvmKvdDJmErawl4ULnDzlB2ro8sRP7QWrh2/uhYbTuj6Z4do3NT32T0+npsviW
	yCtnluw6j6/XG37JcTzWNuLeE65suNKn+pvY1PFBU4dc4NZMV2GR3MrJqM3b/fJpW+kZhuD4fhH
	ennLt7irxWPqe1kLiK2yWDB+I4YixG3tHRu6eTYtRqXVEMArhEMcl0aFa66eaf12tldx8IV1ngm
	D4yXQblQy17o4jYEzl2RLZRBrd5C+6yIjVz9nM4zNALi2FO9yf4O37S2AhvAAnBuHL7/ATePDEr
	gA14r/+JxxZIx2KNY1oxEp1EIYw14f8JrAxyu49b7Z7GBctLS5jpZRZr+kp3EGmkcy2rWfmj5mT
	h4ut/aZtgayVubs46sPRW7MZwwqDeRKIrvlGd+sM=
X-Google-Smtp-Source: AGHT+IFYd2Pb6z0OQ0t6KVOhuFvgsgdyigHOZ3cWHV72uPQsIyZKUUK/GHsc9XGTsnae/EUFCmMbxw==
X-Received: by 2002:a05:6870:818f:b0:2e8:ff0e:17d3 with SMTP id 586e51a60fabf-2ea009b7c99mr8178703fac.21.1749494837674;
        Mon, 09 Jun 2025 11:47:17 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e4b5asm2035950fac.30.2025.06.09.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:47:17 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v4 1/5] platform/x86: dell_rbu: Fix lock context warning
Date: Mon,  9 Jun 2025 13:46:55 -0500
Message-ID: <20250609184659.7210-2-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
References: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
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

