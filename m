Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9F322370F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469558; cv=none; b=Pg/sOlIXPJoi1sFMM5w2caqQZXW2HBfSnW8glPzOhyRZ+pwCdCi0II/EWzeMA7rwECB0bEgPM9FeqVnIRU1LvUvL9RNh+ed/uDGGpsO3AukUQY6GscOONef708QKC9bL12bg97vOvgyLNG7koo0ZxHzFJCaneIFCq/xHib4il/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469558; c=relaxed/simple;
	bh=yyebnnYOMbojsKMKGZn7b6zqWXbtEPzDW9iqHsQj194=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pd8wYNLRs4lBE9Yjn48RqQWIYwgExXbFXbGCISw7lwLn/vqoyn+cRZE1Mcd2spIDJW1E9VQRW7z95PMvTGip/+l1DJPIsRIb4tYXzpaJlOCAJa6TpsJLMPPXLDaTVTAJjToxPigQOCuDVCXcF2jmdv8G77usrCgFQ+kjoPe6s0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xyTS/0IS; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xyTS/0IS"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fab54e8bbeso3798276d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748469554; x=1749074354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=omqhGSOmEXdWEk90xAF7uWs/RUMkuzL/uGHdLMr4fAc=;
        b=xyTS/0ISigjpP7Axm6ewGMGQrt7+CGWL53KT49AcWkNAStpWCOxm6B6xw8CRQYmE6D
         9W0oPyepbxSE4hZMnWx31r4QcqtXjHtR7KC4EvM0U2Pj1Ld2VWOchAMgWX+1z3T9Vp43
         0zF+ckASBLohDBX8EB78mduf7cQPX9/50uBs4atvDYTEa/IM6A7QVMRSp8WH++BpoSr8
         zkR1HKXCEOS15jCK13yrI84y3OtdnRAxoENi9n3+4cOqyUv7mMFyigaaEGFWS27FwDJB
         u0Z/YwSgfGQEEJZD8Hz28g/Fib3UBGkAvrhQ4POu2qt0tto9sTem4fVp7oEkT/GwrnVP
         AQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748469554; x=1749074354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omqhGSOmEXdWEk90xAF7uWs/RUMkuzL/uGHdLMr4fAc=;
        b=KaOrtIdxUFSiosVhX3u4w0hj/TcsMChEyX83xIAAE984+50uI9zvQhsetBXLW7GCcR
         wwgoLKg4rHeY1Z5ODuAx3yzR/CIg6h/V7VcWa67HwtiByG9MekEllGT45+XwQuz8v/s3
         QDXdBOEacQnaOAHJH/tFA3oPsDuPkrqG+IJAh0FokY8kRRqTN35JNKvzHqU78v1R6zak
         tsnbw1GTn002058eYIXWaI+fp3V29lcYfuMuK/5VGtItQoHGlCwviahN2xKmhul52y8v
         fyVJo3LRgaTNvY9kBmIreCDwGPT1lcqPn+yn9hHygXkXOEcKglpdfTPBJFso8zwI7cL7
         Hj2g==
X-Forwarded-Encrypted: i=1; AJvYcCUZbIceAjBnsIMS7umaqkezXmJW50nnvNqWFdVuIxr2UkklwdA20Hnh7vJb07n2R25h16Rr5GWyc7ycNkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSL3j8gW/t4uIW7jQ4sbmYQKr+19IiTSO7OHdXGAhi1me4FszB
	dZqMu1loWiTaOaH4B3X/RIlc4jtL2QXN+WKQoGtzUOvdfWOKZVgLcMRix/voASS1/1J6hL7nqQx
	rTbQ/lpRYiw==
X-Gm-Gg: ASbGncux2O/t01BL4wuOyo7NwCU8qt+BjTwwGM3V4n/487n69g/JXEMSZK2+HTBPlwW
	TrJD42vLA2RjFAhsHtEsaZHLcQUbyND+YVGyWiwMlzJpojfqirSXtYV7NhaegD/mDFMxhTT3M4u
	WKLRYDWS/Ohn6X9sIkOSmveM2mtSO8OmOJgJ/oIo3LDvq6hV8zdRiqvc8cWR/jdsf6h+vsstK+R
	6H77hloSgO/wyNDroZrZVnIwiGtAHLfNGKv5/WbCeB3QBmoJC3hb9Yb/KwBHar/t20FOvV+EH4j
	XHEcch2P54HqtuwBIM7ADv9CESgjAtlNqB4V7VMcqfKEQncS6w==
