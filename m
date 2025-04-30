Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FAE231856
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005959; cv=none; b=BQeBkNq/Dqjciwg1Xv4dmPnnvMImNbRDMsfyeiLXQ2t7DT5vhaCO0fSVwhknL9H15H8Hkiaw2ZJESu3sdveHzOg0raBStbKW0CpnK+tPe6YI0MyUm6m35oKQMAOSJG1R9t5glWR8ug3NJGvhmMgpsC7YWmFfnK6coLTM4SgPa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005959; c=relaxed/simple;
	bh=AUDJd4dz5XyC/N6fEGt5cYH/J0DmYOyJCqcdAnsYAcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwCdC/PVs/r3ghTfnMEZ6uA+3u2zDB9yrsMzVKx2N9W+4wI5KQubfB98Y0Dluw0EIJ9cTqBWViMmyvB4Tsx9P85t7nTIQ/VBoeRnxXhDPtga0JYiO0bN8gkKs8gSjNFZtvcomt3cB7/xrVNKM05QbWMvbQiRlRU85MP+RuojrBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uO3SaQvM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uO3SaQvM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so883122966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746005956; x=1746610756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OGMbcMEkhBmGqs5Z3YtgBQ6Hwa1jUmstb0M0+KK0Nc=;
        b=uO3SaQvMg2uYB5lOtoFBdyDcAipupleaSdHMd14tWmPxYRsMP0RVbfRhnuW7lMa+Jq
         oAmLd2va15V7SUtqz90aKf3EWd/xWqEd0xWoeQsBCy9saIyy44cxEBOe4uhg9rAKzvwV
         qNIXo7Swfnf9PS6tWrptvpRJjL6RizDJw3AR1RlpDPwgB897bn4f8peMWw1963xnxUAr
         HhyrJG+qR/xoMsJ2Hq050qymPzMiuq6ETz1smE+Iwgixdb2vIMSIrlEQza6SnriZQBtz
         IN7dl7qdMbAYFq7MSxSuydv5PgSwjN/w7djsXMs8axi4tOaUajgvJaiZTHgiNP2tAt8R
         nMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746005956; x=1746610756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OGMbcMEkhBmGqs5Z3YtgBQ6Hwa1jUmstb0M0+KK0Nc=;
        b=eYyBgQmuRf4w5gsmvIZ/fgDMjAJG4B0uKlzP+RgcHuJcPe/JpE0d68nIpSMcujSilu
         B35rT4bG7EfadcAgYOBxa9TYOQgfBc/I5BqMtnS1sBM7WDbYETYrtm+zpHtvjBqx+jZd
         vs6xEWiZpwp78gAQT0c1K5saRwSQp+AKCbOEmMg/UINsbYzN9BtgFYjIT+3xueO13pgu
         2mfiugyTxzDznncTEmSUxqElS3F42o0l7DiNHn1B3fW6f5QcBZoQoeqhphJPHci62yN4
         Oy5A9K11pIKNXKHUIExaRJB0+Ljelvax6sV1Akm3GYhp5iSK9tCxgWHp5gFK6RNaZvji
         JqBw==
X-Forwarded-Encrypted: i=1; AJvYcCXR75rYjrzFpqHI1U2Zi5E+6nwXBUPIfl7v0S+kSOtafxXwurw+HDWeOt7FA/ny0GgRajDbSp+oFvzfCIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0mWajhzbTgK43Oz68h3AU38p+wTtZP2jlCGGhxlHRz1bMDAb
	/IXVypvg0J0kKaS12kBXjkNHDIEYXKCqZceuYM8e5yM/7JjD2KjXh96ubtgKZL0=
X-Gm-Gg: ASbGncvqKXwAeaip14BSRn6SZ6EUe3zBzBfRiS5hClFK64qR6MpT7EYE0HZVMYZ6e1s
	BxLFVjBChmd5O6szcI0sYKZdaYb4OCEscf9xK7v01p2BJRWfK8v07nyJ9PhB1v6JyvJRQ6MwIE3
	5AAEK3XyUBR/+RXVX9E4ErPts+4+uHmTRMuF6leh/ZZipe0BSklI/JsaC6LI4Swzfb+rMt8427V
	vYoidnxDa8LZA2GcrpTUWT58aGxJU+gOxDSj8DMlYjOToBtBTl4NvI8Oek0qNqxKHL/IccIBnOj
	hstjQ+tt9CYY5lbRZIqXbzUE7qU7zdL5iQAWdA==
X-Google-Smtp-Source: AGHT+IFdTIvskANcQfZgyrnhvSLOX/uhDZK8XOpbGmgtU0SafrRwMbwRPtiX/Z0dHI+9ZICQQQNkbA==
X-Received: by 2002:a17:907:d17:b0:aca:a347:c050 with SMTP id a640c23a62f3a-acedc029a40mr272914266b.0.1746005955819;
        Wed, 30 Apr 2025 02:39:15 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f841fsm902286966b.72.2025.04.30.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:39:15 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:39:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <aBHvwUAISo2JhYSz@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>

On 25-04-30 01:26:13, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > It all started with the support for CRD back when we had different
> > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > is now figured out at runtime while using only the DP compatible.
> > 
> > It's almost funny how this got copied over from CRD and spread to all
> > X Elite platforms.
> > 
> > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > beyond X Elite to newer platforms.
> > 
> > Functionally nothing changes.
> 
> Looking at the diff I wonder if this part should also be simplified:
> 
> /delete-property/ #sound-dai-cells;
> 
> This is done by all upstream X1E boards, so maybe just drop the
> #sound-dai-cells directly in x1e80100.dtsi?

Yeah, I'm not sure about that.

Though the DP3 PHY is currently used as eDP, I think it could be used
as DP. So I think it makes more sense to keep the DP3 controller as is
in the SoC dtsi and delete the #sound-dai-cells property in each board
specific dts. Don't know if it will ever be the case with this SoC, but
maybe someone will use DP3 with the PHY configured as DP rather than
eDP.

Not sure if I'm 100% right about this though.

Dmitry, Bjorn, do you think that is accurate enough?

> 
> Greetings,
> 
> -- Sebastian


