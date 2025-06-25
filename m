Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE022D662D;
	Wed, 25 Jun 2025 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876957; cv=none; b=gWBuzR5IJMZx1K1p32bXka8FlL05vf+u4Dhqocj/vP0TJVQgjvXWVQvFYLbt+f+lvgPbzVoD22t0TLlhjHUzT7Y+oPk7YUNB699VaFQJTMf9VriXouq3BvJ0oXliKY1Ezg9DNNYGrZD1EdJzFSRzhaS2XiAEjLshEGlXVXnCx5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876957; c=relaxed/simple;
	bh=nQI9j7cccr3AdrZaAMIWz55ImnBkv2fiPbv8eUgncWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd/m+I27jlVFvBjWst3a607gzMHfpjscqLvuVcP+rvnxsys1D2E59A2Uws7jgfa1bq5iQ5jWxWs6oYP2xV7RpqhrXjLGlS04XnO/riSwM6zo5jNssnbNEL2j0YLSy7M8WNqMMG2Iz5vb95JfyLzvScQctMlunDPPSqVAT7z1TVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iq74sVYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iq74sVYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE66C4CEEA;
	Wed, 25 Jun 2025 18:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876956;
	bh=nQI9j7cccr3AdrZaAMIWz55ImnBkv2fiPbv8eUgncWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iq74sVYHTKZwTrejgb8eHj3oTqVKelWzNGdldpOtYBU6jatqwEnZZtijYA2aiYTxw
	 7kpa/29fbjSXJYLTZNG5C9vKA4eaOK/H9dbqXZ5JgiWJ+8qWmyx1Lt9UDs0TEvj/Fw
	 VNL+B8kRy8vT1YLfk7vS93Rwd+NgY6c/JOdc8xQ2uZOZtVo9ARzP+G95k2Xv2zD1Rp
	 xLf6EgPfz+mlsMdhQcB65xe7n6YnfA60BSIqEUqxX6z4t8tQiRA+7W2Ko7+OBvUu2F
	 z1oQzp0t5Llkn2Glrw4x6ppK4F6+tZP7T5hVQib+paKOwxDtt4iR7VFjxdTiTZ9Bob
	 jzfrZhrZEzOKQ==
Date: Wed, 25 Jun 2025 13:42:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add qcom,sm6150 fallback
 compatible to QCS615
Message-ID: <175087695426.2001416.12602811306906388736.robh@kernel.org>
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
 <20250604-qcs615-sm6150-v1-1-2f01fd46c365@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-qcs615-sm6150-v1-1-2f01fd46c365@oss.qualcomm.com>


On Wed, 04 Jun 2025 16:40:28 +0300, Dmitry Baryshkov wrote:
> QCS615 SoC is based on the earlier mobile chip SM6150. Add corresponding
> compatible string to follow established practice for IoT chips.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

