Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413D5142E73;
	Thu, 12 Jun 2025 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712077; cv=none; b=N9rNBlIJiRHZk++skbApflIuwRrld0Pt8lEzFEwrwjeLQNxrtvojsMmEoQ6m68mv4RyFr1mjnsVgT5Ve5qreGlMKQgOoXByJwl3mXDqo7zJ2QAc78VHa6a5xljnHH/3OCOeiveXr4QEUdPW5eMoX47COJMQc9lc1zqXFEP9JF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712077; c=relaxed/simple;
	bh=fcbcUsdmGSWC6B+UaH4cDfyK1n0S4FLllNdjhTXZzr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vdx5c7+ttOOdE0ox88mpGglcHswhU7XpjICl07ZOryC9iLngkRWELi9+Fkq8btn1OdaarNuzSprnY6LVcJleJX06FC8e2/st2PPw/uCIzqJ6dFBDiIU5g1PmXp6tVYhS8LbI5JQn2OOW8c8BnlJxM4+TaXIzr1naSliLUG/Xj94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kow2OY1i; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kow2OY1i"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso935875a91.3;
        Thu, 12 Jun 2025 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749712075; x=1750316875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAOjJxhCfv8VWKL7BVvY9ZNzsKcaY5YiZqclR7H4/vs=;
        b=Kow2OY1iF0KD34H77JO1Y/hgIV2UH6IA2mx8lcd5ccw+l+c5ABmaipVzaiklpSzLVe
         6q93GMpBqrPTGUKAZ6rpNoVRQv1bV56rUC/2uei+oz2sER+trBH+6xuMhhGJWYhQEaE8
         btR5cEU1EGkZhWXwrDL2E3p4XPTo7AJOqXZQibMzW8mnIi63LPjwaqBMscVvL0BEswr1
         JBf2R4XFV9GNIY7piJ1Fwg2Y8tRyvg4QcSdpcRgC7EhloHOhadzKFv8uwC+A+x1diCgd
         G7IF/pzkSG1iGT7xhfeJp+W1MkHGYaE4moAjQii06O8KUMPiLcXGQxHgGcrrbS8WM9nQ
         PWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712075; x=1750316875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAOjJxhCfv8VWKL7BVvY9ZNzsKcaY5YiZqclR7H4/vs=;
        b=VtIAjFV2zXPPXok7tYq2u9yr4u6HeqhuNf6BquJjWDbnS/dTfY8P/3TBwi0jSxuAcB
         OWu97rGgsAfs8cPuoCsIBgbepiBSmh0H94m0MGb7FX3gBrCHUDvZMtW5VFR0lNNAyYyB
         yOFAJelprb2S2l1rNP3/AZrc9fu9GSTvp8O9NLvCI4p0kP4SwP/oSbWSdrWgMQwBIKez
         hybLNSzfERpn0cGx70FKwbXO3aIjmI5lM8tt7DgMA0eyTepqr9l8JHhaFIGQLNKqH97E
         gZLCYW6r+DFpyL8ktQ9Nwg2i3eHhYT2vp8sFUHRcmMfUz4XV7+7+ufil27S8mcMopn+B
         M1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnc0Dy8jKmC3rByxNhhGeDRUT7RV4aN1j0Y65102epnY7Y2R0WTCcynKZS3sUt3LLCFoHVqa1iUTWN@vger.kernel.org, AJvYcCWwn1BS+2PW2SMdZZybcrWQd+SLviq5VvWf9/LQIh0UxMM6+JuPltPBNoFBVlpC40W6dxyehawTdXMYp2US@vger.kernel.org
X-Gm-Message-State: AOJu0YzazXTpkPhCe54Fc1TdLdAP5fYZLoPAGJn3SxBvLD7EMuHW3OWt
	knwJxjWJhMVxhYYVJhd8ZjYLcwx+1a6E46t5iX/O+VwBLcdlCk0SJVUYqmNp+8tZGQA=
X-Gm-Gg: ASbGncsHzNAFiTLJe44cgltdiTdmSWvcM20a/W7DUzpxB5FptaxcG1WkaCVm/+QvtNu
	BjEsKrHwnXLVbAfwx4IpHSD9FS3vQFWrKI6p9vFxqLtnHRjMrqPhoKoobS1q0wvu5lYQ7Bt+DvI
	Qj/fv0t45xhLNnb7vhbVc5FnkIEBZcoebAMeY2snO4s3Espf4uKzwlAEuZJXqbcgPuaVJ26cAtD
	Rl8Jc/wZgTehthGis5olQks9JfrhszNLn3CCxiCMT3MC2CY46r7Np0hczRgzAgtbYz4bwnkQlwb
	WOFi4rxBiZxwLU6qRi2zt31/hbLfwx8ilPT8vgZIm6bI4DwX/ytWM7HbZJ5RqKXDXYZqFvwP3NA
	qIND8pLvePyRgHuJ1fqKInXQkZ48xQVs=
X-Google-Smtp-Source: AGHT+IGfi33QMmP2NxREt3lPErfPBTHFxGftgC5xTDBsF/Wzhv8TdBvW48FWIe805inRamkcxDRnzw==
X-Received: by 2002:a05:6a20:729c:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-21f86600846mr9497042637.8.1749712064431;
        Thu, 12 Jun 2025 00:07:44 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6 ([2405:201:4042:d128:1895:113a:65dd:3ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a06b64sm738064b3a.143.2025.06.12.00.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:07:43 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:36:56 +0530
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
Message-ID: <20250612070656.bir2ywkwu27gxs7d@ankitchauhan-Legion-5-15ITH6>
References: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
 <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>

On Thu, Jun 12, 2025 at 03:01:58PM +0930, Andrew Jeffery wrote:
> Hi Ankit, thanks for the fix.
> 
> Regarding the subject, can you please use the prefix 'ARM: dts:
> aspeed:'? From there, I'd prefer something like:
> 
>    ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes
> 
> On Thu, 2025-05-29 at 17:09 +0530, Ankit Chauhan wrote:
> > Fix an obvious spelling error in the dts file for Lanyang BMC.
> > This was reported by bugzilla a few years ago but never got fixed.
> > 
> > Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>
> 
> Please make sure these tags reflect convention:
> 
> https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> 
> Rather than spaces, they use `-` to separate words, so:
> 
> Reported-by: ...
> 
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=205891
> > 
> > Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
> 
> Finally, all the tags should go together in the 'trailer' (final
> paragraph). There should not be an empty line between the `Closes:` tag
> and your `Signed-off-by:` tag above.
>

Hi Andrew,

Thanks for the feedback. I will make all the necessary changes and send
a v2 PATCH.

Kind regards,
Ankit Chauhan
