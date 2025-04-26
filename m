Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B87221719;
	Sat, 26 Apr 2025 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745670204; cv=none; b=d2Kx15YobPILnfxN+76E7Zj6EvVxMY4RwBvdYR7+QFXnSJlzw2iUKwAkXLztP5L/Nj3GZkfSTsy2Fxnrcf4H+5jpy7Z4drHx6GAiI+dkpV5rSb7ByYB7goABomiPCu+J3rF74LVK0kU4YY7nynZ9be4IcyizyAgNRmtU1H4dEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745670204; c=relaxed/simple;
	bh=N9abW1lOZDc+B91BOCRly9ah+nCCCdochLw4pC52qyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urOSSRrhxYSmpqsVjP56LkCS1fpDQE1JlvikO/utjaeu6+x7ODxf5lpXmP+2VD5zHdBOBXX+romru9mEwuVwt2aujU2DTW3ydgyyTOaB3j376xMeqXlaX0KOd7hDJPh2jFLuu7ukqNZBKf3EQG9IBG+a1M8TALU7gX6AOGfA5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEA8gJWc; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEA8gJWc"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso5058058a12.1;
        Sat, 26 Apr 2025 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745670201; x=1746275001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlEHe5Mf7pIzMqaAH5RZWW7mKF5X71NbDyCS4gm98zw=;
        b=fEA8gJWcUCRgavrp9lsj5+iXj5Ph+utF645bf4c8Ju6xtXcCVo7GRd2Wn6pEkFf9rS
         NUMrk0kozXOF+onPv7TdB/2BkDE7T8hLHJEeo1zZD9kxBFDiqv63ovh+sjVNZxcSFiwi
         P+TQCzK3FSyHTRQps8oAC9Qc13oPQXtd6aK9EM6zYhMg0yCtvLRhfhjynbSZnuh399Tr
         H11R/j8xpQKu2eK8D1T0ng7T5zG5yrEVipNcWO9wEExDhMAi775Wfcz4yq/pmgYPFD8D
         X1ab7maAaATFs2HvM0Ys8Gu75bMTjK8/sN2JbDCS/YvITLxEWbzqkgCVk/uYnLZ+ni0O
         ru7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745670201; x=1746275001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlEHe5Mf7pIzMqaAH5RZWW7mKF5X71NbDyCS4gm98zw=;
        b=rUpbm3W4plUFt1QWHDAQMRu349BWXIenvT30vAxPjAl9uhRgxps5Ub8MBeW5Rfi1HA
         KpbUmR0IZceOYl8g/aBN2dtykAq+Arw7Hpn5EYrcP3SIrW9ej28kKmB6vhdZLGBUISgh
         92wzlZ+67T9pwUcRo5z3WIgyfQACsviuK5+ybwhKd5/CoNnJsa+NllFtOppN++EtaAoy
         4OOX4ENRnOIXMlChsynZco6e1nML88KOA2x6bc7ClpVp9C85JcZPSL9k+R/iR3R2FZCO
         JjC20BrcXRERk8jG1+119PeNzOeBkzCbwo1yvqsmt0Zcs0SI4ZXbpMOqYhKadaTOt5Or
         PRew==
X-Forwarded-Encrypted: i=1; AJvYcCUyMbBfWM1l9nkGMoBeIomL00bofkRc+zyw0QF0ZzqP6jpG4Dxdg0SyCzNaADimeExoOwD7XtdAHdVkF5Sn@vger.kernel.org, AJvYcCX+28uUhexyx0oXsrQxmyATyyQ1DmBqObAQCLVa9wN6o+B5msWS9vIbpRUFL3UwH5wcx6t+b7Y/1Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfO3UodSZFoZMlEXoULtFNOFSdCoMYdUv7E/02wFB4IaSBwlLE
	R/m4/osapSrJ8daW5iktN032sxE2a85no91eyMR3ZpzdyEwhea+h
X-Gm-Gg: ASbGncvubpEZLyMgTWrxQF2licEVGH0YgyMMLWz25PH30aHHumpLBmDnpAYppCFsxIL
	MZMxjDYg5Jm0Qv1CiwDTKhmt/O/urPMXP1+IHbejR5c+evZOD/ERjQuYzPDRYfaqPfuLQvmEJJx
	vD0ph1INYJ4m1yH1LstZT9rFtocUJ5MNP+sUmk5NEDct7tCKRw6S1VHyZEdEXsmpE00087qxR/I
	ysm6xuqlBgxreRxA+zgw+Zb5ccBf8ChMBDkEwDxKBjbki5//F/YyQed7ORJDtxNSy7wymU+sHTy
	Vb58PLscD2OipNAJIAGoxj8o18JVIhW2RhNFqErFA77o8W5rQg==
X-Google-Smtp-Source: AGHT+IHwgMkPsZH/36tTOE1Z1B+hEOgMAfZLu1qKxmPXwC0LWc+7uO4GJlB51CYIN7M/tlaXfMJ3Ng==
X-Received: by 2002:a17:907:3da5:b0:aca:e2d9:41f with SMTP id a640c23a62f3a-ace71425c63mr500343666b.60.1745670200387;
        Sat, 26 Apr 2025 05:23:20 -0700 (PDT)
Received: from be-Latitude-E6510.home.local ([2a01:8b82:54fd:b800::4bb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed72826sm278745566b.154.2025.04.26.05.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 05:23:20 -0700 (PDT)
From: =?UTF-8?q?Adrian=20B=C3=BCtler?= <buetlera123@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adrian=20B=C3=BCtler?= <buetlera123@gmail.com>
Subject: [PATCH v2] Documentation: x86: Fix a typo in fsgs.rst
Date: Sat, 26 Apr 2025 14:23:03 +0200
Message-Id: <20250426122303.15905-1-buetlera123@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425135836.19081-1-buetlera123@gmail.com>
References: <20250425135836.19081-1-buetlera123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a spelling typo in fsgs.rst.

Signed-off-by: Adrian Bütler <buetlera123@gmail.com>
---
v1->v2: added Signed-off-by
v1: https://lore.kernel.org/linux-doc/20250425135836.19081-1-buetlera123@gmail.com/T/#u

 Documentation/arch/x86/x86_64/fsgs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/x86/x86_64/fsgs.rst
index d07e445dac5c..6bda4d16d3f7 100644
--- a/Documentation/arch/x86/x86_64/fsgs.rst
+++ b/Documentation/arch/x86/x86_64/fsgs.rst
@@ -130,7 +130,7 @@ instructions. Clang 5 supports them as well.
 
   =================== ===========================
   _readfsbase_u64()   Read the FS base register
-  _readfsbase_u64()   Read the GS base register
+  _readgsbase_u64()   Read the GS base register
   _writefsbase_u64()  Write the FS base register
   _writegsbase_u64()  Write the GS base register
   =================== ===========================
-- 
2.34.1

