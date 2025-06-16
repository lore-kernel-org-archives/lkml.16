Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307E1DB92A;
	Mon, 16 Jun 2025 22:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112256; cv=none; b=qlvsor/bf+MyQGQxQW/p3fAcYT4GdL/hHo0jkWb9qNvk5trCRMBMsGcye1MAm9j4WVEBYAi81baOvFRU903nQamgdS3MUt8iXUbp2PUq0f9caT28/+7Uge1WO8ctEPNw+nIpiFCCP7iqzgtljoqwei2/Z4/AG6nFwD6ttEytPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112256; c=relaxed/simple;
	bh=Eg7dbGWyyu2ply9sTpPNkidpw4vMgJloLSO8OXtQ3EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBbsaOpViElVZ0TAoI1aN9s+HqTwwRFqUcuSJv5KiOKL1PZeWF7pShX8AcUZCfiG+H+QwhIcNyPYrMCnuaQInpVpD7wgpJWncyKZvrKsO76jMNpdnaEt8nxoSgJVGbVTJ5Jkfq8qd5flU6AiMGFpHLlg8Xs66iGsVUTuj4OCTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+p5pLSR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+p5pLSR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2350fc2591dso46341385ad.1;
        Mon, 16 Jun 2025 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112254; x=1750717054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=;
        b=m+p5pLSR+0ZHTKHZnDxtHlUFbZo0hw4d0lr08Ty1jLN8hoGJj9o6dThgcn/RUOb7ox
         h2NrjOyQcGrydzwUk09g9mzb6+RxjP1UwvF0PXnfAnlAWmXsYQpeeGFa66OeZ2BrNEow
         8sxfIb1gsh/cDdgqLTIjR24qApA1u9xEUYLXfpJOMtzvDdyJ+PtRKwVZ7F1yY1Xnoesf
         xARjjvch8oZfgReX5cbDVHPoDFbZ1vOZ5ByL0y/hijxzmqaeR8aROhtYpt/hKICOpe5y
         udfQuyST3G32cPtdvYz/jAtQagO6Vc8oNdXx2ZvJkh+8KZQ3Oxd1DF9E3LxHhkYfM8xv
         QHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112254; x=1750717054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=;
        b=PasNpv1gJJxbPx888VDInRvLBNgP1bcQPKrJF8Zxwi+i2rghtZ6rSkM1FG7v7dITNR
         fq5z9CI91rpoFvSIgxfIEJiVJselWjyBgayhbyPdvn1L9sMzCmIvYsJsj8+64KkVuEwb
         OsZi/tmJmciTk/sTP3yb2XuYS3EIF38MqUwemofdgc4pCfCx89SM83ImvZ5hWc/CtM2N
         GuPffKeQ+opPfPui/v/Pn10mHUQsklStN391LpvPworu1ShBlg9IJiIkauUmFgTM6f0U
         DhveDkNKjHdYMN2Gc0QIO1UEVdpES+49p1KV46EylD2phqg0xiO8Cqt8y/9mkMKgqs5Q
         IM/w==
X-Forwarded-Encrypted: i=1; AJvYcCXdRM+rQA7cOaO+uy61YVOvc+JrBEjcHXefE/qaUTeV4c4z2TczOt6goYxzglxBeLph9DcKJ6nzMOaByA==@vger.kernel.org, AJvYcCXhQI32WXb1R+yRbj//0p4lZYUKxYjIeiGPX+syIRC2VE+wm2h7eqAETU/SkuGJOnhO0i+D6LJCD6B/QFRk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07Wetc9gRGpRJrLZ4Zmz1tt/JPA1uX83xnL50y9tIcCepLIMv
	MzrLD4fIGiHpvv/cMXHVzFvAs8q2riq3qxFYTAG7U9iVZLO7Cxv/+Xq5
X-Gm-Gg: ASbGncumJ3QEY9MBxy6g+mNxLx1VMIUp9+vwc65j1uo1p+fgOQXt8CU94JsaNCzqMPX
	W5t6tzU5SSO465pP1SC1tmDz/K1RhzqVrZ1dZmruR4AV7ig/UyXyQfnzMRRrL89Iycma+eZ5olf
	Wrx2QdsklzK9ZR9jDBW5zNYyg1AiWJJFR4Y6ZBUETEkq33l4LJ8dE960KVTq0Yft9Bd5R06YshE
	oDWZ0ywgn5w7XJMKFYFpzXei3nfdf8JF8a4dr8AuYaCeahNmORynov87s5ICawj4weN8fiZaC4h
	+t4V4UGSG0mXOfp9figbbr7Wm0c1H5lbeugGPCsdw2DBpDul8RvvI0Ctuc0gSSQZXGeZ/CW+r6Y
	=
X-Google-Smtp-Source: AGHT+IHEzMQYGh+Rxc5+so+AO6P4UVnGiCrhcLAB9kdOjmCCaTuKyssep3cuf68orx+kxzfxw5HgOg==
X-Received: by 2002:a17:902:cec2:b0:235:e5aa:f51a with SMTP id d9443c01a7336-23691c138bbmr3644555ad.7.1750112254563;
        Mon, 16 Jun 2025 15:17:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1643ebdsm7498669a12.26.2025.06.16.15.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:17:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:17:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 4/4] hwmon: emc2305: Set initial PWM minimum value during
 probe based on thermal state
Message-ID: <c43f5318-2158-4f7f-b8c7-d4609dbab41a@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:25PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Prevent the PWM value from being set to minimum when thermal zone
> temperature exceeds any trip point during driver probe. Otherwise, the
> PWM fan speed will remains at minimum speed and not respond to
> temperature changes.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
