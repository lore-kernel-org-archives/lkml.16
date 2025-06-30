Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F228DB77
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294178; cv=none; b=pWILIy94UgpuLmvuMHspQBpQUp4tsLVe2xs+3dtl994vVhplfO//mjENkd8w/DXeI02h2JJ2EvEDJG0dMMNlFqqDMbJJlR0r1c1vh+RDiSUkY8rlcZcHwUSYsL57W/RBvfJZadg5Foyj4s1pcTI7WQYD2uoPl/vZEoQOPIYKDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294178; c=relaxed/simple;
	bh=pwspzJd4AZigPvmdBQBc5YI54moVabhP2BKPyRa45tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZcThFpDlDVK/S8ZwU8mzE256IToBiVk7d/AEJLfPD2S5zgBub/zcKPc60eOD5n5tBLCCTIq5vJr3z3GMQl5pt9bYYA7UFwyTMHe22O/S277q4p8XtDLqCCopeGa6Nq599dqRFCKZmeE1D++egr54GsIiLRGBfJhM2u8Dfewptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DpZRHAAG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DpZRHAAG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a582e09144so1678469f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751294174; x=1751898974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxXlGnhc5HV9WUqIY4yXx7sDZm8dL+Zm0TPRhpOl1ew=;
        b=DpZRHAAGnfQredqN11vxaA/4PuNGbgVITubbNYjwThNiu3FG470qMNrpgoZQF4IXp8
         OE9INoBnLGduDaszKG/o44CX8G6XM/chP/KfMPclx8R0r2Hh7DP6P9t/LgW8kU09Xsqk
         Nmqiebf6JfmYPuxK7iwR1ODDdmLKIoxwskkKlE7Ithjy0HJTXRmREMCEK4IYDoarGS/u
         G7Ufk91XwI+b0U2ZH/AomXXFK4a4XAV4NWej+MkJ/i2rv/n3c7Zc1WK/zg9ciLHqTm4E
         O9YjYTGX7LGUYCaotqGl6XsoK2Q+OoZBfUH7tp0Bye4k0sdroyoGFhcRw01D3/lUotOj
         CyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294174; x=1751898974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxXlGnhc5HV9WUqIY4yXx7sDZm8dL+Zm0TPRhpOl1ew=;
        b=D4MT+XK/P3JFR1+EOd3lSvHnAbvRZicAhwjeJopNwGgORKkwu0wNWEG4H/Z/wKVnjZ
         74q043nKo/g6p3ZWsZ9YL8s5kCV9COJ/ecA9bPNNHk3qa6VEbiIEUnGbewjdw8nDYJLg
         XAbY9v4JehkZZslGrR98vmVpQ/4h4iJbjQR2smIhffHaTBhAIdooxKGArTFAlvTvnDRe
         n6mPwhwLkjwr/GYOb7THqd5SRjgXOzncOQiUAz6CDLK5nngKALMTbFz5sZ/gncEEXylb
         3QpGeE8BvZVYAcftCbDGIKpM7deXxstMfJIrAblkntCjTMnsMfIWhbGuz+9McEXpSxNp
         7w2w==
X-Forwarded-Encrypted: i=1; AJvYcCUsl8fB6qNVZJo1lmaSygN9ZpU5GODGgcjZ6BMxH+mrSl65J3hKMAO8o2i8ZGPqEIDYYfFsq5d44pDZQ18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWM9/Z6iruCcT47PkduW1xo4eOAH7pcHFv8k5X6GVrWMdO2XyI
	4uS7Wn72s6rMWoaBS3y+rQJSxgdlPuUlv+V6jeswQDBwckN0uP26yN48Q2FBgGw16tk=
