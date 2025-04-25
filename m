Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148C1F3B89
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564095; cv=none; b=IJVU70lTPJAKF7ekeowTMAp4z/+IxU9yA00b4HasTGzaGxKb49FUDfmn43HRa6eRZkC5/qhli1G+wfILdX+ZXQi/pi6pC651EQ16joMsSttLVxabnyXYoCvIm9VsnxCJWl7WQf0Id2DrFaOTLTv/MFWvatryr3EkcFOGMEpm2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564095; c=relaxed/simple;
	bh=wrp+qQuWlUupp41hoMOdlY3AQHo9s5GplgWfkKeseWU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XRg5C46VOaLEuD98TK2S8aUBwTfr3Z7fHw79M6slSCC2mGcbl5KvRPZFm7P7fL+Bw8rOxH9XdHbrmvwnPgfdomihJ+VVnaFTTOrqNFSOCg3NrK9eG7EV9R7roCvQG1pmDz/HeuiHDU/3n9w3mmYIdojw0Kvi/dnJNfWtFGqhUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G45Wwckv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G45Wwckv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39127effa72so245250f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564092; x=1746168892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBJku6dnbp/sa7pcKwWWMxlajZ+PUPyAM4LFsPnttJs=;
        b=G45WwckvIY6CFvy5AGs1XCMOaa5mxG0vYtdcakqQRqF7D1ckLDiHLpMowMmK5YqXne
         MaVBlupE+JGUjO8tZB6fCP5DRf9imZp0hZcKnQaDCI7Kxbx/xNPK2OHyj2To9utgzsPb
         1hz+J7cYg/vegHApJtMInQ/2gvUiWeJ5HiWFWWtzZbtAt76Z7ffgjY+29n3EWNfV4LI0
         bJU1/RT7IFT8q5biD1bpgXRNDsH6XMmGaGy8kiW4MRG1Z6wnQyYgsFw4n8C4M9LNNHNp
         kvmLQYYhvTTd1LUI1S4MB0XcTarImKlEaQFiQd6WR28gHKTuPfO/g45yL+M8pPC9XH3s
         NIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564092; x=1746168892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBJku6dnbp/sa7pcKwWWMxlajZ+PUPyAM4LFsPnttJs=;
        b=Db6etp+3L14dfp+gh/bgmk/+7msiGLHSTb9V1fM4ryrIu2gaAor64s1yAjV6qyBCeL
         QneybBBubexeNoTiUdRRB2zkJDmTBQB8zBRDeMpCNoy7tybC/Uk0cxR21HihBCyrWQIe
         bNpqTKEyWwPLO9ifbDOMJPjfnetjHMBS037GTARAfRcopYfBNQD/5tEihov/+rb9Inpk
         87LxLSopuPPQBQ68VZAvJqcEoXwfkWiO1xtgEiOorKm4mO7B9HBl4LRqpmWQLo5fy7Mw
         Y4bsX+ccTbBLZ9XCn4iiFiHiI3oF5UGgEbUYY92vZqBdEcrQg2766PG6RHF32sz/YA0+
         FHEA==
X-Gm-Message-State: AOJu0YwoGYf7eV+UBZWxxhogKwTfkHBa7GVOZ/fZO24/iMvdV94wOquD
	PncrDSGd/M2TZ3tqR4JMgLxwLwD/F4yfg5vXUI8oJfT2mKk6LNpqWhAdb2sBCyE=
X-Gm-Gg: ASbGncsfgfEIKp/M1+9xixBGvElzIPMj44iu/XkLuuULrftLI0McgWCAk0zNbChPcwg
	8zZmS/IVWhIyoNDnsvkP83Cr3oYsqhl5o/E88qIP++qw1I+XkXR4sNUJUUEb8KMqHumpGpOYOQ5
	ED9nBVDXNXEDOfbTmazqlYUsQTu5rRt5xASqepbUH/jPBgOHQ2Z2njW5ecyufko8OH5a1/pGJDU
	6AsfGubRZzFxtxU+aH/CWTluHxTeaiwJ1dKxlN2A/sxHIky5ukYkh8HrNV3XG0NFo992t/GuORV
	G1xl97Uxc/rrX9QRgaSODNOH1VNy9YTqeNuO966rFCQ5Q7X9v776nBhb+3U=
X-Google-Smtp-Source: AGHT+IGYlpRqBzRSCefJCYuoErOf21hmmks/xF6Mg/zw5Y2qxdyUFPJjqEAnrWwpm66pQjKP52znHg==
X-Received: by 2002:a05:600c:82c3:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-440a65b9f26mr3005185e9.2.1745564092368;
        Thu, 24 Apr 2025 23:54:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14369405e9.7.2025.04.24.23.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:54:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] cdx: Minor cleanups
Date: Fri, 25 Apr 2025 08:54:36 +0200
Message-Id: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0xC2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNT3eSUCt3knNTEPN3ENJNEyzTDZINkU2MloPqCotS0zAqwWdGxtbU
 AGgXTfVsAAAA=
X-Change-ID: 20250425-cdx-clean-af4a9f1c0c53
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wrp+qQuWlUupp41hoMOdlY3AQHo9s5GplgWfkKeseWU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCzGyE3u0reAJ92zDWXj7PXR639dmjZ2Fkf8i1
 tor2RtRKRyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAsxsgAKCRDBN2bmhouD
 1zhQD/9Q/BhkH51FFJXYgVBzkIaU6HO2yVt1bbC/f982j3cJW/mZzBTEwVbxVb4ZXXnuoFt/x/v
 /ypQvpV1GeN6dik63+LGP76QgoyIQhjrGpJiFI1ZMFbeo2ztABTIeQuQaBIR266vFTua/hBGPr5
 pxV0tu3x7Y/mgQNnuqtf0U4QWQAarVS0ktWJX1qYHJH9BxFyEynoG8wJbzt/1VqYDEeTTQsdFs6
 DqOYAI/JU36lgiNELOJaBX/m4PlREece5mYW0M2pqdaUYajFGBuXR+jSUltSh4seEl/nqw1cLlZ
 1KlDX/39iaQcDACLkljQ8xm+xBCx9zZ+/AkuN9gdu3hWOFd7mtjiXlSFxg4jzepzJEJFqOPliSE
 OrLsjCa7huo94UEAxo7fNC0al/hQz75RxDk9Ghx8UyIkQSzr+MIBrnjFQP8WIov5QmyJm8+B/4l
 B70irFefbqtCPjeK7mb55vm/iGOyLBfihg9ByFJjOa3dhvwUI6gwpR+2bzBe6HAcMM/e2nwPv5N
 r7fTt07E6A9WCUqtP8mlYyQ/XypEWhIKtlocAka90UXl7G9/6yV1uxYPIDCGqWAiTPSaBW1LfWp
 TwjLaoR42iyn/FLhZill4UYAr1NYouHQvGY7L7QQiSh+etqRxhPBv26SWyj+iIU9g4a0INws73f
 0ZQrTIOkt44SLig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few simple cleanups for CDX drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      cdx: Enable compile testing
      cdx: controller: Simplify with dev_err_probe()
      cdx: controller: Drop useless probe success message
      cdx: controller: Do not open-code module_platform_driver()
      cdx: MAINTAINERS: Explicitly mention Greg who handles patches

 MAINTAINERS                             |  1 +
 drivers/cdx/Kconfig                     |  2 +-
 drivers/cdx/controller/cdx_controller.c | 27 +++------------------------
 3 files changed, 5 insertions(+), 25 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-cdx-clean-af4a9f1c0c53

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

