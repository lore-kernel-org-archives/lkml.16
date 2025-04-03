Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B801F3FC1;
	Thu,  3 Apr 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691450; cv=none; b=ekAuSfk4s+zIzUzZ/eY0qXXHd0zo47lRuOBAaMcvUwCBzuHjJdqvR+IbEWMTV2DC54vgTTZYjW0D2inWucZznQceu9Ruq+m+Lo5ZyDvzEND7ZQ4/XYaTabjpEt+nn7punHNMHdxvgjg39vsZiL88kKBYZUUwd9YVamH+MVOua4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691450; c=relaxed/simple;
	bh=mCWmvlM+KgvE1LVNAoGZcUSJpTEfUzOqx0Or5iImNkQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a3uzgpYMBzX49E5+Mm01PlF0cEu4Fj2+cCYvG14C0LRUg9rjigbhKxGsqGhL5D7SPB4WR/4WTeWCKqGmcxWIhB+WNjveCv3VKgi/Jgz1Hyrxwgnh1+kjM+xOVKXR4MMjMcYjadGrccfddH8Y8Fx7ziJehAAy36OtS+UGu0s2vro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=cidmbjk8; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="cidmbjk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743691446;
	bh=8fqUmYLJMJpXXLlGvmXIL4oBVe8ye6UH5ic3xrYQKkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cidmbjk8S3Oue71BIHBXAHwJA8M2gzyp8mYROuROcv0TcDudZifLfK56rd5TW1Sqs
	 lYJ2DAqf4fOOVo2qBXBhSQHGGgaAZ3AZVheqFy5bJ8qzveH8iSGpZ+OYt1vJirmvGv
	 oRE2vdCh20Uc7P+3e8ufavKwdjOtYUvoZhST9ion0ixw2VxlZL5P/Os+yZCia7BPAM
	 Xfu0Dmix2uzJnp7RfOqoWyMHbT60ucf1EI3QWJBzbTnBMfZYtKPqdUeQvLmOdeWt0p
	 2Krx7wAx/gk/ZgbtrUEC1MeIDxFN4pyJFMKsR3+me4Td6CrO9icH9Y0TPUiXp/0SAm
	 f8bebMFkcu1Ow==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E8B617B352;
	Thu,  3 Apr 2025 22:44:05 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20250401233409.3215091-1-william@wkennington.com>
References: <20250401233409.3215091-1-william@wkennington.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add OHCI node
Message-Id: <174369144385.3206748.4237732855581471096.b4-ty@codeconstruct.com.au>
Date: Fri, 04 Apr 2025 01:14:03 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Apr 2025 16:34:09 -0700, William A. Kennington III wrote:
> The EHCI peripheral already exists in the devicetree, but the hardware
> also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
> works fine for this device already and has been tested on real hardware.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

