Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02391264A7A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135047; cv=none; b=NN/sIAFZkdxUehgwUqymA5VDXEKZW5JA/3ikvH3f+oumEumTfPmtYCQBPaT1GOpdK1KiLhhMai/ydtZHmoosI97TE8zCrTdFBb/GmR+GozALRRRSDXgPkdnVnZ7L98uqifmO4tcAgRTimsxllHgQEEDZ8afct60eFs2yvGHRdRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135047; c=relaxed/simple;
	bh=pogysvredQamG9rVEP3tCTR6wWcpeR/5OVLS1DDkQPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5Y0otsYUpbLd3OebasqNh6ZZqVJgayWJ27KTNaiCCUVz9UrtF7TOlb56YkaKnCUkPM3XFzvSFqQtSMU9NflconRM16/II8q510sFbt8QhVIGitkQAWo3b3M6yFzlrb2lnE9rZSfj+VQppNyxAZxmKa2E1/FQehPTzzsWkdVzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFEH2IUq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFEH2IUq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so245297266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135044; x=1746739844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qQvcKW3MgXdsbNtDQHwk4JjoHG+iRWbqwu2h6X/MKw=;
        b=EFEH2IUqQ9aMSxWAGCbLUyrvi0ovrvkn/mbF9369xAJojjVxS85h7g+GMhJh92JLvF
         zXrRhUid/swS20gtqkNTzgyzCFWQblwtNilJipJcnPIymHNxa1/eYQlm5DNanfhF66UO
         X77KuCudXej+XnPPzB6KjMEvxAYEx5WTttLPZtnySFmg2nCKc04+t2fcKSiz8QAkRKna
         IZwjJwVDWFKc9v11SKBrX3Jg7hdnOJ4L5zs23oH2saggvUuxJGS5RN85oYOWPi55ZQxJ
         Zfy47RGm37Rkq6Ba9+0mjFvhqqS0aNXKP89e1H1ncfKd+lGr40aA/7zGcEqBq4BVJAtj
         OSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135044; x=1746739844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qQvcKW3MgXdsbNtDQHwk4JjoHG+iRWbqwu2h6X/MKw=;
        b=sMz9r5v3BwdcXfEVYc8/0Bla0MmT6jm0Q0nZaF+r+sd+4cpbhi+PZu05pJK5oOEwvc
         QksH6D9CfVmCwdDnG79j2Il5co7FMVK9CCWJjBDbvXivfCN2NMB92m6HgvoLpT6+Yc7h
         odrKM3n2C/U8AJDjXKXIqCNEf1f96RRTHgJILrueiUCOXbru9IOJVAje4vcoYtF5QPz1
         iHzomPwdXdRhU02kt04s/Kns/SYZx7xdXIbOSqYuXVnKGE5ulK+EaxSw72QK8/M6XDVR
         YuA0p2BpAcVKJiD9fM8fOogXnL/mGzNV5l+RSEExk3lt9Nt41vsbQs7dcmNd6CBof56p
         TBZA==
X-Forwarded-Encrypted: i=1; AJvYcCU7bOspcX5KiASxKIw3DHXYQLcVfu8iZw9EwLBcWsTzFtxev9V+Tts6ReT8vvvjAAhuV93oIDJ5JPcm7oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWOWrd1fDLQ0Ovui27qY5rbYL8kb897PP3RggonjBNdJN9fzf
	JAaRGQ6hWHiLxjL5B/UNBiplyC5kGi0qj6qezCxMkCAnxdABYCn91QO5+w4jPCgq4TzW
X-Gm-Gg: ASbGncvJUpt0qi8y/AvZhaXiX8ZKYHpH+ZYMqcDNzMWphKS90O3wqGt9SWKymeQJVGf
	g0qk/fp8XM7uDOkXRqhIqpLW6r7Ebn73FR4hUh8md1g78MfWrNTzCwXxFh3TWYqyWLvrx4ysyDe
	1KyEdCj4975WpheBgA5tEpnPlMiyf0KBNlgSTKwqJqvmx6hE15wzYdmI6unJl7+N6xcXL/9H8U8
	4do6m3FusGpndssOs4tsQL1S2Tg4nW6NymULaxKEFtqAQkq5XA2m6irPSFXe8f2SkzJtLR7WQIa
	32bYBwE8+YOIZM8ZOqTGhG+CXR/ofb0p/om/5HtQ80+SMaJsIbP+H+LM3+HOAn/+PX9I74jaBj3
	vyzP74INIqHmuavuu5gN8a/TFjpShXXxMBKMfJXDBNZZad5RzxugwBMvVo8QS1KBMu4jTzZ9A8/
	p/rw==
X-Google-Smtp-Source: AGHT+IFTKXpGcruR1rtk8NfAptc3Ldio3+MGfuUDD2uU4ON1l/n52FUtzrr9PqitPyGSCwYkrEy4bw==
X-Received: by 2002:a17:907:971a:b0:ace:3a27:9414 with SMTP id a640c23a62f3a-ad17aefb21cmr59437566b.44.1746135044072;
        Thu, 01 May 2025 14:30:44 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:43 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 8/8] Staging: gpib: Optimize error handling in agilent_82357a_driver_resume
Date: Thu,  1 May 2025 23:30:37 +0200
Message-Id: <4f560559491207b85cd1997d9e351e417f048068.1746133676.git.thomas.andreatta2000@gmail.com>
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

Refactor the agilent_82357a_driver_resume function to consistently use
the resume_exit label for all error paths. Initialize retval to 0 at the
beginning of the function and return it at the end, ensuring the mutex is
always properly unlocked regardless of the execution path.

Simplifies error handling and fixes potential mutex lock leaks by
ensuring all code paths go through the same cleanup code.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 .../staging/gpib/agilent_82357a/agilent_82357a.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 4fdf6d42f63e..92bbdd57083f 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1590,7 +1590,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 {
 	struct usb_device *usb_dev = interface_to_usbdev(interface);
 	struct gpib_board *board;
-	int i, retval;
+	int i, retval = 0;
 
 	mutex_lock(&agilent_82357a_hotplug_lock);
 
@@ -1614,23 +1614,19 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 				dev_err(&usb_dev->dev, "failed to resubmit interrupt urb in resume, retval=%i\n",
 					retval);
 				mutex_unlock(&a_priv->interrupt_alloc_lock);
-				mutex_unlock(&agilent_82357a_hotplug_lock);
-				return retval;
+				goto resume_exit;
 			}
 			mutex_unlock(&a_priv->interrupt_alloc_lock);
 		}
 		retval = agilent_82357a_init(board);
-		if (retval < 0) {
-			mutex_unlock(&agilent_82357a_hotplug_lock);
-			return retval;
-		}
+		if (retval < 0)
+			goto resume_exit;
 		// set/unset system controller
 		retval = agilent_82357a_request_system_control(board, board->master);
 		if (retval) {
 			dev_err(&usb_dev->dev, "failed to request system control in resume, retval=%i\n",
 				retval);
-			mutex_unlock(&agilent_82357a_hotplug_lock);
-			return retval;
+			goto resume_exit;
 		}
 		// toggle ifc if master
 		if (board->master) {
@@ -1649,7 +1645,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 resume_exit:
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 
-	return 0;
+	return retval;
 }
 
 static struct usb_driver agilent_82357a_bus_driver = {
-- 
2.34.1

