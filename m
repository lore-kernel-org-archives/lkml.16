Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A081A315C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236079; cv=none; b=I/cKB2MRpQVgtQfgrSyVo1vxvKN10XoN/roCLJrBS7tjvpdYJMdTDKGCn60PmiF7+2qUJmIic76jqpr1WZQw4YjW9HShxpWiwEtB6TRZ4uTdYTZZ2Yq1N2iIdBSD712nWz6AcUhDgf9a1/x7HhUloXdPpeTiazClP6dEDzbrBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236079; c=relaxed/simple;
	bh=LJZDt5Jt2glmNZ/wOhrOamQWBH4PbWPLnCGN7Nze7uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR5j0JQBilDekx4TChehHzt3OlAwx7n91Gb8aTidJSZkZVk2l+2Mq9E54jmqFkMa0tdXLgPW4ZiNagyl1gR0F1ZpP1xhm8aFoXQObBKlQTjwodiI59s+BnRt6zhncqASNJysJRHoQEM/DbD5Qa509asJPETMNgjIfpVJFNUnZZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DrfcIG0h; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DrfcIG0h"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so5375355e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747236075; x=1747840875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KSC7AS1sDT3kiP+IimhJbkxckYibl8Clt4YmfXjLex0=;
        b=DrfcIG0hzTyrs6zcbm9K+lw72n/R20afOyB/L18a6OsH+GeNLpT4G1oOBoXrL3lcXW
         muE/GtpXPvE6bvrOulPJCs/azgShKn5PtLeEs1LL4XpBAY3m1OPzACX4RzuxKNrYjGbW
         HAknvgt4G2kLx5nkedYXvpD2Upx6qKK20ie/Uegv445ZRDJseUJ9adTL1Pf/XLzLluyW
         +aZ4VSzFmrF66Xx3c28MUYf+YPMAoHrpxktCUVwNoIRxo38hSjL8eIq6OttbgEYOPqh7
         6YptkuZAx490A5sTQYQjClF9nY6MF5GpC+CI5UUCA/IY05b4lPDlDfVDNtCAR+pW3XvS
         tb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236075; x=1747840875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSC7AS1sDT3kiP+IimhJbkxckYibl8Clt4YmfXjLex0=;
        b=h0hm1jSaCOMk2QVHT1RFyJATOaC8Zfx9ypfJsCz7MtSzHMSspEWmLeYWvyUOZJ7PfV
         CGR22q+YByuci5bF1uuIxcFulTfldVD87+QTm8wrTKYtaU8uIw/hrotFRwLnwUzv3MSI
         pOfxR6HW8dFHMA7342t+W46mTs4QlYLbWqETWcC7lAKgYGKyy+zisTAN/dkEgd5FHPKA
         8w1ksqDNR4KPzZdQeaJPXoYaRmznuao/46Bf14q5okSLmmRkpYG4NHKoCmMTIFDj6Dfb
         ck+4b37AU1KfIekeQ34FeJkei/x/sknsjFYIQpoDiF3mmdL9JKy3jmhWHSPaKWrEHvL7
         1+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+/tp8EQJW+T9Dyo2Z1h25tmQbslWGZG5SkIE+7qJU4+/8rnSU13TS2vs08peOpjsAb7XrVo1cW2hqKHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94PQcyzFVGlS6TWxoF54dYnX+cR63Clrs7xCnqBj5hM+Kv/87
	r8wrvnY7j1o+wp9hh6WBDfU9+TWG23Z9OzDsqDnTS00CQ2Nq+tQvZ9viznlPbeQ=
X-Gm-Gg: ASbGnct9+ydyLar/V1JO6B/vQPyflLud7Eg/sU2zd2nUxy05TjX+AfrwLttMuXk+nNF
	3BWn4CIPfa1rwxlx+zAMFfZhOR/V+h8k9m5+A/YoTFkht9r/L+xL/EiG+FwiGNwSKF4g82VnDxd
	LUz0pcYQ6SyvrXSTueMroDKJ6/N7LKSkRZDf2fEqnj9+WUIQOMQh74yaC16ayQohDIXssFw43J0
	JfimEjqVi9MsF7TiddunJZTSrWcwL3xkgvDfChy/EEYelgxMajmb5zpRKHQu21QOXUsvvPEp6wR
	ZENYieqpDudjGIf+oOwUacLQlfBkCDfaBiRoFVcs69RSwhjTvlW7OgMpAawP1tZpdIbSuZerESo
	bvvH+/kKFf27NBg==
X-Google-Smtp-Source: AGHT+IGe1ne4Td1Ml7Z+Wncf1fBtA4hEtl4bvauo0/AxKZED1m8DaHt11KVpSSf0ZkBUNpGoY5FUfQ==
X-Received: by 2002:a05:600c:c0c3:10b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-442eac9f98cmr49562565e9.6.1747236074746;
        Wed, 14 May 2025 08:21:14 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef81csm33273325e9.34.2025.05.14.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:21:12 -0700 (PDT)
Date: Wed, 14 May 2025 17:21:10 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <aCS05j9ZYqga6dIO@mai.linaro.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-6-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514095350.3765716-6-ben717@andestech.com>

On Wed, May 14, 2025 at 05:53:46PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine timer.
> 
> The RISC-V architecture defines a machine timer that provides a real-time
> counter and generates timer interrupts. Andes machiner timer (PLMT0) is
> the implementation of the machine timer, and it contains memory-mapped
> registers (mtime and mtimecmp). This device supports up to 32 cores.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---

The patch does not apply on my tree due to conflict with other patches
of the series on the MAINTAINER file.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
