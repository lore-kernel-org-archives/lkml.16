Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391FB1DF271;
	Sat, 17 May 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471954; cv=none; b=RsaB+3zR6q1HuIidHQHKJADeB25WL0UYKh3uLM+PRob0px1NxCbp5qhgE75U+NlJkZ1hP7Mdi5GohtwMfpdukXuD2vujJZommZhBRBGRH5zT98NjjCdu0ddVnl535qol5Z8U67SoxvoeKODBQ4eS+x5UOdwt/x93lpdtDtjgQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471954; c=relaxed/simple;
	bh=qbGX0vY8ua1yjyX4gKrkjXd8FS4pqHM2ZzBMCrO0vV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCxwJMA/SFZvtI117NlL6moEDyRIN5rW8RLIuj5qRUCG/1dFZfVXff2nMAJZubqnzyUynt/qtjQaSZMTk8I3FH24Yv0UlzeoLfz6aNsmlo5eGuqFwixORred6kNS4xveSWkVc5ci2+DRDW8eehJzc9cLXM3Wt3ToFlKJFqKYh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwNSwy3k; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwNSwy3k"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52410fb2afeso1773049e0c.3;
        Sat, 17 May 2025 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747471952; x=1748076752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNsWbQeM3Ef5H0Pf+40JMXz6QJMor+ntR9ZNUEK2L3U=;
        b=CwNSwy3k19CuI5vv1GriPUs+ReW0xJkzNNrPH9YeJz28Rc+rRI+B1PHt1Pn2h6uO4Z
         iBkPqbHmmrLIuP9tLbOjlycpGV2wnRJjv1lzSQcnoJbnPyCeD4myUungx8ChL99/rYa0
         YHNMfZUc08Mj0Hdsdu6qbZgzxFKfW8W8o/YmxuyQe4b047wFqxrJeByIquO8K5nIwJ0U
         JPzN0kNYB122pn47wYjgHkFcOLlTNGQE7S0SKIEaQUJDco7y6/iYoKJnxWq4tn6nNxJg
         0akos/Mu2NhiLzEJc6nI40lNcQBWyWh+hArO0BHz7ze/WH0uOlsT0uxcd6aQ7Gi7qOjQ
         MIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747471952; x=1748076752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNsWbQeM3Ef5H0Pf+40JMXz6QJMor+ntR9ZNUEK2L3U=;
        b=jJ369RNtLGL0Hd3bGnRnRgFAzWz3Tz/zYLnL2MHMHQI32WHHgLOI9jeUkIid/pPvCR
         LxBkGUzzlXRyR6oklxmCfMNiTEA7V4dMsogVLVNzTDfwzEAiWeb3IJNR5y6NTva/0kmN
         guzZsbvRa2KvtkvNRh7uy8CQ8UNXFQNefaDswQEBNcDN+YxbpMNb6jPbXsZfg1E1BEnD
         BCLrsoX99Ez7z7hHYINcwGAa0Op3giGqlbTcZgwq8lP/MsoGquGv41qlwBNHhDUM1pm5
         et2ffZ+G7xXsUvWwq2Zrdn0z+DFxinOqv9YDxD0jKK4QBYeSEllEZlsVHVpdKp/0jjw2
         UBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6mC6SQbmIJ+olhYvFPWaw0WTLj+QGZTxiSFsO8vfj5Y9nPJBs0XRjAMt+zz/LIm4egFvN9/2RnZ7NUHI=@vger.kernel.org, AJvYcCWeZ06dOxFXJQHXUpJFe6wS3otlu32m0gnuvxFDg7bKyuLGPCtjr4CPDVcONe+7EvaqRqYrB607F397cnkE2+qKue1efg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU10DFJRgaPpWIUucucJz0SqT/8y3Ny6m3RpwXpWIHVQR9Bosq
	jlTMkA5/hXKihVnXWMaHpzz1ht15b0kbRCMY6MZPRytPSYgHR1DXXlnO4YbhLA==
X-Gm-Gg: ASbGnctE4JebL0wOx/wgR8nbp/AXO5P0Wy/hZmFjz3SX0ex10i7pTAs5Z5Z9E4ZLz6d
	FIrVQBluqCRXQTQnOhkgcfFAPhxuh/JbUfx2Bq4bfDqAoiIicpqfq+xNTsdN6ShWAIXPE/7RNZz
	ChzweieSG6lbn2g9C6E5zdFAPQ3a5WhC2L2IFiVud+dj+d8mI2aXwtnhA0Vyfyoopf4c1W22+P7
	1s4jhy5gFBgMkWlzROaFIHe4evO2IfAjTDoHlsJNv6mQH2uPs9P+Qh2ePkoTer1v++2xUSNfGkX
	nRrytFyeFWzwJIptQijl8x9oxMZBqwt4maANEOKnlAnibIHYhg==
X-Google-Smtp-Source: AGHT+IGP8LQww2xigb+BfZQUHdyFE9Gg6EhJtQK/HkUNyGB1GnpKuO2Nk5syCihGsKnFwLYIJg3K9A==
X-Received: by 2002:a05:6122:46a7:b0:52a:863f:78dd with SMTP id 71dfb90a1353d-52dba91e5a2mr7834990e0c.6.1747471941735;
        Sat, 17 May 2025 01:52:21 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9405adsm3455812e0c.11.2025.05.17.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:52:21 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 17 May 2025 05:51:39 -0300
Subject: [PATCH v2 4/5] MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-fw-attrs-api-v2-4-fa1ab045a01c@gmail.com>
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
In-Reply-To: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=qbGX0vY8ua1yjyX4gKrkjXd8FS4pqHM2ZzBMCrO0vV8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkafvqOa+p1zpWc+sAv8/Ewe8ryiB/Pfst3+8zdphK1g
 +9o8u61HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCR28cZ/nvNcuiamKQSFHvO
 bXH9w4OhtlmtTBn9WvccGdceeKN/8QHD/9IaK2XWq+Ycabt3KE5WqzEMKbA496fvM8dFQV0vI49
 9fAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add entry for the FIRMWARE ATTRIBUTES CLASS.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfb3b51cec83d96e969c5b3be791948cb9d60bb9..48509d4da8b132f61ff2d5f90e121bf94ee30e24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9190,6 +9190,13 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
+FIRMWARE ATTRIBUTES CLASS
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/firmware_attributes_class.*
+K:	(devm_)?fwat_device_(un)?register
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.49.0

