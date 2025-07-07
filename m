Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC1283FEA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874758; cv=none; b=f1eQ5pS/dyFvCeHwz03pB2Oe8EnlLK/5vafJIPxA97v7de9x2l6/PVRUm1YR6im8NWCA47PbqPaFnPLfCcjmSnuMlHMkYt6OWEqyMTaym1QFGWoNtCiZcu3w5bS4jEv7Unfk1brQlArq0VaXMe0iSQg3mxpKKxLvhl3/xez3Q0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874758; c=relaxed/simple;
	bh=GHD7u8MLy6W9x0ZQVMwgkXAbSYr4OeXpNJoaDqFzbxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWoCnG7KG5GE1/P48Nff/t3Ojf0lUPIFiss5OEe/id7OwKX71rb2pXW0QlzA1swDvtRIUkB948au23CKh7iwgz5TppR6nXM5te2mro1HTAy0no1uENocRoDquINgRe2U0rDVn+gHV8Pt8DSNWyeHn5nqgT5JLJG0fQ+TS43XLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzBwDFFC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzBwDFFC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7481600130eso3822232b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751874756; x=1752479556; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qc9/Jm3EhOg6r3cSjvfW7JqJ4HY8qkLQsGPxe+uMLd4=;
        b=TzBwDFFC9jCnn0uz1Bxa6xlu+EVd8UMnpejbLVXfwSEP0p3Er0IlWg0yEAZfQwtDKC
         Bnu5Y2yu6Y9XKFIlYClSx/b1lRGgwzJw0C0j6P0IKAGUReL+qU6tw9fODrCZDcQeIoqA
         ZKbKa+GUFsAziaDGYBAbg4QYd64imbna/Kz9cMXrstIcR7z2JeKUBQia3uTmijPc51eI
         2AYdXV4a8HK9I0qP/lyRNpE7aenXDlMKvDEyI4l5r88E9KQ/WVhqaJ5sVLgnIDRoemdv
         3kx2dL+gjODei6kaJw4hYddPiQZFXUoBuvZCcg5buEbVJNz8O4URtsGvn4w4ajyYz2Uf
         FXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874756; x=1752479556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc9/Jm3EhOg6r3cSjvfW7JqJ4HY8qkLQsGPxe+uMLd4=;
        b=q5nvkG2WwsWNtBL2b3sQ2t6LAYqXfE5msh+euGXyIfwgAlprOWbrcddWhxBuDUr12x
         Asmdd4eIFCIVUpGr7Jh1OzwG1xby/mpNZbvXQJUnw1R0WMUpebf7qrJQARqSsxHx5q3V
         s4piFEkDJC/e+QGoF1o975XOX6FCbLTIM/yjQ9aRKQukDehE0gIyg+c+IfmngZBzMuQi
         YkftasuprnuVpwPd6cRfZ+GpTrQvfBNXEITSfoLXnx3M3TIVdLmoqthDLEcYz1RkmkxM
         wWGvOKtUi6OPnaCFsvFKC1MF8+VbPPMszdKI52hIuuHr6FVu1wb4XVBTV1s6ehpDoAYH
         0R9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiUzkcw/RMFBW+4YRwYDGNBrCgD4ByaD/A0Z1dK0rHu8+p8cSDzm7gv1yh+4goI+goDzY0pcfxAZavb5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr/TyCB4jUQKxZiLvAdofdFLGLojERsbqGuoEG4z28cocU2xrY
	GeLed2CwZ2columIoRWb6uHLU5vMeNLyByMi6wtMcRPdV96yLi0dPHNO
X-Gm-Gg: ASbGnctwTMOryoNDyfGIvWB0kPy5fav3WndsK05kyUQePGmd0njTh7IpnPBgmxJ2hWs
	QmTlFb1VcNtjE7lZjdzMZlZykMMRq2s7pgRXmknuSBGqlS5bo81CVTkmFWMhJAtYtwqqaPDAvWE
	n2Uo2kuVh3pVeCdWze+O/NiOLXIHBz0+oLIcilzZICxgalSCn19lSVEOpYTllTWhAWPLZnoaASi
	mJSp6rhRPP4ttfMtWXY3az+sjo8j/0S+x2xgbJC94NYSE+V/2r1d400o4j28B8WM6IttBXANXWO
	D4RPZYZoCYllg0UbCesxIdIypAaD+4OB4ktrSA1wn8JPFXvcpan05wL9/w3tmq8anhAi
X-Google-Smtp-Source: AGHT+IEirJCByeAXvTvV0Yhd1R7ncfdagNA5N2NijJvg5PjE98/jpFGSFyXappMWaYcr8iCBMWXpVA==
X-Received: by 2002:a05:6a00:218b:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-74ce658a5d9mr20099941b3a.3.1751874756120;
        Mon, 07 Jul 2025 00:52:36 -0700 (PDT)
Received: from gmail.com ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cbee8sm7884537b3a.40.2025.07.07.00.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:52:35 -0700 (PDT)
Date: Mon, 7 Jul 2025 16:52:31 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] xen-pciback: Replace scnprintf() with sysfs_emit_at()
Message-ID: <aGt8v7RyBocLDBfY@gmail.com>
References: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
 <98d87171-741a-4f50-a632-e84dd24c6933@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98d87171-741a-4f50-a632-e84dd24c6933@suse.com>

On Tue, Jul 01, 2025 at 09:32:31AM +0200, Jürgen Groß wrote:
> On 24.06.25 09:04, Ryan Chung wrote:
> > This change uses sysfs_emit() API usage for sysfs 'show'
> > functions as recommended from Documentation/filesystems/sysfs.rst.
> > 
> > No functional change intended.
> > Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> 
> Juergen

Thank you. I will send the v3 shortly.




