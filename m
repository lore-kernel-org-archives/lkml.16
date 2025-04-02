Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B12323237C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577662; cv=none; b=Ha6Kxo7wZ5QODA0Yx3U55Cu3Ricg274H9V+JbMQl/B1Cijinv7ioLzbo6tmndpe+wi6DVPX9iZPl3yJKXSfF2eFe7Lj/0a9JRx+m+zsQmw8r9xgCo0PEEuQnzNU+A9ed8PjW93oHp0864WHdQk4nR23xpDFr3tfd+LUcts3UiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577662; c=relaxed/simple;
	bh=NnWGuHjIyJg5ukrQmVNz2nsRNWILWqsyGsXJg48Opm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+BKOzUWJFRE7DIWnZ6So9wGucW2lI/wm6rJVgbcueK1Dt+bb9oz8sHkFqLVgvU22xqD/W4V6GLRb8jfR4CXKkdAwVuqFcpYCEYYAWxf0+OTCapzQfBKyD9uw45dZBVU5zoe+SFw3zDZXK9eMUY/KJXYmkt75jmjZCVsdiA/AzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWOfaga9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWOfaga9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so11125612a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577660; x=1744182460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=;
        b=yWOfaga96sPMKnoUq/D32CtFrXpWQpkvt3cee+Dec1xlVgHfB684xB4BxDOQCI46ma
         jLFWnAPGLTJmcoZSpxq5XDLQRKTo1R9IkoD+o5xxFNwfMj8gAmykjrVRHQTVI8he13jz
         lAJ6GbFt0mOK/OiwnrAHqiOEQjQP/WWg+1lQEViG8TIr0d+yIq67nynxR9xQq+tLq5uF
         UjjJ0+xxWHjUqbXcpmrefZ/PDpv6kagd1ck1EoYJbW/mWxM8nHBjkJhLHtv725SJRYuc
         vBZSjRJqZjvrK/se34oZTi9BNl4V0f4FQPNK3HmZSjHvOOoC/kwP8QZQgjEVO6AVmOhx
         exvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577660; x=1744182460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=;
        b=ubM+5x1AvhKNp4JuadqZg4Qv+ngIIgg4wjaREd+asXmpzwYKHPnf+VZU/TPPVhRN5k
         StM6E8f1IuIB9uR3mq7l8P90niahF2Ejmppa3rE2m7Ii3/VQ9s5Ct+YpJtchcL0rF4oS
         JK//68Su9EaxIVDeMrgp4y1WFAb3yRDzOCE+obh3xYZaufHHOsGG84Tbj137UIUPaOvI
         kUe8wpKMoL8IuLz76nvNi6eGPZiyDSOZUnJz8FWtPn02kjMOsCp17HBFz2AdzT3tuciA
         XIzwxfe2xbGJoiHNgA57Q2xlcnsYhC27LqHr+HFliAlDcTRv8KEGc3qR2Xjnrgc7SvlA
         vG1w==
X-Forwarded-Encrypted: i=1; AJvYcCXD6pdxBWk5RHH+0tZwiSKEOU9V2b7S/SLTZhLhlQGG1szixufK9ke2hcRm9oaQSehkHiHtUG2Vey7f/q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx30k39ftUpqBDmsDKrEHKXDWgNffqOC2qbTiN/F89jQgLWc4W7
	BrABW6QHxnTw7u/z5EHWCWUC4CHQlxEHYPc9diAzwdJjOk4oJmiOaRs8K2hy7w==
X-Gm-Gg: ASbGncviK4oBOc3tocOyeTF5fFk8KHqTZv6Qwg4vVJEhmTPZpBI+D6aMGF45joVPq05
	A74ENnNSA9bWS3tQJ6DinwG3kTRsk7UWSzOS0iO2meZToITjLen3jdU1rOnXnFXlRZPIaT7m11c
	pHzdIEo+gCO1yzYKUlTRgqN0GID2ubWAqpHHxAxYitiCITlhuq4PmsmFNMS7cYfk9kgBd4CRbGq
	XMLTxUvRASJuX7VOoo4C97CB5UIxYEz56pg1i5hMoMPlLGBgZFXTn9rEK4FhgCBLsxSuKLAUJ/Z
	RTzxy6lWqymV54o7qHqndKfXp9qp6hhpm3dFhVH4b77rgTdvgZa2RyIF0B66GEDogyU=
X-Google-Smtp-Source: AGHT+IE4wHP6J9GXf8X7N3O4gyhGdGcC+e9u9+l3c8VFMifgnYsypn4gjUxr5vUgHQch7GtGcGvLkQ==
X-Received: by 2002:a17:90b:4f4b:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-3053214596cmr20228761a91.25.1743577659803;
        Wed, 02 Apr 2025 00:07:39 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71besm101393275ad.14.2025.04.02.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:07:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:37:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-4-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion

Is it possible to share the link to the erratum?

> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 

I don't understand how the presence of Vaux affects the controller. Same goes
for PERST# deassertion. How does that relate to Vaux? Is this erratum for
a specific endpoint behavior?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
