Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6881F16B;
	Fri, 13 Jun 2025 03:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786264; cv=none; b=by4WjIGBAQcJ7IaT+q6hj0E7yOrlKjsNaJI6aWkmjPeTtcMDyxJ4xzVu3hlyf2UyWtnVFSMosuNEv9N25XqpYLmHU7Cm4VIqhXsVXt/fuyxaJXPjwU13oH1P7fvmLuPIoVS/oW858PcEWZamN5SIo58hIIa2Wqg4IQ2OMDvgiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786264; c=relaxed/simple;
	bh=6DVU8f9ShrSSPk2520CMGqx6g8aHeI5yCBHq288oGC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WJsIGKqaaoSS9Xts/aIvjt5I3ruxr6D3TcV9sqnr53iuYbO30AsquAEDR6veA2zg3XfLdo8DRaLmeu1FBWaRqtO84zfpKvH5YSQ5uP59ztA04/4k/bOKMhoOt8eA+yW2wVwVrxODxkIL/eiYEHfWOC6tPzOZJUk9o967EfV0JT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=kh0xw04V; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="kh0xw04V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749786259;
	bh=e1p6/5wXJ3cC6mmHN/REy+JAlhOgHjO6oA0FGENkSaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kh0xw04Vx0uKRUojByFDJGN96V6mQZJEqdgMb+sFZJrRXPR0k/Sg2AOzZJ9BmhQnz
	 ZymbgSXTWizHqtKlgh3VnX1QbxpDEHjEQRxh1mYWC4OFD9sDiwuIraTJ07M8GcuseX
	 x+hTeBuRnU5+IdVQwQenGCtRXg2BQynYziyLe4bbX+/hUSrlDChe+APzcnpTQ7H5ky
	 mLvboB8v6SZluNolUQ9O+b5dhWdHaySADQll+syYIRWIvzvWrxytIl7ob8jjULD2od
	 8sq31tiLWR80BcymTcBgJeOL2+EY+UAlnvz7fqqn1/1DVedrXC2LqHCi/6xcvSoeqX
	 xlQJ+/Qioix+g==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EF2926699C;
	Fri, 13 Jun 2025 11:44:16 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20250611-catalina-mctp-i2c-10-15-v1-1-2a882e461ed9@gmail.com>
References: <20250611-catalina-mctp-i2c-10-15-v1-1-2a882e461ed9@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: catalina: Enable MCTP for frontend
 NIC management
Message-Id: <174978625629.315392.14738595529417409352.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 13:14:16 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 11 Jun 2025 01:02:09 +0800, Potin Lai wrote:
> Add the `mctp-controller` property and MCTP nodes to enable support for
> frontend NIC management via PLDM over MCTP.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

