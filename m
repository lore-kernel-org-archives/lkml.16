Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB89F199BC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731108; cv=none; b=gacO2KE4GH461g538xZ9RUWicZcrJQ4iMkrQ63IgkLjf1uKr97o5K0coJNgp6NZjrFrhXIPUgqvaoc6/cxiJJNUoLeelOYrLNKQqdTZfIL3GqKSkdUavzp9punD81MmysMHXWO7hZTEQgUhVDQ0Dgj94OyWWpnFBTdVISidl6H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731108; c=relaxed/simple;
	bh=3VZyd7qeqqdU+fU+qG6or5DrTUYgsIUuffWMNMB8H3g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LemGNLARGrKBI7sNw3ND8tSBEYsddFm2gpQdrFR7IqAnAvzbfKMT4+Qgx+EyGV3JSU7qv7NZpfDBAiVQnI6EzVJOrwFkPUFFbj5zuKq6ixUwEteKjIeXSCFVcMajwizN+eFE/u3vkbefOT0gj5zkVYMkh4AP02X3kRZpPDEdQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kPTwadx5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kPTwadx5"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1548429b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743731105; x=1744335905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjiXd/lJykaxGlMVtDJ8cu8A9Kx6Lj/fnArm1Z9o5jQ=;
        b=kPTwadx5dz5hHRsonexrFKaXmuenq838Cfl+62MEEx1/mj5cez3xen59FfPpDK8evm
         lrY9OCCMMspEGfd0wd9+4YLX/Vn+dB1CFV/womAuhkOoH0YrF8CdWcUQ96zPM/V49eUn
         vg25t5BftxOHlrKqbsGERO41VjC+GuFaBmCPYaY6Xbf8CjAljsc4DBrDO8gvKeXMCJri
         TCOP9Rv4oJuiTirUMEIUHeUosfTRfOqNZs+DJVEkLD+RpNHAQsBFAiEUFKSrM9hrY1GX
         yhlsePJJ66gRZ3QJJShQKaHYmmJaIcAaim2uxi9UTS/jhFIsGT2LVS4O70WlRlPxTlRs
         EX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731105; x=1744335905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjiXd/lJykaxGlMVtDJ8cu8A9Kx6Lj/fnArm1Z9o5jQ=;
        b=pzjpP3hkFsDvEJrq3G7+wvehSuYOBfmyb75ka5QW2AY5gZOSs6pRqX4+yMnwq6k4oQ
         mqwsdwHkmMVLDAUPelbmjt8QSnKAAUyz3ckPuefThCD14C1RPAFvk/MNcfpCTA4u2Kne
         KjfJ4/KdcBiEfC2ywO9Gl2Ft/y5V9d7D+wTPjEXGAOcajvrKbrSqk9u59Y1yFhzKh6Ex
         WAKOMcc5aEk9RSXbe6pdcwylw8mr5lnNW12VhjxpK/fXDbDIAinODQW/Zix6wgVJSBC7
         1fZl5z9hgnS2b+RiTh00nBg6YQ+LkDMEOYuSzsC24ZPtqqnGS/p2JXyZitsRaOgVQS1t
         ZzPA==
X-Forwarded-Encrypted: i=1; AJvYcCVZGTY0T3A5bzhIeveIcv3T4gB5VMZRqpmWKEeneKTCNRTtm+HRdtlYTPQbeiEARNpzZ0vP6Xo0CWDTZKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SYgHpIgPbATo57FKFns9VoxJhtaiJBpIJW9r6FAvfP7Ajc4T
	YT4tpBuAOU27nVt2Fl2enFYMtKohndeuKLcWT+Ax3NZQr5KprZGXL0gCr2yjmP0=
X-Gm-Gg: ASbGncuwRrtF3eWfkpABFzKpXHfhL5ZdmWLxNMFDstnxB0w17HKPxEo9buK5dVlNP/M
	iZdhiv554SCgY9gSmcgT3QRRqJVRorudwQQ9H/1IHvD+gloL9R7On56ROXUUKzge3rsHr4hW9Jd
	VHbmvFXbo/RxKRzkoFdBSyJ2BOvwVQiXDp1g1XG1e7FsXO6uTEKXkCYGbKxHN5b9Hmkkaok5IAf
	WUCHKZRmz8FsE9oRMJ3e3A4Ln+7NyZq4YprK4DL80AFKoc0LvUVEUDW2YJFfQA50586R1cqkouJ
	Mvk+MsIIoBiblVrPZG+jyvlma4Q5GymOM6LDNSZBM0D3ed1XYNJ33/AEYdoAYG1Hz/Pd3WCh62W
	Od3n+q6QZXbp/hyiPzA==
X-Google-Smtp-Source: AGHT+IGZdc5ayPV8h3jLG26Fb3Kc7t8JCxjxP14CJnyWZUDnMeJLYlf0ChW7M7ptwKjPLxd1mWNs0g==
X-Received: by 2002:a05:6a21:1643:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-2010472e135mr2027506637.33.1743731105128;
        Thu, 03 Apr 2025 18:45:05 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2195304b3a.160.2025.04.03.18.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:45:04 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] dt-bindings: clock: ti: convert to yaml
Date: Thu,  3 Apr 2025 18:44:56 -0700
Message-Id: <20250404014500.2789830-1-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert TI autoidle, fixed-factor-clock, and clockdoamin bindings to yaml.
We are fixing bindings warnings only. No change in existing dts.

Sukrut Bellary (4):
  dt-bindings: clock: ti: Convert to yaml
  dt-bindings: clock: ti: Convert to yaml
  dt-bindings: clock: ti: Convert fixed-factor-clock to yaml
  dt-bindings: clock: ti: add ti,autoidle.yaml reference

 .../devicetree/bindings/clock/ti/autoidle.txt | 37 ---------
 .../bindings/clock/ti/clockdomain.txt         | 25 ------
 .../bindings/clock/ti/fixed-factor-clock.txt  | 42 ----------
 .../bindings/clock/ti/ti,autoidle.yaml        | 49 ++++++++++++
 .../bindings/clock/ti/ti,clockdomain.yaml     | 38 +++++++++
 .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++----
 .../clock/ti/ti,fixed-factor-clock.yaml       | 77 +++++++++++++++++++
 7 files changed, 169 insertions(+), 123 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/clockdomain.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml

-- 
2.34.1

