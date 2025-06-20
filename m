Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABAF246BBA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460534; cv=none; b=sD0iCG5rSji4dcIM9914ezXdllQIu5+ep8XcBDZwC3deNTXDS1Sr46882pnefrNFpusiZMaqtIxDxpn4j1ka4ppdbItSz1GiPuAour+FcdIwOpsqgxVeYjgbkJPqTrAVCZibcH+u9XY0I8GUSJ6xSjlUWpeP3AwJnKFhnTnav6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460534; c=relaxed/simple;
	bh=1lvQKCp9n+oKaAXB121H8fPPhHQwfZZD/QhUPBYTciI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aAlI5bB/6G8gPrny9daMvfaWGuU5WMc2wzPC1fWo7nZE4S9p3HFtkptvbzEeRBaTARa+QkzkvT81Q6AR776TvwDur/HNIBFwRp4Lz70IZ6fmaZWSMX67mWLoerN00z7Hxp8dfDGxsSaqw0q2V3Cc7YMkJZiPdV+RuFxHyH91Tmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgnvNV/E; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgnvNV/E"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e73e9e18556so2348873276.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460532; x=1751065332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS5x0lPmv/9YrJ9NWJaaoBaN+jFbkNMf5RYhq2FuHjY=;
        b=PgnvNV/EhCzMCcu//CHOhnAWSrtvfRdgTpk/ONftlod8G2fLRrlOqAqs8dMn9DZkJ1
         3nOtnQgPRKjPpJ7gB8IhSUK6vJ3bcbXjmonbaDjb1nVot0VsgDOhA3U39x7cBb8rW8Gy
         nXjQr8Xzb/+fRUKEcoxwUEyQM1hXdeBanJmfo9bV4b8JHVDuk4ZOSVXX136bzzC65WCd
         p513J2mfuQxO4TwUTe9dMu9a5VT9Epu+HPjk78JNfAdiuUM8S+3FNud0qhikHwsXDUxb
         LwTzL2+Lmm2bY6CjkVxIVNvVagNEpz/BUEfQkgDZeVG7M9bD2jTgfJVgMziVpI01G7pu
         AScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460532; x=1751065332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JS5x0lPmv/9YrJ9NWJaaoBaN+jFbkNMf5RYhq2FuHjY=;
        b=gRI6TFIJ6gBQRso/sJXtdKXLiNacboCWvxMC/nBYJt4QEu+a/j7yMScKcuZr9jbJKN
         6V0KBKpCCUb80cyY7uVOb4dRjOLJbF8AJDJ2cnt/uiiy6i+ARPFc+PDy4dlbpDbAA2R5
         MDAqgmdVEo5nMyivyQ7aI4pSCCVJkfe4ZknzmriqHkHGCRbc6gmBPaEn7u1bT0xuGGbd
         JKKwDK9ENGjkyDG3nvjzABsji9Fq0jlaXzLW1VfxH+7XXtD58jQ/wS/10Po74maVzeAF
         gokyTILERLduk3FOx1Q05LZEQr7w9N8s8ZHWab+dzrbgkcnxGuj3rncYOZ0CcgjrTxOL
         FqKw==
X-Forwarded-Encrypted: i=1; AJvYcCX1d9dktdaey6GaPBY0eHYIUGUUVhWA/8/3SV9JE45oLAlAGyKfxG64qUdW9vlgz3Zvics4D00oASA7Bdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRk95083d8fPefOm9PkbsxCvdikBoNoMTSPcbid/dghkx+zicJ
	Qhmd90/fEzCMA8lWZD6REQ/UrbgZz/s7WG099+f7/CuCCyEkL/W2p/VF
X-Gm-Gg: ASbGnctxYZmcC9lgYroBpDiK8KtnUYdGSRmna071K4jV/N0LV3Zgj5iikwEywLAWbxf
	4QRtmB2Q7Udvwbv96dha7tE0d7OkodcAyWo5DB0+5c6VsXzUrWRON1Fhebop+xpfZwfy9LDomhU
	LeSEu/CFcGfRv5/W2ATmpBPD6Rg9LS+yLNVIHNEOzCHEz03KfRpozX7aQhulRLtE/wr/zJkpi8J
	/wYAxWY/aZ73cqT6C9tdWqQ2DS1oSWeLlvTPQWuBtzk4H6+/U3OtoJhxJxCECYhP7R8hUAw4OUA
	lbIsI7c7gaUEMZSclVLHCoPSZ2igW9fb+3QyIYYjQ8V5xlhHy58ZDcpnbeNgDDhb8quWC8bnDvq
	Adw==
X-Google-Smtp-Source: AGHT+IHjvdkJUEaWAFgjCBfsfMl8s3mvhayhTVsi/j5UEW2Ir0aFNCt96betsTsHuHASHhOW617vPg==
X-Received: by 2002:a05:6902:1547:b0:e84:3495:808b with SMTP id 3f1490d57ef6-e84349594c4mr3793213276.15.1750460531937;
        Fri, 20 Jun 2025 16:02:11 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] Took away the full path to the script
Date: Sat, 21 Jun 2025 04:08:56 +0530
Message-ID: <36ceffe2dcf5490fb76e4995e8307ef08fc3ba27.1750459100.git.unixbhaskar@gmail.com>
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

Eliminate full to the script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/gen_dma_funcs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/gen_dma_funcs.sh b/smatch_scripts/gen_dma_funcs.sh
index 7346963b8529..1a3fc5f0d612 100755
--- a/smatch_scripts/gen_dma_funcs.sh
+++ b/smatch_scripts/gen_dma_funcs.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

--
2.46.3

