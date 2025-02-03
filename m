Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341132040A6;
	Mon,  3 Feb 2025 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585143; cv=none; b=nNfBfruNyHJ47TWySMtaY0mBsv+ldLe+fIWG9ia7Kwk0qavbjuyOSK5NAogrgJJdhjrdXgFf9Y8YTepAecs0stiQcraDqOb9b9ZXwbRWP5+Hns13IavrzMg9V9TjvpiJmhtwyxNY35DNIhXs7xF6rGOk7DYnNeSzoO16MhqH9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585143; c=relaxed/simple;
	bh=gYKcWXUm7TPtu7fSQ5BLEikLENt9Y26EUFJAZBOTauM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvTDLdZlbyluZKV2KBjyhqLx/QHxZeeuvBDO+4W08QswQZbVVYDZ0RpIC9rMkgIvzhsSj9ZcKQYN36NgoE4SAlYFJyVVOrhuTCyUL49HvdLvHjF1lqvzKfpLMIbOkNxheIFIjYaDl3M3Wek9TpqGA4ql2VfHIsGhBw89QFY6P4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/Vy+K1Q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/Vy+K1Q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21bc1512a63so81539745ad.1;
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585141; x=1739189941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=;
        b=N/Vy+K1QWJ3G3WpDr1frqtAuDkrhi76mhPiUJOjCamTNXWavcmA8tqT//fDQjBGY7Z
         8HYLMBmRQAOUJd+9j/YmHLnoAwx4AZQSDjxgeJeVG+fPElrFE/ovbHOjnr1E+vRrUjl+
         kmb3t4t+KhANkVyBK6AKS+CQJ9GdzBP5Nk1/NUwEk3iogiakUSjvpJBpq9oy27EDYlh/
         aEPmCu0C15IymfAif16uCMTesGAOnnDoB4A68iRthfHpQo2Pl4QJZBMotYCG1SPkE+a0
         X+1kFXKJPKoX9if3kFbapoK9VsTNF6PW/orKtGDcwsPu/96nYAgHmIfa6xDxSH6Ly2kB
         8Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585141; x=1739189941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=;
        b=KFtyAUgp5JWezXnbNzWbYX9TVdRvdiF5XHQNvyG0X9d0mmmtzF+OY1Kc5UHx18mfQN
         FQEi9EwYuItgMHyAqaZv2JjWiK2/664Q8XHaNwS/tSX5e8GiKaxV5xCJbfEccdfI8t22
         r08YuNIOmnNNJCWIaTsbvqRY9lMBHIS22pAet5hLJjzc5calLUCZnUcluF3goXQAXt2X
         pyKAS7ZwxlsDSPExwpoRNvsk+G/RrjUoBBCStvCOlvdf3iA9qtHbb/Fnvr3bjILIzEKv
         zCbO6VVn0U4C4+4qcqF5MwQAPcmUaXAgOs1tql45KgNCCJU03wjkawVyLBl31MYSujWh
         3rlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiZALAnCrCSKF/miCBUn5XAhcCpN6EzCs08ooPvQnhQrCZAkcKOCFSgFUg0l9eomXmWPEmel7YV/re@vger.kernel.org, AJvYcCXLNOT/gHifI2mbXOoshHCjNuVEZ1yU6YiohgKoMMy2Yo96sHSelaGFwF609OFJSotOVKPehthZvfuA3zs8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2mi4YxAaRVw0q+CJ05oQT46SuijKf6/Oi2MJL5Cp5P80EqEda
	+G7F1e3wnKx8JxkOkXDBjApgI0Ctg7fcoqpwA5nLJVHDKdMb0yy/G0CPVg48
X-Gm-Gg: ASbGnctK0Sojg7wcLu6rSSTBTwI/uZZ2t0/Fzp7cPSWgGsvu1xdPZavBEF222SH9gpu
	MfV6lxj0XsTQOXXNuEmdPYPbiOvMc0c3GhpdqFSEeWpJ9RMPzU6IzU9G7wBaZ/JBelDVrjutRyF
	redh8Mm4LeEN0Pki/LLB1OZr7e1G5i1RTSj83RbrtBegyg9Izzrp8ZYqCigZJwJAi9CEgWMQU1O
	6ao0oaNQC5oInFO24w8EIgMGrSTz6ijn6yUVFeCIYLVoI8DVQVKyccSphqAQsgL8ZlK0Piwccu6
	sawsd9xL5azfvbJz
X-Google-Smtp-Source: AGHT+IF++I9XnXiFEGYHA9dEu9o41bfGAtiDlH7AxvFI/EqWBiAjKHlfZu5h6CMES1Hx6Nig3VrSwA==
X-Received: by 2002:a17:903:2f84:b0:216:3dc0:c8ab with SMTP id d9443c01a7336-21dd7c4976fmr343221115ad.9.1738585141430;
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon,  3 Feb 2025 20:15:45 +0800
Message-ID: <20250203121831.36053-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.48.1