X-Google-Smtp-Source: AGHT+IEeu/ru0xTIC0/zY+95mafro63ViqPTFWl+O1vbQhm3YH/mab55TTmjjT4Phvr/wnuUzcgNMA==
X-Received: by 2002:a17:90b:1dd0:b0:311:c970:c9ce with SMTP id 98e67ed59e1d1-311c970d207mr9821264a91.28.1748469543377;
        Wed, 28 May 2025 14:59:03 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b9337c6sm119747a91.31.2025.05.28.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 14:59:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH RFC v2 0/2] pmdomains: core: add support for domain
 hierarchies in DT
Date: Wed, 28 May 2025 14:58:50 -0700
Message-Id: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABqHN2gC/42NQQqDMBBFryKzbkoSjIauCkIP0G1xEZOxGdBEk
 iIV8e4NnqDL9z68v0PGRJjhVu2QcKVMMRSQlwqsN+GNjFxhkFwqrqRmy+zibCgwT5hMsn5jMaD
 FaWKmbkbj6tZppaAEloQjfc/4C56PDvoiPeVPTNt5uIpz+qe9CiaYVqLVvOXcNvo+mG2iIeHVx
 hn64zh+6Prit8wAAAA=
X-Change-ID: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=yyebnnYOMbojsKMKGZn7b6zqWXbtEPzDW9iqHsQj194=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBoN4cmQojOk3Ihl9E9SAPUH/nPBbWT/ptBi3GKE
 yto3X+2wKKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaDeHJgAKCRBZNxia0/vG
 ZReYD/0UiVWQ8Gm6D+kFMfawkv1wkZcTcoS8aCapvqjbHOU06U54DLhNtqjXVwJZN8SdGkWEzXK
 XCUIb+sR+91FDipIxCQWW4Y8S7xrFpCf5OWEmpXsgNsZtoqa8waPcqpuZo5ymhwZQZt1DxXQCGs
 q3trDyhh1vm5jKR0hWnfgBB+O1xR5IHdAIxKrup8TyeSq8xzDaKWvrhLBAFcbPmQz3FHMOJdXdW
 De0UXcS362k8GBVHyvaRYDA5Y4nG5pmKh5ekpFtw4GEBmojphBna2wZ0IQYgdZVleg+fBfcmymo
 WUNuALb5gFUn5lvQQitX1wqw8vcvmISdmJpUYO7BheCZcJhZDJd6rtO8R50a+6utWe2igSVZJ5m
 bvSHn+VIScsCGcHoQlkBoCBZIYsj6OknD8FC+NLhIlddV9uoCsGzXiu6mRfNPtiCTATg37LNJS9
 Wy5CE65DeVd6UJceBPCa9izXgMWcmHGh3bN3Q5E4V8k8zdBiyG6eR2ZakDWkyWYPQ3PU8z38tTz
 M9Kn4E1+0Henp2Ks+cVffVM3wqs6DFwBAhu12AqjU0UzuD4y6gTCmHwYOpqc0ucR1lJ5hfZKcll
 t6oIbAgdnIMHgTK45eRmxEeOFrcnfMqmpxIXGCfzNPA8+aHRzZuPSjGDiWVnvsNaxu5obhE3q/+
 8tZEFD0oL5da76g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add support for oncell providers as well by adding support for a nexus
node map, as described in section 2.5.1 of the DT spec.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in v2:
- Use nexus map instead of creating new property as suggested by Rob H.
- Link to v1: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com

---
Kevin Hilman (2):
      dt-bindings: power: add nexus map for power-domains
      pmdomain: core: use DT map to support hierarchy

 Documentation/devicetree/bindings/power/power-domain.yaml |  35 ++++++++++++++++++++
 drivers/pmdomain/core.c                                   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-pmdomain-hierarchy-onecell-a46fad47d855

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

