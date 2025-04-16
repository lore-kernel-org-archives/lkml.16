Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C2724E008
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836148; cv=none; b=iYeN/BBFOMch9X7d3+n+POxHi4TAAE9mjBZ4K+GgkCDV4Huu7f72CWxLCEcRB/Eml3nwJHuiuNTZpqMpZIAPVsJq4lgXr+03TNW5STqawo8EF2ZtCGkgnV02ruTYGndF61rsAaVe4GqiukDNTGgPoPespW3f10D6oKWVCcHaKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836148; c=relaxed/simple;
	bh=r9FE5GpaFdBdPdJ/Zrxc1eYMAW56Ux07mT3KRwmjw48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SU5YF8tNE0ylmlH/Z9ORdYFqlNz6TcIlKC7zXNcKtjlMI6tQVkSZ+7Uicx2kZ5dSrkQJHNF85wgei11CYFvkO10O33P/GgdimtKSinmiSpKk0NKLTCpFNtUPPFo9BF8PM4sLTso+TflRPcXLOm99M4lM4parUegbbO9T1hpqS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=NDKGSEvG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="NDKGSEvG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33677183so1179215ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836146; x=1745440946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=NDKGSEvG8Bny7iUAZEaxVFbMfow3pHgbhsx+/puvzDF4HBlpG/bmDYzqxw9WbOQMNN
         ylgPbmjOhSf4ZCB40xtJcCsj8xk94Y+OWQ0ahgoPtjgDwsYHGtAtS9Fc1stzHa98HE0m
         ViQr/cQ5OkEuem+cqc3hdT6C3M+vOtu1ConKlCVLCxBYmEMJsD1hmDClcyvahDGksrkZ
         PTaSb0QLJOqUDUmLPApuGuGZobhms8Qte2EHqjxlEZF24y75ZA0TWzaI4v9zU8BlrUF9
         ROeuIa9WwtyYqrRy8CK1krstvB+Jv03kNxl4Vyu82L2gQE41Utoena2Ey9M2gSNC9yDB
         wsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836146; x=1745440946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=j1nlUDOZpVb3c1BgxU8DYuUVRn2xyx44qWNELQqMLO/OiQEUP5bPFJUVDEIWh4vnFB
         v0l46y65UXUoeuo6JfdQPTb1kqVv2ahCBktRke6ZCbMlMUp8oEO4LaBzyec7joAddnxl
         VxJLmRnwZUdXCl5ZKZQ7o7JutZ7Z7GaL6T98lwEEhTg8l89nRxL7IczAzmIVNoRg2eX5
         HHtYpV6g3qQP905Z27DLce4aUHdxv+b4L3hpmi0kMU7sgEgnEEEZJ7rPr9m1a0iqMdsP
         ExVeH+LkmTobiqzQtwWPIJouN7B2NSgBLADv7IkkGLLgwVXFSBc/49zvYtKriLfwuCFh
         tnUg==
X-Forwarded-Encrypted: i=1; AJvYcCWeBTI8IdIMLLd1eUBXp7GUWH/cH+ojxnlUL1UfLv5z6tby2dn7OlA2Gx48ex1/Rs8WShthUXFo1Ui3GLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJBnap2uYmoI3a2gz6kAGWRwLoUx+/zz72Nq9j3slzofBw4z1
	dMW0u0K/f8iucUSZN6BVMqqgZqDb7Owiee3VtMI047kaa4DB43kZSzZmau/l9g==
X-Gm-Gg: ASbGncsr7ykw6820tH+4QBsc027tSxvBraWtg16mYIgCr5FvNrAxLX3xvGLlTmyDIo6
	LtNyHZWvNTUPjVPsUR2BCbOBwNvWpP/fZa2UMoG42PDSGWeE4wkVKyYA44FSWTf4hDSME6NJ/Q7
	CL6MCywLonambVBhhaXJBaZUZ5chlScMxdqS++GylV5+usnZOY8Wbmz4XGlG+tZLbpnAnDuZ8QU
	UDRVnzqBLP6b0pdI4X8vT1HX5/hOpWEowZ4XobyvVi0hrU13aLXakJuBjbt8Vq2r579MC+b6Fh9
	oOCj3CHfWIKio5MU5/1Co9cwoknk+LduyqLLXHa6QRLPcaaZCKm77ECAJIRka2+NRQI3zXBSMLN
	06G6TbA==
X-Google-Smtp-Source: AGHT+IHaYCE1yo3wywCZz1WcKGDv4E5arxZTfISVirWVGIKPHGaGjoxMurBeZllSADoTUT314yzFZw==
X-Received: by 2002:a17:902:e544:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22c359844b4mr53603915ad.53.1744836146538;
        Wed, 16 Apr 2025 13:42:26 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc47e0sm18808655ad.167.2025.04.16.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:26 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 16/18] staging: gpib: pc2: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:02 +0000
Message-ID: <20250416204204.8009-17-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index ee4ea1f32dfc..ae265e2eb46a 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -519,7 +519,7 @@ static void pc2_2a_detach(struct gpib_board *board)
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
-static gpib_interface_t pc2_interface = {
+static struct gpib_interface pc2_interface = {
 	.name =	"pcII",
 	.attach =	pc2_attach,
 	.detach =	pc2_detach,
@@ -547,7 +547,7 @@ static gpib_interface_t pc2_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_interface = {
+static struct gpib_interface pc2a_interface = {
 	.name =	"pcIIa",
 	.attach =	pc2a_attach,
 	.detach =	pc2a_detach,
@@ -575,7 +575,7 @@ static gpib_interface_t pc2a_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_cb7210_interface = {
+static struct gpib_interface pc2a_cb7210_interface = {
 	.name =	"pcIIa_cb7210",
 	.attach =	pc2a_cb7210_attach,
 	.detach =	pc2a_detach,
@@ -603,7 +603,7 @@ static gpib_interface_t pc2a_cb7210_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2_2a_interface = {
+static struct gpib_interface pc2_2a_interface = {
 	.name =	"pcII_IIa",
 	.attach =	pc2_2a_attach,
 	.detach =	pc2_2a_detach,
-- 
2.43.0

