Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5C1FCFCB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783058; cv=none; b=bMCwJbbGIzkD9SP0AGuf3wpQLzMR9GQZ361Ns9HOH2Ol1AtO9oIaGJY2hdTUAyju9QCpOIZZhND61QqSRhhhVmRn32Rwt2v8OPIp/TibX5D8CK3/3Gr55RG5ZVkFsMLjNNl62B2OcMB0XOehMcs1Go/KJVRVRD4QhcKDSN+h0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783058; c=relaxed/simple;
	bh=XLYpLYH+lbFcCgkKm8AppmEwarNkV6tLVU4HUATQ84A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T14Mddr6+N6Jfo+kJhG9JIkiZK+/R4+pjjaYm46bpIOuN4tpOXwbFBj4cwaZAx06EZzT7yx+yU5EYKbibXjy+i6dBooii1cqiCEaQTz4FfiDlKek7Vagt+iqorKd10ZrKtU4UoBpXGla+pJTiavuRMKEUUPUUaHTk6qV/nOsXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mkQp6EC+; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mkQp6EC+"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b7041273ddso5222885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738783055; x=1739387855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q6hZ5i4uGM77E91i+vVgQnF7/jN3WqwvtuuTzpTp8gk=;
        b=mkQp6EC+MBn16sjKBaDVue3xzKtM8pdMcl8/1Xd9qR+R3+mmnWv2XQZbp2TpmUlQfk
         ioDo7kQm9eNMmDpDyF+jpVLb3jRgYxDgyJpvU1Y991nXQJCB163k+kb4VsFluMbAZsSI
         fAJICTk/eqd68lC82SxZmtVTr1Dbz6V8+iynjkQtHksgiIfwJW9shQieaMbjiqncBh7g
         Otpzfp4Z5QFKbehC7LHlmszvjXL1kKp2iW4VhArXQtKsH2bJ/WhMZR8KFekWxvyURT1/
         ebnckl8kXdwtwbwH1lxV/t1qMfqh2ibASD/dVD7fegROmpbOrt63lukP7jS5/oVbrpfz
         shmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783055; x=1739387855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6hZ5i4uGM77E91i+vVgQnF7/jN3WqwvtuuTzpTp8gk=;
        b=l0FTh3owcN+VXLH7IzDiBjgsfdHcoWZduSSESPkXIkT7WcrwmKKDvaBnvyVHpAoUB/
         WbZDO10iW4pFestmhRkNpP/cemXb9Ze42etmd5rKnNfqMFoS5StntwxoaZ+9v1/HCGnW
         PLGQDfE8Rqx/4eNLBd7Yn6U8Dn8TyNVXESm3+IVA3Q6jyh9GeZ4AbJAqvI4u4CJl1J6y
         I8z/akqsq2s0kvk8XjRPw4JGevGA6qQstmzNP6vx6D9RtFLKtcr1OER14FZF2Cr5XtKQ
         4jevGUdgB+HVhGD9UbwWkrNSKHzT1tXAhalX0Eo+48AVnb+CzyJ8MOASaAxI59ZxoWlV
         /Fqw==
X-Forwarded-Encrypted: i=1; AJvYcCW/6riU5CNBJEjMjQI6roVsucIO0J9iq/sqpTnt1WkqC59Qm5aTnCA6E69jGufuDwyL29FuIATbp6XPuj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YweNVEiMQKYnDZxmxTKce1sSflfTVO7PYBqmw0rpLmhtNDfe7H3
	z178ndrY1A7pWxwiuFTTBBlOYWc6Hi/U/lYY5Akn8tfjf4aEC9axx6j2atLthlnhJ3T6RJuH04W
	9
X-Gm-Gg: ASbGncvcx4Gw/1o7j3vyIiwHCsz9qWXp1JxZ9B6asWiW9XeJVCDeSQRl0lR2WI7ykqN
	6va2tPbHGwjcBAuhq/mhy+QI9sl1qxlmLShrBoS/+VaguYujHcajshcht7P6RVUIaotTFeqXFgt
	fB3TenvByM6scLz42tI/EkmmMni9tSGmDmX240/c4skjx510bde4giozc8hyOqkfCzaMfUZAMBS
	HRPmvjnjVu9ckEO8CDrwEztIQHCPX2vXSK4O6sPjhpQLnDDSY+nPILqo+PA3HVPAlAVhHwJGWbk
	wbUFhWiwG8lSKs1MomSPHsKi6BNcO7TVgiQfg9bTq7ZKhUJFG/xNcppV94QTBzftH/2eJgFUYw=
	=
X-Google-Smtp-Source: AGHT+IFZQarDTzB54Kw6beyPzV5fjHD8DeB0Ab1xvPcLzHDuFGzQUMrAaJDjENdFi/8n2EjfAvGJ5Q==
X-Received: by 2002:a05:620a:4089:b0:7b1:1180:a455 with SMTP id af79cd13be357-7c039f9974bmr572670685a.22.1738783055498;
        Wed, 05 Feb 2025 11:17:35 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d0573sm781697585a.37.2025.02.05.11.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:17:35 -0800 (PST)
Date: Wed, 5 Feb 2025 14:17:33 -0500
From: Gregory Price <gourry@gourry.net>
To: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v6 1/6] efi/cper, cxl: Prefix protocol error struct and
 function names with cxl_
Message-ID: <Z6O5Tbf3l8A8_uEt@gourry-fedora-PF4VCD3F>
References: <20250123084421.127697-1-Smita.KoralahalliChannabasappa@amd.com>
 <20250123084421.127697-2-Smita.KoralahalliChannabasappa@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123084421.127697-2-Smita.KoralahalliChannabasappa@amd.com>

On Thu, Jan 23, 2025 at 08:44:16AM +0000, Smita Koralahalli wrote:
> Rename the protocol error struct from struct cper_sec_prot_err to
> struct cxl_cper_sec_prot_err and cper_print_prot_err() to
> cxl_cper_print_prot_err() to maintain naming consistency. No
> functional changes.
> 
> Signed-off-by: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
