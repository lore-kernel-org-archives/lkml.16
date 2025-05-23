Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789319CC28
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748040969; cv=none; b=TKbih9bt6F+DP6u0pq6qbhUj7fhTwrIfZCYqHl3yjWQ4DbARYLi50/oEMr/76Q+yXBmrhSDzBcwWYrT7LdSraVSfi4jqS/8sQQH7LhnzBmWaZc8umxmDspF9HSBGwyZZO9MoPkNWc5j/cgKJ1J3NgQerY9/rwZwBcoi//F5mMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748040969; c=relaxed/simple;
	bh=NGj6o1TSHq7NgK9mTN3qfWo5lNA9ZOhTkxnTKNeNFy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rzrP6mDs/ROMTUnJPrnvyQHiwvh89lJaRQTRfkxL84wn8H7aHgH2COSRsitgbXVxsWZZwDoQqOAPe7KTa8cAchiPl0X9iqT3IHr51Vm41QNOV9WsVg+FRqqZYevnrnMarALoQcw7a9OezKH2GiuLFOAgmUTNrWxE/fd+EhOSy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIf8jT68; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIf8jT68"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad51ef2424bso54674966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748040965; x=1748645765; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxStp4QDv+1517JcztzoS+IknMCMQcsrtKk9OWJYKww=;
        b=MIf8jT680zApRZGPE+DmRA7RfISGCytnfYDBffjJTuf6kyMTfDE49NRCR3QGUVLFWT
         BNKOvfU1TA4RvJZxsOzs4gkIDiuzsKXbVNwDwiwSEYdm6OnwIdEi2KQsu37PhjPvtLkv
         bnQymALzeMy6l5kSoc7gHyuyjdH0npVKmbargrJO4UJ1f3APQCWRY4bIaq31/6ynoLd8
         jTvE4tDJSwtZIKNZyy4YzHlvKShbV6gKySaLCzeb4UwycTUdAzRqOkdEz9ZMA4LtlHHt
         qGKlihBF8DQgNtrtGsBFu4p27gDNwB7nT9TiBYjVT7BRwRETHnohveeHsdyjk6iJSwM6
         42KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748040965; x=1748645765;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxStp4QDv+1517JcztzoS+IknMCMQcsrtKk9OWJYKww=;
        b=h/r7M4S3vVJkv8GQ+tNqoGNOmq8CNyHznFp14E2U8Ez6S0E8OrLZ5MWORt6dyeK0GB
         oX2DtO4zlq5XQyHJTtLKqCv6450l7M6ad03QpbRgjOOe89pA4JVFlXUb/AnWZoAzlG51
         JVJ5w/rMInlSIU6o6DHaVVJr7gE7TJVSELfGjNJmkEvB7cMoNR1xYr361jGk9tdsGVrO
         MejfqNdnFSNrGyvLoVc4TnThP++iXaY+y6NAe/rYxk9I2y4LPQS32Eea+n9Fy9djFLes
         +RIh6DHMLPrZLIWwusgZLKZjbyOIcusUEH6edPmE/eOb6tKXAqd/wwEu2qnBbmCGzy5B
         gPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv455wGW5o/unwXGqwdfAmx6jF3ttqrxfEP/Kdj5ehEa2jK0oMpxQCjhCfLvx8sDZWQG2sDAmWCZIHCTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnR9euqaf24K+3dEamZ+QMa1TDo/7xz1ccmHRreFQYG7istHr
	OSDG8VmKqNdx/eK3GCIz/S82bfOXYGjKXY2fASCCShtD0/HYesbmDgyo4Xgm79WnYGxoK45/hc3
	ZSNlExPV/tH8fcGqg4jlXgQprp9+Ld30atWMayRRFcyFDZVsMuj2jxLws1A==
X-Gm-Gg: ASbGncsHqAJ4X4ognYY7BzvXZti+F4MvLTHRZI75msVnFzmYltPDYIuJRzJTtbobsz2
	mLN18u4tQckb5QpO0bQk56Bi4YuyHgB049ZnU6YpF7zAPWdBoyk9PgNHdh1acNqMSSt7kOCPlzw
	2Fmqz9K8vdVDdgEYl3GnEPTm4hpSQGWbpY/xRDEIvH
X-Google-Smtp-Source: AGHT+IE/wg/Q+CytxtXRhEaDTGo9u4Ms800IaJJVdAvoge4pVxbz0SwaQe2RarImpiXn+y3zAmMArP0lyG9Ursx4InE=
X-Received: by 2002:a17:907:7253:b0:ad5:2324:af85 with SMTP id
 a640c23a62f3a-ad85b120251mr89333066b.2.1748040965527; Fri, 23 May 2025
 15:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
In-Reply-To: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 23 May 2025 15:55:49 -0700
X-Gm-Features: AX0GCFvviElEY40v5_8eyRqNA1AiBdPHwV7AcPD6ETfsr8U4PUtD5Oy-bTe1HMk
Message-ID: <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com>
Subject: [PATCH v2] kconfig: check for a NULL pointer before access
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

The call to 'prop_get_symbol' may return NULL in some cases. The if-then
statement accesses the returned value without checking if it's
non-NULL. After inlining, the compiler may treat the conditional as
'undefined behavior', which the compiler may take the opportunity to do
whatever it wants with the UB path. This patch simply adds a check to
ensure that 'def_sym' is non-NULL to avoid this behavior.

Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
v2: Fix whitespaces.
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d57f8cbba291..9c5068225328 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
  if (prop->visible.tri == no)
  continue;
  def_sym = prop_get_symbol(prop);
- if (def_sym->visible != no)
+ if (def_sym && def_sym->visible != no)
  return def_sym;
  }

-- 
2.49.0.1164.gab81da1b16-goog
