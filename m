Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6E3596F;
	Sun, 25 May 2025 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748200093; cv=none; b=j6WwidJNDfTNrWuIyOTgTjcFeQRRC3xgvOigp2BtMNLgavXJmZD2ycaUmCHVAN86DYzE6r9VgnhHhnhvqJQV4HdHIQif2k1UvU7/XVA0svVCrA4rw1Tiqo3sWQZZlQA1yq8oIhWKHT/x9JKESyPz2Fu2619lo5gFLRfQ4lUdHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748200093; c=relaxed/simple;
	bh=hQ50hdmC9pjOtYEv3cztvNwybp3k53R3vskxGJPCsgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1E2H12puOVsxQOY12xRt9a6QUQ4gzeN4OCM7Z1RxhnmJyQW40c7Ek9B1+gvGDFXhcQssGoKy90xbBNiK7HURJT00C3TCER2WvKycTpEcFLpQFjPO4b6+mXjMPSIHboHU2WCsu3vJQaiIDrmoRdiu4YigDH72mA8IIVALqv2owE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBe2wSEv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBe2wSEv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551eb17123cso2439978e87.1;
        Sun, 25 May 2025 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748200089; x=1748804889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnW85cP1cMkj1Q65CdC0Nnhj4/aADdGprEwtCkfqX28=;
        b=iBe2wSEvDOp9JKLSOkpmQ9h7dzcohFsClnPGo1EVqVs++UWkgSH7zGkUWIAIZ74z5p
         AqC4ZbtDUW5VtWRMADXtUxFcf997cq/yt0rc6IHvzT2dzL1jIRCizcI1mf9dquNmyLh8
         Sozb0YmBhO27hnWKdLhtz+g+QLFwNXeHVLv0pjxsGEZSSxM9/J0V/m5koLGwSZBUQRZZ
         VtyzRVLJUbBgPoJSrJf10rbBlQN1ypS6mSekVv9OHJpwY+e/9l+QtXYgSbapk5u37/rJ
         nF5upYaEqTJx58jmqUE1gqGA9PDrVlbseuQMvUgTIc29uGQWF+NkwLrxGQE/WmO+YbF+
         30aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748200089; x=1748804889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnW85cP1cMkj1Q65CdC0Nnhj4/aADdGprEwtCkfqX28=;
        b=Ah7YMWvc4AG5d+5G9iiZcwsr2Pj4BeYprDOGyYlR/MQgPciiykD1cdr6HA5HnuKHDu
         gCgrekno62tO2tsWEcAhieVzpmJrw3tk5GmKiSnCuD1hRb0eh/FPMqKksMbDYWM+Omqk
         YFjT/bwVQ4/PQ4HG2x+LWBQcwhs7HBA0fj8GGNus/PPD8smzsuuBnAtelBWVsI4IvsWM
         tr1FT8Zgi67KG6NK6OSOy+S73vAXjQiZ53IAVObiCqPzfuCYM7JJ/pRa2+T1IDqmQUQh
         RARPv3IaxtybT55KTWfZhSws9UCTBqS+fFxWnSFweoOFX9pUq1QIc+R9GWdGvZLqa9AB
         Y0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJkMY0mfWO+RhZmUgXNURjRenX5+zX5fbQCyzzZrnkN/D5W7mJefh7RTydi+Kxa89eydOxUE4K4MBT@vger.kernel.org, AJvYcCVfOyp084czmMziROfZ04QkpznuOZ/v02pqMoOBycol+hZwjg8zYvPilyQZ/2SurLHmbDtFAYGDh4su/FIu@vger.kernel.org, AJvYcCWDo+3i5wTdK94eYiXtABXvwhuY5fFdJp/sBAVV+yt0ZiXATapAcq2uTpjk8JakbrV3vKmc0+q6pEwR@vger.kernel.org
X-Gm-Message-State: AOJu0YzORsue6X860sRdnvqV3gY8DG+85OydiQT045Fd+DJoQ8h/8n27
	KQJFY7IDxrejmaQljL75wr/NV2+VsB6xBitjAWHX8udYj7YOAhxIZRhX
X-Gm-Gg: ASbGnctEbf0vt2IBHGRpkfUUPIxqRN/X2n2SzU6UthxWgd1yoQMIy6fBhdEF2+0/5Gv
	43HoInZNM6QDMpW2kxOoICdNkJ1vnk0fbfuAbgnJU3/FnP5yZB4KxdDZiWLOhRC0yIqHnr/PTyw
	qRpYO9EAxbDoRXWchYknZuJD2XJ9TaFX2DnxXzM62In4CkvBZUIEkraV8L+JjPVKH5pXu9NgsFy
	XeKG9WaDvKV1k7eXLjHF7ndf/aYDqwZJmYeaKvRk1aRJWbeQUym/esnID/2ld+oZdAPsQKOi4bX
	4nq+K7lcLMlJkz69xi7IvGYRtAv4VJZhNPaYScwwbFy6kFTlH4l0JKvnH1Dy+qNJtmAMFjsFpTm
	Kv1QRpdLxPav+TpTveO3raZc=
X-Google-Smtp-Source: AGHT+IFmwdJ7zKB8rzf+rgiGertXPdVsNgHDRdx1sfF8sLYxYM6YV8MXp8+m4VgcPlCUyNjQ0s5E9g==
X-Received: by 2002:a05:6512:3e0e:b0:54c:348d:19b7 with SMTP id 2adb3069b0e04-5521cbb5966mr1606374e87.46.1748200088932;
        Sun, 25 May 2025 12:08:08 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550eb6c7155sm4551758e87.22.2025.05.25.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:08:08 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jank@cadence.com
Cc: edgar.iglesias@amd.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] clk: fixed-mmio: Add optional ready registers
Date: Sun, 25 May 2025 21:08:02 +0200
Message-ID: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

I'm not sure if this is a good idea but while doing some stuff in emulation
I had a need to wait for a fixed-mmio-clock to go ready before using
devices it drives. I figured it may be useful to have a generic way to
describe a simple polling for readiness.

Cheers,
Edgar 

Edgar E. Iglesias (2):
  dt-bindings: clk: fixed-mmio-clock: Add optional ready reg
  clk: fixed-mmio: Add optional poll for clk readiness

 .../bindings/clock/fixed-mmio-clock.yaml      | 38 ++++++++++++++++++-
 drivers/clk/clk-fixed-mmio.c                  | 35 +++++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)


base-commit: 4856ebd997159f198e3177e515bda01143727463
-- 
2.43.0

