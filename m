Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC224635E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460532; cv=none; b=aCdMIQrOHIQZ5BeVTnVQGjyDAcmrq2rbpJaJSgXLZ5ekbbOh9PHjOw1b3Ybw9FcLFzwHpIq+MjzjzjM+jFTpAuPeR/fQRySeK8/ORSSVsir6K961045dixFSZ1NB7vHsFvjk8B0WrdkbDNwvnZkt6fpkryfD3k87wV16/kNnLvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460532; c=relaxed/simple;
	bh=ctRqnhUwQjPPmpLTJUICJ9v8xhclEmGaCkW+nnKiT34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYH9g1uH8geqKXgHuJmd4FLcQu8/S6gGRpYktPkfgKQlZQBYEggQ8Htio0WOTuyEwqbKnH/ULNCPQDbG46CgIgsMv/jltBfwanqZ8B5wTRIzewPt0qZ7aq/ANdRsJqo2UQenbGp15uOOWE8MUdMlAM4Pc++ALmCNaDho71N4vSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXvMoRFe; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXvMoRFe"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so2202548276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460530; x=1751065330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vTy6hl1Htn9gwcL8f9Q8LxgadhkXDRzvlPdizUXFDA=;
        b=SXvMoRFeAp0NNwQcLQ+xSLGjkfIlbQRDVl3i197spAuk23FEY4lSne02LrGP+7J8wz
         Ug8jjRC4+tE8FPw1uB1MDLNs8vnQ52DfLl+AVkCKf6V2mgAMlM1fYoWhu2wpIoJuiiYY
         uOWcQzULqsFk5Pqy6JsiEFAoH7JmFzaX2HF4H4W4W9StoH8LfYFajUEIm/FoEglNgQRM
         RLORQDrbr46JqWNlmDsFkAgh1yE7xgB9Sjs+dCIVLSIEahwgpz1Ydkp5sxnNh9l3w6+X
         wgLKnNbTdtvVOPkzza6Eri7FCgL4sYsO4zF1DX85JzRtUjG5KBLHZa2JW1KuPx9u0MQe
         u76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460530; x=1751065330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vTy6hl1Htn9gwcL8f9Q8LxgadhkXDRzvlPdizUXFDA=;
        b=gq///79h8wCbdZcrKabgjlBoA7sgBkxVY2vwsBA6WCDLhqtaljRedPsj0sSOrr4PZs
         oPYr+gMMb2TQ+3pTFHe1eAqMGfmgt9AUubBTvqHBY4YIUY+kyNutHW9Gycx/r6rlfRw0
         a+nXenPR6G5cQf27HyTZFMai1s8GbrtZiBQz8gBmMiYWm3ZtGJcPuEn557y7K7svbyhY
         l/yU/+e+OVsf+tLRxnMHZHvZhvXfr5qO4veOSMrPST0S634uYYjviApFgL8Nr2ONlYCh
         RzExFjK7gZV3GtliO8NXu4TfZRVnwx2GdCPmmAgfJeXMa9B306HDVVKVxpxwJgSvQ1bw
         3KOw==
X-Forwarded-Encrypted: i=1; AJvYcCXX2I8RCoiSegkhf60C36z3yV0SoTwUM2lpmfgCVrgQ9pI9QKZrmEpN6zRvRbRM0aAmlhZfX5bY1LeLFoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/mi4xJDEIxA42WG45tAfUORUsvJCaaXZzKaxvVXgxp8Kpf03
	1HFajphjBxRqZZXoS5dPagjF3sqUuLByeMCRHs75k/qPvhWrCZQhqjPG
X-Gm-Gg: ASbGncv2IaQRXgIyQutDsEKx5z1NTvFKetIlTDyN+ukg63ow1rwTecrkkNK0qXbwxYC
	dPruzLjCrOk5dps3tsCraRdNU5m7MYu2XsxNA/CfYqQhvgKRoCn+rYVZ5IhHKgYXQC+oCa6Xh7f
	g6FOhAdX5PQZJPdQ40MuACtSPLeyNTAfnX0dkoJuOxFE9vIRIgtGLrhnRoabjneDCbP1Ui1PVDb
	VV1t6pWr1MeI2jkNxd6j7iXJycZtr2FK4gqvAG965QblU7OrDwh5P+OKdayWpdDLgQhnneETVx6
	GUGlvsAECFL7E0MHKq6sY+OTmNxX2GLL1dv+laxQOqDyUVRjSNPNxYzN5/dFHCORGL8t4J/2pG/
	uDnDmvHUwaaOZ
X-Google-Smtp-Source: AGHT+IFuG15FkXuCGVi0wMLzlkNfhtvgOLDQeSIZoj0U5Sby33079WKOjEpnECvjD1pntkhtRwnIjw==
X-Received: by 2002:a05:6902:1509:b0:e81:9aa9:88cd with SMTP id 3f1490d57ef6-e842bc6e2ccmr5707994276.8.1750460529622;
        Fri, 20 Jun 2025 16:02:09 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:08 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] Trivial fixup to take away the full path of the script
Date: Sat, 21 Jun 2025 04:08:55 +0530
Message-ID: <aa46241bfc31b28a714029c114dad8fa3a62cb07.1750459100.git.unixbhaskar@gmail.com>
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

Just for the cleanliness.Full path to the script removed.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/gen_bit_shifters.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/gen_bit_shifters.sh b/smatch_scripts/gen_bit_shifters.sh
index 98fa30ca205b..53300345a3e0 100755
--- a/smatch_scripts/gen_bit_shifters.sh
+++ b/smatch_scripts/gen_bit_shifters.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

--
2.46.3

