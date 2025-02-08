Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574DA2941C
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738977778; cv=none; b=oOOXPD6yy9b7D8kukuiVulVjrtAVb7Fob7zWrftG8vVCXXjq5Yrshe9TPmtdAw/+t0i1klu8kxLQhhz3wDFzmt44HI+rCPM+IkZ0BbyRLiKKfuXSZTL/39fgaUAaSP42kvRWImdUwRrGM3Z9f1NO7Bp9aSDucZZVy2f11ezrQlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738977778; c=relaxed/simple;
	bh=O1zawSqtTaDgxfnRCxchlXO+mOBQc184IOTdX+I2CcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuIO7q1Zc2ouf7S15+pcDyVYu8U3Z2QVhA8g8DWejhWxWtgWq8h71o7R4W+pnfknwYYv0RtaQnJFf1pKN3D2W/p1VNOt7HIk/Hsqd29Qy4mQWXAGLGHsG1ZTnUVJCcsFQey/AwoaxvUmkOx7IpNyGHmdfDre4X12F3lMDLbHBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lg3mJZUY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lg3mJZUY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f2f386cbeso48215195ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738977775; x=1739582575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1zawSqtTaDgxfnRCxchlXO+mOBQc184IOTdX+I2CcE=;
        b=lg3mJZUY/m99zUttLivvH3KZGiKPG1PY0ozE8voTbgPkqh2ZphJ3+DgDhotTHE9bZt
         A8XNVsSl1pAN+uOk+NtQ1YI1n3as6vxxa1qF7fZNXoNfqJvK43ozgPb5BmPaNbMZQPBD
         w5tw9JW415KsALESABbf3hYSRjN2Thu2dBwS7qS2fA+X5nJMc+mJiW42zemvqp3Wa4uT
         HM1l4a+B4OfXAtgalAwmyWbyv9o9n5tbx7jagpBg/lSXPIQeQ8i1xcMa0A9s8KHt0GGn
         blncS45NndvRXvDPVAm0E8onm9uFGiuJKIlN+kAbCZnHoMARkiGJlH1BqJqEsR6NMShl
         p+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738977775; x=1739582575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1zawSqtTaDgxfnRCxchlXO+mOBQc184IOTdX+I2CcE=;
        b=foqM+hEavbEOtods8Yo59txqbP1pXluYLA4tIByvBKztfolBZWyVuXnVellhrgHPNY
         XuxSCO19hm4YK/SmBwBspjFbd9lmFSXytPSPBX4hl3DcAxxo2IyWUEBhrW0jvwuOs5ap
         mgmbiBlvu9b9wqN776V83qCQYfimo1ArD4gtJlHU6OvsUV7+oG7hqb5Q3y4eG7gp1WeW
         AgRhwjAp82sEWVJ6WJd/fFcVO4ck2p8t4cgMIXtyl7lLeBJCJq70jXdQJ4CcdAVF//dZ
         jZhPkrDyk0Dvd2FvCRdOm1BQS0SNp6HN6zMNQL4PmjJnIQ+LAIqdMfRNMTKz+SYbMSiq
         Rncw==
X-Forwarded-Encrypted: i=1; AJvYcCXaMi8YSSiYVa0QQeMJiBp12u8r+O+eXqBjKgmKbbENQmfCON9cJ2iKlIX4TwXAPQJB2SxzZCle16/JTHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvLjPLf0OjNTAU1jxycSX7P3fsVfkgGhwa8qdNk06XsaJMf5A
	iBxt9DjssfClJdR4KnOyoei0IYnFPih3SraC/ma33aoBu91QIVzobbZmTox2rHEaaIU+4BZaaMU
	PS/cuXA==
X-Gm-Gg: ASbGncv3qptqO5ODzQb68BIRtO0R91snQ855rcSTeUeMpN0rryohrFuMSyss6oEWHOe
	t5+sVl5qPhhRGhhTQzh7t+Hu3+D81jFSloq85H82n4MVHdfl2XbFuzyTkom9/0Oy1vjg3DEuACP
	dxJLx6BnIZmHV4pT8Ff/oIXUVw2K52dfsPY+WNeXbzhvqKG8VZmRrAJUMkpqYSTDqCUljHOHrmu
	ikFvocKFHDJgNE7LIb8Xy2JTdzWeb5bUrpbfnZSPy1FSXmdrPkudpPligTHLxR8DaDyTgcWqR1Q
	An0Ykg==
X-Google-Smtp-Source: AGHT+IF9rISnfOnpR3xvYPo6t1RPT4dW9BdSGa2sPl+vTJMnbdXop1lg+6VdmAE/oTZXzpREQyh4XA==
X-Received: by 2002:a05:6300:668b:b0:1e1:9f57:eaaf with SMTP id adf61e73a8af0-1ee03a242e4mr10303690637.6.1738977775668;
        Fri, 07 Feb 2025 17:22:55 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af7a221sm3736753a12.75.2025.02.07.17.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 17:22:54 -0800 (PST)
Date: Fri, 7 Feb 2025 17:22:52 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6ax7B45OsGerjfA@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207161939.46139-18-ajones@ventanamicro.com>

On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> Probing unaligned accesses on boot is time consuming. Provide a
> function which will be used to look up the access type in a table
> by id registers. Vendors which provide table entries can then skip
> the probing.

The access checker in my experience is only time consuming on slow
hardware. Hardware that supports fast unaligned accesses isn't really
impacted by this? Avoiding a list of hardware that has slow/fast
unaligned accesses in the kernel was the main reason for dynamically
checking. We did introduce the config option to compile the kernel with
assumed slow/fast accesses, which of course has the downside of
recompiling the kernel and I assume that you already considered that.

Instead of having a table in the kernel, something that would be more
platform agnostic would be to have an extension that signals this
information. That seems like it would accomplish the same goal and
leverage the existing infrastructure in the kernel, albeit with the need
to make a new extension.

- Charlie

