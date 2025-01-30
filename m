Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960219CC3C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738228980; cv=none; b=U1WMtlNA4g78IQOX7PrXto+Jycx0Eqn4CWvOet9Cn/NTJCjfUcHOMPqe7Q7YW32Nu8nSl0QyXrLa33zWipnCHie6OkIrmkih89GGCfTFRpllEgZ2rkvDfpE6txjSBxo/HPzSBUoKqSn1CuSJU1zwJ8j1d93iXjY/2R7GO7Vcn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738228980; c=relaxed/simple;
	bh=l/y2rKHTeHCMIdFJknmDGptmgyKdHRXNKUnma+8hvQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns20oIjp2l+02ee/z6F/W2OwGfYLi4I4OIdIoe2bNDdnYne6PnlKtXTb6DERuzg/ZCGPHJf16Lc7wUjvZqdJeDCvA4EeLKO0BhAzJkQMTu9I6dLTJ35By8L3AW/IIaquNLB6/oq22S25ptlb0et6pbCfniamtPWWihcljj30Aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lm6cPiPU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lm6cPiPU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so5567255e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738228976; x=1738833776; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bABlzs4WV4zPMzttcVzuljSykTsEdocLqyABjUyKlak=;
        b=Lm6cPiPULMyLjJel+LENu9CHVV5WB3c9v37E0JsvoOxlBLzzdCbU8mFoX44w8wUiL6
         zzsuUSq0vVXhGR7zS6xwDwyrszF3fVX97cQq591AeCgIPyJN+wPXpwS2cC9N03y8pnw9
         29bCgH/GHn2MmkEeW+75k59pPksxDAoJCqdXTkcaIWOn/5aaCadzSdyMeD8p/RkLyeBd
         dyfxKFVWIKikMDHRnPYOfsPOLspSmYloS8z6Uctv5y5K4TbppY8/lzS38q7alazruWZ2
         JMDeWcIybOrJ48iC6VrEUOHZ13e2oPPVLdXa2idzMZCb2WYn7Rja+xCZ804/+4KMQL1s
         QYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738228976; x=1738833776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bABlzs4WV4zPMzttcVzuljSykTsEdocLqyABjUyKlak=;
        b=wkOVvcSWyFTrj/8gOHgt/KmX14MPYabXuhKCkTl9PnE3IIYzwKeT3O2F3ekP7dndg+
         yAznmVFiUf/mNMCUd35j8Qa+A0jH8VV4i8XTLoH/N4y1k0IizxhAcA/qM5gGYeh6Njik
         tT6gJdZNwZ4DThbFWzwZcSUR1lV9MFC0h3Hdn1EVE5WwvumrzvOw2xzvF7GzubVlooD3
         DPAqIzSU8Vp0GZm9Y1E3Tf8ZfGjmkMqxk9ArJL/E8mThSWwiNPAgI0It/vtQOmYLKhWm
         Tmknq+RoSqOK9hkwmD5aVK1q99hgCj8lQ+Gb9OV8Mv18WZe5ONXGhUssfzqusavSbMH1
         AdiA==
X-Forwarded-Encrypted: i=1; AJvYcCUaz7qRqwK658MFCcZ3s0zMu+91OoIlYdhUfC2v8HMs6I+MnSWzP+eE1kB68DzZIwwJieTwSbKZngfZ1h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGQ20Kv3y1uhoViurvWoKSbYgBcXapKwlq/xS/43KZPg2u+/+
	tbDYSfdsRRcqlENfHgoDLsS+X9+RcfcY69W8w85qukDRuC3W1gW1poDYTDllB6E=
X-Gm-Gg: ASbGncuJ4SIhuqZonbCIbD3K5hbv72SfeH0KZGZZSryiiJgpYMxCt6Gm4/3IQE3RzS2
	ifJvZUfK9N2G6GmHF33xOiwtawYC2sFH5GUY2CXbvO63CHxRpcOhkIZFIJTZiuRqst46aEyB0Ce
	nWM46VRCtc6xOXXfIuBgQhNkcla5yX8rXKWjp5I/TvdIEHeEAXR10l42m+FL78g/1tdgCj6TvUU
	IAFHJnNLMEnKIwFQdDI9XjXHrpZOKsLFlGwrnlWEYsPu3xdavxa8wPkIy8rCVv5weym1W/w/qQO
	9ZyLpAXCiAeNteLjAmVxow==
