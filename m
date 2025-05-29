Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B4293725;
	Thu, 29 May 2025 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550512; cv=none; b=Ilp1LmibRQeOucOIYNYFynaPEw8mz34pc7T03SULTt338ZvtShR+53OyQ3u0Ke0jEevEWkrDhDhWmKNZApC4EU+c9t0+pDgbksvNX11XxtWYrNBM8FQ43cVlmmB4ZrDSZHwG9yYSzRqmtzCSOwtudut3yHX//Gz/moCQ6w3CJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550512; c=relaxed/simple;
	bh=QBX0wKas8hMg8UqxUJo8euFBcQTuFEJmE6HLDNOpMw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbD5ZIsVlEkUXcRTDP2osxhPaUpO7KV0TaPn9p3G7Wwdl9hZEb50qrS5hI8GtcRFIetFzf4xK2LSnokJOcy+UbKDgsJ4qC8qJwxfpkSi0YjtMI6rYlbErPwoJfbzTnoVehQCZHR1FTR9MBQRK9N1x2opRI+Wyf8Wbs9be0frcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgLlF2KE; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgLlF2KE"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60be827f2b7so649920eaf.0;
        Thu, 29 May 2025 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748550510; x=1749155310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDwrjOc2P0lgnjjq9Q/Gy/AuUSnuvG7kFTIq26PL/EI=;
        b=mgLlF2KE4kiT7EeQNzUWohqOqKFzDWBpRcihOHrvD49Z3iwKGxbEOxhBnRijKtIpCh
         5SjCdE0mioEnAyOtvYBFZIpIrLxde0dzFCo0zroEnSegDGT51SfxGt6sFTWTHhLF0Ks0
         gmgCpEFgbeb4/1572Vn4fVlt2gfCxWnHMs4iWE3d6fOVcu652wDcryoNexdfS7XVkRhJ
         j2iO/Dwdp7WVkRjiPmgFKiaQsRvwyktuI6urdecR3PJlpfNvvhi3Ky4teDSZ3gXC5q/k
         6/CpAMXTlhaNL5KFCaElNtgkWFP3txzlTIEwy/YqQcTUo8QM95P4pvPsOYUOMTDuAXPF
         aMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550510; x=1749155310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDwrjOc2P0lgnjjq9Q/Gy/AuUSnuvG7kFTIq26PL/EI=;
        b=bmmxB4dH2PTOO4RoCzuSgUEmII0geOQ1kD4szDGD/3GA4IRxAvsxJvwpO53n1tg/as
         3H/tglcDWQOCBLaJnW2RkSwrKUw3p1EOj9VmtxZX2TVx5chCBSc+k/wnRTKdWOza6Oej
         GR5GTIFsz9SmX+NBPBZWGn484JVh8SH4DH+hHkEwhISuLP1wIrV5DVsvaIHUZEftARst
         DjR//ZJydOhu1KRBdQBI7WH6y0551kUbH+8VyCgdJu7xqQ195+K9ARqTvaWJIIeisg64
         1WaPZ3G2kvzCRxCJJj1P13KIqxm5bJLEf4Q2yBKpt6z7oUklD10oUMRPu13MzBq1eGZO
         iU6g==
X-Forwarded-Encrypted: i=1; AJvYcCUA5g4jhglAjj0FDFGhBzHbonQ7zFwClmii6V3YkS+EAWMiTDVY7BaS2uqhiwdzfrluFDL7q2S6KWs9z3C5/HWCx9Jh@vger.kernel.org
X-Gm-Message-State: AOJu0YxBU8hEEMf1/WY7OersqRBMhXfjo76xEibDhDT+KeNiRxembOSE
	EVLFJQDNdstdqKLQ11XfhdGGHipGq1oxlV4fpDIaO9xc/ZVVM+Ws9UWiQlXS/Q==
X-Gm-Gg: ASbGncv5dIZV7UxHXXji3TDgenlz5Fji17vCi5fHoncsK+r7n40Ex3FDPnrLSfppcjx
	uaDNj1Hq1BU3Qcx+By5x2EB1J3Qj/P9TNW+Xc3vajmhPYb1RO60pMAD3Ap4UyhhV5jSCFXH9CJx
	4roI46QpbGHaxI/O/D3t0RMFgvewqdh+7c58ap86wt8+0jVv0i+hhDJkjXGzw/aYPlzXCkk4tj4
	1ktIu7U8QfxDwC/KgKa+ILp+fVYoOoFNRTnwWdNY3sXMDDxk1GhYKHrdG3ZeMNWuxYhXy09b+K8
	+74kr+gt97nO0OKlInOsn9AIBhZjKJp3HEPrh52Hnlyav0P8eLa8ofoa36plk1/Gx5284UEeuV4
	VQYT5M6iz7Pv6RnXr2w==
X-Google-Smtp-Source: AGHT+IHF4HZ++L8kM1VGf0rEhKmV59LLBJotobAimHoIQQjkhamAF/oB3sGTdm8zOhi7vwQ9xI9hSg==
X-Received: by 2002:a05:6808:6a87:b0:3f8:18a3:b1cc with SMTP id 5614622812f47-40679fd1c7cmr484415b6e.12.1748550509905;
        Thu, 29 May 2025 13:28:29 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678bf36e7sm129240b6e.1.2025.05.29.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:28:29 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v3 4/4] platform/x86: dell_rbu: Bump version
Date: Thu, 29 May 2025 15:27:58 -0500
Message-ID: <20250529202758.8440-5-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump the module version.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 7d5b26735a20..45c0a72e494a 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -45,7 +45,7 @@
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
 MODULE_DESCRIPTION("Driver for updating BIOS image on DELL systems");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("3.2");
+MODULE_VERSION("3.3");
 
 #define BIOS_SCAN_LIMIT 0xffffffff
 #define MAX_IMAGE_LENGTH 16
-- 
2.47.1

