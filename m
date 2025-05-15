Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D6283FD7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297274; cv=none; b=ebQ55a/Zzw3I/WFimlWji6U1ISjsHCi4q0FU73F2B4aJIsHmq6/qxAHmQ3LbPbbfQx542wDQy1zYNjr+c0LFrXLtqHwA0qvHkKMM4gapIDz9pPZsJIPzrt2m2v5RZ163hJ4W+XV+PXoCGB3w5XUd2M5N6by7Ve/QzJLGoD2d6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297274; c=relaxed/simple;
	bh=uM73HkG99+TNT8nsvdlnT2Zs1LVrH6Lrgr5PnJjjj3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjygxXyJFaBXTGmCOEcpHxyi/7CXnCAy+6W7sngxr5UTUeWQ8T7JD7eZDsqeNcvsOW9kk1Cd7UfE6rQy86DOM4RPCdVMsBxD9zDFc6OYxKLwEn0Tm8VYZOcw68CES3s6fSpox1+F6QatDo2IftbW/azmHtsDTS8IqdBonFDeMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LiKr6XlI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LiKr6XlI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4354435e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297271; x=1747902071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgUQ3RNTO7GU8Z0eVPaF+SACy3D+AkDLa3fqsLEBtBg=;
        b=LiKr6XlIzq86B+OpgtVTCwkzGSdrN2YhPMRYFtiKI9siioGQwOTi/AXalt6VmaGnET
         QUQkgzBN8MqR9/9EoKgqtIwj3wV17urNALK8HqoRhepnFuddnGN74fWmTp+enQVlrayL
         PGo3sppMqoJYMk4yCTbDbEfhVRQKip3FjjUEq6BIAaqNotPODfeShK684o/bDhtT2BdE
         5OzGpUK4pHlcrDGIrfOVXI/FlydOU5fz+Az/25eP43FjGy9X+w+b7xUOYJX6KlC7lTLZ
         IovI96QEIGV+220rdIaplyR+Kcdw2oFmmrgbjk07SyAyiZkOiBrEFTRcYsX72caJhDIa
         tCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297271; x=1747902071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgUQ3RNTO7GU8Z0eVPaF+SACy3D+AkDLa3fqsLEBtBg=;
        b=J9wKmuSV44IIpRoJsD0k7NqrbNDLV9S9+yr67kObu/mK5NJCp807dHHHptFYHfr4/z
         /2onVkElR9K9kyKNg0+JlsqZ9JnbxITT6AbL1ENgw/iwC3W5esjNkAZm676B1j3d2eNo
         X/Wi/XMwCrjixEwqeE2lx3E8esRssayKgCV+IZaAzLvYqgCNyXX5iWuIFG+qbA0fraS6
         mtH267bZi7dDla4xwygqteNevx4hXwBFsU3A/vys8MLUSrun2VQ4GGly6nXBlgs/rMl1
         KY0cYFLVeYvzwASIhAkQkDTe9wppy0FUHOXVvPbE1fqIOPf7Qiebz/5YB9PyDhJupgVD
         J0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC+weAYzQfE6WVUPGSyIZc3IzLCx3OkhDIPYjr1yu/4n4bIgYmCDDxhx7rDV3SdxbHJU4p/v77Sh1EyJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9Cg7kCNBZQ5LrUPaTf9n5UJQO1bouNrDL+jbSR+akUtm5yYs
	NMIxzjZ56Hsw5lmAHLAqZoC2Tq4iyESAOKXYMOhwpag5YeUMlY8g+K7Ur1LxgqU=
X-Gm-Gg: ASbGncvAyqRvFTlb/9kecZ9DdAKqvhkMN9RKrOUt+9OtHvDwJXHZyr32aD+tdiEBXHg
	ADnGI8oVlpm5hJ2xPrUDWIgW3i+fQFDjq+0Pob9c0rrQ5eQXd+1xqB2gQYfQEKZEg/+E4SeVZNG
	yLZcIBlpg2MG9oMnvUGO3cBz5HVrcRFtg10KjVk+sqA4i+lVsadDIfnDsXRG5EYZxPyK15FHOBM
	OlS87amVWo8LYpkDlLZ3j2Jg4ke/OqldXV8dwYKgbfeFsYEDewrQogOoynLQ7GszNEa4ddets8S
	0Eh4FDdyuaMRcKJlNS3rQHJ1OIqMIN33nLQW8+k7ko9F5qOccRFPc/dm8G0jwuVSrkb1wa2/AbR
	uV6uWNbSDxfsG5A==
X-Google-Smtp-Source: AGHT+IHfH0V/L6X1amxlYzN2860kBxVyRho6eEtSaj0Ukx7jim95NGCIF0Zz8dm/T26dLPE/wkBEfw==
X-Received: by 2002:a05:600c:3f0f:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-442f9714e8amr13086825e9.33.1747297271274;
        Thu, 15 May 2025 01:21:11 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c3a4sm61410245e9.26.2025.05.15.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:21:10 -0700 (PDT)
Date: Thu, 15 May 2025 10:21:09 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert cirrus,clps711x-timer to DT
 schema
Message-ID: <aCWj9ZHaSH9z3-TV@mai.linaro.org>
References: <20250506022215.2586595-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022215.2586595-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:14PM -0500, Rob Herring wrote:
> Convert the Cirrus CLPS711x timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Drop the aliases node and second example which aren't relevant.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
