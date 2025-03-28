Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FAA213E77
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154200; cv=none; b=KbeenZrwf4qiqICgaZYHnKFndabpfGqUwo9i+tBEiwvhAQ1Yp9PbipxMYCd1nj8MRFWQTeHE5TETX1Be+7+bv4EcasZCl+nPPGXXq8f7OC2jUZHBvGg6KVANrvway2cL6Lfm5p91gi2yQP5CaLg2rAbmpH9kcAWkpGlOx35m0sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154200; c=relaxed/simple;
	bh=8Vu9wccvRJP8ukJq1AmbQm1pxBvfrY2JQJAGM24f+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlVCbrr8a1Zy13Rogv7d1cWx6w36KK5aGiFTvLJR4opOl3zbMM8H4BXYfRPrKTmxxrkrkK91S/PlWVmazQhMNAdd9l0WAEv5hYmE+0Hl35C+cqcAAeXUVQvdNvlBvUGFwIF73r35kqFbF8mmN69ibQaTZ119PmBwcT7MdqX+JWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1KNts01; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1KNts01"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so3441929a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743154197; x=1743758997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSShgXJw3PA+4hUdB5QsWQTuvezZ525Q5xMzwXN2rc=;
        b=B1KNts01BRgg0aJXETm7M6ea9egioMTZOIPIYRmp8obe2y+Rtl1ox9bvusii+2cWI5
         HMbh4bl3aimUyn8yB0+Kn2tyKR6qxXDci0DUZS9ccyou4jT+ndhhQKULxSxmKYd8/wXd
         mUnWj1GokpFp2BWgdTbcRz15DVGkb5KEgfdOv5kRLsXuNMtvArhaKpJ85HyfebojAmKp
         Af3+OI3+AqVjV4O0wfB5Nv6NN2+YSJ2x0ntpHQtZNkXZ0EUs+zmxy+Lcsy/pDQAbvJ15
         X1MPVzOAXR0dh+vfMyZLWO2q2WRTjAnCgd3ccinl1LdnbBoDUW6dBBPyauRrA2+b+d8E
         CcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154197; x=1743758997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqSShgXJw3PA+4hUdB5QsWQTuvezZ525Q5xMzwXN2rc=;
        b=Xj76qInkuUtpIeZaga6ZQlE2s7pJFS2AV2ITY53KaR+90rhCkoAZL7zDU4JrhkKLSq
         Sdy1Uq6RY7pWV/ZYGL79ynjVa7tTEXBHVHW+txIbecyJlwu7Rb25aXjmOaGNx+jA9OOs
         R5rX4F8EAPJdjampprxwnch380Qv7NDWwWPiXT/KpqMkAyrgwRdycAL+yba7E4wXcj4q
         t4iVHiOrO3s91S6b0YLUfVYU3XEUgt+WlPh31sH2ble8qt5zmWIiShnoK5dJezBk/0nr
         bqTMFqtXb2mE3ffXgGNVGeU+8QMoZsSu6ONjZCtVkn1e4Eq/fPDxr6oyk641YftxdrKX
         M6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWQI18Wj6MhJkEEnnEuakzwU88PcwPVls2E0QMv9lpQa0lRehNGkZVfDZZYep7kDQ9qz27CmK5T37uo578=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQz4jBVvwDFpTnoKfx8A5piMPCl6tRNg/9azzpJVuDcTCUBRJ
	qyw64rBSVzPihSXOx4gURKMblv0g51BMDiDxhLEj5lqv9hw2nDe53YyfejovSOo=
X-Gm-Gg: ASbGncvKi07Ws2r2WbD4i+aPTO6afsLZdsyNsT9Tpau+mwcXKrPF14E/hwAH+jIZZ50
	/d2yxZzzPIwpdJ8yv60yz1K8nQMWRVZTZuQbFeDOydxbkcbT2Tl8y2lO4B+mn5UxJI5JD3lSqOo
	dXIFmyaSB1iqkDUQRPC40A4MivZSuuy41yPZdq0KAT5FpQ95ySrvNIqkTsn6Qbtdmu2Jkh61AZ2
	Jyh+ZclKb7Q5bvIbeWYGHy615bR4qeHF4nkCalf03/5RT7pp3kighe9kBfk1fyuYULOxK3ekppD
	F9BuqOZ6xC6+qcsTKlgn8bttAZf13W3WLO++kUIwiw==
X-Google-Smtp-Source: AGHT+IHfluKIRr7jH95wATbLlb3zKl9uT5b3dRjhMmF+OXcjSLOy4S6m1p6fE0ADRn8ZZaTWKhlyrQ==
X-Received: by 2002:a05:6402:90a:b0:5e5:e78a:c4d7 with SMTP id 4fb4d7f45d1cf-5ed8e387bbcmr7030250a12.12.1743154197144;
        Fri, 28 Mar 2025 02:29:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc18030afsm1108964a12.81.2025.03.28.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:29:56 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:29:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dgilmore@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Message-ID: <Z+ZsE1wm87GfVanE@linaro.org>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327081427.19693-1-johan+linaro@kernel.org>

On 25-03-27 09:14:27, Johan Hovold wrote:
> Enable PCIe5 and the SDX62 modem present on some T14s.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> I don't have a modem in my T14s, but this is based on the work I did to
> enable the modem on the CRD reference design and the T14s schematics.
> 

What happens with T14s variants that do not have the WWAN ?

Is it OK to enable it on those, HW-wise ?

(Hope we don't have to split the devicetree again, like we did for the
panel)
