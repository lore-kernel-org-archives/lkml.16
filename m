Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAE2367C0;
	Wed, 11 Jun 2025 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630856; cv=none; b=qK5utb+Y26LazQyXuakjBwCgCXK0QrSzSQk7k2oMKgKFH1fNjIMKPT0/HkRmsX3ifjDXRXNtRxhdr10phli421L3SbXphfe7C5LwfS5f3Dc1Z7DEiw09hgCvszfMlyeOLdWxwy2HYRcIRwOT7NkGoSn9lqCcXTTXDPEkHSZ7bLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630856; c=relaxed/simple;
	bh=YjUuaMXRjj3yUKM1oXzB5tryE1JdcUrQb6CsDD4lW7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu9VFRJgYw+FdM00O+qcUF2KpRBjoz9yxKRo0ebQiAoO3tE7G4Tt4vAM6hWnOpzqkwhnuehdLfVtY00HBsQyFpSaUhzS07u22Qjj9sZ4KTXILIZbxSVF9XHAwPN7nwZVKj9qxQU93jncPfM+hDvfJM0tIImzZK4q6T6GEevzSfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3ULcI9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3ULcI9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5311AC4CEEE;
	Wed, 11 Jun 2025 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749630855;
	bh=YjUuaMXRjj3yUKM1oXzB5tryE1JdcUrQb6CsDD4lW7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3ULcI9IJyU/3l5FNnF21dookZoXpT0aM6QPxdT5KR4dj5+MwmuBef05fRcY7CvZK
	 UeBU/WbML8g8V2ZL2h+sTSB8laoO7PDxiX6kvecKeUcl2IAD8GbCSkN9SavXl6WuY1
	 4MeUMVGBJiaY3jt32AJp0OJWQoVnQ6JEEdcJiQXz2RsWlMl+HyL8g3Otn+G0/gdz/e
	 eKJOq//e/kg3jeadV8QCPHBdmUKKIUSVGrkK1ULlLjfVMh6zbV28tPRlyVBMBK2u6V
	 L7MgsqJc0Pbe0lggsEFkW89fWPIeryKYmGkJTIrzKXP7Vk2hBiIfNccbDW/7SsIYEg
	 IaiTDLO+Cf+uQ==
Date: Wed, 11 Jun 2025 10:34:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
Message-ID: <20250611-serval-of-immortal-novelty-055c93@kuoka>
References: <20250610091026.49724-1-jammy_huang@aspeedtech.com>
 <20250610091026.49724-2-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610091026.49724-2-jammy_huang@aspeedtech.com>

On Tue, Jun 10, 2025 at 05:10:25PM GMT, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

