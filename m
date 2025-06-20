Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB20243969
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460528; cv=none; b=omhijvJu9Ud9B6rTFKrcseUF3rHoOwwZO+QC0/RwjqGvIO6p0Cg94XbEDQCKE7btMQZ/Ke2BFIUtCA0Ib62n6TKpWrA/7CAsA8AfE7sN89+XoXe/VOUry4oDD55IpYkCeE/xtvG9H4r7WglAVaN1QR3jLC4EP5HkCXvzGJPa/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460528; c=relaxed/simple;
	bh=VU5ve1vXDz4vEnUoQ5DThRrS+FaqftBC7adiCxqhfEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bpnzwyz0axwmdhIrjFpbOTSPR82EGvd8VmNf+IfRIKSDXF7sUgvfA4VS6reFad5YN96o+Lr84HM3jn4TvDNPDpOrvA6hUyanjeYhc8gbJ1j5B2pM/zMcm/W690Wb/Q2Aho2sVig1S28OPHAtlRwMwssg+OPpviJV5g27exB1RYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1s9XFGJ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1s9XFGJ"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso1911106276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460526; x=1751065326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de4qQV+4u4zXoiMEHXM5DE6gp65EZeEI+U6dIaYnNb8=;
        b=W1s9XFGJiwTvNvIeVlhwKgfvLd1LsEIfhsZxtmbFuBrUV9pWv+BQD0VRY8/tJz8L8j
         7ciuVkH2h+YsU0Mi3FF6+9cdyDDXak2mCTmMr+QyEkm2SX7aZc7dtV8Kr0OYpGnBxgIq
         HW025U+ZnrW1VKkguhqJrQIdPvUYLLJWbaN6MfKXYi4xMC0KMKmRNiQdnyqHHUtBfykg
         o8LZXqDIOwg312l4+fdj0r30R6K4XwXMBdnOLbpKWHQlN6rQycHBGN8aNR5snhAwNekq
         pENGszDVixCeBncRqpKxRk0uD0g8mLOjI51SuN//K4u3KNE0uBu0vgd4kJgIUm7xizjU
         Xcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460526; x=1751065326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de4qQV+4u4zXoiMEHXM5DE6gp65EZeEI+U6dIaYnNb8=;
        b=wkZ4mInSkkhRGvQCuwAkg5RmEm4P8Tx92f4w1JsyFWfPZf1vA49gGyGF3Pu0Te8gEb
         uvQuZWChTVrN0QhPLm/jxPlQZ1MlfQVtpHNiW9Pz+an3g3TbNIvuOPOn3rnFeDNiR+9y
         FJF2aln4rEL2tFHpfuB3dAJg6nLChu9S8CbhUfEJL4oke5OMv2HQRtaP5GIJkG4j7nX8
         iP1sY8kZQfsth00aiIn0OO6x3UYCvIiXaGdeVVTcLM9Kj6NnYgQ7kI7YS22+ZJkHVaQc
         9N66WDwgvRkHASfAUrUHwAl+X0wtosy5V7QRsFDH+uadT1qkOT7nnB0O3HnQS7IHi1Nu
         Lj+A==
X-Forwarded-Encrypted: i=1; AJvYcCUdUGtbHUZPJsq99t9vHqYqUsV0hsNEYmr1XlJLrxVagPEpTxgbRwPl4Exeq8X27bBGC3gT770R0BjF8J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NCji935pvQZKWLFN6iuDJMrf2b/2dLNlU+1cSB92AO3qT5Nh
	cadaNc6nVa80hqudx2Jme6HaAWEtKTQoGHyNlYN+KK3AC4WfRhtdYXTM
X-Gm-Gg: ASbGncvMndsTKPJpyZTYZJU0xqfWBwoUOUM4qS9ZxLSLtUol3oHZ0UxHfpySqZgQt4y
	JOQVGSZIR1qtIpa0wmPF1TOJ0TsZMOn48eT4FN/aqqLlPzSn+ca21Apu2hxOCjtz/Xi/MxzIY/j
	yIQQRNN7RZO4fkj6PNcI4t0RgOcQLfh5hTsCQcczYTvR9oltrgNLgBEfHPplSWAwi/0FvwDoRfy
	9BdF3vjgPdtuAFBvDPKcY0HCrdqxNanW8fVP2qW76cWNMPa/d3BzmFIplILr1s2tKWPgUbW+W2t
	/ZOt/ic9IbO02yvisGXS4bssXUshQ/Svt9XEnIkazxWSUsGwQ6x6CF8iD+byVN6qGwr3nIh5/xX
	vMw==
X-Google-Smtp-Source: AGHT+IHvoccqPD3JKtr4PnNECJV+A2rPWgNXNHrGRlM+Ylg2iEUiB7MSphrjBWo/D2hxkIsdY1VY4w==
X-Received: by 2002:a05:6902:161b:b0:e81:b0ae:43c0 with SMTP id 3f1490d57ef6-e842bd03228mr6848828276.27.1750460525894;
        Fri, 20 Jun 2025 16:02:05 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:05 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] Again, for the consistency, eliminate full path to the script
Date: Sat, 21 Jun 2025 04:08:54 +0530
Message-ID: <a461f2b5238756c909be2820cd7225814d35b5a8.1750459100.git.unixbhaskar@gmail.com>
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

Just for the cleanliness.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/gen_allocation_list.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/gen_allocation_list.sh b/smatch_scripts/gen_allocation_list.sh
index 20175624bd64..3dac0bc0b0a8 100755
--- a/smatch_scripts/gen_allocation_list.sh
+++ b/smatch_scripts/gen_allocation_list.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

--
2.46.3

