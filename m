Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D85213E94
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135045; cv=none; b=p/JtWyXTPJ6UUkp+Wr0cEyu4a/7ZZAmdrA2+f9Zz7F3oV5KHAEfNSTwagNGLy+qrcz1oVXOdTC97gOASmobvGX67DeDAeWUfJNRbo89VKj4SQenU6sQtyyVyFNI12CewJEXPHIIsISJlYImgZZa+Oor9KTvSPUbajAwX9iduUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135045; c=relaxed/simple;
	bh=yhYCmS8IVoXo1p7mRguldiGQwoQVGa85dcolwS17S80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J0X9+MYI6bAf24A6JBagZIsz57REYX7blHFb/sXy12bNhsVW/fVvJB0cCcNgVbcNz3TYYU0eLZK2bMOe2+DrB88fSCfjdAYyfe9xUb9QtB9oND3VQAUlLxuZDg8F+smDC15PC55k8WPdjn2p7WF3OhHG+86PxWJG85UiuOSMAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNTBcVwp; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNTBcVwp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so225791466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135041; x=1746739841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAPg97rlsRsbrLSpiR27c6dVk7oaQrfXRDJd8fOaN9Q=;
        b=UNTBcVwpYmt1hGSdkAJEpJVNiKlTjWyPfStNFkA52dIG9ohiY0OlxRXRw5UG66Afm/
         vxzkoPxO4ggxqUB7/KvpCCpqcUb/YXIyUdb4/S/NW9oHWPydmb3mCRR93TuiGMdPSYUy
         6HlYIuvn6UU0Aw6jlRQ1dy9d7H9mLSZ1dppn0j6MYuRv37pMjDspo9pPHUaxrwCE+EYT
         EpHIV9RinXYj1X71PrzD8lb6+LUhYcSQ6lEbmNaVMBWpxNWHEJDLmIRITrTG1Urht5M4
         FLHUGL3r86A3r6pChU0g67xYlC+AkhnImuHDi5n0HSjWf79diY2bGbdL5u8cHYI8c0xV
         vK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135041; x=1746739841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAPg97rlsRsbrLSpiR27c6dVk7oaQrfXRDJd8fOaN9Q=;
        b=Cyi1F04kd9MWnPQaNlNYQjkNFdnbIR9WUt+qsqcf7N7Qxiu4KwAFTuBxBZcHImujtE
         hJzS5oL2uHPHCetaqVc7ncZ+6CFbyzsacUQU+hW/q2eRZ74GSyXV5Ou4ltt3K5h6jIGN
         u7HK6HHZXhjg8TJcydddFlGMUiMQq4fCgoTl96uPAvjZJzhXy4zcvuFEpNqQUYHhc1tR
         nVxuXkGVJhmEykusUB+fP6N4TSjTkQacQ3SH3qtVU0d8GNEKW1kAIhpF4/k2t3hwmtB+
         RGCOn/jTnp6frJGNcXE714suNuMLRYTwxhlATE9M19O+rUP89cHiW1+fWUL0rMtzLnCM
         9gxw==
X-Forwarded-Encrypted: i=1; AJvYcCX4H9J3MFzZUauOKheVzx1LsIhI/5UswQZKXzxf1bXJceI0JflzNmgsUiDyle9HxOnekifeZSXfzj9c9zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbD6tvWOjVfAFRXXkghcUYKhHQSYPbN4rYbXoG6FW4QyoXsEPl
	WWvhJBMVc2k8+NU9h90MK2cZQ8K9iwpy+zuhUoPKj+1iG4KIE5HG
X-Gm-Gg: ASbGncsSnpxCHhK4rSYHoP2lyjDLeSiOn/UWBhhldVJxoTGR8oaknsSBD32+7N4ED4H
	jqjpCE5oFO9TQdePFpA8DserVCK2KVwVW/2ymOFbIDopNSAFX0nLGZro+q/0MbyGtQTml8AsKu8
	MLXGaWnvjOfJf0TW8/Qj/e2d1hf9pO6CKcShkpVweRKlS7k+P3sK9DBjVVkgZH01WhiiJHYaAzB
	IxVMiSMBwOZmf8NEt12ccnEPknGMt7AR5IR6U8QEcmYNOoFOY2u24pIkEZb6TLrmOFDANVoO2E2
	p/Wkzgrk+/2H3nuqSBrztfTVvxKqevMMNiCSSbiFYl2U9MLoqZizrpS6AzX5xrAGDdjIT3CWLAY
	S6dE5ICrPuQvlzH+kR/zcb695OilaQ/2j/gykhhHjLAT46L2UjcS9H0dfSokr5E4Ylm76LTATze
	G1mw==
X-Google-Smtp-Source: AGHT+IHZwkIMNHb7vmuhFcwg+PFYsQ5Nh9aKpaqDy7Dh25DUh58mjbcCXEQIa8W0R9RKqNzY5rec3w==
X-Received: by 2002:a17:907:9717:b0:acb:5ec4:e944 with SMTP id a640c23a62f3a-ad17ad81e27mr73901166b.15.1746135040517;
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/8] Staging: gpib: Updated return type `request_system_control`
Date: Thu,  1 May 2025 23:30:31 +0200
Message-Id: <28632a0bf5275553e929e8699830377069e921fa.1746133676.git.thomas.andreatta2000@gmail.com>
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

Update `request_system_control` type from void to int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/include/gpib_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..4c28f35606ef 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -93,7 +93,7 @@ struct gpib_interface_struct {
 	 */
 	int (*go_to_standby)(struct gpib_board *board);
 	/* request/release control of the IFC and REN lines (system controller) */
-	void (*request_system_control)(struct gpib_board *board, int request_control);
+	int (*request_system_control)(struct gpib_board *board, int request_control);
 	/* Asserts or de-asserts 'interface clear' (IFC) depending on
 	 * boolean value of 'assert'
 	 */
-- 
2.34.1

