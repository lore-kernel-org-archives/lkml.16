Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A7DDC3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 00:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802235; cv=none; b=aDs2T0UJNxs/aaE7kPqeIY4yy8E2q6lm7nx+M/sQx3XsEBWEpMOa/4NuEOeh3FkfBrWHMqQ3aQgzi0oAs7wmnIRp0C5WyYRSz2Euv+aOzgYit0OWjO8acH7Ozpxlxwtl+3hdp6hMYPJxXmJHP0XYq2nf84fNJsJJ4/wjOhdkRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802235; c=relaxed/simple;
	bh=P0D3iFt86T6gv8bKDwIO7YaaHu/XrhniOHkLnRI8OJk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FXPeirwRUCWqmJW4y2bginqW9SQDvTHKznxnChbeVYyCKo8veF+S0wi+/vFO34FDuFXBDNZT0/iRphEZl+EMDfzvpRzmuvOAcNs5OjGfmEEmYrAqv0E3dmUz46zIEZuhC3vOizVM64Q+c0RnI1ZHkGNH41pR0+9gyHz5jSjVgb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DXpsq6Mq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DXpsq6Mq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f2339dcfdso4953805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 16:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802233; x=1739407033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rr0c0Mekj/MPUNG/MPU9ertPQwQ2z0j9RQ9nWUa25XQ=;
        b=DXpsq6MqZlECFwdNodOlWBlSZ90L6jZSRDrpoDQ4Uk62lt3Esn3ACWnNhp2R/HFrRX
         JoLHNJo2wzZ0CQ5zqs1pvbvznFDlg+bHuuqCrrvjjCrtHJReCeDMXoDZvxrUMm3X4bBp
         VH6HdYD4djpCcq92zGgftI5qnjAp0vBE31KlAQVaK5/dcI2xPX40TdCtplswKHn083yw
         fmswWbp6SasFrULnDzKeFvAoxK2P1rkTvZ71wKy2+mDiFZg3dvZBzjQRf5/lYYNMHGnX
         KEaV/LIfpF0FFd7bQ5L0UouLa7Q4r3GHbWxVeUWsW23y5xkiw28dbBgcZ2W44lgiV8Ja
         42qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802233; x=1739407033;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr0c0Mekj/MPUNG/MPU9ertPQwQ2z0j9RQ9nWUa25XQ=;
        b=FVnTsIA1ocSqqVMHymgqO8iiTu431JemDfsJGuTWBByjvuubgwkJih2iBd0eEMCgqY
         QJKXi8607qaBw7hGVkXwJsFiIX/FCDIDntXeM2PSQ/Tjh15Go7/jfEOs1E0nyipOqr7S
         ErEifgcI/IKbKldURJujPYqs8vvsSB8NCRVN3yNJJaJlR1nzQhjNavTXFeDUXAfrS51Q
         Adcs1guAgXHn8mjkRw7zRscf3FF+vKzL664cPshusBxSbRmnUgGS/+oqpKCilWMKtH1G
         QqzA3mDKkXnoCR4o2UrqDBp9hvTE1X8oEHI/SRhjNYIYhDjkcrLtKTrJIUon9g15FyT7
         plog==
X-Forwarded-Encrypted: i=1; AJvYcCVESAFSK8RTmjKykdPsghak0BSS/n0AyY1UkohyEHKEw4HurJudGjnwtMNiY7eZNv/Ck+LfaBuC5HRYeE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWaXkh0UhTdnvoamZ/KLxCamj37bYSpkGUXijKUzH1ZxSPmv0
	p3ZzVTAq/2+fcZXuM/Yq61tSL+S6gk931rT8wpqFpj/+ncm08PmrwAy0jr/ZGNM=
X-Gm-Gg: ASbGnctyh7yrB4W/HQN3on/yp1DHxAknSvCUyJ8iOse0DYWXndLMYbQ+oIwsHvQS1Zn
	0TlKLJwhv8lcZ6K2UBT3Kibr0F+m5ML6cviHL//iMws5r/CCXCIAQEFGjLeuM443szPUFXjx2lN
	OuifRU5w4Kfwa646H0h2twP/jhOXrXchc8n8hodEI1r2V3ZbQHBiu+P7EnKQ90NNNFfWucbpK/4
	TAQG6MiwkSr8VnDdW8e53/vLdUod35SR4JBktWhTAcmIHZx8uTpeyQdPOX0hIquj0HHXkA5m3E+
	X8yGy72pggqmOQ==
X-Google-Smtp-Source: AGHT+IE/LzIHKJCWK+klnZk7QiidIC1M7t+1V4Yqlxs0v7unb8+7MKwR4ueUDiyVPVQQrQhsAjtmLg==
X-Received: by 2002:a17:902:ea06:b0:216:6be9:fd48 with SMTP id d9443c01a7336-21f2f1374b9mr23519265ad.3.1738802232844;
        Wed, 05 Feb 2025 16:37:12 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c9ccsm41755ad.189.2025.02.05.16.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rogerq@kernel.org, aaro.koskinen@iki.fi, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241230195556.112118-1-andreas@kemnade.info>
References: <20241230195556.112118-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
Message-Id: <173880223194.2488567.3049966264498351840.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:11 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Mon, 30 Dec 2024 20:55:56 +0100, Andreas Kemnade wrote:
> Usually interrupts are overwritten in the board file to specify a
> mux-dependent dedicated wakeup irq, so there is interrupts and
> interrupts-extended property which is not allowed. That has generated a
> lot of noise during dts changes if just a phandle involved has randomly
> changed.
> 
> Avoid that mess by specifying interrupts-extended in the dtsi file.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
      commit: 13203d24dd003206f58d570d19e2b515feca71c5

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

