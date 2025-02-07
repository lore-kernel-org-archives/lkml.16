Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5142C19AD48
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911574; cv=none; b=r/Id+Y7BO9rn3lA3tT4PCydhOmh+8xTNxplv/lZyxy/0xirQ2a8nZoGi93wLTUcusTr9AGARHRYSjkjhkumRvhycTlj6PZsBSGOtYOaLTabI9XhdlxKbN2iiTaSxAB/rL/4MYQkhj7tkcMiywD/myafnssQ3NZq0SvP97HCWZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911574; c=relaxed/simple;
	bh=6kaouR7oZgNLN17kEeH+Pxk7KmscGY+LGC8DZcas6YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l5dYibLKgcD5MqkMosFFXe7XFyJnwQIZV4ILMuPlS9kQl6mdkuQgcZngM1lEzFM6owGoygGaNwKtu+OLYEEX/sNXAju5K7tQla+t9gmYKDRl4ITl7x1quXhG8K0rIGoYC7atp/u2IADNvbt9kls08lIxHJrKrpHNsvXdtKZ8FeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQMvUHgv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQMvUHgv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f3c119fe6so33412185ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738911572; x=1739516372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W679lNgXvpPBehgEqKaCNaQXg+NBsATD/PMGTi0DCZQ=;
        b=jQMvUHgvhqshc1UDYlbmrn7hqzKAA/xWfHWqExxrt5kGXZIwAatmqk4K8bxLgf09CD
         BI1of/w7CPPv2OC/bV20MX0bbYP+miLMF3LFD74xrAmheqJaBM+1O3bnkpDcaMXq/Y8+
         iiF8IdWi1XlT05eFIt9/p5K04KuodMeWbf7F0zQ8v704jds+1JU32OG8lZJDvppe8o7B
         4gWcuNNImslOa7CMbEVomrRbcDzfnw55BaxYVl8LmyqUMrJdp1yveAOUsXQzTbKhXHaK
         6Yd1HaGVyZ+vwCtKTJvElFGUS46Lc5MkB9/8dWHmgnIMTqhax5/0790QcNk9n34GHefV
         YN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738911572; x=1739516372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W679lNgXvpPBehgEqKaCNaQXg+NBsATD/PMGTi0DCZQ=;
        b=mMxvEFmIybhxTQLP7bXpxaPWo1HCkP+2h+Rk1OVC6i9rmFy/Jl5ba7caQGEDhU7dGK
         iQu0K7TBJ5DY2kaWtvwxTj+ynFheMn9Ab6AXNXzRRFnbzkndTTb9GLiiJvU7R+v7tQoZ
         Bt6H9k82ZYlyLRbojPcfPH+NWvT9m4CeTH61GLdvoPxE3CUIO8P9f8fs/ZSdEi24kr/v
         6VVvY+4G0HU7/XCgq0fxqnLJCLHGw7nASgrdZtdMg1HB/cSWenutOMFZn8CNClAItILO
         g8HVBt9VdlFtjPFi2C0KEjZCMYWCxRqzsMl8v6swH0/M87ANTpEthetqejLvq7E8bCZt
         yCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8jbkwEvj+//gKs406M+4UV95Go5nVIuHqPi/Q1YItg02woZRPKB5wxbA/nPeM7JjrC+g5T5EgAY/fSkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OQMIfOcf65eQJmFaVIUX9VWtGnKFEdJFamBKiOWFvH3EUx1c
	+RZfle41JenDxZa55wCA4uqMxC8RFbGRve6+g4SMEkUWY50GpWuurqUckg2XUw==
X-Gm-Gg: ASbGncsHT39AAfE5mXbmKxE8FF4YCPTEoiu1zIIjxn5s1B6yteDoWsYIHp5yajEYHSd
	EQlfGhqxGOjHLf5ZW60Z97obsruf1fNJ9KBEAo6s8at6G5CLthbR2R2U48Q1MvqH56vn2CnHDMV
	JcmDSNHr+pLjhroYoAxUByKmy+sZIaPnw3ylaO13cfQ42VfdQpej29/8wmHfbS/jF/g4n1nwrtz
	e6oj2hRpCQksJqbnw07gkZjBRmX9lQtP6TRI8rKk2n6mGl6TIMU1rnALTBZUXRG/ppS0+SLtahl
	5HCPLUjVfKQAGAu7ybhif+QW7Q==
X-Google-Smtp-Source: AGHT+IF2LpdEJOzHM/r4B4JdjSv0QcjVX0ilM/S1u0uF9+87CF7k8lNOP5/Clx4J5u89poWFyLFT4w==
X-Received: by 2002:a05:6a20:43ab:b0:1ed:a4e2:8631 with SMTP id adf61e73a8af0-1ee03c00212mr4065052637.38.1738911572638;
        Thu, 06 Feb 2025 22:59:32 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51ea79a47sm2226085a12.76.2025.02.06.22.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:59:32 -0800 (PST)
Date: Fri, 7 Feb 2025 12:29:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [v8 3/3] PCI: amd-mdb: Add AMD MDB Root Port driver
Message-ID: <20250207065925.6u7bemyn2aireiii@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60c5504d-341f-4ce5-b337-1eca92a9506f@web.de>

On Fri, Feb 07, 2025 at 07:39:03AM +0100, Markus Elfring wrote:
> > I don't *really* like guard() anyway because it's kind of magic in
> > that the unlock doesn't actually appear in the code, and it's kind of
> > hard to unravel what guard() is and how it works.  But I guess that's
> > mostly because it's just a new idiom that takes time to internalize.
> How will the circumstances evolve further for growing applications of
> scope-based resource management?
> 

Please ignore the comments from Markus.

Reference: https://lkml.org/lkml/2024/5/20/724

- Mani

-- 
மணிவண்ணன் சதாசிவம்
