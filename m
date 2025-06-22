Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75623E47B;
	Sun, 22 Jun 2025 00:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550705; cv=none; b=tOCot3MPuJPQCtXJDk1HHIEu0ox/VDi/C4xGxQ9krffo5gjPc4Y7GSCd2iSR5Jl6GjfmA9WeZBcWk3R87CUd56vc9HUIsYj97avWjMinI70apHZlUd7lS9Z5IhrJ1b+ynNc98MHlCduWG7zJuOEW/ClXH+gbZXruQlnDuRvwzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550705; c=relaxed/simple;
	bh=hOd6+qOcYjH/w/j3ddYeY0GLTSBfqJE3weH99urGytI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaAL3PAsLxCXlJ0eXDvjDAVP8NUC5THydzsGj8ick5MKyUtfIaY7LTvnBC+0aA1Ym5UkVFqmVumyo/GyzjpZYeZnbUmVYDImpoo9DDV4scQo/JumNxibroOMixlI0YVbsvrifjoQorptwmHg8wjEuL6Bft4/4nYJ7/FCU1RA2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2ZFqhue; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2ZFqhue"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2297608b3a.0;
        Sat, 21 Jun 2025 17:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550703; x=1751155503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DnWNuVGlcxt97iON5+GLNil5h81EohwejutmAGRqZY=;
        b=I2ZFqhueT4Xgcvjl7dBj6bthufsgBvDKomlAvmwX/+vOUZXSQP+KG9RnZUGOK/NRTl
         XCmw9+CEGItRPRw7EgA7tgdujmu6bxAYtxNsPcs+JbbIc4VmZXbw9aSR4s1oUfswrlQG
         1oeLFoG+12MsE8Lk7KaVBKe9bZUd2JF4ylECNXRlzc/wSanDXqcK8HSdAOnZECgox0sq
         oUBfa7qZgXDMTebmQW1yN6pSPY5hGU6VeRWdPHbvOUeq5+LnYi49v97ZquDtoHO1kUiM
         OtjBotakVywoPLifqKaQYeIp7MhVQH8lu/93ArDqY9fHbNaqMZTz2ti0VB3wK+pxA2ee
         odCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550703; x=1751155503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DnWNuVGlcxt97iON5+GLNil5h81EohwejutmAGRqZY=;
        b=bD2aNMGyjJsYbjk2PmxW3J4BwUypRf53npxOrOEZBFBjFaiB3BMtYk1EgNpzfJy1Lw
         WiYYIqRD8LTlPczOiWS3YcBHcn/aaO37ddBjIIg+YtB6VTz9Or1nVdArkG76R4CSzSAU
         voLNGQn+Y1mf8yrKKB0NRBgHjzKXLgnPtRuxMJLt3HgF/xgOMzqZRXc9eiHaOcwreLTq
         qFVO0qloexNgKzXXYD2MXwuZqqeBFqwK7wvtwhRUejlbnHMWljsEGr1UvRTQx0nVN6IH
         KhLFJThz87OZGNlFZzlBY2jRMO2jL2QTLBnpwcAExRRPmaQaOuWZKTCBmqkKzqzAzKH0
         MKeg==
X-Forwarded-Encrypted: i=1; AJvYcCUHel2rMYv6VHB2b4pNppz4dxR+6IGuhsnuagIIAQKvuhZNgvwcz1PnNkAHlzyCVLcNzubzF7bzsbQygEk=@vger.kernel.org, AJvYcCUYszI3Y7Ms8WjcFW4OVrH2RoIakEQe8xDwZBkQ6dl2LIVnmXoxela3t0R29AvxjtuoTixhSAesrgIbXJa+Bz5gnWXPcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSz+lImO9Y+cWDwirrJvBRyf32EcocoPo5IRJl2Mbwez9vMxyI
	wKeIX429x5tPlq9BkYq8aCyTq71FXccPzsr0YTzOO84Z/CxPvxpiMY1n
X-Gm-Gg: ASbGnctdsJ+6HO1Pw0TYK1Je8lFiucEoSaXIt6aILMQovxSMTUniACAeRqVh23VN7ZB
	ce5fNmOBYj/AN1aB309OR0ZrRmRUmOzjh3E0gHupJo74FlWxsInbCPbAvE5dNCBGRVAJ5By0kzV
	DeRmVOBYwAJd2we1rtTcc7l0qv4A+pdFPkH/EWYkf6JqsPm7+9izIwYTjEyckZAmcLGtTsaf0aB
	wHOJ5jgFO+QUc0INo1fc6A7NTBTIOeekcy7+266X5K+JjvFeRm+YqH/LcHDQNt8zskcCekzWU0D
	H5vXJvoI2HhJzZM7xNODkpewcM7rZaKI3UHLRWwO6WejFw7eEcEjVC239G/iFFO4h8V34b7O
X-Google-Smtp-Source: AGHT+IE1MOr1rfdCggF9CVGTBOCN0L20OHEyXsSSxw+1pr/VwW2OVdL8ypQHNSrFMAImoPVGMhfFfQ==
X-Received: by 2002:a05:6a20:7fa5:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-220291c220fmr11495803637.5.1750550703163;
        Sat, 21 Jun 2025 17:05:03 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:05:02 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 21 Jun 2025 21:04:09 -0300
Subject: [PATCH v3 6/6] MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-fw-attrs-api-v3-6-3dd55e463396@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=hOd6+qOcYjH/w/j3ddYeY0GLTSBfqJE3weH99urGytI=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHlOfdW1bavOjW9LVe5fDQ+WYiXOjfeZJKbmn2e383
 NMoKfqwo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACZiws/wh481bb99kq2dhrVu
 4OZdJ96+59385WTC9YIF7TkTP563yGFkuHt+03Lv7B81uzfOe+msMsem329fz/+S3XxCN4QVpPK
 zGAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add entry for the FIRMWARE ATTRIBUTES CLASS.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c14614613377df7f40565c6df50661fe3f510034..c799f603e9210e4703eeb1f0ac9d6b9e8bd469c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9352,6 +9352,14 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
+FIRMWARE ATTRIBUTES CLASS
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/firmware_attributes_class.c
+F:	include/linux/firmware_attributes_class.h
+K:	(devm_)?fwat_device_(un)?register
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.50.0

