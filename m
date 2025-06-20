Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38F2475CF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460537; cv=none; b=YobWyGWDAEOY/+EGMaxxKD7s6IF3YdchEjerxBhBjz4enBXWt6ZCYjdtItjQ6yIJMWSD8ZjtYJOJAA/cuoRYx06H9kgWS1D6KHkNQTjoEbe5SNiYmZ6BVRdM0QqE1KFdGjkp6Qq7UyKDuglR9lIjaMi4yoO5zp03c4j0k4X5OII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460537; c=relaxed/simple;
	bh=+4QAOhOKs2z7oraV6eBDU1rFC07YSDwir0q0MOueysk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XC0bmctV/9tm8SQnZJ5Ym7/x7KJRszS9nBHJ6MiSi2nFMdQrnB0jxfalC7jwc22hV3upWG9ja6VJKQA6fLc0504vvBJLE33SDyWypt1UQ+o+yx2s9F/BGxD58MNc+ua6Iolq8tVpD1cZWXQd4xcr3i0saMJ/ksP4h0y0xZWg2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv/9zFN6; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv/9zFN6"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e81826d5b72so2275498276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460535; x=1751065335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db/PBlmmdvlLRb0OpTrQ2lhYAsbpFgBOYRSGmdSJSFc=;
        b=jv/9zFN644TxSJ38ojRRDbmzIdvCJAcTZgKO3YbOf+qGlUhxvU85gI74E/ucxMHaFX
         8XLSyEMpUGC/78UtWN/erP2BTQymxPbXhvfIteBDzmJviR4dAROVGEHhCbbspTom6+PS
         6Uc2eLGS08CMIlLdS3Wxai0OCE5gKHTGZG/NQFELfmmnpp2EkW4YRhbTo/nXBExWe54M
         0Rqe/NfZ8leD4sEUXMAP/YoISbq3I0xXuHsAeawHbi8Ziuk+xt9fxhXo9AvNyBI1YCzM
         QWuhoEDCqHLaogN8cN6RachUl0qi5RyQUoCU4+lccmR0FODXtx63Ck4oSTQTjOb3085L
         Hoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460535; x=1751065335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db/PBlmmdvlLRb0OpTrQ2lhYAsbpFgBOYRSGmdSJSFc=;
        b=O3dXrC1/DgrQP+zgZspl0tql3R0GTG4RQ5835RiIABpPk5rTbkFP7+aXtRD0YWf1t7
         HpBX8MMQT0v5tuaXwMaZAMEKf6iRPmsxcp8gI5olOLqfsSy/7ydEg6nlTwb7p1gA4D5F
         T5MlqxxlKNfPQssbjtMVUA4stfGttAFryDTuNZ+cEsNu6mcAS9z694leI1xpvkC2rXN+
         h0po5JANxZPYqtoHT0e6PnRqfQrWpw73061mO7VGolZwE0flQIovMkETf442/BkNyT4h
         L/LIuTBhvbcxEcO8F610AqiEyGpQnml/9sgp2tkWiSim48A/wshzEQqdB0IYbozcRHAP
         zAYw==
X-Forwarded-Encrypted: i=1; AJvYcCUvtmjZi5/JugXkcrJzN4jUXMT5aU7SveTj15SFA4dZbxS03LvlpDQ4zcCawDp8uHd7PQNsFT7Y9FHcACU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIRaYgPB82i3tsknN8RmdU6bTofQGjA5xLDWXwRgBeV4w1PNn
	AvmNeXTIIpNe7v6aR+4edwyqUw1q53M5ekfJDIrUS5D8ek1fuszscyVR
X-Gm-Gg: ASbGncvBzPFjTnJ671Zkv5h39E1ye+kvM6fduVxUn7i9FfOLxGTcY4trqa8poKxUEA2
	/haXgn2OY2ZRqwZb1924lCPMUQ4PdYt22orpm1bf01s1gQBQCMq4e5gGNTXFu/4F7LfFkLl56je
	pXljXz4rZKBEpnD6b9YTV3+qfB/eY5OCyqzZze9/xYptPbdj1uXb5BBzLF+5uzsTpQ/1JwizbyB
	KpoWJ5oPuaVUvaBLIlBLsq+IPWak7Mess839VuJxueecykX7bAqJqUZeBSenWi6vwcgaLbj07u5
	6jI0am1t74wlKY75A1hySze3TQprQ3YWnQzBKBop/fV8LD0ZnuYXprbBUZJNvp36jrj889FbG8s
	jwQ==
X-Google-Smtp-Source: AGHT+IFfUdRyAKzd3krLdg3gt4t2ly61Edez5IEL/6WvTR//gcqM18VgUmR0T8XfbyhdJzT9KCn0jQ==
X-Received: by 2002:a05:6902:2746:b0:e81:cab6:6db5 with SMTP id 3f1490d57ef6-e842bc6df3dmr5841712276.8.1750460534533;
        Fri, 20 Jun 2025 16:02:14 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:13 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] Usage shows without the full path to the script
Date: Sat, 21 Jun 2025 04:08:57 +0530
Message-ID: <502715cbb8c9cf7843a3d140a1d8affb2b0a8679.1750459100.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <cover.1750459100.git.unixbhaskar@gmail.com>
References: <cover.1750459100.git.unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate full path to the script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/gen_implicit_dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/gen_implicit_dependencies.sh b/smatch_scripts/gen_implicit_dependencies.sh
index bb6217437507..d6e21bf63bd6 100755
--- a/smatch_scripts/gen_implicit_dependencies.sh
+++ b/smatch_scripts/gen_implicit_dependencies.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

--
2.46.3

