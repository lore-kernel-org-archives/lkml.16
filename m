Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49C4C8F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747618931; cv=none; b=hruzQ3JiwTJ9WnBBKlyP53rA4d/yYhYsLOd/nzdUsvWhwUwgstDDkMx7PP2uhc8DtZcTHdL+0i6Uc7+4uUAOV4Qkl0EEBAmjtbwbyl+0ZywpWr9X0Nm3tMTpuQDPy0j3lcib3yt1bU6pmLyqlz2EPhEqzOGRHrP/ZQVmUd4VX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747618931; c=relaxed/simple;
	bh=gsoTiGSN6feFOfrLPgyZ4uJNIi8+OPTLwLnIDN9EBb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=il0dJfY0dcJ7NvpvR0DRPi67w1hE0B0aYNIk51EUnQPzXfRum4uHmL1ay6Cm3Nuw+L0NVDWckph6TPsOLmgXkfNUKuScFWBKT4UmUmrnD3hf3JiECZQyKS0imPWYyjlXKTyn3PL/Ky5PDJz6CEwiSXgZO1Fj2uI91MWVYkm0tAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYu//Tqo; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYu//Tqo"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f2b04a6169so46759666d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 18:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747618928; x=1748223728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WuYrsA5VycSdsang99hZsZXYsoGMpgxGYVc6khDgfmE=;
        b=NYu//TqoLv/GcGIGkzWezOAnDL3I9KanuPXzfzXJADrJJc+Vl7PZXRaHFlnUqXu3fN
         xxH2Vj8J+832KAivc5TvGvLCioQSdF/vcQlm2+V9jEl8RzZdSGgqeNyx0knzp17Se/7F
         sN40XF9fX33wEH2ffi0KkYpuk8os8xMpdY7KGEJkUO/U093rvnBjowVAyWluSAap0b1Z
         qx1/wTklfh5UcXyy3nANxjytJqWndtURTpU/KJ2FTyzODOIWWJ8I53d4h2R/DXtm5dUm
         Pw0a6yRd7UVOooJZMAMEzF3a/uTC/zD+i1SNvpQH/XAs378JygaCrD16LeZSbIN1yRc5
         kZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747618928; x=1748223728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuYrsA5VycSdsang99hZsZXYsoGMpgxGYVc6khDgfmE=;
        b=dadjOybGiizyysYVwktbuYZJ+lKQCJ1ycPuQ63s+rXFuZ7bE9C+W56npjA4bJ7PGGv
         MkNQ/8YqYbLKmz0haabJHE7xf2jiX3hgD5Ya2uTcxmMj1z9K45732HCBElepGZRU0EIh
         00gg3oiNewVCTEZ8A0bySQyGKKRjswC9K/VNmNdysAEiXXf9Whz2PwVSdus4TKYwSReR
         64XEVPihLmlFFmi+t2ZEhXhdvzwzeZR+xYJe4RUbIDLTfQysysL36OEgjgR8fm71mJr+
         zrvEh/hLsjF/pHspjdOxPLQuEg3gRR4/fyU0NzKzEwqp95QJKcfwc+P8tBZIIEJNBF3i
         31cA==
X-Gm-Message-State: AOJu0YyiOpfcjA/cerHAB2JK9FMWKybD+CL8IrEeQOy+pBIuKAu0YeJD
	jrrJx24nVnNoQZxXRu0R4tUI7Mwe80ZQpZvYH6gu1523TtLV0eSCX6YaWeUs//0mlqs=
X-Gm-Gg: ASbGncvo63eEGPLhC9YTj+PQJEqVER86XLNOfGBudRAtiAZG6xd1Y/2kKhLHjvZlw+X
	rU8HSAvf6SrUiZKljg4wcZ2Xr9HDBhW0VLDRy/yIccZULmX1skWGxqlElFFKP0MtAAdgD+TkTvl
	fXxrc5c6S5ip8FsS25B/5FI6082irW4K1PaOk3iHY53xtKMSKXLCGKTeFBuYkcgG7ENPGLXLoUO
	06vck4FJx76SjIyMDuBPCDEFVcSh9sFV370fw8YlgyGHXX0j4nF7qw0q3cCIVJzUhZhN1l5hAAY
	SMIbip8dGaH93g8aKB0lzDN4n37e2KeLciU+IsNwe7NudTL5XjEWhpRor54xg/o=
X-Google-Smtp-Source: AGHT+IG05/xdIGHWltI/wOBJf0eMzpvX7s1TOBojQ6jFoSkSB5haV+38SL9/gkxntEyRZ2GQCKtH3w==
X-Received: by 2002:a05:6214:ca2:b0:6f2:b7d4:afb9 with SMTP id 6a1803df08f44-6f8b2c379d0mr181327036d6.2.1747618928361;
        Sun, 18 May 2025 18:42:08 -0700 (PDT)
Received: from CNCMK0001D007E.ht.home ([2607:fa49:8c41:2600::f21d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097b9aasm49007716d6.107.2025.05.18.18.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:42:08 -0700 (PDT)
From: chalianis1@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Anis Chali <chalianis1@gmail.com>
Subject: [PATCH] scripts: regdb2hex: add a script to convert regulatory.db.p7s to hex for net wireless certs.
Date: Sun, 18 May 2025 21:42:04 -0400
Message-ID: <20250519014204.304611-1-chalianis1@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anis Chali <chalianis1@gmail.com>

extracts the certificate from regulatory.db.p7s and generate a hex file usable
by the kernel source code, after that take the result and put it with a patch to the kernel
source tree under net/wireless/certs

Signed-off-by: Anis Chali <chalianis1@gmail.com>
---
 scripts/regdb2hex.sh | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 scripts/regdb2hex.sh

diff --git a/scripts/regdb2hex.sh b/scripts/regdb2hex.sh
new file mode 100644
index 000000000000..b28912a79094
--- /dev/null
+++ b/scripts/regdb2hex.sh
@@ -0,0 +1,37 @@
+#! /usr/bin/env bash
+
+# This script extracts the certificate from regulatory.db.p7s and generate a hex file usable
+# by the kernel source code, after that take the result and put it with a patch to the kernel
+# source tree under net/wireless/certs
+# this will be added to shiped_certs
+# to verify that your certificate has been added successfully 
+# 1. check inside 
+# /proc/keys and you will see a line with asymetric issuer and a sha
+# 2. dmesg | grep -i x.509
+# cfg80211: Loaded X.509 cert '{issuer}: {sha}'
+
+if [ $# -lt 2 ]; then
+    echo "${0} <regulatory.db.p7s> <output-filename>"
+    exit 0
+fi
+
+trap '[ -e ${2}.x509 ] && rm ${2}.x509' SIGINT SIGTERM SIGQUIT 0
+
+openssl pkcs7 -in ${1} -inform DER -print_certs | openssl x509 -inform PEM -outform DER -out ${2}.x509
+
+hex_crt=$(od -An -v -tx1 < ${2}.x509 | sed -e 's/ /\n/g' | sed -e 's/^[0-9a-f]\+$/\0/;t;d' | sed -e 's/^/0x/;s/$/,/')
+
+echo "/* ${2}'s regdb certificate */" >> ${2}.hex
+
+cnt=0
+for h in ${hex_crt}; do
+    
+    cnt=$(( cnt + 1 ))
+    nl=$(( cnt % 8 ))
+    if [ "$nl" = "0" ]; then
+        echo " $h" >> ${2}.hex
+    else
+        echo -n " $h" >> ${2}.hex
+    fi
+
+done
\ No newline at end of file
-- 
2.49.0

