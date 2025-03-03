Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9C2135CB;
	Mon,  3 Mar 2025 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014543; cv=none; b=ExcMnrEnamt6ItPSeYTkler6XgfAbHH4RBDmHZSf9xSHfVrJHNd0DeitDNXdku60QGRNTrgDCP4vwmTntNpTY2xHZltvn7UT+Z77y7/4f50n0aQh+7OFu8RvrudI8lEU2ZF69Fimne11Q/ZWPE3dbh/B5SBKuvdkYDfoP6q9yUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014543; c=relaxed/simple;
	bh=B/RxgGplWHCJm/nG4sQ+Z0xVy9/lkfkkboziNUU3Dxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INX7Tz5dvXQA8bKrTz2M0dQa9FkMnls/YU1QcjYBwQT31CnvWbO9hqhCtso3kM0OknJ4LZiyu0nz1Z1QvwBPHxIlnJyLpCVAfpRPJcc8vCpSiep0Y0m6s5SBztCdOVCqA8U1qIDLj/vs2oRqdaYaFxOQ1k0lihIkl0mnlQP/3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT1Yrfqg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT1Yrfqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5065C4CED6;
	Mon,  3 Mar 2025 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014543;
	bh=B/RxgGplWHCJm/nG4sQ+Z0xVy9/lkfkkboziNUU3Dxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QT1YrfqgnWQYI4Ycm/WXvNkoC3goiGCfXFocdGWofOwRvbe3dJvvQUog5Pj4T/eeZ
	 e0HGvLiCGEcCgsM1979Ted+wN3yc6HakbIyBgCFOqU78wnPhfhgVkb9vqZNBkKkIxG
	 EM1D5EHLa66faeSYjs5+ve7rIOCNLGI6/k91wzrdJxIdMzSP/tfTbmRtznLjIGoTM+
	 zpe/9WfW+RoWa449lvDwKhjI8qt1pddCsl/YNuK6pIGC9eKdBslzYmfmXB+2hk+rWA
	 xm5Ga872uG9r1QiPbDbI3czeej5yKuh9ofhiuVteB3zpIV8tP61t8P8GUSXA80+ioD
	 ICXffMh2jsH7Q==
Date: Mon, 3 Mar 2025 09:09:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-sound@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
Message-ID: <174101454086.1861365.1920682427801153215.robh@kernel.org>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-1-81a87ae1503c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-1-81a87ae1503c@linaro.org>


On Sun, 02 Mar 2025 02:49:51 +0000, Alexey Klimov wrote:
> Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
> to be compatible with sm6115 LPASS pinctrl.
> 
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml           | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

