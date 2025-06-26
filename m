Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A91BD9D3;
	Thu, 26 Jun 2025 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750900706; cv=none; b=AcxWqxYBvkvxDV40cp54cxyeEGTHs8phbYg2XpflogqjbpBYbxZwWy4sq1KrXGrUBRdcVePXqF0I+rN7Db7gKZLdjtTeQdZDb1g2lIWxQTUXkE1FlKsYmKOLr6SMC2ZN5a9PQunHm8maSIfBHJz6yK5/AaP7LCA58iXoKK6tZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750900706; c=relaxed/simple;
	bh=nC8H/A+QRZ3V0YztO+CXOqVjDLNDSttloQq+3XJkDJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnaGcnFYo8EjZWVAfy9PIkpK3XwjnLUWvDjupZQM4b+uWYSuoOUPxskLfgBfB3GtPt201hVEm0qOmzIFo9KNVldnNCTzYEuuWx7zqZgdE7Oc2ajKJuO7sQWj+haPtMjOsbYpZBE1VvEiIxdeA0eKnVmbCG6C5aWYxo5w6YSiX8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPvpS6Cb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPvpS6Cb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23633a6ac50so7012985ad.2;
        Wed, 25 Jun 2025 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750900705; x=1751505505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwIi6jWNZtQTGTAbQRjQnPjf7pghpX890D+aGUCZ1VE=;
        b=SPvpS6Cblap0b1TLnOrGcMgR18Hrwh1awyt9z+oeGlRda0F/9/MDidMxB5QOMUPQu6
         md0jB8AoRIsJlzTO2sBfAnAzdhil1swQLNn/Dk02bGSx5VuRtFiomZA52sA/bP+aCxrL
         whse+OanpHXped8Cib8gUij+QlfTAxunCsVIJUpVNPPXUNh5QbgOJ9ux4eVRi8qbiSTh
         20BWL9NDjfhnF3W8zLOoOQfSXfYKrH6DkiJnSxcMOWQowty5Cdb9fAHuZZZCWgbD4qm8
         H1QKKSlBAhomnlgFo7GbKq6zwZEon1YFtDINQeuI87uecEbiJpR9M939SySVzvmVCOZd
         +UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750900705; x=1751505505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwIi6jWNZtQTGTAbQRjQnPjf7pghpX890D+aGUCZ1VE=;
        b=uaPG0IxpvLB+cHZrbEo8PRNdcEOPCNKtUZujuXhJGss2RtkX/WojxCJXwO/RqLOyEG
         KQ+w3tm1ZSQ4fnS0ehsk9mGbX0beFMGrKi03fOPG5amEiQMGuv1NVt5awbim3vpDuAkn
         ssGU4k5a3p1Q6B/uW4qKXBSciPB/+w7edaso9UZ8bcHp+tDvPMbzO797x7H6fLNvKKPF
         zefClNvRE0uDxao1JNCk4Lk/xMWV1U4cdUS7t0cs0BfDofGhXIqAa7endsrHX+8DWt+y
         bPENSxdQsr68An+jFw5XrqDyXsuG9eXW6OmznNBoYrT0zPM/cZym6Gs1SkbSiSNu2W1i
         dfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe6W5VCwjnWERpEM7JxLIkPbGWuN/OUFfVPLJhyFr1B2jZbyA8wCt/UAGz1lXBtbX5TIoJ+XTMe2S6vZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7eMT4dZ4J8OqptalihxmyvxYceqrzSBwmmI0wna4NA0IOQso
	Y7hf7v59Ew9TY+Zexo4ybAvt4ptHZNJDNGqp7xE42bhN/FMm3gfLJ4TX
X-Gm-Gg: ASbGncs0aQYJurIif5JtJhuoUY+sCkLdfuttLJv5Q+gwO2GQsN3/kZHunC/bYXhGoE+
	JVmwKlTlKYIGWexvoiuPs5lD1Aymo4bJNYRsvLKTb+WGot/c5Ob9mDYteogJ2WDfeaxsdlJx5jq
	riNqARFvjgscoQ7TfIaDt6mFtj6jvPn9qms01j2VRK8fWW0Kg1SFYyy008Klw4w8vSbOo0sohDW
	qwGolr/JEZ/+g2i/eBl5CeYh8TMQ0XRNK7oHxQEXXSMfzvWeZWhf0DRU9+/fnhIhutFu3XHiYQZ
	avFJc55SfYlc25H+ziiEFBvMpSAz8gQFQ1xwdPwd/elPL9Sa2+xaTMoF1ynRLA==
X-Google-Smtp-Source: AGHT+IGtJvH5h4QmhjHN0NiHua+DnH4X/RUxAxgHcW/LIEV5hQwjVqbipbPqd8JgeBz895hX74yAkQ==
X-Received: by 2002:a17:902:d491:b0:231:c792:205 with SMTP id d9443c01a7336-23823f6cee7mr89468815ad.4.1750900704884;
        Wed, 25 Jun 2025 18:18:24 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d871f10fsm142710025ad.233.2025.06.25.18.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:18:24 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 25 Jun 2025 22:17:36 -0300
Subject: [PATCH 2/3] platform/x86: think-lmi: Fix class device
 unregistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dest-fix-v1-2-3a0f342312bb@gmail.com>
References: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
In-Reply-To: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=nC8H/A+QRZ3V0YztO+CXOqVjDLNDSttloQq+3XJkDJw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkx869O+d19t+NDgcGSVU7r97Apvlzn8dv3pv2vK8zMG
 jdEOO43dpSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBE4icy/DNwf+5QmGTebbp1
 Jt/5FdfeNu5cs1Ti8uOiow6nf/OwVbUwMrS17v+zPHWnxcuTK1c2rr2kY9/0fVOcoX4fn5mo+4b
 NHbwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Devices under the firmware_attributes_class do not have unique a dev_t.
Therefore, device_unregister() should be used instead of
device_destroy(), since the latter may match any device with a given
dev_t.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 34a47269e3d34d2eda6b71af73892656cd2bf67d..085d6fb8ff6a61009217dc2a397f73116bceeb61 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1556,7 +1556,7 @@ static int tlmi_sysfs_init(void)
 fail_create_attr:
 	tlmi_release_attr();
 fail_device_created:
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_unregister(tlmi_priv.class_dev);
 fail_class_created:
 	return ret;
 }
@@ -1783,7 +1783,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
 static void tlmi_remove(struct wmi_device *wdev)
 {
 	tlmi_release_attr();
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_unregister(tlmi_priv.class_dev);
 }
 
 static int tlmi_probe(struct wmi_device *wdev, const void *context)

-- 
2.50.0

