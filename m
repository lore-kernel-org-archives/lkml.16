Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76630241116
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460518; cv=none; b=HXMtIUcMSpO9uruZN6aoOAgp2CQfopR4u+I6zXxWJvJpnANJxK/bHek8fpoNNix6EIV067IMSh4E2gWHseeVseA55IFXaaE9lNbk3xslW9+pNVAjdXkBcDQflhx+bEPtReN1/fPsVEvbrSZa2NF8FeAmACOFjgl1HuFclIARd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460518; c=relaxed/simple;
	bh=hZF2/K5LUC1X6Ro6SUAnPmnqhWHkrsl3oAupIaU8Ibc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jy7XwYPtIEPYkZou/4ZgeAVx2zVHAHev3obb6p89mwbZErcsIzQwgSCXWK+O42Q1d3et1de0nL1t7lPO5kyYRVLG4wrOk/jO5fcddROYgt5lbPtngrSOKW+RyxnEBzW5CNbrxRXQAGo8MsyQmCTeUtu3ZVpn1rpBIdNqNWO3v2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXiXfseC; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXiXfseC"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso2224990276.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460515; x=1751065315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wo2J4qkP1GaTlr0PKOfpFx/Fh4KIdWYU8BmTs1ZbZs0=;
        b=MXiXfseCGIQ6E9h5aK65cSeGNDs4b3E9VTEYeTC59zGxe3jmOSu02WHALWXn+bdIz1
         cbX0Iq187J1kLtP1Jm3fplpLmhiED0EpYb5yrxFstSTmngefoZ1XufcxEH1awRgxMbGt
         hJAsIHXcgEhYIbRYpoLxvQov0O8dBlyRMaxmTCJmE3Jj1eIRHUQEOoSGspBECk+xMIfq
         lXsq0dKcK5FulCm5Hq36Od/XynJKfYECc26W5USfSYdi8KwlG3n7BknyzJPj7yeFtNB6
         L1Lr6I/QzUHFFeR16K/ZDdgUIEaYZeum2872aavqP1+CT4EbKAkZLnUA4uY/txEJ8YBT
         fV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460515; x=1751065315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wo2J4qkP1GaTlr0PKOfpFx/Fh4KIdWYU8BmTs1ZbZs0=;
        b=xCAoTDT/JdMbGj26pgHppnmtnRgT50ZjoTZoNonewjcziKfQuOxzANVw1ixQK1q3Un
         RHQ2P/U7IwUcp9dBule37gLkZpM+20PHwKlhsQ016ct4hm0cLHyxKpSV/PgJ+HeDnON/
         Pr470oa/Y2EdLyiLzfCn9kyEjBoSGKLzPI6Qnbg/cHCJ36hJYfCe6C//RmnN0S5c/ge3
         H/g0KAfTtQpGBf4SLf3fj6TTb63MJs8UL1NzEKyiwAtmwGiz+hr3iS15JZ7nrOOzYqWw
         uftDPtdT2kfQFU1Q7vwQkTahPbufRzAkKCBIIrCyGL2CkRdOQJV6gEtL0L9UhZJmfBPx
         6kUA==
X-Forwarded-Encrypted: i=1; AJvYcCXS/HE//4NjmIqCh/Zv9hWOY38Y938mvrizYQ8z89eEwoJThsjKDxSjHQ1UfPvDMu+Olch7k93TinqdKSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3JR2scLiyuR4jEzz0Fg60DO184gYPwNZBXTVIMZgjtogb7Mz
	muNoCF8kuK4NArqUENIJ42CE4MYm1j9X6kF5om3u9oja/pdaVWmF2NBo8P4Tt0qT
X-Gm-Gg: ASbGncvloTCX5/k9ojvWBFzeDuc3D1QM+NQieyhWEXH7XNbZK9dQErFa/RUw8QaYOjw
	bh3mvZLCvrJXAyzIxVf70SwOuJOERost/tKz5Mu3swE+LYSHCfyN9LiSTX0Z4CuHpckvd8vegCh
	I1rCJ1ZsgGUvmREMTRA8PQSskChrNQER26k0GQu6abpdoDXOaXgp0aYKCM0unhdEMVQS+x5IcAB
	gUFFbSHK4t/QV9y6MJgPo5/rzmdIDvZmeg9pcApRv5zyTxAfgxt0jmoF/ukynBJe3PjJYgdgnoh
	MpWg8iu8Jxos8uYJU1P0p/Ipx8bV9T68IUW0tzK+ZX9O8QU+8PFzYY3R9Ql+fztcZhRgkjLfVx2
	fyc82V+/01Hsl
X-Google-Smtp-Source: AGHT+IF0TEeCkxpDfY5j2YO0G6N7o+6FuOVUXfs9uSl0UmsgqRFjr9EOr1Ys462MhWHZjCY+J0brVg==
X-Received: by 2002:a05:6902:18c3:b0:e7e:fa65:8fd8 with SMTP id 3f1490d57ef6-e842bc88d84mr6273130276.17.1750460515297;
        Fri, 20 Jun 2025 16:01:55 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:01:54 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] Replace pipes with a binary for cpu core count
Date: Sat, 21 Jun 2025 04:08:50 +0530
Message-ID: <919ba691212bbc1436ce1f54ad072caf73c13022.1750459100.git.unixbhaskar@gmail.com>
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

Change the piped series with nproc binary,hopefully for better readability

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/build_generic_data.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/build_generic_data.sh b/smatch_scripts/build_generic_data.sh
index b18ceff8320c..c88ad3fcfc0f 100755
--- a/smatch_scripts/build_generic_data.sh
+++ b/smatch_scripts/build_generic_data.sh
@@ -3,7 +3,7 @@
 # This is a generic script to parse --info output.  For the kernel, don't use
 # this script, use build_kernel_data.sh instead.

-NR_CPU=$(cat /proc/cpuinfo | grep ^processor | wc -l)
+NR_CPU=$(nproc)
 SCRIPT_DIR=$(dirname $0)
 DATA_DIR=smatch_data
 PROJECT=smatch_generic
--
2.46.3

