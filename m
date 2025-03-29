Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F001DE8A2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743280256; cv=none; b=o+TJN4raP+RbPGijQz0+HVytZiv372JMwhHdjDDvd/1kKg6ZRRlODhqNdn8oy45gn0Vc3CzKvfYP2CbFfx97hsZWpGrH53xneBxr+lfobhDxtkc7XpTM7llerVGKobfdPugmF+qIe4SfaGxDo6MMalmZO7vJKUubNoA4ID7Lw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743280256; c=relaxed/simple;
	bh=Yu8gx4E30LKjqkUeN+vwaFVnCZ1b49SThURUG43iDtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/FsIS3KOiLV1HVzuWlT4Bl/qDsOAEMZ6D5TbpYH+dLkrYaa4N/nK3fvYTFQg2jXVHNd0QJ/buACrP7D2O0lML5oLLGcE8Kuf06n53vDrNuWsu6eBFU+w8lMjzU8BT2Vh2Tj/CBzUF2xQp2BSABSZxOrj/joQgkzM4y2tk9yTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHUlig8P; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHUlig8P"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso5141446a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743280253; x=1743885053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcKHKeP7WWkzt6wllCWrZxsfdiWPO0K4X4xYXivfUlI=;
        b=zHUlig8PCOj8nQe6uPjQC6nHhMdUFTf+ChShlT0uLCdRdWcvQ5X/c+gxSB9HNPUVOv
         TCYSGlWYebTj7KG/hCWm/mIawJn4NZcHu8lDWoKWKqxo9XgGPULaWxI/hOSLQEZI+xof
         1OFxIu5CKrKWnzSaGUPjcfDzT6xeaklpSsouh2ywp5eQjrmpuo0Eza/L/SOCctzrJa3f
         mhVxlCpx1gPIYo+HAxssKA87mKDJYBjFBlHp+lmOy/CrKVk1TsJDkkki/jvdZYlUuSDA
         ubfvkoNYH95C+kjfZ6awNUmq7AH1IISGBivAnI/Y0lFpb/aK2w5DzM9MW8+u3ExjSJVL
         8vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743280253; x=1743885053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcKHKeP7WWkzt6wllCWrZxsfdiWPO0K4X4xYXivfUlI=;
        b=Bkq8ocGQLCH9YXaQrFcrBsjpteyE9/VYCemKYUp2Yt4O3d0KwpbKHJrpngjDZV1G+F
         Rpnq3f9TmUEuG0t2Npx9ReTCOosXyeTmNdG7mKJumBJ41Ci91uPV5gtxMmTu6eo8ztD7
         JGKsb1Vc0JtV41RCj/WT6qqhQ1T++jIVXwG3hFv3VU2t9TUaoLthzkE+tz+HivFFLGuR
         MPJlBQVNYNmpYjh0AG3Sr3O8VQgbYdeqvG/0bzpWAYMuQ7kZd64It7BxPEA+xr124pNI
         JzWARnlyRsJ77H77bwnzm7LPjPTsabwpMiYFndi82Tia1VFSxXe+z0+IAEtvAjbDp1es
         OD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyzHR+S5XBp1KEnVzEQAPjFut/w9NFCnspekAahYlgJ7I3hgW6FNeKCHrTyKZUKbnpK50MuwtwMjkUDdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN1OU3N95ZK0JTMcNC7cxo8/aMZ6d+IhbbAIb6pwLyUcaxBsSS
	Le7ZHPRLGKNq8YGfLBKaBfVCUUVxeQvIPVr1Oj/u3JEz7lFNic/zh25IvpTwPPU=
X-Gm-Gg: ASbGncuDZJVToo8DHq4l/A4+MzEvIHNRT28b7ujNh+BObFtgff7CZRprGUmMhJOGoGt
	b50fNv1eIpaRbs2R1K+p4KMJH0EcHDUVwxMDAB5Z+m1onwU+w216q4WisAP43mKnCEKjP7WJkB5
	rPftVQ7sVeESw18n/Ttqa+8ijjnMIicXwdcqUxTVirsotJ6moHGYazP8vbZAy0JPfeBh75ubUNN
	OUrxNWKGBe6iUVm5NvCiSKuyu963YeQE29ybbfN1B+sHVwd/La9KzwVIHgWA6CFf3BC4Uq3jcwE
	9xPcHt2nxJfy4qCVMmbV7ewSLbSQthrhZB5HDfgyqA==
X-Google-Smtp-Source: AGHT+IEb6Ruea6hK6TV9vn2hpTxeIQDJ7rrjAnaoPPm7WZXIAH45MUutF4n7CxtI5vev0wjCTCnfjw==
X-Received: by 2002:a05:6402:4007:b0:5e5:c637:b69 with SMTP id 4fb4d7f45d1cf-5edfcbe9333mr3696024a12.6.1743280252884;
        Sat, 29 Mar 2025 13:30:52 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e04e6sm3377468a12.76.2025.03.29.13.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:30:52 -0700 (PDT)
Date: Sat, 29 Mar 2025 22:30:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dgilmore@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Message-ID: <Z+hYel7Cb2t4mMPl@linaro.org>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
 <Z+ZsE1wm87GfVanE@linaro.org>
 <04ada91e-bf41-4be6-9021-96bcb781a40b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04ada91e-bf41-4be6-9021-96bcb781a40b@oss.qualcomm.com>

On 25-03-29 13:06:54, Konrad Dybcio wrote:
> On 3/28/25 10:29 AM, Abel Vesa wrote:
> > On 25-03-27 09:14:27, Johan Hovold wrote:
> >> Enable PCIe5 and the SDX62 modem present on some T14s.
> >>
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >> ---
> >>
> >> I don't have a modem in my T14s, but this is based on the work I did to
> >> enable the modem on the CRD reference design and the T14s schematics.
> >>
> > 
> > What happens with T14s variants that do not have the WWAN ?
> > 
> > Is it OK to enable it on those, HW-wise ?
> > 
> > (Hope we don't have to split the devicetree again, like we did for the
> > panel)
> 
> Unless Lenovo planted something else on these GPIOs (doubt), it's even better
> to enable it, as UEFI brings up this controller anyway

SGTM then.

> 
> Konrad
