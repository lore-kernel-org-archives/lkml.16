Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88815B102
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908824; cv=none; b=Z6gX07O9aZyOLFkdMDM3lfYR15BtigDag1bHu5ilRgmj9453ndiJdujVNQSoSQ7tj7v1gTgLZBM7zYNZ2sehYSaegYJNEaiSkuNYFKMkVmWEASKPh9oczvuxn1r9sWEUCrScEpidgAyrK6aZjc0BPmWdBFCTaMdMnNp6eceH4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908824; c=relaxed/simple;
	bh=dpaZXi6Uy/hcH7ftkBr+q4yRqWSwSq17UhJiP9K/hvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTNuGjsTlI74n5x7I8sZsqzSRfEXZVH7fj7uYox9tmipBDLdKQFE3T+DqA/vVYWnABRxhm6AmzgPd+00xAQqUVpXV6HvRJZm57ouPNLkJ/yX7TzVQkLyjzM+staswuZmR43klRUKfJkBKtzxyhI/Gg+0jWbC5+unxilwKs7HwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CywcktCi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CywcktCi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f53ad05a0so3540755ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738908823; x=1739513623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpaZXi6Uy/hcH7ftkBr+q4yRqWSwSq17UhJiP9K/hvw=;
        b=CywcktCinJrrSZ8RfhE/ZusQeLoEdxcDEDp8E0SoDqo3VZ49FvKlycxZ5Bfwcd8bFN
         DULTEAdMYNl9EICVVG9kFVep/HciTr4WDOeisiSfW34gw36o3TsA+hfBBBUoOMBsnhpY
         46JEYKiXk5Fb4bef7jpRhCd2rr5zSa2I+3ruwTmCAxa8wd9ctziLYcvSle4eJM8Tr01b
         aX4mbe60hoforfwP6IDu0Il/hBi6GDUhQ6Utt39aA82ceFq4ijuxUJVB1Y0hgsTZ9BnJ
         IpCGDGj25JeD+6YgPnpKkTXEo2kxBIpsdv6UhwH6SY6ZAOMSEIRACoeD3fMyG/fq3yLb
         9yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908823; x=1739513623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpaZXi6Uy/hcH7ftkBr+q4yRqWSwSq17UhJiP9K/hvw=;
        b=EfXmCLB+TFMhfNOAAmL61u+CnZETf9lTBZ7Q43zIuJg4DeScH6lOPiIf1KaZFC5Xlm
         S0ZwZrz1qAjHOQAI1/g/Hfu2nzBMUgpUwigM4j4DgwTRpJnGn1P3huLl35Pn7MMu5Mk8
         E+pA5+V+N0XQ6Que7dn3b+tAh7SCNhh4FX4aXFzPpMtyDXcUY1BTFcMaF8NcqiWURP8Y
         vPdNbqlfanQWrtuo9PG4O5v1RDoFHY/hexQeJHiYj1k7KOIe7Q3EkS4L9FwQxph/95yj
         Gr+oUaxNQfGKTDTAYNgYD9rAQgNJLj0xlhGLYgHUVzNS/X9Y+lJpi/bxHUEjkiWYO247
         t90A==
X-Gm-Message-State: AOJu0YyKYQpVRT/dTlDVXEzwDRGkvHIlwuET9+MRyNDrYnG7ac72eGmi
	7SNHbxmGcZ4yTFB3BnbbwBbeJjI/yz/RVk2o86D/HfpDNjzbNsR0
X-Gm-Gg: ASbGncuLxIlAt6Qnm2pFrxTHs68Pza2yEqg9NLa7Fs+zVSq5JjkmJIs8qeJySjkz02Z
	BDMoyla1yDrIMenrk+Kt2IbqiYb0DXcOH5HoLEtICtxNUf1FB8nSdYwiSYlq6R3jcb4oo17dN1M
	TuI+AHbedmWdWJT5TVRw4hfLJE+gcclYgsKjLmY9c7sqac0zgqiPkPgObvcFTzPIWyBXC2W7uiU
	SZ5/e5dDZiVkJSEpXg7BG2eG3w5P5xUKDyw0NE3PDBe8wBZpJkgQPg/XvwU4RLPvNO/PGvdam/M
	bLyNBqD/e3X0BhsQKnxeN9yTJlbmA3k=
X-Google-Smtp-Source: AGHT+IF4EkR2ivum3VmCCnQST1j5wS2JtDBDxrrrHIhvikkKNyJhNf7xmvHNcQK8Y7WFxmLFlh6IAg==
X-Received: by 2002:a05:6a21:170f:b0:1e0:c56f:7daf with SMTP id adf61e73a8af0-1ee03a21dddmr4313077637.6.1738908822661;
        Thu, 06 Feb 2025 22:13:42 -0800 (PST)
Received: from [172.20.10.11] ([49.130.99.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf13absm2255060b3a.114.2025.02.06.22.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:13:42 -0800 (PST)
Message-ID: <f48c3c74-5693-40b9-a869-577e2fbb5069@gmail.com>
Date: Fri, 7 Feb 2025 14:13:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove myself
To: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev
References: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hector Martin 於 2025/2/7 凌晨2:21 寫道:

> I no longer have any faith left in the kernel development process or
> community management approach.
>
> Apple/ARM platform development will continue downstream. If I feel like
> sending some patches upstream in the future myself for whatever subtree
> I may, or I may not. Anyone who feels like fighting the upstreaming
> fight themselves is welcome to do so.

Hi marcan,

It is sad to see you go, I believe there are issues in the kernel development process as well.
Aside from Apple Silicon Macs, your work has greatly simplified the work
required for booting Linux on iPhones and iPads. However, Sven Peter is still listed as
maintainer, so for upstream purposes, will the https://github.com/asahilinux/linux tree be used
in the future,  or perhaps the tree should be removed from the MAINTAINERS file as well?

Nick Chan