X-Google-Smtp-Source: AGHT+IE7mw9vUK2x3N8IkDN7zen3ZP75QkC7O/wisGJaB9+GYHuUpDqUdPuFOauTpZOn5BwLdabLgA==
X-Received: by 2002:a5d:598c:0:b0:38a:50f7:24fa with SMTP id ffacd0b85a97d-38c520a682bmr6008492f8f.54.1738228976499;
        Thu, 30 Jan 2025 01:22:56 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d443esm16834705e9.1.2025.01.30.01.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:22:56 -0800 (PST)
Date: Thu, 30 Jan 2025 10:22:50 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,wcnss-pil: Add support
 for single power-domain platforms
Message-ID: <Z5tE6hrmVLUD5lLB@linaro.org>
References: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
 <20250129-wcnss-singlepd-v1-1-b01a6ba0b1bd@lucaweiss.eu>
 <9c573fff-31e6-4319-b8d1-527a3487cc20@kernel.org>
 <4981958.31r3eYUQgx@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4981958.31r3eYUQgx@lucaweiss.eu>

On Wed, Jan 29, 2025 at 10:42:22PM +0100, Luca Weiss wrote:
> On woensdag 29 januari 2025 19:44:54 Midden-Europese standaardtijd Krzysztof 
> Kozlowski wrote:
> > On 29/01/2025 18:51, Luca Weiss wrote:
> > > From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > 
> > > Support platforms such as MSM8226 and MSM8974 with only one power rail
> > > (CX) modelled as power domain while MX and PX are regulators.
> > > 
> > > Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > [luca: reword commit message]
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >  Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-
> pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > > index 
> 8e033b22d28cfa8203234f744b3b408e976e20c3..d3c71bcf0f02122eb0dae214f135d8d7f71a9600 
> 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > > @@ -69,9 +69,11 @@ properties:
> > >        CX regulator to be held on behalf of the booting of the WCNSS core.
> > >  
> > >    power-domains:
> > > +    minItems: 1
> > >      maxItems: 2
> > >  
> > >    power-domain-names:
> > > +    minItems: 1
> > 
> > 
> > This should be further narrowed in allOf:if:then per each variant,
> > because now you say that all devices here can have only one power
> > domain... unless the compatibles do not allow that, but then explain in
> > commit msg.
> 
> Yes, the compatibles are so broad that they cannot be used to narrow this 
> down. I can add this information in v2.
> 
> I'd add something like the following. Let me know if that isn't clear enough.
> 
> "Due to the compatibles qcom,pronto-vN-pil being so broad we cannot narrow 
> this down by SoC without introducing new compatibles."
> 

The qcom,pronto-v2-pil compatible isn't too broad here IMO. It describes
a specific hardware block that needs the CX and MX power domains to
operate. The hardware block doesn't care if the power rail is being
turned on via a regulator or power domain. At the end, this is a
firmware difference "leaking" into the hardware description of the DT.

We can describe this in the bindings. Both CX and MX must be present,
either as actual power domains or regulators. For the old setup (=
either PDs OR regulators, but not mixed) it's already there further
below. You need to adjust the part where vddmx-supply is marked as
deprecated, undeprecate it, and then try something like the following
(untested):

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,pronto-v1-pil
              - qcom,pronto-v2-pil
      # ... drop deprecations ...

      # CX and MX must be present either as power domains or regulators
      oneOf:
        # Both CX and MX represented as power domains
        - required:
            - power-domains
            - power-domain-names
          properties:
            vddmx-supply: false
            vddcx-supply: false
        # CX represented as power domain, MX as regulator
        - required:
            - power-domains
            - power-domain-names
            - vddmx-supply
          properties:
            # Not sure if this works here, might need to put minItems: 1
            # into top-level and restrict entry above to minItems: 2
            power-domains:
              minItems: 1
              maxItems: 1
            power-domain-names:
              minItems: 1
              maxItems: 1
            vddcx-supply: false
        # Both CX and MX represented as regulators
        - required:
            - vddmx-supply
            - vddcx-supply
          properties:
            power-domains: false
            power-domain-names: false

Thanks,
Stephan