X-Gm-Gg: ASbGncsCuTDCc9dZfmmdFoPHwZ9n9T6VOwOAUkpHlOQnh7Kj/OIKeHS8TdUHvnI54aU
	ryIYgOTRE5aOUIaJvbW9snprvTL0U4NyxWOzb/8DRdmyv+Y65sSkDBU43JzllCU+I7pK2FSYGP5
	kK9mZJrEuiTii4G5OeP9HnA84Nd7he/obD9KQWhM+6dmq7Z/SbzRPC08lOkjyGnRWqATuKYZ5n4
	339UNhMg02iC47Tg57L3W+rwvv9AdIfQQcdbuWmJZloTTKPNyz/p8sNS4iDhk7bV+GYGFFgKVEv
	n8/bsibI0ZbP1v6p4MnGjgaveYNUiSK3+gstOJ6iHfYR7YH9LqL7+bBCsMYNCg==
X-Google-Smtp-Source: AGHT+IHN5CLUSWO1xiRD+qqKfFwkQtfevB21L0QtujyoJrVD0RIup44F3ZYXGZ/DDsSpOXdt+Yp6ew==
X-Received: by 2002:a05:6000:410f:b0:3a5:3a3b:6a3a with SMTP id ffacd0b85a97d-3a90075f95cmr8351749f8f.54.1751294174091;
        Mon, 30 Jun 2025 07:36:14 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm139691695e9.29.2025.06.30.07.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:36:13 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] module: Rename MAX_PARAM_PREFIX_LEN to __MODULE_NAME_LEN
Date: Mon, 30 Jun 2025 16:32:36 +0200
Message-ID: <20250630143535.267745-6-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630143535.267745-1-petr.pavlu@suse.com>
References: <20250630143535.267745-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maximum module name length (MODULE_NAME_LEN) is somewhat confusingly
defined in terms of the maximum parameter prefix length
(MAX_PARAM_PREFIX_LEN), when in fact the dependency is in the opposite
direction.

This split originates from commit 730b69d22525 ("module: check kernel param
length at compile time, not runtime"). The code needed to use
MODULE_NAME_LEN in moduleparam.h, but because module.h requires
moduleparam.h, this created a circular dependency. It was resolved by
introducing MAX_PARAM_PREFIX_LEN in moduleparam.h and defining
MODULE_NAME_LEN in module.h in terms of MAX_PARAM_PREFIX_LEN.

Rename MAX_PARAM_PREFIX_LEN to __MODULE_NAME_LEN for clarity. This matches
the similar approach of defining MODULE_INFO in module.h and __MODULE_INFO
in moduleparam.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h      |  2 +-
 include/linux/moduleparam.h | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 5faa1fb1f4b4..0f1dde3996d9 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -32,7 +32,7 @@
 #include <linux/percpu.h>
 #include <asm/module.h>
 
-#define MODULE_NAME_LEN MAX_PARAM_PREFIX_LEN
+#define MODULE_NAME_LEN __MODULE_NAME_LEN
 
 struct modversion_info {
 	unsigned long crc;
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 110e9d09de24..a04a2bc4f51e 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -6,6 +6,13 @@
 #include <linux/stringify.h>
 #include <linux/kernel.h>
 
+/*
+ * The maximum module name length, including the NUL byte.
+ * Chosen so that structs with an unsigned long line up, specifically
+ * modversion_info.
+ */
+#define __MODULE_NAME_LEN (64 - sizeof(unsigned long))
+
 /* You can override this manually, but generally this should match the
    module name. */
 #ifdef MODULE
@@ -17,9 +24,6 @@
 #define __MODULE_INFO_PREFIX KBUILD_MODNAME "."
 #endif
 
-/* Chosen so that structs with an unsigned long line up. */
-#define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
-
 #define __MODULE_INFO(tag, name, info)					  \
 	static const char __UNIQUE_ID(name)[]				  \
 		__used __section(".modinfo") __aligned(1)		  \
@@ -284,7 +288,7 @@ struct kparam_array
 
 /* This is the fundamental function for registering boot/module parameters. */
 #define __module_param_call(prefix, name, ops, arg, perm, level, flags)	\
-	static_assert(sizeof(""prefix) - 1 <= MAX_PARAM_PREFIX_LEN);	\
+	static_assert(sizeof(""prefix) - 1 <= __MODULE_NAME_LEN);	\
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
 	__used __section("__param")					\
-- 
2.49.0

