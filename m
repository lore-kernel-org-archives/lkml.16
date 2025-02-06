Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D51A296
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802235; cv=none; b=gj4c2KhGFpY727T+jNJlGPYz4dX5VFStc7JZcS7DOFEOgskmXjOOOoXxQCpDQSn5a3eriE2HwDZj+ZXDB3u6sYjFtlVLBsN+5RHLeWtzDeoPvvvF+wQMYThHaBsh0TiX7S88+aRUbtcPRUkxzuCM86524+OMa5LwV0VBc/nRM0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802235; c=relaxed/simple;
	bh=nOPgqH4lhiAM4OWu/qIJGrbWH9VXRKT7m22Jc/D4Ss8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=db9bzwoXZIKL52KSwgmNvMWZhPMd0feIMB53uRRVAcegRcsSxefo4T9FBiGnMnx9KHWlxtyRXrfUw0AyZZrDSpfk4hWwWwzFuj1Ud5CuWECtFRkQz3iK85FC+N99s501Jk2H4Yxene8/k7CQvnCJxg6qVQcF5sEIterGwn4of6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=stmo4099; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="stmo4099"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f2339dcfdso4954045ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 16:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802233; x=1739407033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zzIHkh0JWr0k+Vy4PcXdrqiu6lb1v5EsnhvqxVQ3do=;
        b=stmo4099NOPLysGubhkrcLBFWWz5loMEr2psuQsrLJFll/4G6Yw2LVU6Tbq9kZ1glJ
         OLn0Je9TBN9mPkdDbBkDpbE3G5rFDekXpBlTyseSrysNGnknzRGJOJDAgv/Rd/Lsh5VR
         1hkr5shDvjeLqQaBN/eTFhK4sHPEqxn3W/ddij7ZQ519fCJuhOnR/Iy0wBeTFV5VFZpv
         5JTYwQ/hIiuMnENyM3JLRwcotNnKANDmHsKGZoYsSmgG5NyiVV7YEUuEpDRsC2BSkt3U
         qqrVN1Mt822M51HWAcwzjqeSsfpXiuZwVtVTQB2Uv4DaYy8zeNH/Enpjou3CJxuiOyVB
         Qo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802233; x=1739407033;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zzIHkh0JWr0k+Vy4PcXdrqiu6lb1v5EsnhvqxVQ3do=;
        b=YjiAfu0KBQvc/vd84GJsIwjsyVVlj2Av69HWNJGI3/Dn/P7oodH6ccf5pOoNmSGteZ
         0HBsfflZ7PyAb89il74/la3A6KnA6xmcRUHK8ZbGPusUz7Nn2uhx4oAfZQ6F9QGxneYc
         AI1+kB5owMdobUs0KuAS45g4BxHej/61XOezz/pAPH40UUsnNhiDuQkOdyP+43LAWQfF
         4iyvRNdkpl7M3B6RrKqISAPt+D300h/9rdgaya/+Xf4zO3K6GJWrpX/PJJPLzOX5Xjjb
         uYB50dVmWgH+KJjAp1mNHm50jTyguI+kFS3sU+qTlsmBIZf3WycUJOyX7za5sFxaMQd5
         2KzA==
X-Gm-Message-State: AOJu0Yzkn6lLO+Wem2XBfLutmMyRDPQTgjzJJ2Ut7KetNPsjViox1JDx
	TqBPT3ZiiIK+waDQt/s+ju7sapixt5gfc/7QeKXdCG7kllqJWeZfBjKb5YX9XE8=
X-Gm-Gg: ASbGncuEU150kBY6clvFZwr9f7FF2SG8Eoychew9TBHULdbu9qheGg2eoE8u6akmi1d
	fkQM7AJGvBA4AxeabdT/aSUh1utYxjd9m3W5ALwo5MCFlmreja79Y2/nGldTqa66X8llr1tDv3Y
	pqRe+wng4JqzyOnF6TKmkPBqwiYdNZlhEKGFIwpC33zXJNs0B/lnPAnC2jBpwzmQ58lXtZ/m1Os
	qN0SOVF+QjgKFx2KnqN7ANXj6pDf9LFuKihMLRXq4B5hcra6WkgDrz4wFputLvnQBb9e9dMsxB5
	M8R/1oA/DZVFng==
X-Google-Smtp-Source: AGHT+IHeAALMMN6rEjNsIcgDHE6izQCRHL2t1ia7J5PPMNZzXVn0e++b281jLiI3GTn7lM9t/PY1+w==
X-Received: by 2002:a17:902:e809:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21f2f173840mr22559485ad.11.1738802233665;
        Wed, 05 Feb 2025 16:37:13 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8desm49515ad.155.2025.02.05.16.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:13 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Robert Nelson <robertcnelson@gmail.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20250123174901.1182176-1-trini@konsulko.com>
References: <20250123174901.1182176-1-trini@konsulko.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-Id: <173880223301.2488567.10858467099491839208.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:13 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Thu, 23 Jan 2025 11:49:00 -0600, Tom Rini wrote:
> Document the ti,omap4-panda-a4 compatible string in the appropriate
> place within the omap family binding file.
> 
> 

Applied, thanks!

[1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
      commit: a4ec13e6101ea750b17dc23f49f21d3f57623099
[2/2] ARM: dts: omap4-panda-a4: Add missing model and compatible properties
      commit: ea07a4775df03852c353514b5b7646a17bd425be

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

