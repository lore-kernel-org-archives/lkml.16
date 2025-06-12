Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41091798F;
	Thu, 12 Jun 2025 05:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749706332; cv=none; b=M+wnX0EOtwePYr/Lsf0tN3kRoJiGYJ0OwBNTJw4APs/MFuanJJCVjsnQqUw5gbk6O7VUpXE3Wh2i+75baGgi2B+eEf5ISrcoKgss1c+2TGDqPsuf2DigvaQXOUrLRD+d0sJKfcmmA6OjFiRvJ59iwN+0eF/y8JTr7l6ECeF62S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749706332; c=relaxed/simple;
	bh=uHkslSzYJOTh/mGI8DoYwlUMJbRtRzBVFRxKuEQ3cvc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYJxBcprTCMHgnui4q6yF9Df7lPa6ibeoy+eCD7V/MaABx1XQG6B4PlE1CXC0Oi4tNsCXsHQNJO8ge5WO3BOUtW+JXv9hfzMc1JmgPU+NKN086M4Cjf5OoYCtZahFBJeDixlxh+B+V+tbYHL6mIISjH9io3VvZoCyTd+YIRUGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ZyN1xgxD; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ZyN1xgxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749706321;
	bh=Hua5sQUgLCroJtEA/gusAW9GCKDx3U8bgUR5LPfnzhw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZyN1xgxDp+vYZ2LEUoYVDDFhTjjdGrDq9YygHqnUAVRi+XIpSNL9SQn/omT/w8rVq
	 9SF5ioVDuo+WOuleqE1fkuf2aUlIYRtvj1mnRAWAlkbdj3OIQeR7phkrJEiQ1FXfE0
	 TXOce0dQb3o1mqIDGojdJrVus6GX+6j6Xaed87t75IvC4dXgcseLPyTBRQYwPzy+W+
	 VdqofRLHjm+YdIRmTxzzGhLE7gLhhYuqnMpc+OYZ/Snw90F9KuW5dtS70IFtd2hW6L
	 swnXC3U+xeUnKlF/sV47LLqbIeLI1oGXgKvuSq9TUQe3hTlhPGcvUGJgyBVtHFWHS+
	 cAsM/qFdkoGdA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BAAF6699C;
	Thu, 12 Jun 2025 13:31:59 +0800 (AWST)
Message-ID: <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Jun 2025 15:01:58 +0930
In-Reply-To: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
References: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ankit, thanks for the fix.

Regarding the subject, can you please use the prefix 'ARM: dts:
aspeed:'? From there, I'd prefer something like:

   ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes

On Thu, 2025-05-29 at 17:09 +0530, Ankit Chauhan wrote:
> Fix an obvious spelling error in the dts file for Lanyang BMC.
> This was reported by bugzilla a few years ago but never got fixed.
>=20
> Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>

Please make sure these tags reflect convention:

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-t=
ested-by-reviewed-by-suggested-by-and-fixes

Rather than spaces, they use `-` to separate words, so:

Reported-by: ...

> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D205891
>=20
> Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>

Finally, all the tags should go together in the 'trailer' (final
paragraph). There should not be an empty line between the `Closes:` tag
and your `Signed-off-by:` tag above.

Cheers,

Andrew
