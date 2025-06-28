Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4394421C19E;
	Sat, 28 Jun 2025 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086881; cv=none; b=j/5Si6PIAZB2+m7w3MngGBCL/Nfb8FudCFlpkd2qAYav9YSsQuA4qv1XrzU7V5chOFTjYISgiS7wzxH0sXSeVM2beWoxjQbYt0KYEVe/WiMcs5MBp71Vyhi5yXi/jLmJX8wCQSLhp7v05GVIKkfIStGFGU/d8M/exmkytlp7Rwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086881; c=relaxed/simple;
	bh=x4+w0bmLqKhE3XkngQN62+KQqk5Kt99eaf5GrloOe4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukX+WhLdtPTrcO+h92q9pOp5t04eI2n9/a+5mAOjx5paQWBwz7AjP5WD0jCG31IhzDXqsjUWLrsB7KGZZBl+o5XBrqv40UoT3zKd6pBaict52UIJYdYfxrPi3nn1rNENDiey6n0w7Jkm4EXDzqN28+/Rs4aipGPUTkpHXvgig2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3DZEaeR; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3DZEaeR"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso28495496d6.2;
        Fri, 27 Jun 2025 22:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086879; x=1751691679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpZMJ6djd7w681PQrFXCalL42+S25luXWIlauLUCkRc=;
        b=i3DZEaeRX5bbQPSJpqa9HjvCM2m7IdDoweD9W0fkhkPCpaXbFW7PxCEwiJAxCdmDSo
         JOxUAmRLOrcdKwSic+EdjlfWOjS7YDZelR8VP2Ue4q6q95cGEPruyEzoaTBTW/MrrF1k
         Dgi+yFYij6eAXG/ccPQq4Iy599H27KXuE3ZKhva6sSsw84SJ682HLpcozK5WUJOYKJY/
         7oQfAwkRGHJgHwIcAZhej9dQF4SV6LKbFf7qvkvLm+LKCQmiK3ipWNTmWAvJ+moXjReH
         /6KbUGExfsnFU1acze+80rHUPhmGD4EjsIFqpMnd9Sr5DupqV0Rl15Z+uORpqtP6wM4H
         sOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086879; x=1751691679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpZMJ6djd7w681PQrFXCalL42+S25luXWIlauLUCkRc=;
        b=VHYF3XV8dcGUBziiDq1BlU3XN0aNTFu0L0jSuNpidjCcanWMT+hwXmHby3MCHUwHrQ
         D9jL8G0sEd/2gdFRHDfONpJpWma7ah2Pu8KtNuS832ycXR3qIRp8OKBew9HscySac2V8
         L1aB3y7M91EVshmwKujcHbIEz9ukg7H4hrqVOg5snwVbEdtEbSal9zKV6xAH/+vZiizu
         2oAopiXvay6L0IqB5WoBmt1gv8Ab3nlDwioJ/8LMrvE3EMqo3gmnPUnHrBfF1yJURRaI
         VUbq3Gm8osnWq+NpuOnzQ+waRMe25Jd314t9AvOwHwriKwhmK1THbzM7s8fd5UIdEu7u
         mm0g==
X-Forwarded-Encrypted: i=1; AJvYcCU4B2fXsRWOye4oaKHZn7R0LYS8a0D+nYzdNVvGl3UiKmw1s9Oli9WuDUbBYpgN+UZ68S1y7H8tvCiLZUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNd9M2K99fUYJ7SCqAcrw3wT5WsMf6UIPKbT2wloAkjsHaRnw
	AUEZemGTMKMiyn592hQ63bIeTOZy1H98UmKj850Wghw/GFfnketHgiVgeRteGpxK
X-Gm-Gg: ASbGncvyKyqv2Nk6IEDVW7ApceDNHZi0vyAvpJSS0OzFqjz//aZKrmtj5AUZJ9yM9Zu
	vvR8IFcYhzNQai+9tb+k0txGSVR2mdN7TaE/FCYudXtg6py8tkvQyFsB8HvcpZ1jH5lZlTj1shI
	dAouz+o2AjoIafb1nnfR0w9n2R/x9t8PnPvmFYgJDBD7JvVP1cXuGEC6gNLBHgahvNKuZwq/cbV
	03/i8vC+jXLymy+QMmWZer194nOTtW/Tllg9P7Gn3QUQ05/HSGrbeNlgdN5hFaMcdFaLaFb6UvA
	kDgsUgiZun0F/O2qmmqZ2oj/vFOkGlnkCjwNtXd8VG2KrUQCpnuY4ybudj2Qw6mL9urvHQN0
X-Google-Smtp-Source: AGHT+IG0o/2SSxf4iMGzsNeZVPRsHJaDefOz/48Ka9I0Z6qaaOdClkuB1ykID47g9yvGQTbRtw0yLg==
X-Received: by 2002:a05:6214:3909:b0:6fa:bb44:fddf with SMTP id 6a1803df08f44-700016588f2mr109629556d6.16.1751086878784;
        Fri, 27 Jun 2025 22:01:18 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e34besm31504966d6.75.2025.06.27.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:01:18 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 28 Jun 2025 02:00:46 -0300
Subject: [PATCH 1/3] platform/x86: think-lmi: Create ksets consecutively
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-lmi-fix-v1-1-c6eec9aa3ca7@gmail.com>
References: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=x4+w0bmLqKhE3XkngQN62+KQqk5Kt99eaf5GrloOe4A=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnx5VJ+Smtjuq6JeS351PF0f7282CdlyZONh2USfrKcP
 RQTUdDWUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABO5q8vIsPeP5+p29RWGGRPW
 p93Zlt4z/XTr2eb9K++WSMVO43556C7Db/Y7B3RYbVtSKyJ7hDonr/qdL7oifpvnn8+a9xwtI0v
 t2AA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Avoid entering tlmi_release_attr() in error paths if both ksets are not
yet created.

This is accomplished by initializing them side by side.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 34a47269e3d34d2eda6b71af73892656cd2bf67d..b3e7d76cccf7840a5bcf7f849f2a70e164cb7086 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1457,6 +1457,14 @@ static int tlmi_sysfs_init(void)
 		goto fail_device_created;
 	}
 
+	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
+							    &tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.authentication_kset) {
+		kset_unregister(tlmi_priv.attribute_kset);
+		ret = -ENOMEM;
+		goto fail_device_created;
+	}
+
 	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
 		/* Check if index is a valid setting - skip if it isn't */
 		if (!tlmi_priv.setting[i])
@@ -1498,12 +1506,6 @@ static int tlmi_sysfs_init(void)
 	}
 
 	/* Create authentication entries */
-	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
-								&tlmi_priv.class_dev->kobj);
-	if (!tlmi_priv.authentication_kset) {
-		ret = -ENOMEM;
-		goto fail_create_attr;
-	}
 	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
 	ret = kobject_add(&tlmi_priv.pwd_admin->kobj, NULL, "%s", "Admin");
 	if (ret)

-- 
2.50.0

