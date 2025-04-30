Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917DC148
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994263; cv=none; b=tIRYtjsYCNEl4S6jGawPopfq9v7llBYAruY0eoptuY2srPj7MGTWco11qGA+xe0mias6GUv8PbA8vC6hxBbLchu2WOqv9tjHjpiMmQMrGvKs+RP5IBYv+bbvqugne1WnOr4PCTnDFWruyMjxl5ysnPSvJJr5AA0Q00N8nKZthwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994263; c=relaxed/simple;
	bh=BUlIa8BzzS2z9z6WDQCdewmzjAzUJyL047+xiQ/8HL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1Bz7OngPZLUP/QaeGR9le8VBJarSC8c20gSIA9O46+iXdL9JKisbh9vhygQg6YmMiYCVf+iIYwYc0cMJVcShe0X845lf8z3PrC34V/CRSbuNlgIFNlC595QUpIdaVzLh9cGiQo/5ryn94PPnmXN9qTTpdWtR8ZCPsDfLcsglRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZifqA0oe; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZifqA0oe"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225477548e1so72528535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745994261; x=1746599061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2BkgT+ns1+Mv1Haw5znYsaR1kZcYX+VRlw/c++zNcs=;
        b=ZifqA0oe+yePfIxmvVtAGtQFZtBuyyhceQNPFg2qv4SlvQlLW63d2YBgm/aHRby8Z7
         3AnbapK6dHtZgFFjC+ax/3S3ziYuyysIU1G5sb7WtDeiXPw+Tx7Ij8aJiNofAFN6CMLy
         ACRDENlAfJMEG/0SuRJgT0869OZdoueBW9Ffe9VdMS1J2YjdKhn8nU7EkCPM20vmRQKq
         Bqbln2N0IDtVTcuqGwY5g4ECl9kZcm8WmCnD7md2yN991qa9lDpypEGjurRDnTN8EoCl
         jWWVJpcLimEXbRmrLi3qwZuTu2HYb2jiHH8dbDwDtKhyCOuO1XEtnll/b4oQ0Ha2Ni3N
         EUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745994261; x=1746599061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2BkgT+ns1+Mv1Haw5znYsaR1kZcYX+VRlw/c++zNcs=;
        b=K0z5atDVyT0s1TRSh2f3v4v2ke0aqSZ/1aI4DxKYpwaUX9Yq2pg5X3smW8uQRzSseG
         4WoNhk53ShECYq4QZCUvTinB07eGG9JShzhr5yFlJcPqgiX6189S/oQD+Oqutvkc3hkX
         iu4TTWvyjQLKhDJUABfKGjoxXY0tyllJRuzq2k7I98RC5R55HaVfhR/6mo0Tp+y7uO6d
         +w7lxbGUedpeneyuxl4A1G24i4i3LeWTPUPPJ2oOZhohgR+8JAm3P3bs50UFCc8eA9Or
         j+zKiCWVrMbLrY2sPPLWsJprec/PmaTp0DkB4ckHr8JbDr84s3hjUenChdFRJEkXcrA1
         qmqQ==
X-Gm-Message-State: AOJu0YxYyse2MmEFjAQJRE6m3qpyIezlGIaBsJbbzbXFkqK7yI4wvSN9
	f66555Ajj+ka9MDvP6uRshKMDV+3wTa6IhZip++tnpK8wnJ51z2qL3uNODYr
X-Gm-Gg: ASbGnctf4+YxLH+Drsc5eh/5aqLfAq5J76dIkv71n6OdcblTqw+qO5YqobQrZRv1mGX
	87+uNe7qvbC6OeVJg0Zs62PvWD59OM0Hfae+lQC1oyjaqS8JRzznG+MTizLoi6gdw3cuCJpvKg5
	CE0Quo0uuHcYGqc+nMrxbrJuHHz44RlhL3JZ/Gpwaw/o6IXiYe6q7cwPkH0dPXBqQJ7XuC/YgnI
	xXBK0Imy1XooGbjmYlMhswZemJVcXoRc9BwlZZRfPlghwgB8/XxkWhVQGDQp4JXqCRlvRMvYtfX
	mFRfrT8AGWTGqFsRxZ6OviqNvU2aLN3QVU4aWMDz5OWl8CUiDa8f6rLohh0=
X-Google-Smtp-Source: AGHT+IHSjHX+RHqL1/RPrri4TfXKibji4sFCTL39MYugqcNiiBkHWbhLt7vmWGwVOUIhPwt0riovvw==
X-Received: by 2002:a17:902:d491:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22df34a5d21mr26938355ad.6.1745994261145;
        Tue, 29 Apr 2025 23:24:21 -0700 (PDT)
Received: from localhost.localdomain ([103.77.0.13])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22db52163d6sm114169185ad.214.2025.04.29.23.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:24:20 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH] docs: fix spelling mistakes in HID documentation
Date: Wed, 30 Apr 2025 11:54:12 +0530
Message-Id: <20250430062412.54133-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes spelling mistakes in the HID documentation:

- 'triggerred' is corrected to 'triggered' in multiple places.

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 Documentation/hid/intel-thc-hid.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 6c417205ac6a..5e0dc51c8d20 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -182,7 +182,7 @@ value and use PIO write (by setting SubIP write opcode) to do a write operation.
 
 THC also includes two GPIO pins, one for interrupt and the other for device reset control.
 
-Interrupt line can be configured to either level triggerred or edge triggerred by setting MMIO
+Interrupt line can be configured to either level triggered or edge triggered by setting MMIO
 Control register.
 
 Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driver needs to call this
@@ -302,9 +302,9 @@ waiting for interrupt ready then read out the data from system memory.
 3.3.2 Software DMA channel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-THC supports a software triggerred RxDMA mode to read the touch data from touch IC. This SW RxDMA
+THC supports a software triggered RxDMA mode to read the touch data from touch IC. This SW RxDMA
 is the 3rd THC RxDMA engine with the similar functionalities as the existing two RxDMAs, the only
-difference is this SW RxDMA is triggerred by software, and RxDMA2 is triggerred by external Touch IC
+difference is this SW RxDMA is triggered by software, and RxDMA2 is triggered by external Touch IC
 interrupt. It gives a flexiblity to software driver to use RxDMA read Touch IC data in any time.
 
 Before software starts a SW RxDMA, it shall stop the 1st and 2nd RxDMA, clear PRD read/write pointer
-- 
2.34.1

