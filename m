Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0183D1C5F25;
	Mon, 10 Feb 2025 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181764; cv=none; b=roodGEFo64sRsoYDDEqZnikr7+dohG0xoeTCxmUMYl6DFArSfZcxR72hPdeytzrYMEn3KuY7bMpOB5wCS2QARWU0U1JL/LKuzKI2+Nqc2cpEvPJ73E7i7vqvyHk1PGOpssIax3ZwkNTprQtlT03L3j4NLvN1xp7M1QtMrek1EM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181764; c=relaxed/simple;
	bh=kAPX7U4HOemMCHpMi6ojF51w0Vel5PxxbwLGLMG+LsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUcFCkAbwkmJG9j97bxy6A8Vj7AyxZVu4jfdg0d/Nb5XUevZbR4gpWQAWqXuoC5h4VFV8VF5ewa7K9/2AvEK++/Cn0x6oBdwGIm06XvcXzmBVtDdW/QKGqA7bwjvzzGdYSUFUZmI74F8NOhfH4OrVlLInnjzC+u9NPQFeABES4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQqs/zSh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQqs/zSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2935C4CEE5;
	Mon, 10 Feb 2025 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181763;
	bh=kAPX7U4HOemMCHpMi6ojF51w0Vel5PxxbwLGLMG+LsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rQqs/zShPLbbCKZnUDqiVh2YXCC0g9uohS3xzZhnklcHYZmsZ/MGIB+l48sn6e+px
	 2ItQqbq126z1vWIqCeSbyOI1/tlUZAy95wa9m1tgoXERtu4Y7fYqp+kX7kJ40Dqbxh
	 SwbViyJpA8pl1kFoHBDpiaDiDyNYyvysSnd3ZjJDLY1Vs1CnToSH9AUDkZxVCibRFU
	 Dcgn3utMB1Ule6/49RTN+SPnOcJZYvgZZ9hyJlg4hiHggC4Ou5zLw/eXOyU/+Yqiyv
	 BeczPbox/kscg1ojhF05q1fwj+4Dgi9W1ncBWhfXzpUe+DNJspl2QGhdEUtBNLiURZ
	 bMQ0vE3afSXHw==
Date: Mon, 10 Feb 2025 11:02:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 10/13] dt-bindings: display: vop2: describe
 constraint SoC by SoC
Message-ID: <20250210-poised-free-pronghorn-4b7fa9@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064457.11396-11-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064457.11396-11-andyshrk@163.com>

On Thu, Feb 06, 2025 at 02:44:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> As more SoCs variants are introduced, each SoC brings its own
> unique set of constraints, describe this constraints SoC by
> SoC will make things easier.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

