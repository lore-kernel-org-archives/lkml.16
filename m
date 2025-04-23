Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA89EEAB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426007; cv=none; b=iGsY0SRkCj9wVwwSscMA8giE1by27VvRwkfykIBX6Ug2uvSsQ697AgOtMOBEquPr7PlpRZlMfXxrozsj7OJvcQR+oPYSjL4WTMwAP33O/6kmFZ6PCD82f1daCBtHk2RTT16DIOQu1SWdDW010d9EoD4PjMD8MH8C3aRboeyhQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426007; c=relaxed/simple;
	bh=rSM+EFsjSD1fQZVjOGIdDi+cXZqnNDV9jV/QfQczB/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JftK6sGuO2+sdM/mR+4GGK5APhdCRlMI+7GEMNO+MYFAa/pQalrKP/Y+xhNZrRHR6SJ/LMcACxGTpsJmVAIlW5SoTOLbhjMm6lf9zi9xjKFIObGaUH9obAq2bzsD7Yhb0FwkepeAnfqyvrQpDpSlFr3uwNEix2ASJev/M2M1EZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRrWudTT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRrWudTT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso55875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745426004; x=1746030804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aasRYpj7F05sOufZTkv6nipdyRlL5vXxtfAyn5Wy74g=;
        b=fRrWudTTxwcsyy6GQki44IlD4UCC8nodK7zBT7HhvFnSIvK1Ieci3nPDv8k3j392VG
         2XfL8qNbYquFddgfgDP87zKNjeiW5Z2fTU1MwFAAGt1dE/XqpgBAisVTvRlOXAV+jnWZ
         iaB7xjueubsZXLhvih7GTIcLXtz55iB6NaCchtDUVx/Fa7Jz1/HeuGRslJTBnPBDlVou
         Vnwnf7xxzyXWtuyB7kBA1E0eOBVy7KayUIDDnFNZxdgjsRnSY07J6yvYQ40rHpcaBJwg
         /jqwylFMFQ9OTafN3r84qoENr95g3YEnISclwgzznpKnRrZJp6foou+Nxtxo8hGVmVVT
         JRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426004; x=1746030804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aasRYpj7F05sOufZTkv6nipdyRlL5vXxtfAyn5Wy74g=;
        b=NIElDxOKRDaEFUOgcfK3Wi1BfkOGbQHoTX2DCsevyQBJLEDG4/7f83G6LdISpMapM1
         dAKxXrm4XaOT6VuVLUx9cKv5+uFUykwYbWDlzmKknbOxgx6Js9q3vTUj3po/R876JtdY
         YTDPVijngzzsR6HSTkNfbrmBRjj5GsauEWJrQkTDTc+rryKiblQoxCU1F5g1rbFXmyjB
         waD14t+g96MNaeFomgdpthsrumgA3gZpbHd7/j5ttUpodXu2/VhCo+tPmYjBUg6CGui7
         89k0ausyW90gZjVZcUR77C6aGG9ZWDEVkqocpVSGHD24JvL35a6Va4W53QUOg7sHqCAX
         0XoA==
X-Forwarded-Encrypted: i=1; AJvYcCWOhPr/jv/6cSTC5Oqn7LLAet9XuON6jV+/Plea9PP5s3nWYv6robloE/t7INYl1DwUi0ulYCa8/rKk0aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCh5d+lyhs6SPWgCdLxmDqk5KF5Od2K38gFEtV+PpzDLllm+M8
	5S1Sqp0hb6Q6I9QEc4mGnmI2gkFDdG42Ah3lVniULn9/wIRT4oQU
X-Gm-Gg: ASbGncsTTgcjlBzU1e8vkiTxU+OeAKkwnLn05fmJn7rYK6I3Z+A9f8uMCdtVdiaR/JQ
	4IfO6ZfovwMKwgMwun2h2sQRCslUS2vHBD3bJIkzy/US6GyqCuXN99AufSFtcLbLRB8cYYpG+UC
	5ATL0ArExQAi+5Cx2twOxMy2duWdMXLJgcSJa5+wncinCUplmL17xEyN1mG/lLc3mHau8lh5PaK
	kA6BZUvnFnhoET5Y7bA+8exZ+AXi77R1ZrAYJzKc1CvwkPKYMXat/sItyXTsF3jGV8jx+FXkmCQ
	8xwSMYKcOVbX5gya9MxeK53gvS8iU1JQR6io
X-Google-Smtp-Source: AGHT+IHTxs5ApM4KX8y8JA6bgu6ME1GUQlOV5BttcxQMOG6MHXCWxullTHlG0OYtrJZj79e57BvGlA==
X-Received: by 2002:a05:600c:5008:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-4409a0403a1mr1854745e9.7.1745426004071;
        Wed, 23 Apr 2025 09:33:24 -0700 (PDT)
Received: from andrea ([151.76.46.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d19ffe8sm27847985e9.3.2025.04.23.09.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:33:23 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:33:19 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] riscv: Add Zicbop & prefetchw support
Message-ID: <aAkWT3AN8xDeASFf@andrea>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>

> Alexandre Ghiti (2):
>   riscv: Introduce Zicbop instructions
>   riscv: Add support for Zicbop
> 
> Guo Ren (2):
>   riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
>   riscv: xchg: Prefetch the destination word for sc.w

For this series,

Tested-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea
