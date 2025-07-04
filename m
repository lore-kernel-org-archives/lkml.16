Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BF68635C;
	Fri,  4 Jul 2025 01:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592293; cv=none; b=EGyg/NWlINdH/r5ca4iIA9ITVN7RwpKAc0Ia3SZSt84OrGEyJbWFggQcgLMhNf27e/PNqSe4BOHIrmYIT3b3qG9sdFNlEcLwGUZ+x4XvgAUojcA8+Mx6LOHlyiI+qDq5iiX4PRunyYdOwtc0LwCNgNnDkt48jn6vrMCSC4GVe4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592293; c=relaxed/simple;
	bh=dmVwpc0egoHaQe36uq5tr8rwYmpYq7GIAe9eeLMQKLc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aaZxfdnEPiT/l8zoPm+++kJc1kFZJmmYyksWcqsuyMN1omlvckvAWTmtCwmETTITxjix3uTJuWnWHAgO5ty2e5+IZrGzrKsCW0olJ+vLtB/nzRV23zJl/hMC0FMPt5k6ZszCcxny9qS4+EAG0pH6PO96fP/iqlN9ONXZUnOP5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=I6is1ers; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="I6is1ers"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751592289;
	bh=dmVwpc0egoHaQe36uq5tr8rwYmpYq7GIAe9eeLMQKLc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=I6is1ersaoALURA73JjjX7SMm43rGbIhpvpBNzKZRZuDY4wEbdLiPSBxdCNamI5ZA
	 7Ft6POqmfNCzi6eF30kD+OdQWsJgKmnQ94fckvpDCQ+ByX5wv/JsoO9wNvvJaphd70
	 qOpP5m4yDOPF//pl+HAxxyRgeLy6/oGTS9uAiPCN0wf39X6FlQta0CgHNSaUQm10kk
	 BPVl67+Re4njKhtMqDPieMT8eObg6RdPJ20Mx9fynkLpknkRKjV491IW+om0BXlDY6
	 Y/QKwLyjVTtC80KCyFcodX3Hls0py3vnpM3Bfc/tfJvD4k5cmbuJ1FKdMPBtNqi2h9
	 kI/sXIGRrczDQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B5CD66443C;
	Fri,  4 Jul 2025 09:24:46 +0800 (AWST)
Message-ID: <444ea7dd85b7e664043e3fae4a22d515fd121433.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] mailbox: aspeed: add mailbox driver for AST27XX
 series SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 04 Jul 2025 10:54:45 +0930
In-Reply-To: <20250702011956.47479-3-jammy_huang@aspeedtech.com>
References: <20250702011956.47479-1-jammy_huang@aspeedtech.com>
	 <20250702011956.47479-3-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-02 at 09:19 +0800, Jammy Huang wrote:
> Add mailbox controller driver for AST27XX SoCs, which provides
> independent tx/rx mailbox between different processors. There are 4
> channels for each tx/rx mailbox and each channel has an 32-byte FIFO.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
