Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78F80B;
	Sun,  6 Jul 2025 04:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775130; cv=none; b=E2hc9AVrDbgP2aLAbxD7aluMy/oIKXbGAh1J2xVP9FO296UtOUOXiw1U/R6/+xk0aJVfDA7ni1im2KTICCToP32rADPkBsrT2iuuAXpfXNnpoCo9uAa2Ji8Zoqk8DUBSHvk/ZYCJprJmPQYw85XpQ7RhfUVKgxzebXH3GaNDGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775130; c=relaxed/simple;
	bh=Im1MsfaNI/SXTSokDs/ezJ6B95yDAa0b5tSdfO11BXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBNiRAbxuvvyQvLH6+SJ0THEmM1NfgoZU6gj+wy2itaIrsRxAcvjVLMqj62A7qnFOyh+6n+lfvt/L8sKT3X4FiZbmJPSFA54Oh+k0MC4r8QgI19Al9ONDP4ZDB2x8ET9+bCQhcb+hbg+nORNB92Rld5u2KDENdjqn2wtFZYHjKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9Mxp4iV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9Mxp4iV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so1575067a91.0;
        Sat, 05 Jul 2025 21:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775128; x=1752379928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVmb8+ym3rIBDL7U+LhviQ6wlTsutcclIyc87Szy4qU=;
        b=G9Mxp4iVbWQJdT9thZjFbLsJ9F5KU7zolznGpihVpLI4qrA5TQyCGd1g6zLMMo4bW5
         g0YbOnbACCb98knxNhTEeIITyKETuwNXSWKbP1nj2JnV32sd1ugolx75lYuLWS/JGeXR
         qmihQD8Fpvo/lHSaCZpUYOspECY+n8DcnTXNpAKsI2Hb8mC1vKE+3qKE1J5hzWCimNhY
         5Yx8xyFnDDD2UUItPPh//vMJ/NlSlHvm5mrdsYKYjP73PAh6fdpE60khkyRFDVTqlN7z
         56WghLEUBY0x/WZztHFRzCRISQZYubtDViyjExsnxsHjCR+RkIImlYYbpczTv25Pl8Nq
         w2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775128; x=1752379928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVmb8+ym3rIBDL7U+LhviQ6wlTsutcclIyc87Szy4qU=;
        b=LQDgLXs8RHGfIW4K70Bi7vSCdGvAFPLuzcCUmtZ8kRQ5BaMp/gcXgzlpW9n1zXrYDS
         7DvAEVg1ndtkM3mgT5J7cSdL+RKCmJHziUcEXXdZK5qF3M7Ek6aQ+FHvhp84AkpqZbgQ
         4Wb0khF+hYJBin1sKuv9r9WitLv4EUax4RAcJc9YM4UzNuOo+RPsh4WiWjo149isnd+L
         ril6Ovo2HE9WHlJ58LKZFfUDFJiOSH5ahsMegEkJSkKASHSKtl1sb4nv4yybeOzrGebQ
         vS6bVHfq9Q/iWiaiYk1nPNsuEHaLN1i3iXSYQwCBOOKKvsS/gRhlvqGcz0iawHq/tAqu
         rusg==
X-Forwarded-Encrypted: i=1; AJvYcCVqEpTIwECWgqXBx3nCr12c3oqeAia7/H9k7v+na4tg7WJyL7HTbVFO4kmr0WYw4zQ1BGweJ4//lahB2dsG@vger.kernel.org, AJvYcCXlRRKBq2n1zVTv3LdjktphqVFSW4npZJX1llJc625ww/MW5u58X08UqoT5dQO6B2BTAApSBvPdX15G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6EFEXGCrE4l2g1x6OMefGepkTOFJqDVddK2zK2FY9o5ieiv0
	iofwIKj1UTfSZo4C+SkAgfWcMUXdHdnw7NM8tZFriDvKHY5tpZ8pTF/r
X-Gm-Gg: ASbGncujXurBuz+tZ/cJyLm0iRK07wtcOvMZlRuP90ZCZTT0JoXesCncWtMP+5Y5nCE
	rYtec0GvW2NZA/wUYhbT+70oQrjnmAJiLUSyJPwI0qSD/xwGzkEu3Y/vtY4jI3+OPkBIBlNInMV
	09+8wFC9UE+qVj4wsgDlIgucg4CIC5ccmwAziymleeJ4m9MC8T1ExdNKICCFC0FoDhEtDoavhqe
	4HXjtDZiBZyW2HB/UjHO/hIxXBC5COEVp5zPQhecL9baXU+EvzMBaJL0zCrh/6GfAGoAkhs0KAz
	vp0PINuHTui49L6pXFvxdTL0+APIiqhWvZAffQwJ2XzN7VjVze2YvhvF72ljIA5Rdn3n9KT+Xgb
	whMLdQCpaCmNswpinEZdnmDtTpOqDSKFRkAiRxbo=
X-Google-Smtp-Source: AGHT+IHvXW5jZXVYlEka38PzKTBwvT3r/GnGzZfU2rZK6jmJT69dhrpF0lmwPqysm1iag9gx8vKZWw==
X-Received: by 2002:a17:90b:48cb:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-31aab83725dmr12052060a91.1.1751775128288;
        Sat, 05 Jul 2025 21:12:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457f34bsm53310255ad.156.2025.07.05.21.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:12:07 -0700 (PDT)
Date: Sat, 5 Jul 2025 21:12:04 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGn3lNXQ8cid6jbf@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
 <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
 <aGcBEHMEyQJuzmjj@localhost.localdomain>
 <95ff4056-d1cc-4564-8c44-0535196e7428@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95ff4056-d1cc-4564-8c44-0535196e7428@lunn.ch>

On Fri, Jul 04, 2025 at 09:37:20AM +0200, Andrew Lunn wrote:
> > Hi Andrew,
> > 
> > Got it, and thanks for sharing the context.
> > 
> > I will reach out to ASPEED offline to see if they are actively working
> > on the MAC fix, or if I have enough knowledge to work out the patch.
> 
> There was some discussion about what needs to be done a couple of
> months ago. Look for emails from aspeed and IBM.
> 
> 	Andrew

Hi Andrew,

I guess you are referring to the discussions in patch "ARM: dts: aspeed:
system1: Add RGMII support", and I can find more of your suggestions in
the thread.

I will remove mac controller from my v2 for now, and will add it back
when the delay support is added to the MAC driver. Thanks again.


- Tao
