Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4084284695
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238905; cv=none; b=FzdRRh8ojxbAG+QyfaMQ6uPeSInAr5VBJrlPsQKlcRfKXB4+53nbNxEGJ0WjTLbSuCPH0D2poLVhg297yRoS77OewsQNg9jfDLY1pLr+LipsDoCpnQ+u/tgjAUoUf7Uc1FWHdJzt6Il/waIYW71aQ/xP6eQIwY0976hkbJHQWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238905; c=relaxed/simple;
	bh=BdTd86rD8wGBkEGobCd3dIkyDDHb4Ycg01Tusl+Lv0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3eKeUsaOzqL9fBpDSSdA2h1EcPCJ5B5Fy/eGIK4bMsfZo0me5vtmDNqfl9f7B7w2i4cv+AuXsh6XuJIzd4nhK/7p+FFETnOybbDht0ZhKYakzNe5Ll7KC5ENWPaoTE4wAQzt/caO+87qKXynqobsXDc4Dk2bLNJm2VFBC73R5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqkAXk1W; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqkAXk1W"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e98f73850so6308611e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238902; x=1750843702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdTd86rD8wGBkEGobCd3dIkyDDHb4Ycg01Tusl+Lv0Q=;
        b=vqkAXk1WN4j8C7WfZ2pxXm/Ee8GQntNeRJ/0UOFpmjihDoEUU7TQY8QBVmPRFtFS6x
         D6tdUVKuxDSmyrffgKiZ/zJiHUICj3kooLzbXXijH6bPZnS/CUQ4WJbW2oAsic2malkv
         7TGstFzXDWREZjnkIylBm4IKd6IqfZ2AIcVAY3rnTUAHC+y+qoMvaEHbtDP4CY5tT+DC
         j0YiOdJGUfMSRYo7lI7KcPWwj3bloTk09hc0/7dgezdthMN96xkBmuxjo7OxUj4Vzdt1
         skTWhFRlNS7+C77bODAOtskqOHrnddKJ3fK9qMw93y2g8arjeflNO70/IPSTuFKeOJUf
         L0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238902; x=1750843702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdTd86rD8wGBkEGobCd3dIkyDDHb4Ycg01Tusl+Lv0Q=;
        b=g5FCvzi8HWKCqxtTNAhqbgPDIeiLmKP6bKsdaT/gYcfVqW4QP6JXX2dGIDMuVyn3AW
         n0Esj16BbSm5Aw1wFeIa/5zjfuIuzkmbczuUrv5vDdpXZ/8Z2ctLT/ACGkJ4/hw6ciRx
         g+RP1iP7uWSszYz9Y+V+RQj8XUCk6SFfyxUgnAdiYPg7L8RiuLJw+SItFjINmjQOloBE
         9OdmzHHIRST7YGFiLRgAfLGv70/Aa3XX/abS+meCe9oH3FR6PdYfHXV3zoccSChNFoyW
         Ivxc3rU6SS+545AblTVKdH9JmMSzkwMeCFtvsdfuHN2I6sy2GgNWMflL9t84cM9wRdpe
         UcqA==
X-Forwarded-Encrypted: i=1; AJvYcCVHY8wJNDnsZJqGd1xn40NX98imA7MA44rTKP4qCTE52fM6OjNqqVBJAMtMIEeSJYJyKSU7GYrwy1BNmAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzueT7nFiqe0oKkHEd0tH2AA21ZqN/q1WXqxrgapQUOD6cY643m
	PiCD5hORV2oMda7zGtZ3iAz99UU10ZSRdK71AopK4Cq+jfixVjKhpRz50at7A6bKY/T1pQiYjh0
	JuyZ6amwIQlevxgpncF0Y/33TlPz+vmPeB417JbgMOw==
X-Gm-Gg: ASbGncsAsMjx3l3r7XSRI7PT4kdfc6EcXCs8B2PFGDUJ5af+WrrBc7l6PkNCwcFI1AU
	ihwK3whOxbkt4+AtTd9WaMlewuyqOYvLNiJYjptVsdLeswPWMxyaSCyh7yErPmUXrGa3RJjv/zI
	cgFO2sTd9qdHJDKQxnfP2pcNRPoPPMT5wMX2nwQgGE8k8=
X-Google-Smtp-Source: AGHT+IEqIwMIpDCAfC/mp2g5or4udP4zqxj0H5Z8NfKN9pZpGaYnyn1sPYmydRm3962RKwUckswXX8mjoIzWXQbsVfs=
X-Received: by 2002:a05:6512:3ba5:b0:553:25f4:695c with SMTP id
 2adb3069b0e04-553b6f4470cmr4666950e87.50.1750238901764; Wed, 18 Jun 2025
 02:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609220900.3035642-1-robh@kernel.org>
In-Reply-To: <20250609220900.3035642-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:28:10 +0200
X-Gm-Features: AX0GCFtHdJldExb7osATG0sE9yc28prRhU8fIk70sNT-r9whXSNHnrPKGLd_oDo
Message-ID: <CACRpkdYea5F5pvQY1Sv=u3Oe9Bv5bp31Jwvo1uftQYbwF0U1rQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: arm,pl011: Drop interrupt properties
 as required
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:09=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> It is possible that the PL011 doesn't have any interrupt connected and
> can't be an interrupt provider, so drop the interrupt properties as
> required.
>
> The LG LG131x SoCs are one example of this.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

After changing all PL011 to PL061:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
