Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673DC22318;
	Sun, 22 Jun 2025 00:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550701; cv=none; b=SllUNnM+ZmpX/oN8G25KN8RP7VHgoJ8ZuWpHqxPno+uYJLzOzaUweyT3Ma9xEyol5v3MNaSIsDOL8pF9LeMb8ihvTEzbFzkeRV6+8ZUkwyOQbQZ5hD6QwhPbyjVlGMD0sCCO36ifdx/O9xkI6ATKiWbW12uwu+pLXF6JRYXQqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550701; c=relaxed/simple;
	bh=PGzNmxKPeKeIW9y3SLrZgxUtNxszaOvcO3mqQbh5IU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ynca7SmjtLfZayHLikelIEncPhIx5fClvkq7nq+f4YV2UiqtHGg7UN96MPgm8E7gLKelJov09mi3mt07+3G7ITm2y/mB0rxl61fneebvBIqemS9gV8qI2aLTmcHmvwuUVyJVI9fYWmi7zhFAR60DYH60FmhsjkM647VFt8ncDYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghRbiuBF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghRbiuBF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3495686b3a.2;
        Sat, 21 Jun 2025 17:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550700; x=1751155500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXIjFbe4Vrz2bi8rFlLHVCaoVK6EIDR/YQX7SQMy1sc=;
        b=ghRbiuBFo7hpSCf1fxPCuz2UUHlbx/3erm18gemvAKdzoC1700MBK+P2aFSv1Em1nI
         ckRloKcIyNigHsw9CCCYRWBj+LcD+d5lcl/EpaiC14RymoWoDSETYbmavem0wTRBJYvi
         1PPaBpG1s43wf2NK9wxbO4kDGAwruCdtEL4g84T/8Pyc7pNss9B9GSNRgr2xKOAodW9e
         wh2Kp/7Na/Bsk0NUb+BKG/qnIkkKuRT7t5Y8SF7GvVwG8AH9BiI/TE4+cry6XDnZFDw8
         uDZL32ebZO8rfe9I3U7T2Ac8SdbnF9wpP0XSgvQiMDrJuEeNNk7+vKYeVIy9yuMLq/LD
         YFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550700; x=1751155500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXIjFbe4Vrz2bi8rFlLHVCaoVK6EIDR/YQX7SQMy1sc=;
        b=kij+O/aRdcTqdK/ChIL3ub9bl1f3zfp/BUFIqcZhXQfq0DkylWt+kSPQCkxFi9NXjy
         sV4bcRjhAzpdDeloVDBfCthyiXH4we1Nf6oKKZxeYa4l2nYok5+ajJIRFoY8j2EPyqeW
         SOq7wLUbFnfv+H/+mtJU5IJzXM28iqIAMP0nGsYdRS7hf7ctB3+Tk6i+3nQZBVVs/lo6
         W4zlNxHrmtp8m5pP6yoH+n6KGJkXnszHJ2z4jSzfKPUmbY1EIO88EPsr6tynVqMSeP7w
         j0i57J3IjWvWIidew73xG3iv9ecTxl7odxCQ+G0lBdcGFkvc65hI0ZKVS8ewR23qsT/r
         NwXw==
X-Forwarded-Encrypted: i=1; AJvYcCVEwh3bbG9joukQBY/m7820ciKizJcROJrgXY9jHF1KRjvsMTSLGsYZtWw+vY2ziEv4wlyquATZ4qZo8Gw=@vger.kernel.org, AJvYcCXQZjJH5974UBEoliWNkMd5Syhc2p8cSFd5904y4QEe0wfCqV17h69iM5/yPsWLqKNPhMvGXrcv7unBu0IeW2Lh+bLLVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBiuduxn4GLqaPHm4Lzb45GCnJPMtCfvR7Lpy9VX55g0NfeeY
	Zmp/SNhvufP7lGEkkIZUkESUtlmEtD65C7CYePVvuYr2Ns7PYuPY3++Q
X-Gm-Gg: ASbGncsKRkLWsW1umq7SMesY2KlGfgqKlNr4TLK2676ha+iCG/IRJCDa9ZB9T8yYcP8
	BnjPKm7BJAwPmo+ev7q6H2psbOoToTZ56QB1VWy+hm1dQUZLA3eXSmnQfmbwNR7dYRdCwIjB/G2
	NPRRfDv1idvVyuJ9EcNEoW2f8kbTJUvv8SIciq2CGPbNXOug2z6/XbuwNhug+zDl/vJBVmedn18
	JzzD9GXdyMuErJYxjK5S4d7LexAbwfxFY6g6Xm0FaUVSPsKmUufAFKc4k1fjLiIyVOyju/p52ev
	ZLpoMVYLH1EetmtM8EUJCtUPh6Alo4SAVEZMIbtZk9KzrAaAGDyA8jWaXLZnwQ==
X-Google-Smtp-Source: AGHT+IGV4XdxopG8G2S7cgW2Oa2OOcAyNnYcBcje+Z+pJWDLQ1GmJ7zqzgwvby81KNcPcdYG5ZI2gQ==
X-Received: by 2002:a05:6a00:1914:b0:747:ee09:1fd2 with SMTP id d2e1a72fcca58-7490d630890mr11356548b3a.12.1750550699762;
        Sat, 21 Jun 2025 17:04:59 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:04:59 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 21 Jun 2025 21:04:08 -0300
Subject: [PATCH v3 5/6] Documentation: ABI: Update
 sysfs-class-firmware-attributes documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-fw-attrs-api-v3-5-3dd55e463396@gmail.com>
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
In-Reply-To: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=PGzNmxKPeKeIW9y3SLrZgxUtNxszaOvcO3mqQbh5IU4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHlO/rkr5sJeVR2iV31+GgmUyRT7/rGX2fp0atDDtn
 PGaOc/zO0pZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiGnqMDLstl5dNatIOvfl0
 oXaiUdSc5v2PFbct/D990pIu+U0KtlyMDPd+z1Co8trg11FXnzXNvXWaJZeazLyZu6zyf+V+Y62
 P5gAA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a simple boolean type.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-firmware-attributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 2713efa509b465a39bf014180794bf487e5b42d6..64b8d5d49716e8387fee26e3e56910862f6a4f5c 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -18,6 +18,7 @@ Description:
 
 		The following are known types:
 
+			- boolean
 			- enumeration: a set of pre-defined valid values
 			- integer: a range of numerical values
 			- string

-- 
2.50.0

