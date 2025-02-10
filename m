Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF31BE23E;
	Mon, 10 Feb 2025 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175751; cv=none; b=aMjWqwpR4/XHYKAkCp2gmd1XAFoDWuSKTjVrSVmKz/9corzlZBjfAnJ7l6OcPoRXJ3EtDszeb04mrMuF8TMtSyEa/QFvEFG1hO9ZqsA1aV5cXpHxfPcHysDYqrsXMuj2t12qjnFZIJTdrUQpfVQNrLFA83SQIaKWm+RVq9lUgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175751; c=relaxed/simple;
	bh=HX8GeAv04Z6XWS47Dp8Xdjby7F5tEZNckau2fi/hP/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZzX6q6wmMugn11vk7FjqpLjWWL/UK/WwBSLQ0M1A2TNRF19InWq9cZu3NPdBdVHRrvdIvc+7+4fUiKfxf5Ry3BFsev2v+vJ3irDMKtJqFd/B2TEgoFnAFUurMgILScnxdUJAgqO6RV5ufZE1qnp3ZNkm6rERpzgFCKuBwMrbl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=di9pyYUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="di9pyYUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17542C4CED1;
	Mon, 10 Feb 2025 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739175751;
	bh=HX8GeAv04Z6XWS47Dp8Xdjby7F5tEZNckau2fi/hP/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=di9pyYUdUj4RtOkKb7+HqkBj213SO/fXYMIc5snPjFl+C+IWjlrf8PyJJxQsWXqsv
	 9w6UCPL792nQJxb2cgm4kCTlks5Am4qhGu9p+AJwhegokmG/HcIQy06bmFX5m8CH0V
	 fesz0+yjC3RvpAa4FdkKlmKvklG0bQPc60n0MnRfi6hxWReeYMSh+IYS+3FwvEuer2
	 YZ4cYpBS01vEjHWq1bnzHm5YRnSjkPNLjucsKLu5XSsOZVVMYrFQv1OXWOhnAjD8ax
	 XH3yWzOlVDIw/tu2tRXkVkxPLPD+Lcyse9Lar9jgjjmL/sYuejno/fdaKoZd2vAiRy
	 wPteyPvJvcbvA==
Message-ID: <4646aec4-0270-435e-8097-344a1df0e4bc@kernel.org>
Date: Mon, 10 Feb 2025 09:22:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Reserve high bandwidth for HS isoc eps
To: Akash Kumar <quic_akakum@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jack Pham <quic_jackp@quicinc.com>, kernel@oss.qualcomm.com,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206111543.17392-1-quic_akakum@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250206111543.17392-1-quic_akakum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2025 12:15, Akash Kumar wrote:
> It is observed while testing multiple audio devices over usb, a glitch is
> observed during testing. As per dwc datasheet,By default, HC reserves 80%
> of the bandwidth for periodic EPs which can be increased if needed.
> 
> Add quirk to set GUCTL register BIT 16 to accommodate higher bandwidth for
> 2 isoc eps.
> 
> If this bit is set, the bandwidth is relaxed to 85% to accommodate two high
> speed, high bandwidth ISOC EPs. USB 2.0 required 80% bandwidth allocated
> for ISOC traffic. If two High-bandwidth ISOC devices (HD Webcams) are
> connected, and if each requires 1024-bytes X 3 packets per Micro-Frame,
> then the bandwidth required is around 82%. If this bit is set, then it is
> possible to connect two Webcams of 1024bytes X 3 paylod per Micro-Frame
> each. Alternatively, you might need to lower the resolution of the
> webcams. This bit is valid in Host and DRD configuration and is used in
> host mode operation only.
> 
> Set this bit for host mode uvc uac usecases where two isoc eps are used
> and uvc flickers or audio glitch is observed.
> 
> Akash Kumar (18):
>   usb: dwc3: Reserve Higher Bandwidth for HS Periodic EPs
>   arm64: dts: qcom: sa8775p: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8350: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8450: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8150: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm6125: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm8250: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sm6350: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc7280: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sdm630: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sdm845: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sdx75: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: qcs404: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc7180: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: x1e80100: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc8280xp: Enable high bandwidth for hs isoc eps
>   arm64: dts: qcom: sc8180x: Enable high bandwidth for hs isoc eps

1. Do not combine USB and DTS in one patchset.
2. This was not ever tested (see bug reports already published by bot),
so obviously disappointing no-go.
3. This looks like SoC specific, so deduce the setting from the compatible.


Best regards,
Krzysztof
