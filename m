Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99B3FC2;
	Fri, 27 Jun 2025 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035094; cv=none; b=dgDveXdHmN+/Qi5Q0gXIYO/T6GRUXn6FVLKOVaSSrFkfXbDYUHlyifsf2jp2J/NkIfP/hzKwo/1kuBxO4M7/8mUatQDmqAWV4/a4Lrehs4djzJxmHhpo6eUReRC6ueaoUw/nPT96OJHldaYbVDB5IYrj+ZaN8U1iDBlywlNUZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035094; c=relaxed/simple;
	bh=Hpwfma/ETEF7fLDdQNJqDHzls5o6Dz7rhJq62nL5ZsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVznY+AOwfZouCdPvP25z0uSPOaDXUZEjtojSssO5vypkYUcDSfOE4P+vpQMUaz44RvH7THnhhnGrLe2ydz9B3CVPyxspgoi7z9KhSe1UL1HE9xzrwyVkXPOkKZuE+NiU0w7qoTiBbIWXmtilDN2C58MV0MFw2shzTXN5V3vd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvShlk/J; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvShlk/J"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so2162130f8f.2;
        Fri, 27 Jun 2025 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035091; x=1751639891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXFPDRZXg2Sq0BTog03BA9peluKkUONk23HYcVvvGXE=;
        b=YvShlk/J+JHyysOSKSQvNDk/j1yG9uGNXxR3j0FHBdIIe1VX9PwFSAIiw7jdN5xeu0
         8WApeHWMCDQ2+pHFboHpLEVF0hf4V5J8JzXA9GiFXGyCXjDNNez8Ov6P3dTIFOlKKnrH
         3pJ/kSNUGhcnXWaK4NWc4R6hWZesHj8PUiHU0sojN+MinkP+QgbCnQ9X85iiw+sYVrc5
         CnlccorBAkaI9kpksSJrF3rMaTuO5uDpJJ6s397agI4j3x6wmIvIdtwl5WnKYI4zpxe5
         4ZV/pH1RVCulw4qg/JQuQmtYp6JU11X+mxuh02xoHLG6WISciS2xXjKY7o+AgR0hsw2E
         KmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035091; x=1751639891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXFPDRZXg2Sq0BTog03BA9peluKkUONk23HYcVvvGXE=;
        b=SzHiHaMgGF37TAsNDhcDU+AxJOH8UVtxU1jrodKM0xayhHN9Vm9k2l+WoZYBlBsQvy
         Mo38C8r5RMEQvb4wmtO+QzNZmH1tbNxvKuOHaHGJ4IkZ6t1e1y9CC1YNKdzNE1KrVRTB
         KjTcXD/he3B6DfyiHHsuBgufK/NyP3U+UPFrTufZ6FTwENogIG5+DyymZBQqnlY7sxzy
         m6REs3Rfp5DxsA02ehFKvT7/YXsZiLySCSjvGjdQ2YWN7T/Rh8L0Z5UxZJCVxQaAsPTT
         /rcbUjhBPq3ZMEqck6Ml4mpNIOU41nP1wArBGQNqCUFlyfq0WYKGdQH2ZtyAQ4NqBbY5
         9RDg==
X-Forwarded-Encrypted: i=1; AJvYcCVxcHoSZqRii4tAR8MxKcPL6pR/A3ogbR657mpVK59fi80DcwlTVBSGdz2SoAs9Z41xNSeLweEtl5MgVFVM@vger.kernel.org, AJvYcCWqO1iXSu+LE+xwJjmiC0jQDNd4l30UtikV2TOeO6IUg5maYguM8RSsjlxiIxVJIyetoJ4pYkrfZbfG@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQenVXEgDzTjLFouyQI1l7T42O3BZknO1yjmPoH1IpfrN03x2
	BOkbi6r3OCLeWLSm8eKrkyfHhGgqX1mETOgoqWQE588bi/D1S1jGsJr+
X-Gm-Gg: ASbGncvngERCSXrFUD3VzwN2YyUYskWxHuCiJJWms1paYuXzNFoQyo+G+1XsKEu7qGT
	8zW14DuhqKAZHSIta1QUogwpqNoBBYa3N2BZjHSzZd4N9MywkkSjhoC0g5V0jz260g9RJgOC7GM
	2Jhi3Kve4fVPOk8qAOE7pE5KfgnnrsRQOYvHglYx/R0Rr5gAqkiyawIgphQEu4TL8YZGdDUdLyh
	3tiyKQ1I51mVDgnF56FpwffGxZhsOIM1wFkdC2SgABV1RnCr5GKDk5GJazhoHg0M6Fo9ZNI2y32
	cWuz2Ul0pXJk8q6oYWFhNstMTHbLJQxjtlKBr6kgcBHTeX8dk1DFZAZXfp6Jp6B2Zi0alOlZgpW
	d2o3U1JQ=
X-Google-Smtp-Source: AGHT+IFA8C9HjgL0OjYL5rpABof8IlYXB8y97W6UPPn6Dh1c8uM6AVaOlIm5wlhtCjpIGGKm6HCM7g==
X-Received: by 2002:a05:6000:2082:b0:3a4:ef8e:b31b with SMTP id ffacd0b85a97d-3a8fda34eebmr3434181f8f.24.1751035091324;
        Fri, 27 Jun 2025 07:38:11 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm53521945e9.29.2025.06.27.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:38:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:38:08 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>

On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > core that implements the MIPI I3C Basic controller specification.
> 
> How did you resolve my last comment? I don't see any explanation -
> neither here nor in the binding description. Binding description is
> actually better place, I think now.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

I forgot to condense out discussion on v4.
What about this binding description:

  description: |
    FPGA-based I3C controller designed to interface with I3C and I2C
    peripherals, implementing a subset of the I3C-basic specification.
    The IP core is tested on arm, microblaze, and arm64 architectures.
    It takes one or two clocks, axi and i3c. If only axi is provided,
    then there is no clock signal to the i3c input clock pin and axi
    clock drives the whole IP. The compatible is suffixed by 1.00.a
    foreseeing future controllers by Analog Devices Inc. and breaking
    changes.
  
    https://analogdevicesinc.github.io/hdl/library/i3c_controller

Further, deeper descriptions are available at the linked doc.

Best regards,
Jorge
