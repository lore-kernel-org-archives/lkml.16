Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51E610C;
	Fri, 13 Jun 2025 02:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749781587; cv=none; b=gKR0910dwuS5BSf0jD2UBxkQScX/hGc5MJBbodHAQD1OCgmRggZUYqeIqTQ/D5d4uSIOqbKkhzdrJndM1GUec0pW59CXWVt4pAtosrlRrBsvKfXB3zSbj/HVmjyoJt70I7y3fEdNGL38fMM2CZs9lHpL5MkLYIEzAVe6U+kMYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749781587; c=relaxed/simple;
	bh=hZSppjegY7/oN6b4E+4u7yQ6gjRmHCewO4Clf+Xo/Ac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fw875s6az6/PZRW9Ml8McgCaqRECaulfB2qCi2dkLZ2TnTeymHyX5l3iY2eRbHbN1CIfkvattFxquLUSCclCbSKYQiR/JC9I+XUVIBfZO8ywsDE3QsR7fpaT/7taHcFqiCR+ApWQq74rfnIQ1jdjMncyiIAPNjc1GIELUuUP4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=hTN6C+Kh; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="hTN6C+Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749781583;
	bh=xLHonorKTCKXs1ikp7cWn5/J1/dRh42gn9VA3Kq5MxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hTN6C+KhQtfWhCMjyBx6tHWd7BiD4ype3lldLXmgo5ieDZAGry0Hr7CRlSfD14/4n
	 Ll6JbaJk4Tce7g52FXEnu4d1MaGTATbCwDvrB7Cw+N6A+UJErG4+eI1fBrf8OkO03i
	 PZYr4axD8buJcpM+JGvHcG7qht3P3Omn10nBnr6wmAfmoGomJEpnueDm3aYGuTDiVJ
	 yVZizSGjbNrbAROq3sBLCPtMgduDOGWRnRwPgjuRu4us7D9oRJDIt2hym+oVmWSd0C
	 uv5AMq3qn8E2ttX0R+HaejI99xAVCciUvKRfjmAgVxQT0P1hnJ7XMyvlGE6XGHvwDO
	 SU8ELB71SRKAg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 689F36445B;
	Fri, 13 Jun 2025 10:26:21 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250609203721.2852879-1-robh@kernel.org>
References: <20250609203721.2852879-1-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: nuvoton: npcm8xx: Drop the GIC
 "ppi-partitions" node
Message-Id: <174978158113.301145.12233806769903779055.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 11:56:21 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 09 Jun 2025 15:37:20 -0500, Rob Herring (Arm) wrote:
> The Arm GIC "ppi-partitions" node is only relevant to GICv3 and makes no
> sense for GICv2 implementations which the GIC-400 is. PPIs in GICv2 have
> no CPU affinity.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

