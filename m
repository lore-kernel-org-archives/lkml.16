Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8D4CA6F;
	Fri, 27 Jun 2025 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053215; cv=none; b=qu9P8BAdvntnZirPtg4JKurb7QuhuojNxyH5IN/JlfnnQlgrGsicWKUufX3m1uAol3T6GVYRrwu+YnMXIz1u+BE1K7v8GNxZMBSzk/2WDLFNFIyer1DcJXImYP/u7ByYZ/VjMuu7UXwC6BKyN3WgB6smZLsRWOQt7W7WrDUtonQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053215; c=relaxed/simple;
	bh=Mle5Wd/myCxxbKxEF7MBD6gqGzYF6gifwYngiKeQK7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfKSRPg2J5zUP/v3+0TAPBoGSXepXpaFB6bIWm8CPzwjdoBx6u+FXYUjdiutwYD8O+l4Fqck01vdNI/F7bjZRAckNUQJWKCgR73/edpj/5lb10BGo9fPQXwBOrj10hY0UWQ5pBA/LFbT1aFJOh5PsIYnbD5OMeWGPmg48QieQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfA2cUrt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfA2cUrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5E7C4CEE3;
	Fri, 27 Jun 2025 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751053215;
	bh=Mle5Wd/myCxxbKxEF7MBD6gqGzYF6gifwYngiKeQK7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfA2cUrthE3YwHTy60AtypMWF7RhuiYGdKrowMEVvHzmGztfYtpxlzKyFt0HrTtne
	 q351DMNZLh7zSWu1iLt1hCMSva2HZUTMUMYCyDOafENshRCju+3jDznZcknN05m2Hk
	 qhzGBeQfyuT3UZ641/cg89TFDqgHcwXl6x/VrHsKdB7e+aAK3TMA/2POuu5TjFiL2I
	 n4CgsdJ3JHIyZL8UhZnzJkqmZZIrXfVd7d3mijJRvieCHpGzcH4Qc69YwjVq5YeI9q
	 5Uafe1Nb6W21VWUdnnib5d0y2cmi1aDRgOXSPOd8x34OZFtvkwpUjoSdCqHAyCkgy1
	 voxyqFuYXhoFg==
Date: Fri, 27 Jun 2025 14:40:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH V2 2/2] dt-bindings: mmc: Add sdhci compatible for qcs8300
Message-ID: <175105321339.4056729.11169660708371897827.robh@kernel.org>
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
 <20250619070224.23428-3-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619070224.23428-3-quic_sayalil@quicinc.com>


On Thu, 19 Jun 2025 12:32:24 +0530, Sayali Lokhande wrote:
> Document the sdhci compatible for Qualcomm qcs8300
> to support function for emmc on the Soc.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

