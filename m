Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C92213E61
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153738; cv=none; b=AkNSc0VigC7sn/KnZwRTeuhzP6m+Zuj+4qAruDhg1I9JxskSUa6Azg4rIfcPPcZHIVJBRIeQsbl+d3paTIXWQYDJ276X4JNz38SH096VrWwD3hayHsrGwMl+u6Ngs0wrnvT/WoFKvivUExsdevKAVre5/QIji4cvXbZP47evdBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153738; c=relaxed/simple;
	bh=3n5NcSWbMxNV65pkiH8xO7XiulAHfo9FuvZJ/52Zbn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvSdjuDv/koxQUDBsYLqffhPw1Md8LPnDmOPLcqAXhWcI087DMpUO9UKgLX7ykiAtKBgG2pS0vrqkpPXsjjqAp/aw5UqzZfpiOItyaQC2+GMSPSP9JHjc9qSjflC5C6s72tZJglXbd1hY+4d4jnyCdMJjb6swDXa+s0y4FmKeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nw6sNeId; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nw6sNeId"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3699304a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743153734; x=1743758534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8F6/Mi5t6CvVa6NbJV7qdkNj8IUB4iUseQrodXPdQU=;
        b=Nw6sNeIdeMenm31Ozp9zvLFT4ZPDxWlDC0/xuDM4AlHNphNItUXe8s+cE5Ten/Jf69
         lTK8JwKSd7JXPFYmWERLVFTRRn4LGyUbgnkKXaiqaazYrFgvrwzKyuMEgiz7m4chXGAU
         5N20ifyoLnKHscaGLth7Y9yFv7HumouRleXmhuRc3yhhJm67NE7tijwNiHeOd0tn6u1m
         cdkjp+A+a7jA0ktPZ+DV5kX0+hXu5Ro1/0OA0mc17+iwFk06Vb4P88Lv703IcLwJn/NQ
         PYqvyMTjeJIf+TChxT+uTbJDOvMEFRCW4YwP41mlxLSPqR+XHMWjY0UjmkRJjKKqbAMQ
         b3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743153734; x=1743758534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8F6/Mi5t6CvVa6NbJV7qdkNj8IUB4iUseQrodXPdQU=;
        b=E/lfkPxj2SY4KwGh6mamHU2mKQ6DyIQo6UN31XaeSzQ1fEYCAbFqJ/XyYLIIZMTljl
         4H/Apu9Ku+WCwwzbdJrQDfjl8SrLDGQvm7efTzNU2N8vdW+784wIzE/NdxjKukk/t/Rt
         wvoHBZff+cgJd+x1a1h2px0UyDc2hjv6Pz2wCLOqaT586VUBvuAsjgtSUVuuXk39a6SI
         tlQ6Ay0M7dEwSM6mqOyhZyXqjv4BzBS9+H958i0rzYEH3Tn4wOe2yypdRsFFslNdvnxu
         K3cT/uwoI6eH2AWwv8XLQahLmv1X4L8J0UKyv3KnOMh3NXxX/whz7oXNaYf+oKHhwgie
         4kOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXahW8ZgzOpXXgd4o1PeKG7jWW1aKrf6gwJ2ideW8+lv7Y1SQORhppPe31qU7g1gzsXmU0fKE9XNngmdl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaIBJ5iriAcOBl74Aw9NRai6ShMq/yvp3MIplZS5Drhz4ACH9F
	Sq5icl5DVq3OryioVZJfaCHbT0udIwUloBPHvIt+eP+V55cFxpHasHx2910N+BU=
X-Gm-Gg: ASbGncsHTRBMGweJhR3/OYM9qDsBKVymis6HUvbfEIewSDO0eFq8Aeo/hSRpxOXwo09
	rUQcfI39roJllAQ7XCalRGCd1/WWmomcWUBEVmsdGC3NANhdLfDTdKZfIfV1KLotVgX4/5n9w7C
	aNXbt0fbumrTFfE7Q22518gesTFSgCuGS94FfTojQpOpvQqnf8auDMf59O62sEbO+49rKyMHZ90
	vIsbdXiTno8atTjpEgePE67l11GIudTuVw29Oucvb2WfFQmFPGva4yq/fTXCHk3k9lyHNmSDYZF
	mXGz6PxdnUz1jQ03JnrT2rEfaEviOJIgJqDa7I7yrA==
X-Google-Smtp-Source: AGHT+IGqVO5GOBdKSR0UHnmKwqXfKTUeeVTD7NtsjeXDRVx37M2iiHUK4xT403SV1qcakAEOpZYu7A==
X-Received: by 2002:a17:906:c153:b0:ac3:4227:139c with SMTP id a640c23a62f3a-ac6faf2eefemr758055966b.24.1743153734352;
        Fri, 28 Mar 2025 02:22:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71971bf3fsm126205666b.182.2025.03.28.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:22:13 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:22:11 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
Message-ID: <Z+ZqQ4pU/YHEI2M5@linaro.org>
References: <20250328084154.16759-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328084154.16759-1-johan+linaro@kernel.org>

On 25-03-28 09:41:54, Johan Hovold wrote:
> Jens reported that the sanity checks added to the new ps883x USB retimer
> driver breaks USB and display on the HP X14. Turns out the X14 only has
> a retimer on one of the ports, but this initially went unnoticed due to
> the missing sanity check (and error handling) in the retimer driver.
> 
> Drop the non-existing retimer from the devicetree to enable the second
> USB port and the display subsystem.
> 
> Note that this also matches the ACPI tables.
> 
> Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
 
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
