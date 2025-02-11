Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA561F4262
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269289; cv=none; b=tfB350D5holDj12CrLlqKRbhq3vgAFSzbF6FLlzXvSLH7p9wSL8vDGBsdVeB9WVg3C6759DHz9nK6kjhIOtdz38JMHnJ1MJOqwKlC09dsHKzmsvIxbe1HmD8c4Q4ZYL5+5qlL5l6Vmj717Z5H2AZf1zFDrQevDEAkUJ7lNkEjdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269289; c=relaxed/simple;
	bh=5x60nY8sN9m85bsl7snncFeqJyHzcSnNTeHckXMLF1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qXBpV1n9D7PyOxIQK9XISKE4I+iDtWm8R8JVAslgyksAw+CNvDz61uPl97mMFIaD0NKnDu6Kx6GUYlrw84HfSlBqsJ8l4GTG9oFwMqYnaCEBA8NDgS5JucAQff7vdBUsNkxmjG8It2Z1KSplaMhoJSAkK/0k+2cOsCHEzpA2mhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlER+ZpB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlER+ZpB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF148C4CEDD;
	Tue, 11 Feb 2025 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739269288;
	bh=5x60nY8sN9m85bsl7snncFeqJyHzcSnNTeHckXMLF1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NlER+ZpBIywV2hH4NLYcyQqtdA2ZIWMZZYQDbRwYH53hyWe3tMs1io+rHfUdOCu0c
	 rpALDU5pNw+xGeOgXRHto4Aj/PnWVDxdSu1pyBFgyKVpMZFA+G1Zn8VMY3SLM/4d5S
	 VNOiuqvZ8wvmTXl5O2ABqSYvS6yCLmLP4E+ySudTr4GrtQnfNP8zXcJal6I0z/Lxd4
	 NQLHxX7HRvaJiICWvCkbJFAbuQHV+etv1HfELOGjfuG33Vjdc02QoslRC1hTJZl8XI
	 AzMtXKzEaFFNfhHhyWRxgWDDI5vUbSEv2Vt9wEhC6SXPmGepCDOJBHclNYsO9cR3p8
	 IjdtD+rnJ4C6Q==
From: Lee Jones <lee@kernel.org>
To: catalin.marinas@arm.com, will@kernel.org, lee@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arnd@arndb.de, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr, daniel.machon@microchip.com, 
 Nicolas Ferre <nicolas.ferre@microchip.com>
In-Reply-To: <20250131171739.1044701-2-robert.marko@sartura.hr>
References: <20250131171739.1044701-1-robert.marko@sartura.hr>
 <20250131171739.1044701-2-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v5 2/2] mfd: at91-usart: make it selectable
 for ARCH_LAN969X
Message-Id: <173926928672.2065569.7282528185747912475.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 10:21:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 31 Jan 2025 18:14:10 +0100, Robert Marko wrote:
> LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.
> 
> 

Applied, thanks!

[2/2] mfd: at91-usart: make it selectable for ARCH_LAN969X
      commit: d075bed61594009df64055630af2e8754fc95b78

--
Lee Jones [李琼斯]

