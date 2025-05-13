Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C224C6C;
	Tue, 13 May 2025 02:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104734; cv=none; b=La62GdtvS+S68s8Fy/ufdWld6pEFg8agaqkw/XrZvWcn7vrappygHxCnLx28jNgoaZPaiIWhlNpS/AUhMGNu2WXWT+OtrH5OkAk42czinHWnErDY/GTwP9muO3cOZBdkSfuoigrq/3uTkJ85Ef7pupgIBalw2RWPs5RCmXYuJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104734; c=relaxed/simple;
	bh=YYS43f3jvQefRqW5O6Kq5X5hmfApdNlffSa5ujG2Eqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSOByQc9L7IAm8J8I0OXkJ2g0BvhGtNyueFuJJ6z+I2QOjKDoQ4kPg9u2xr+A6KxUdDpl7yRftwmiZZOPqw5O69GLwZFqhL2aYeexLX+8QGJO98EEe+MpEYHnMnmUM+zxMkNP8OJq9N33UaO7jsGnPD+ztqmyPIo0GmuKadYHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yhhy9acp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yhhy9acp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38C9C4CEE7;
	Tue, 13 May 2025 02:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747104734;
	bh=YYS43f3jvQefRqW5O6Kq5X5hmfApdNlffSa5ujG2Eqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yhhy9acpSFMOMJ81A7rXxIyX8VzXTCJpJT3ZAMJZS0IEkheULUDps+zgVs153M1M/
	 vJlyI9euhj0rsI8XTeHxkZaG6Jcuq3j9tLRQ/VFn0s2B63EQzTP8D8WmUQlx1fDMlm
	 PxQa0Ys5P+TlcXOPXVvnvR7w7018FN50v2IkwGLZkMqjUX99VrmqZdye5FxqNDkjBM
	 vTG1ydL1RN7Zuoaxbko+NAQJOxp4LnWmdondAcgjYI9+kOoZmNcClqB47sThFh6oP5
	 dYhjRsVcZgu0n3Hgt4ijNJnyJfo0AAQR3eVwdy7SWKsyu4IM/74K59S1tMJG0gukaa
	 5+Uni55RQlJmA==
Message-ID: <02e04943-d0d9-40fe-bf1e-7e13ab469c2e@kernel.org>
Date: Mon, 12 May 2025 21:52:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in INTEL STRATIX10
 FIRMWARE DRIVERS
To: Lukas Bulwahn <lbulwahn@redhat.com>, Mahesh Rao <mahesh.rao@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250512134332.36366-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250512134332.36366-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 08:43, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit fbfb64987062 ("dt-bindings: firmware: stratix10: Convert to
> json-schema") renames intel,stratix10-svc.txt to intel,stratix10-svc.yaml
> in Documentation/devicetree/bindings/firmware/ as part of this dt-binding
> conversion, but misses to adjust the file entry in INTEL STRATIX10 FIRMWARE
> DRIVERS.
> 
> Adjust the file entry after the conversion.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

