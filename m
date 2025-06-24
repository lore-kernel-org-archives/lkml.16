Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C352E6D03
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786352; cv=none; b=QII1K1G+ICDVv7IG1oa6bFqW3iuNEAo40cTCGDAjDKxxiusFkXblXJKDy9VDe3svxDapONg8ngsGmhrkpuW51cNEuZoUYvR/3wzgpuSXcphnTCgEy9Sp//b25tFEpGFdDa5qRaJVSSGV2nJP5c0yBVcBOtvpg7hXS7Fhk+Z8B+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786352; c=relaxed/simple;
	bh=5zXOGQHtuzqMdDTdTVm99Sp0hUHS0qO9OFTXoiOPRec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUarCzNXDGib8P2QhyzjLPgY5QFtA5lDk71ozdVnMckM8vyGg5/Z6Vtr7VVoPVbFVQXZx/AGyltHsczHaV+TlwINwlmX/nbGRdklVITKiZyhaZqwiouL7BBtMraeCV1vCc45HGDiqMqJdabVDm+gTPafyYTI/kKkGRohUpobCXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fc/+yBf0; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fc/+yBf0"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6118c1775dbso214466eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750786349; x=1751391149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSGDqT2il9ocDCmHC7EaO2CWRkrvX38ACbyIKYy82e8=;
        b=Fc/+yBf0pZDPwPb3AsSwFvTvoaL+xqbQA1ZWO1vc3/zveT5gCXivoVLV0r368wNULp
         Q/7E2yKz9z/c4OmA0Qv5sROfBjz8MfaiIjYOpDqpjFfzRCOkkOzXlwA7PKJ8zndxSYWi
         lubQ6IC6fcWPuFz/pyrIsVFSvKMvdAjYTbTjd353yE3o6Uid4vEDzfg+tSb6Hl50p5Hp
         GRhjCZuuHpOt2aziOLU7YfS8nY/KElvo9JzYKaWtTTXo3G+1IrDrSUnZelQ62v4kN0vE
         pBiCUvJwTG7K/ySVv7+9kfsg1NiOqNt3v/VjqG4Hw7QRDS1gAEnNJxnSc/ZRn20t00nq
         z39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786349; x=1751391149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSGDqT2il9ocDCmHC7EaO2CWRkrvX38ACbyIKYy82e8=;
        b=j91+U9zROhaSi72JNJmLdvsX5AeJdvZ+fCFFjqqO6//QF1elktMPe08MddaUsL4pvS
         ZqPATV4l4n9I5sxhuwKtUKkzCTaBhsIcH2oF9J0GLPt5E1yyet2TOhLki29oNS/1KnJw
         L7GMo08A9s9NcAhrmPQQQQ8gcd2zxfDrjlhMNWuMpQh2ri6fG1X+IhYeklbqg6PsJzXk
         GZivautNQAwEDhtOLgBBQMFgBcnj53UCSWwai7obHBFYMovC85nbVKe7HGq17Q8n6TBq
         0zJFK6fuDyYWMgXfpwQFS04Qu5Inozt3f3fHqh6HJOD87+1x2AO8RzL1sl6y0oVq+Szd
         HE6g==
X-Forwarded-Encrypted: i=1; AJvYcCVu08P8kIFQYZkB9IS+8m6v29Ex2K4uHjfplDrq5eN5GpXjG3dFsZmBfJayhNcKa8yx5j6WMBqvPUFOlOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YweA9USQk7Pq5JrabU8XouApDo5+qi2ddnzmX716ru1zaCIc3YD
	Q6BkaOe36ovVTLLWip5PK/k4NZwc2lE7uy0TG4CsT+AuXF3LmRlpL24I8p7l9gWCaMo=
X-Gm-Gg: ASbGnctBIbltecAUeY3cTUjCApkZaxWbGDNbyS81Kw3nFCpGFwhZDq22IApwBpaazJS
	qusC/tkq7s80/uaGe+ssohKtj3pLFDpTTGvo3Ja2PZOfOwPQmtDFMA9xLYKfpKCm7D09HCL7eQ7
	eeh2/mZVQ9MxDXlehg9p7yedtnJS8Kw9kB7gOh64ihTFjAe7QDVTNIkqm+5XXaHUEwQwGQ34WkE
	rCN86NbxG3zdw++HxTqB5tF6Wd7MAos1o5yES32iSQT426bWCHM/W3LRA39siL4qF8CS+RDKw3q
	op++BEMde0oOBHYLsvbO0IUhqEepiB7/jfvDhwugx3LFHRtzgy8eRI9ehS5vTMtyGwW0c5NrFI5
	H2yBO
X-Google-Smtp-Source: AGHT+IHP57I2IEpZSZTYdkWPLpjlVv9dwCTYMhHj4ANtmM8o/tFTjl/Qtb1NAxmUKgDIueYRW8AITA==
X-Received: by 2002:a05:6820:1b05:b0:611:5853:3ecb with SMTP id 006d021491bc7-6115b734ecfmr11470941eaf.0.1750786348746;
        Tue, 24 Jun 2025 10:32:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7f76e9sm1317795eaf.39.2025.06.24.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:32:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:32:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>

On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> On Tue, Jun 24, 2025 at 7:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > >  int hmm_init(void)
> > >  {
> > >       int ret;
> > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > >        */
> > >       dummy_ptr = hmm_alloc(1);
> > >
> > > -     if (!ret) {
> > > -             ret = sysfs_create_group(&atomisp_dev->kobj,
> > > -                                      atomisp_attribute_group);
> > > -             if (ret)
> > > -                     dev_err(atomisp_dev,
> > > -                             "%s Failed to create sysfs\n", __func__);
> > > -     }
> > > -
> > >       return ret;
> >
> >
> > It's really unclear how this "return ret;" is supposed to work.  Was
> > that part of the sysfs_create_group()?
> >
> yes , but still it can be set by hmm_bo_device_init so even after removing
> sysfs_create_group , ret value depends on another function.
> 

You're in too big of a hurry.  Wait for a day between resending patches.
I have looked at this some more and it turns out that nothing checks the
error code so the "return ret;" doesn't work.  What do you think we
should do?

regards,
dan carpenter

