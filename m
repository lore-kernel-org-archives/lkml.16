Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4B236A9C;
	Sat, 31 May 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748679147; cv=none; b=mN65GPE0gwtsYbnqPssFroZ3ZzqStSumB1dbw4xk42Xv59RLtta3IJDO4vh/+ZV6Oh+qj7OkWIkWOSHQzIHzb8wzcbNIVMaGSoSVDUaFc9mHMDEC0ktd5wV2n5fCSEVG4M99cUXUzZ7U9+HgbNboHWj5UebYrbHlLZsIRTtSBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748679147; c=relaxed/simple;
	bh=8HwClmr2xVr+CmAlR/0BETSpOdsTD5SUPbqo4egfRO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTLvZn4PAK5RS4eClhD0rNNrn3uhaB1VPNMgeNQalSSyGB88kp8Mj2UZHusMZ8UY9sy0u3hCfLNS2EMOMaCss0dSurOLnyrNKIH/Qi7YJHNnmg3H0PlarGFowGSkYxo0GbjcjOVfmFSRoVljg5ojTKrBfgvFrNAX3K17wsQrFkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0JkRh8J; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0JkRh8J"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89333d603so512662566b.2;
        Sat, 31 May 2025 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748679144; x=1749283944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLmUijDcOQlZSQu4QReLwYm78Nqw60uUPGdDyhjoijs=;
        b=A0JkRh8Jb1KpaGd75vGh2JBrIgMAQJmrfoB1V/8h8FrbHyTjx11r8ALqtHgaGKnTFB
         oJ+ybMbokzj19VqiImjJDxoUhAzy3Y1dlRhAAojaZPkd6mtVEJZQe4fHfFZ0Sc5EBfFY
         4QmchyZyuJYvERj5MtVZnmHWHgs61T4yKM7YgG7W+0/2mjxdN3K4qidZ+iJSXA1ky4IE
         2ZCnqxf02k2i5gn1x76vLce0+ODgA884bRO/LS9P0ukvV7RzWekxHSY6sivSnJzAGVPk
         iD2c3z85MZbiP0KP3CRptsptyi53bKSMhnllAMlkwLHhe0w5sZWQ78KsM3rk9Wp/4pMR
         zYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748679144; x=1749283944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLmUijDcOQlZSQu4QReLwYm78Nqw60uUPGdDyhjoijs=;
        b=c/zFZdXLrzGbsGBJOOqp4pLZfmWYTXc9la3DDzJPEuotln0bXaXlg3lyi90fMNoIr0
         2jvvgm2X2kSSdzKAbgApKEdd5KlFNU72as1RvXW1kR1fel9rEIF5BD81SQKcBlk9ve0o
         BJ1tP42u7uirXGLnkjYcqgEWEf74NftQR8mcZSpjrThroMC1F9A5ybtXgctJMJgUSPbb
         EnKI+mKNNBkfyubuqZATqF3wkbSDiSB/zO1PY9MZvxKVGE/rg63YXglcEIZSSazQiISo
         5/azw92ydo4T+5N3sx7Ds0b2Pc37QH1DjzHe6cZ/EH5WU/+CvIaklFrujmVziHmnfMjb
         oFZg==
X-Forwarded-Encrypted: i=1; AJvYcCXlvBxZt+x+cy3lhsFisijljgEImPbf11O5SpjxjxkfVauMWWElbIDqR7VyR9H/pWMMmCES3Gwj9DL+@vger.kernel.org
X-Gm-Message-State: AOJu0YwvVlgJIKgXBG9z/CRwzs4oijZtb2PAlekyKVbDS7nLap4msHTr
	Y1Jqw4Dxg0AgwLIugn3mAGEuht93syxS+Q2ngkMpn35avlAHR4fy1z0KYz8HKn9Y
X-Gm-Gg: ASbGncv1qWbpHw31RIL6fRoDbP8nhcF8SJ4Mg8GjIKXWYm2LV82PwDUWQaVKAPDjY4X
	eKgBdsChZFF/qNMyL52BxVylF8gVUOiKQqvyQ0JJK27UgXXr8UiliLg/A41E8Gdhrrti278tRHw
	BcN/KPvyGFDSEvBI98OeMuEgmnJXPiK005bkL7MCfilM1De8SOo73ggM1C9j7ryWTg17YiW+E5v
	rFQxWnas2wOrU6+djTe0wl9vOm6HSgVZuBfk3aWjhmp8NKk1MtI0KZcRLCAUusO2qHVMTCGf0Pe
	Sl/O0CQlPo/zcxnchdlWXyLA+VsFmCqjLb8zjYnAwoSMMgAqpWsx0Ylkj6vdGbvN8rhfVcT+IrQ
	Zjh4WCrTjWhZYnx9kCE9CvM5E99TEm6grMrY=
X-Google-Smtp-Source: AGHT+IFd3hUrqJwk5ZcKpsNdJCVoow7Qh+Yu4NNlytx4myRDGgV3XmKKhbk2CzvDlF84MpiOqZNunQ==
X-Received: by 2002:a17:907:7206:b0:ad8:8529:4f73 with SMTP id a640c23a62f3a-adb3243a979mr552944366b.49.1748679144154;
        Sat, 31 May 2025 01:12:24 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-114-141.web.vodafone.de. [109.43.114.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf05csm451352766b.113.2025.05.31.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 01:12:23 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	abd.masalkhi@gmail.com
Subject: [PATCH 3/3] MAINTAINERS: Add entry for ST M24LR control driver
Date: Sat, 31 May 2025 08:11:59 +0000
Message-ID: <20250531081159.2007319-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
References: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the newly introduced sysfs control driver
supporting STMicroelectronics M24LR series RFID/NFC EEPROM chips.

This entry includes the driver source, Device Tree binding, and assigns
maintainership to the original contributor.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb11c6f57500..f08975ac4d9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23017,6 +23017,14 @@ W:	http://www.st.com/
 F:	Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
 F:	drivers/iio/imu/st_lsm6dsx/
 
+ST M24LR CONTROL DRIVER
+M:	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+L:	linux-kernel@vger.kernel.org
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/st,m24lr.yaml
+F:	drivers/misc/m24lr_ctl.c
+
 ST MIPID02 CSI-2 TO PARALLEL BRIDGE DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
-- 
2.43.0

