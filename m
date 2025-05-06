Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA71B87D5;
	Tue,  6 May 2025 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516759; cv=none; b=eTidmYPpc6DoSYp1RODWkpb3514XxkjpcMc+vqK9muBVdIhlhnNmW4NThJy1BaXRR05WWGp+5iTh4DFZLEReDSpWN+N/HPKGliSE2zhaQgtyXirDV+iDGbZMwkDxORE1kfEgpLjfPnDD57kef3rvstbHG9e3HIzf9cFy9YcWSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516759; c=relaxed/simple;
	bh=JtbwBkpDzF640zMb08UjCzjsawIeV2mxO9RsQlX6+PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tLVUwYr1X0Uv1KIRef0mhb3M7e1iQmNPKB8/+vJ/OABWCQy08dC4tpH9PtfVY888ddDX7VVu3ovyaZHglc7H5EancUDrinMfRhaEqzSApEMCXnRGcop2VeqckCUfQTylTpr5BCnQM7ypWB8P0JDLMRlQgYXWcZPr6zzi7zKm/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDlDHLFL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDlDHLFL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso8012829a12.0;
        Tue, 06 May 2025 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746516756; x=1747121556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMzPbMaKws7S3S5HYRGUKHH7z0uc98amJrx3ejfF3Uc=;
        b=CDlDHLFLSEvYFrBb0wR2dEjq8kp+WHlcoXbCab6Eta70bcRdHr0t1xi2etIK1CevfB
         tQVmYtzILUKWvBMu/zpJFmDhpjD1Gb7Qd65rrFtsyZwLX1N4l41PaV4BvZNYuQrafTr7
         rv8v5iNVlyA+oQR2NhBPFrVmelXOMC/Nq6xfNvRWJBzN6BjLAbevE3ONR3CI6ZQ7WcGX
         T56sqXkOnlduoLSbvDVeTV6CZvyf+88XoRBag516s2T7LIeh1O9sucB6Er72vtgGfKYL
         tlAPc73lUDme4wnxTRRp+JtjSxUlk8dp18QCPWaGcadO5yt4G6T1kHnKxLAslT8Fj7D2
         JwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746516756; x=1747121556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMzPbMaKws7S3S5HYRGUKHH7z0uc98amJrx3ejfF3Uc=;
        b=xASmR7KnvKshxlPLQNbCeF92pelqgABm+AB0OhsreIBJesKo95qvJFVgJ91C5Q7ZIR
         4C6Q5f9E3Xj2oWk3oBT67In4RoIKJyqOvxpTsptlAivCi1Dwji/JkOwSdoOX7duePaXH
         gwP8kjkXS1ITUhOa0gqqdAN7SHzAVC8jJaXuvl+IXElhm7xCtGHHQQ77bhp+amqwhtXG
         7ZLpV2epxiRsGvNFQTfU3+VNNaH9oE2fVfK66VHk2P+p0U1GYRn7Bt0KuJZOE7URCZ9t
         6gcKfOExYXpiEqfwQamQHjooC8oC7TR/KKtlpJyhf3R9mdnjH3S+tcyZOXASXLEWwJmX
         zn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV01iFeIyv5Ae2u9DgoeIFIycJBat2zeNkDTLjTpwD5H386FgS207TW64I6kuSVsb6QqJvCgltD688I@vger.kernel.org
X-Gm-Message-State: AOJu0YxtmPTUQQPNcESmWXdKCa53h8vk7GXhRU/bgONfjR1zzRg5Ber2
	mDu+IEziSbpDN1/erh+wXlSeFnLGDbQ+LYzPzhju17QLpa66my3F
X-Gm-Gg: ASbGncv9XUoGTL0WyEelZrFo2AvcRoCitbHov5QeUc6z+0m8/WvaEiBFBYGPGXS9GHR
	g7mSGPEt+7CV9hpjdboWpjLmkiZdl1pFB3I+WLe5PT2v19AbsVnj6w+998G8vLDSd8K00GVBd9u
	Ukbn8BRpGs5MhK9brRidfqaLgWYzqTFCD5lzK04TI+kl9Sk8UOr2kXBB+pgloIQzZ0erYdsuDol
	KGfkTdw9jA8aDlaphxkMk7yqozx5o5OPV9gobxWGrI/pbopwpSG1pJw2WGvngHTaC3TdHFDcPtj
	UBMXe0VvrlvrHR1IUQKp9l8LfWjTkWvq
X-Google-Smtp-Source: AGHT+IEiQDOKXUdKXcoln2OcfDKVnmiTIuoMylbHgXy5gnVYfswPG/iMS15MdnzaB5uq1YLfiMg6HQ==
X-Received: by 2002:a17:907:6c12:b0:ad1:91cb:3976 with SMTP id a640c23a62f3a-ad1d46ed54dmr179485266b.58.1746516755441;
        Tue, 06 May 2025 00:32:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa778188acsm6937219a12.35.2025.05.06.00.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:32:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] extcon: add basic Maxim MAX14526 MUIC support
Date: Tue,  6 May 2025 10:32:14 +0300
Message-ID: <20250506073216.43059-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX14526 is a simple multiplexer of common inputs on a single
mini/micro USB for portable devices.

---
Changes on switching from v2 to v3:
- fixed overflow issue with ~USB_DET_DIS

Changes on switching from v1 to v2:
- added port and connector to schema
- removed -muic suffix
- removed unneded comment header
- removed unneded gpios in private data
- improved code formatting
---

Svyatoslav Ryhel (2):
  dt-bindings: extcon: Document Maxim MAX14526 MUIC
  extcon: Add basic support for Maxim MAX14526 MUIC

 .../bindings/extcon/maxim,max14526.yaml       |  80 +++++
 drivers/extcon/Kconfig                        |  12 +
 drivers/extcon/Makefile                       |   1 +
 drivers/extcon/extcon-max14526.c              | 302 ++++++++++++++++++
 4 files changed, 395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/maxim,max14526.yaml
 create mode 100644 drivers/extcon/extcon-max14526.c

-- 
2.48.1

