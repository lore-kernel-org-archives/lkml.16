Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2511B960;
	Fri, 20 Jun 2025 00:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381140; cv=none; b=JnDXvcBPdl+EGfR6ILlmZRzDweVn8SV7V5mKQOnTwdE6q/dP646LSYK/wi9TDMYilY2tSIAU5PuSXyKaz37AGcxfBZSTnHZS1Yrm68R+0+bzx+0G92VxmS2zS6GNIBwmNjx6Q1QY+wR3ui4pdthPdivlIXqqIFdhA8FMlEZE05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381140; c=relaxed/simple;
	bh=q2i8Qs3911Kk0ltdtj9t/YiGVSyWNAeuUcRyaXFa/hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ko4IkAXsRLOloFJvxUxSqiHadxqKOJSkdzYh8B5O2NxHSeZBVptDY1ErBk/bzhT/UKn7JwK1PKg28xxO0Dryoq3YKVL86UQsyZFqVThQ7nowmSx+q0J3kWlORyShjUgEsAxFhoq5nJxr2HKePHdkX96SXd8pX9CIMK6ppgrPCVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpRth+7T; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpRth+7T"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b9dfb842so11852625ad.1;
        Thu, 19 Jun 2025 17:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750381138; x=1750985938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gNfLmL2GJ/LJtjmF47jC/MYcsOmvEuwoo9HPi2OM56c=;
        b=gpRth+7T263A7pb/iRhJvWRuhSnhw7Jw/GroHxUKkh9qztxOt0mU97+AoQpg/Afako
         hbdTwepekd4UAjdjrQp1eTAPygSB/rXmkHGS5G9hSxdy2enuRYQcmM53p2dMzHpedSlB
         pU4cm9hV26UBXvdSqZmkIS0J0VPodKfHKJlPsoTE2+GYyneNNho9+1gJRZZjUK4IINBe
         SBUTV9WvyCfV1zs+mhorJN/GGTHbB3hdVM1rSoLWv28ucSwD8gv9vdqUBT13h8Vef3Rv
         Sjh4XLin+bJPx10H8k9YVztNLHJOXBPkzIe8T1KWwWOAEVEAuOS1XoxneoIdqehzNqBd
         etzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750381138; x=1750985938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNfLmL2GJ/LJtjmF47jC/MYcsOmvEuwoo9HPi2OM56c=;
        b=k0fwZOCwdkam43A7KmmbQjOMgdsO+qLUcWUOW0cJ53u+bQqKsNi1qhp4Cu8mLAvCQX
         3hHEtTFILI0IWlgZsYiCGrS0WmL8LYkTbptKEPflKNbE9aBJPynXtWc2csg4MCJlGVRs
         y7oNipyZ5Ao0s7uofOKRNUQHxKrHXaqprF0hRrcJs9/V1lawvb4eNpnIHyqrqXuf0gWd
         ++sKUlvCgztHesIRqkvpJyPBcWIcbvofwoAVO6DwItsn15pnMDyRQ6422VaRWPmGT1sB
         SR+sY13Lz3pvyRvr9N3ku/yoIFmH7rmqFRD2sanLGRfIc/wmehxizP+teE3SFduUc37L
         1BXw==
X-Forwarded-Encrypted: i=1; AJvYcCWjXIcy9M+afoL34fgqKs3a0ZFd6DxcW6y3YHsZH/kn5i2ShDK/Uvy2tVhhfs7b5AzChJ5FnsL9ydZvtDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6OFo9XFtQGBgdI8k2AJ8Gvbmn7Sn1+rhYbw7BmxxpOgfRgyif
	Tj3X2D4w1e7AcOyJTP34uMS2l3Cqibxcp19k11d2j97TLfoy/dWoPv/B
X-Gm-Gg: ASbGncs7bBWr8pX+umSQnVqzth6tyaEkS6/i1dRRR88Nfzzlar43X+V2W/wUwptHx5F
	YUqBjwT9ZatrL6mV04ti612XNwp5fsfqHxltRDjk8214FPXQbWxtpQq8qU4jbxE2sK2EXL1iAAZ
	IuwOAeXKatZSBHZ7zMCvijIUfDEx5Hvjrb+K3YtK/oWU9bosx40ND/iGdVAMSrQQ97fN/7t7vPT
	dXM26ZA3RtouMV+MO7L8hvEb0XXw+p8JmfB9tE//INzsF4xf3dkaaTPM/LAD8h192q6Eczd0Qlc
	aHxD2xSG1EFxScmNpBpbcle9MzdqCNgeFPKxmJZk8Eyrbd1+PwuEQKcJUfqeGA==
X-Google-Smtp-Source: AGHT+IHi7aECeHZRnPC7vw6NES/MMPC6y4QJZ8P+xcgs4+ESGezFPvNV2kX2PNH9co3DTZQXCAXUPg==
X-Received: by 2002:a17:902:f54a:b0:235:f3df:bc1f with SMTP id d9443c01a7336-237d9ab626bmr11772325ad.36.1750381138271;
        Thu, 19 Jun 2025 17:58:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83cf981sm5109995ad.59.2025.06.19.17.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:58:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:58:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing
 riscv,cbop-block-size property
Message-ID: <os55zbba4lz5dkbrejz6pzsxn3o2brtchxvp5sdjrqubavwoxi@ktyfnjaqchwm>
References: <20250613074513.1683624-1-inochiama@gmail.com>
 <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
 <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Thu, Jun 19, 2025 at 03:30:31PM +0800, Chen Wang wrote:
> Why not apply this to fixes so we can pull this soon?
> 

It is not a critical change, just a forgotten property.
I think it is OK to leave it to the new version and
reduce some work for pr.

Regards,
Inochi
