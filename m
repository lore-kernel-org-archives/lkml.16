Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1C81EE7DD;
	Thu, 10 Apr 2025 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310173; cv=none; b=Yz4QTK6rCWjlLcOxNWUfLgOaZ3tZMgjtsoEIVG/g8m8HRqojopGcpk91XE+sTZGCLCnXB/S5BkN7KPVdvZNipOYuXMcYlgCY9pkmA/lkEHZTDWIcsFVxqo4CKpxnVi9EzHgh464tTutWmbk4M4FcMBOg0hZQn3ivoWBmnmX1mrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310173; c=relaxed/simple;
	bh=/YlGaJrDMtREG70oFyBmE+DbzuF9W9LpheI5IW5gcas=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SZKkHGt1ZqgpbystiMybYCxTrSB93e9u8lUrEkExpwp5JOL+1lvqzhg45tXB1YNccrEdGEPcnN5zKSwvEY31+XnFstY7PjzzdIfnb0v0LD5a66txmqUsLbO18edue6VAmPJTtpUNcaZF8Y9lXOB+bAqX2bSyOCMWywbR5YyqlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClrfYx0S; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClrfYx0S"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22548a28d0cso17369955ad.3;
        Thu, 10 Apr 2025 11:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744310171; x=1744914971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oac5s7OjyGN5VS5VbkIAHn0ot4yH/f9rZZZ6VzOSKww=;
        b=ClrfYx0SHuPcbGDME6tbNfBXtMem4P+PoNO0BccWMCBpe8adesXK+zJ9Uj8rZLu4P/
         raEV3AMlQiCOz5SVPrmPNBlF4OcV/lzojG92v2BwQvkQLIEO3sUU3M8cw6h7+vupXo58
         Qm6Opi4QMVyahRdKu4WYk9MByPeTX95k1Q97fHW4BYr3UPQp6JtgmBirBpQ4sVruhcZl
         YWB+eBj7isuWTlAMmMlXVDLO8EqiEe7QUHGA622RXOXW7nybVOJmk4xc7RxDFzIOTdF5
         5Cv7n3I0aKSNVMmTtEjYXQr88wR4QgUa/0gIXBZArNUcKkk0eiLLttT3KupHewNupIvI
         LLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744310171; x=1744914971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oac5s7OjyGN5VS5VbkIAHn0ot4yH/f9rZZZ6VzOSKww=;
        b=KJcBfwq9CMt/W7+PDFiLRw1BxvGN31ZErBJdrPZEFOi5DS2jkpr6/ZhobSVrzyOxCC
         CKb3cGSOZDh8A+Uv3DSQAciiC8lAhyNGYTnJqhXFNF9Z0adexaHGsExpKfDoH7Q8wwTj
         BixihVWLkGdCnjLE6yXjM2GbJ65vHak0eKZ6+77VN1UXN6RxUu98OYBEAKVhwM+umEsF
         vsAxXLx3NJaRRiNHFCZvguqtq8JJXZsMKRKczQAPnp6597eUggkuxZ23bXkADfOpYauO
         RbDLeIkfso2Eg8gX/78QivKpvVIVKcXpgsZkaaspadIOBbW1StsniGBSJlBDL24LcnnR
         m5lA==
X-Forwarded-Encrypted: i=1; AJvYcCWmp8FddNICkwhdsQj1z7NwIlWxDutyFSvua9xrp0LIBY60p5SZtBx3JKjD41QTVmez2zfLpZxKFKJd3aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlS6Xs3MR7Hd9cGRniTw0pQ5WdNU8QhVIdxDCRgayPVO1iV37i
	WxfJoSoqQiwgS5ELGC00Ex+mJnfY9MaAw18XPoyYcULfuGhwgY6w
X-Gm-Gg: ASbGnctOd+XyWSu6AgXvcNlmT0JLo/EqcPXei8UjeKsgNtOAo1fQIeL02pbwNp5nX7o
	l7/Zi0437nKzkQmHsXrn+qFC8X2g+NoVToLRM/9wnm1jdSZLfRhVvGiFpEmO64l4wL2SHUCX7Ca
	ffGHRCFYOOUtu559u9kJYt0kJ0Pj54zgnKk/9LZPN+6k8uYuC0BK0iG1NW/HVNEef2YkjINn7pY
	J/GWA7nef0g5p9RmY2gumSOXtZhz5C1Ql8/nFQixCNyinlGY1g1lBqXGrTKRb+lUyQ3QQpidggk
	PtPI9BsXQOushZ++PIetdZreSJVqoLh3QXrOPzgAiK0dPTbH8PNT9nH4Ojd74CqH9Ry7jYNSiCY
	=
X-Google-Smtp-Source: AGHT+IE7813f09Upk4N+t4KU/FISmjErr0pklWnn1shoTyren++hXOMRERD8bFxjlcaeHEq0hfPvUQ==
X-Received: by 2002:a17:902:db06:b0:224:1074:63a2 with SMTP id d9443c01a7336-22be03edf37mr51007795ad.43.1744310171563;
        Thu, 10 Apr 2025 11:36:11 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:4080:204:a537:70f5:9c3d:61d0:62b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5ddsm34072825ad.230.2025.04.10.11.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:36:11 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: Luca Tettamanti <kronos.it@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] hwmon: asus_atk0110: NULL buf.pointer after free
Date: Fri, 11 Apr 2025 00:04:50 +0530
Message-Id: <20250410183450.15514-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Smatch-detected issue:
drivers/hwmon/asus_atk0110.c:987 atk_enumerate_old_hwmon() error:
double free of 'buf.pointer' (line 966)
drivers/hwmon/asus_atk0110.c:1008 atk_enumerate_old_hwmon() error:
double free of 'buf.pointer' (line 987)

Smatch warns about double free of 'buf.pointer'.
This happens because the same buffer struct is reused multiple times
without resetting the pointer after free. Set buf.pointer = NULL
after each ACPI_FREE to prevent possible use-after-free bugs.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/hwmon/asus_atk0110.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index c80350e499e9..83ee7f25bb8e 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -964,6 +964,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
 			count++;
 	}
 	ACPI_FREE(buf.pointer);
+	buf.pointer = NULL;
 
 	/* Temperatures */
 	buf.length = ACPI_ALLOCATE_BUFFER;
@@ -985,6 +986,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
 			count++;
 	}
 	ACPI_FREE(buf.pointer);
+	buf.pointer = NULL;
 
 	/* Fans */
 	buf.length = ACPI_ALLOCATE_BUFFER;
@@ -1006,6 +1008,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
 			count++;
 	}
 	ACPI_FREE(buf.pointer);
+	buf.pointer = NULL;
 
 	return count;
 }
-- 
2.34.1

