Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D302356BC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796570; cv=none; b=rKYb+WfMI1nY6QLnfRDYilxUd0IBfi/g2ZchPZklibnXURh2aaaacqsNb8QpLb5ju118umWNduye9SrfnA9t68P7Rc3y8MsP6i0W9iq+JuperV3/lKP3axup0ipfF+ZONi6fofEBOVE5LWirpm15ncqupuR8qh2aYd2wphsSnas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796570; c=relaxed/simple;
	bh=v6n7jILdjhbGKHuKJjta2U75MS/4ZHmGbjks7d8eyvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCBQJc6JDfPtG2REdiJx05ZG3gTrJn4Sun5/N7nZQg1Mgaz/dvVv/0pBZTf0mud5Xg8p+ZbORI5vJf36OKbX6IalGzGWjNcuboKKNFWCUxhGEnjbGKM2tbZ3mqkd5V3OuXbFCWxgzNO062mxSFi/qzPXnWN/4070rdIDg8MU2BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fy2/TuT8; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fy2/TuT8"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D3623F316
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796560;
	bh=i9ixyQFFhUHW4HMFMtkfJpGgEC202KPMs1epsc652uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fy2/TuT837D9uOjqwR3OmKK1P1tjZ4VekxtrFdqLFTTn+CgjOIMhju/9uzwvtRI+1
	 kuvZzPCE/V4Aj1xn+HLjeiJli5JN4SC4ij0xERD00QgxzazXDqU+MvnHqVThmmuzsx
	 Y7YTSHAQBW0hjNuAfJIO6nsrHiv3P6Gxg+bo1lLIsbCbUhsm5xjgUcTMlAfrZeQomC
	 zfa1/nOj1YFV9qifJd+srZVDDq/nb64zs/zaWNQBLf7IOkjOUzkZJvleNqkquJeP0c
	 rZuiBjJuoS49Q4NKCAWdXipWpf76nFm88oNI6HGNCYb+nC6a8w8GaiOs8/9njnewpX
	 L7Hn4khrwHmXg==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3db5469fbso590318066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796559; x=1745401359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9ixyQFFhUHW4HMFMtkfJpGgEC202KPMs1epsc652uI=;
        b=Yl0j3Rbrm+nxC5gMk9Hj4Zk+3YAHvUoMs0RUsxDxa89mzr/JDRUVxh1o1IHWRqStMF
         Rse9dOapPTpPadOs8AyFVFW2T7fbPyQIrMut8GvsrJ+VwNzdGNh6AMLg+wSpSnSey5Nr
         jQm9naYIFS18zLQYVwLcoNRSpbrAh2Htxxxk31izuBzN98LGgUFy5b9tm2e5PjeOjkUe
         w+xi4weTPhlesY9xx5nfvkm9dMa6erAkLFenaNTKhN5PqAlW5edfRTRmBV1muiPFNpBE
         9PBy8JCS8Yp1TBejFxeHu4+WdpgWEf5L5nIgSDez3sXd96nF2epsHzE02CyObXDOeoEj
         FWMg==
X-Forwarded-Encrypted: i=1; AJvYcCX1u1PEK5jZgu58lN1z/KuPX1rbEs+aebyq/zHcSnZTvUM+BtFQuaNfX4gXxZT31vZcde6i7HWk0YOTGQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPULXheA85a/lJs4hxc7kFsrSdsI7u8fRX3LeDBYs9oZqs9FF9
	iMO27bjCaArLNZt1ji9CccX7MIOia1AUrxnFLAeeLuSdUbwfSjkgbxAbOANMBzQavztBsEpLi4D
	eMSP5MY+KNtx8DiauaX7KZ8wRwUTYplUbU6pAk855cTnZ4h1+IhCrnIL7lYghdd1J1L2KjCRHlB
	ic7A==
X-Gm-Gg: ASbGncuF/lj3mL+brKzypWdB6wmmpUjv2/iBOZ1KvCN5p7mrKm/ji5rZzGmuJjpNG6u
	2K3jGQxaYzTmgxE6/gU+oPlGj1gT0RUyidKyekKWMOm7CTuQEbmufR+gEpLnyNJvc4Ox7/J2EcD
	1o1HGNG35oCEnL7Vil1WYKdBKNXj5SKlX3sMPquzdRmtxksk5Rn8R3mHvFfskhbEpTfa4OvVZ9A
	CKquJmqz/8XYUgPO02ksa6E8I2YhDB9kBjz09ngsIpGD6V9hexRVjJXiM2mKs2NPZFEDgC9dbJM
	kEll9KIEQthR9g4CpJycycGngXxRzzYssE9PvHUs8oGM871X5gHlhEjf
X-Received: by 2002:a17:907:a42:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-acb428e0393mr105041166b.17.1744796559214;
        Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7ls/+zecyrOEaABBTILwE0kIy3epCcGQns9JrjSqagljy01aArWTanNTW2rX4QlZq1npbDQ==
X-Received: by 2002:a17:907:a42:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-acb428e0393mr105037766b.17.1744796558467;
        Wed, 16 Apr 2025 02:42:38 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde04c7sm95510066b.55.2025.04.16.02.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:38 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v3 0/3] HP EliteBook Ultra G1q support
Date: Wed, 16 Apr 2025 11:42:33 +0200
Message-ID: <20250416094236.312079-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HP EliteBook Ultra G1q 14" AI laptop.

Based on HWINFO64 and APCI tables, it seems to be the same HW as the
HP OmniBook X 14.

v2->v3:
  - Drop status properties from nodes in patch 3/3
  - Add acked-by-krzk to patch 2/3
v1->v2:
  - Don't rename the X14 dts to dtsi and directly include the dts
  - Add a label to the sound node and use that to override the model
  - Reorder the dt doc patch before the dt usage


Juerg Haefliger (3):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull
    out the model
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  7 +++--
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 5 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

-- 
2.43.0

