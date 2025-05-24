Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E40288DB
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748076673; cv=none; b=iLWz6Qmcj/nY15VER01HTw42JJdqYcfq1cfm6dxQuFDpncBx0rbeyrXbRW8jYt5v7TM0bBpMjEPQrQd0Z12XA+WCgotzo+JUePd5LAQ5T735KoCcrQuZAzCjvIIq4vC3XubG0rgb5DJU9jd4PSbTH6x3YogRM62+mYVeaTwPE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748076673; c=relaxed/simple;
	bh=hJI2cVKiGaBvtXQjm08xYf5Z4PHVl6rT8CHYdOSGTmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHgKD8Gpc8JtxkrVwSKwVgGMhfzuC3zkw3F0gqSNh1vURWKkL6uimJ7jUfy6ymAsYDAlhwmYcufPhzp9AdAPSAA2Aic/PXgxgpsCgdTXdw5hrBeDopf08lVzmt7xe3S1KmplE3FyvnsErpoikbARyKo1pBfDbVtUCZK0n0+IoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psQz3INo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psQz3INo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742af84818cso460221b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748076671; x=1748681471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NgUtYvO5WBVFcjG1wvfO5HBM3gch3DBKN3wNQ2sbbso=;
        b=psQz3INo+2xPlXZGyTnsZbjgP7vsqZTAf6TsxYOzaRiXJ82n0tOZCPqz40MjwPbtgL
         NRYpkpIIUOiewTR573aQeWskE7BPNXMZ7BU6/LQUiiAhIR0lwtcC/zcL9XTswHprYZAg
         JBQDkJcGOmNiDNz9uOkLS6VJola8litSmRPA3K2zEUqeKCOcHP1yRUgGmRnsJEn72gCk
         zZmaO8F3K2mnwwoYjEdfuhacbqBJfXMnehnNiWeh7UaA2589xUoNPDVK+XuLfLG7rmT8
         vSwuflFAluibjeLJYdB7UOIUkKjzJf0CuZDcdEhjYlogF4IlnArDPP7VtHWrmK0CXcM1
         4l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748076671; x=1748681471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgUtYvO5WBVFcjG1wvfO5HBM3gch3DBKN3wNQ2sbbso=;
        b=UfW6omA99p+tROFOsBCJQamDxSR0VgXlUk6NfH/5HKuxiTu95Mi7GJDEACif67JlfJ
         K/tOsk8Ltx10oqBxTWoH2TJYibked+uU5P5WhSwbyKbF/Dnq4nh0qo3yt2Cr2PzNaTPn
         z9IEGBQbCuHWJvYBCMebeU5afUZTshDowEKQCBjyYBkv0KRKjYkNBb43Uqp+aNwFrqnb
         EwCxRMV3n6s/JQq0bjq+bIP6bXTMRfPJvhTGPAFOz3yyhOW+a2nh/DlD7QMkvbVTKLUs
         uYALNlP/h0jYblStEOS/UKaRO9VJJKDOv1unOD2qG4/5zeD2SO9ZPKylDamLa7uYzULw
         IFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULlJOOVA+sNcLlR/802auB0gGoIFNuHcXNCxXznzd8Mci1UsdXoWR3KgqWWugsoR9EMcaTUeklEJF9rrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEH2cxxSrNRrIZVvfAk7jhCSjwz5QuU4+nAQ6txyWBL67tz9mj
	2ib6t5a8D9zZENIEcJwJkoCLKHpXToGhErLo60Wc7CT37919D09B653FhABbImxylA==
X-Gm-Gg: ASbGnctymu2IujdxDlptBnbSxwh+l0mq07JxIXSZbC4cyN8AFMY7xrrMrdMFADoOssB
	AMfPjyCGX7fO7SZtPeZ3QHHOtrtRYbPyWVY9LIJAjY2Yb3KFTubeXuBDPn2+5Iv4XpSgjCXoLNb
	pUOOmI7HVYLP9Yto0zYEKaMEjPwNAsEE5dpIj0Se0QfwrnEnGJSmLholBCZ5vve5LdTdqq5lEMe
	JTn2qwUrGpy/cT0NwRKRF/m7/EnshNBlCj5+qEgNbVDyXI+yi46653skN6F6davCWlgcMNXwMGu
	HneHJy6/X2LRl8f+n2PyoDvVEG6nc9VhC8aMiNEJA90a740+YqPWaP1aqFPyY00daw==
X-Google-Smtp-Source: AGHT+IGFbuTyCv6tgMm8E3JAfJ6kyMrUujqWjJTP9pTwNm1nU1e8K63D+WmdZes8QFKEikCi/Dy1sQ==
X-Received: by 2002:a05:6a21:9017:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-2188c2673f0mr3510555637.14.1748076671262;
        Sat, 24 May 2025 01:51:11 -0700 (PDT)
Received: from thinkpad ([2409:40f4:3001:8408:6765:3c6c:c7cc:8f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a441sm13882488a12.8.2025.05.24.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 01:51:10 -0700 (PDT)
Date: Sat, 24 May 2025 14:21:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof Wilczy??ski <kwilczynski@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jim Quinlan <james.quinlan@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/pwrctrl: Skip creating platform device unless
 CONFIG_PCI_PWRCTL enabled
Message-ID: <nt2e4gqhefkqqhce62chepz7atytai2anymrn6ce47vcgubwsq@a6baualpdmty>
References: <aDDn94q9gS8SfK9_@wunner.de>
 <20250524024207.GA1598583@bhelgaas>
 <aDFnWhFa9ZGqr67T@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDFnWhFa9ZGqr67T@wunner.de>

On Sat, May 24, 2025 at 08:29:46AM +0200, Lukas Wunner wrote:
> On Fri, May 23, 2025 at 09:42:07PM -0500, Bjorn Helgaas wrote:
> > What I would prefer is something like the first paragraph in that
> > section: the #ifdef in a header file that declares the function and
> > defines a no-op stub, with the implementation in some pwrctrl file.
> 
> pci_pwrctrl_create_device() is static, but it is possible to #ifdef
> the whole function in the .c file and provide the stub in an #else
> branch.  That's easier to follow than #ifdef'ing portions of the
> function.
> 

+1

- Mani

-- 
மணிவண்ணன் சதாசிவம்
