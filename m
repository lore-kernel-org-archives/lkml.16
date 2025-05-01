Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228A6261594
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135046; cv=none; b=IER06iqs/+ymoDo0j/WLgsR3HS5dCc+11X4NnJ5BJewmflUpwNejby5zdbF5ElC+oOgmgzk7K4Uilwvg0XWwqKK+BhU1TVYVZvCa59MB9DvcxSy5siTq2k5tHvuVsEiTiwZ+pm+8xCao6n1VrmjJpwkwjEde/uiuGhGqkVmyItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135046; c=relaxed/simple;
	bh=gOapckKc/P6PZfyll16dMvfDX1mJ/ZFGM/QRiaIG5MM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=byJOh8RsKv57AZi3elSPWtmJiEjTx5c+bm92CxUlPmMaePzzdqpNi0k61SOmKe/+KdKTe29Tqq94kZmMqNV0i+hcZP9g5BQC97HqW4uFW+vdT6XZ9hc7UvCSElH/azHodQpLjt/MV24tZ4MIzOSqdGXpPE5zlY1AdTywytRiG1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2NeYrJS; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2NeYrJS"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac7bd86f637so456902766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135043; x=1746739843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrcl/JpeQTu+NIHhF4Pb+87UlDs4MN4JYFVInV4UtgY=;
        b=F2NeYrJSW/Hzl1wnXlhGHYYwaQXsGWR98+HacZo1JiqgWb1ALOvc1wJkNJs2AVyRxL
         OCE/S5kRQtUyUvZjpWakYl1NopnknZUyYoJHZykjonk1ZIURg5lPp2IVSI3jDRCsGvqh
         uzrKlbL4lWyGHpXME9EAdXY7+Ax1pFvt6usIprwnvNvNNuS81GXXkpxeKw3ncFht832V
         6b7jDD10Wd3i8vLwkVVW+Y00QJjz91a/6tYYgxkIp/gPdlw206rJ4eVE+x1ISHCDo81o
         lpSuQlhON1MGo7ghnihyTaUbMVBlWhY7WMNuk2b7g+QFrDjxfTj6x8jHtU5Bnm2KNf6a
         9XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135043; x=1746739843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rrcl/JpeQTu+NIHhF4Pb+87UlDs4MN4JYFVInV4UtgY=;
        b=AXyqLitXery75u5P8LqqiKA+e9Rq64AZ4AO+nqK4/pLZLTrQY8VCRhihl7Etih40rX
         Qu54kE0O9iQnoLMeI8HkImUnLTk2sce4W1xrnweqIYSYM1tOoiTTT7jMSaGscMNHrG+G
         RiJozDQvuLJNwdvyWqwOGqC2KJRmt41WGpkKoX8/VmOTN29zpirsRmjRTBHWZd9TBGWz
         jf2RPg3U67m56BjADqddK+I3ahAh4GTawg2klLv/f6tbzX6zuL1ln0ulFHNZLHnXoBYy
         SlJDFe9seyoCzTeKflVtahnMSxpMbTtN+8S1uDgVOsKQVKiMXg6ICy4BjlCu5R6j1/ny
         gEWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWVBL2BlVXroeHkJGWiR5Wyw3YfcAisJJvSENHYxnAYRqoSBbiYqXLrS5bA1E7X1rb6rovyqTAbu5KXGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSR67AvzvMTfMJmlAnFnJrGTzw8o3vEgySSLQBxIIRf0jLgUt
	iEE80KnLztlrQ6C+VFmDZTINPzyJFOwNVc1b4d0MkEF28CiuJGSN
X-Gm-Gg: ASbGncva7af/gH+f51D6L8WzUBxQk2IMi+wJSLW2ND/Idn+/B46cFHvLDIRaCNGcZH7
	gkPB8vy6oK8bY5krR0m+DtCJgS0p0BxAyO24Hr47BZglNCzfCCltiFahE7UyFj5qt62x0AKyW4S
	Wb3Ljs6+woGDd9iwvGgh4m1dx8JOQ9iurPdR8GLu1XWIuwrMP8byjsfyVKHxFnE+7NybMYVHqNw
	WFuLF8MM8At2Xej01FIkNiPNXi22ncnOCcFV2ZCmN6D43slcDupuMwjEVwcJDurPkAzkMf519YW
	iF1IIKxg9qpERPTFv1QAeprBKUOIpkdWEi24e+ERT5VIn5W3tvuFE6eNkYbdVTGkCRLUq6HZ/kB
	JowXuuPnCCX61RmPVALfQJUIy8cH3+PvDQjLJ4cRB4uvn9ZkdkEpRBnX5DLTbjF9P6flpkg4aSR
	XRPQ==
X-Google-Smtp-Source: AGHT+IEYu91JG9uDqTUFxmBZwv6866gZbhwuIT22bemmqPxLeyzNfO6CuJoLuTH/Vh7aEJacJErv/Q==
X-Received: by 2002:a17:907:a42:b0:aca:c6d5:1dde with SMTP id a640c23a62f3a-acefed69a43mr341279166b.8.1746135043207;
        Thu, 01 May 2025 14:30:43 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:43 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 7/8] Staging: gpib: `request_system_control` error handling in resume
Date: Thu,  1 May 2025 23:30:36 +0200
Message-Id: <87afefe2ba2fca9f09ffd66fb8ba8e1e5c3c1404.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function `agilent_82357a_driver_resume` now handles the return value of
`agilent_82357a_request_system_control` unlocking and returning error in case
of failure.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index ce2d3850ba31..4fdf6d42f63e 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1625,7 +1625,13 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 			return retval;
 		}
 		// set/unset system controller
-		agilent_82357a_request_system_control(board, board->master);
+		retval = agilent_82357a_request_system_control(board, board->master);
+		if (retval) {
+			dev_err(&usb_dev->dev, "failed to request system control in resume, retval=%i\n",
+				retval);
+			mutex_unlock(&agilent_82357a_hotplug_lock);
+			return retval;
+		}
 		// toggle ifc if master
 		if (board->master) {
 			agilent_82357a_interface_clear(board, 1);
-- 
2.34.1

