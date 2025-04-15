Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8C2918FE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715672; cv=none; b=OBKvZ6yd5Gl36mR0P8CcZYefADl5Qh5udikaVE1EBBLRy9DUqytYo+DXW6NMiUp1guhG2u/6DwmHPx0d0JqxeOSJG5OeZyeyh1fEdCrBLoF+85fYO72xpHu2edays5Edwcr6YKY/MerbY1AUwFIroJ2qrF/5IwHdN2B2j3nmBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715672; c=relaxed/simple;
	bh=zf6S7BwxmjRGPEbtBn8SAQUbmMfRLV8FnIH9oSAWU0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mEnGQ5ubJAuAdgw7yrH+wNE7hKurjjI7jkqTtjTyncP4v8LMYosb3iXpbcdp2zdLqSV74IEu9mvNtTLXfN0wopHrg8tzcsKb6Er5+PkobJEn8+F41KyOeGORVOSqc9oxfsoti9ydJlGS5TVcmWyKnlFRPiBBsPvtz78ZBir6q6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdItgkMr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdItgkMr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso38172255e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744715669; x=1745320469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bY45fV9JtsFm8hS8+PJ4taV+G95NrPm0cwhPaiVS9H8=;
        b=IdItgkMrSt96BXtHyl7jbXD7dh+f16U9FSPYCDBYDVMkcXzlBGMXMzO6yPi7jeljf5
         tUY20pRQAdasyBUZu9MQNOwXo0NScpFzttej+f4oJbCVVu8EFcp/L1NKroZ/giwdCh9I
         r3Zh5Qmb6KERFoIYTNXJlzh9A34RL0cfUe6w5VmWN6Wzm4vMOrXxohTHMY+1OYeFChV5
         do+55xe8B5ueKVCe97l+dBQyrXqtyLrElIThqeJpqbTPRpimPS1sM8N0CQ35FSLPK4IF
         wj7ERscjcNr2Jxtlly8d7BPQLfn+xfw99CdJp7M0dT8/sToBhC5HS3tZLjut1pcnjmfE
         JpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715669; x=1745320469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY45fV9JtsFm8hS8+PJ4taV+G95NrPm0cwhPaiVS9H8=;
        b=O2fx9Yths6dc4dacZFV6o8JmouNf+k0isvFVtiFhoqJLMGPF0RNGR0vs0bKsQR4Zmp
         cWXw0gJW/ztw7Y+mW1JwNfaJzO+FnpJ0TKZr5B1WVv+5sbQkWidnYa5DOGwQ4mgN6MLN
         S4ciBFQDJSCG41AWLDLRZ3lf0Aqu0pWP36PSh/z86Cz9q+1LvVUQzu6sL5vSFSXKIEdj
         hUd2sJCqIsj+wnIrIt4YokBamnM4jXShP7FdnD0r3nE4cuhKF0ekQ9YcIol2JnAeaQ0d
         LS4l3NxTcHLOFa5no+sHuBSkY75wYz0JGG4xM9WS5czaaG6p7POmp3deQo7rIBdHarqk
         Yl5A==
X-Forwarded-Encrypted: i=1; AJvYcCVhOqdCBi7xDlKEjP1wIeeIRqV0s3+JoJ9mvXDssENQIWjudgrKT0K+QviukgkAfiN/apX0tHgNTp40MIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1/rFe18cU4JfuJuFqCs/bPCQ3bJo6ll8hXPGV6Kzd+og2cdbk
	hfJCVs8Z7mhUG9cVjjhH5g2/JVANQ4SG2aYqWMW4I5O+5ZQXT1b+
X-Gm-Gg: ASbGncuaN2RtISmYR6hC9GP/Iskr4ioaP+aq02Rns0qneymrkd796oQDLJCav0wUMfB
	5MVrYsceOYRB0p/ys5Akq5zw/PCNdpQY9kY9xqb8GXSZ82qbtcuzPFJaQr8ud+XtOzf/Fjvun96
	fnqgS/OSxEB7c5+EiBN3kiBqQPhDyBcMzo72C1oIz/c7TbPxIIrJsKuPi3dDS4dwTaQsy+aZPTt
	fXgCGfMO/jBytg67+xzFK24P4Gnhyuw6RWB+CSfsSc+Cu7GTl1H5PVm9j31XhI4df8cnuo5+3Ox
	dCYRSO8V0QPuSi+plnvUwViO/4HttwN4Vme1HbpCemCHibU=
X-Google-Smtp-Source: AGHT+IGueDp3RVJwV56+mggSDaAppr5UT6eQvxQ7iCWwQLXBu204Paq6HN+Cpe1tHMJqLp37X05/0A==
X-Received: by 2002:a05:600c:3501:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43f3a926d56mr158614435e9.2.1744715668267;
        Tue, 15 Apr 2025 04:14:28 -0700 (PDT)
Received: from noctura.suse.cz ([103.210.134.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eae96c614sm14106636f8f.27.2025.04.15.04.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:14:28 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
X-Google-Original-From: Brahmajit Das <listout@listout.xyz>
To: 
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] regulator: hi6421v530: fix building with GCC 15
Date: Tue, 15 Apr 2025 16:44:04 +0530
Message-ID: <20250415111411.6331-1-listout@listout.xyz>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the Linux kernel initializes many non-C-string char arrays with
literals. While it would be possible to convert initializers from:
   { "BOOP", ... }
to something like:
   { { 'B', 'O', 'O', 'P' }, ... }
that is annoying.
Making -Wunterminated-string-initialization stay silent about char
arrays marked with nonstring would be much better.

Without the __attribute__((nonstring)) we would get the following build
error:
drivers/regulator/hi6421v530-regulator.c:189:19: error: initializer-string for array of ‘char’ truncates NUL terminator but destination lacks ‘nonstring’ attribute (21 chars into 20 available) [-Werror=unterminated-string-initialization]
  189 |         { .name = "hi6421v530-regulator" },
      |                   ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Upstream GCC has added this commit
622968990beee7499e951590258363545b4a3b57[0][1] which silences warning
about truncating NUL char when initializing nonstring arrays.

[0]: https://gcc.gnu.org/cgit/gcc/commit/?id=622968990beee7499e951590258363545b4a3b57
[1]: https://gcc.gnu.org/cgit/gcc/commit/?id=afb46540d3921e96c4cd7ba8fa2c8b0901759455

Thanks to Jakub Jelinek <jakub@gcc.gnu.org> for the gcc patch.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 include/linux/mod_devicetable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index bd7e60c0b72f..f9bb623d0949 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -605,7 +605,7 @@ struct dmi_system_id {
 #define PLATFORM_MODULE_PREFIX	"platform:"
 
 struct platform_device_id {
-	char name[PLATFORM_NAME_SIZE];
+	char name[PLATFORM_NAME_SIZE] __attribute__((nonstring));
 	kernel_ulong_t driver_data;
 };
 
-- 
2.49.0

