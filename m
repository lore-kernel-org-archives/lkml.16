Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AE1223316
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789892; cv=none; b=XdNP0UIAoCyYalfDCXpLl+FmZJ9WG9N190Te+DHq6Aj3azeTpb0Z4lzfg7hSw2dK65D5JBP6u+8jewL0mKIl/q/J1fHUhb6vK8PDW58o/ppnw5ldcLQ229rLCf81tgBr8D9iP+naKlyzlBKQkaHvqKzQNPnMhKhL8GxIgIEYHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789892; c=relaxed/simple;
	bh=m8J3O7QzYtKHkTJW6LMTlN1rnZ3hXaZDwhHlnyjRWHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHZapypxtuFufWn/nEYG/efpc7dJfJaL65JGcNATxGm+WKLjLohYTbb17SSLL9XnswlcBfkuyj8yrPfOxjdDcM2Iac75RnNFDq0WwneA25tIu+9jkE28QQr4nNuB+38DASPO+Shgz7DK4YTgKWFz+D3LZdJLrdqIiieb04NjPa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1/Wgsvb; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1/Wgsvb"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-40abe6f8f08so4924890b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750789889; x=1751394689; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GjxEYQ1lbJWp4ECKZKQpz8oozPbUNKZGlrJ6EmAWMmk=;
        b=V1/WgsvbksR0gweco31aEBMw+5KQsjbsnRt8VFD7eN7CMlaN2YZ6lUkMRpD3YBgF1G
         qCk8LuBcCDQF6sTxEyNKn/EE0oaHCGDRpWmqHEP2wOxcMzaPg5+ZJvmPiH5A4h9wlqVa
         SqK5zigWn5SPaSv8LtEL38pr8ShYl8YqSEqenDBukCXtQVIqpSUFS/dWIAgmZCMUFUpi
         w2fp/Bw7NHYklTolWIoq7SqBuSEbKir8MVoVg81l0B85fbLx/KdGfDnCCMfvWtff6xQ/
         ELN8M8W7Ve+FIpbloOrZCBTICFCIOYeilORbqDAD7akGtCCOFrLVP04wH8ZEVaSRE0Ck
         QFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789889; x=1751394689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjxEYQ1lbJWp4ECKZKQpz8oozPbUNKZGlrJ6EmAWMmk=;
        b=KhUCgg4qr10Ibi0JepDPRU3LVxMCzsF9VSeFqiiMsV4GI7QsiCxM+bPP4/bCSIGDYA
         Kgigc0DRF3rUSH8Q/vcUZLBdSAbWru+mn4UUVyw389GlJGr9ud3KOll0zy5d9X/iTU0l
         Gy6dadIpHFWbP2SY13D+HS0rDsDBrFBLxNt3X091RJg4foDENSKsXmgKo1WQk44qBoZL
         sW46oCwfCp/HyM3aHEPygJgtAltcsFkxSFConHlhycVIgjQX39fgSwV5Uf0u/HsjbHZn
         JT8LZNO0R6aP60ygGqaXCP+QfT1M3DIVcAL+n+9m9pt8ASYPBIuxJ3K9kqgUhS4lJDoY
         VeHw==
X-Forwarded-Encrypted: i=1; AJvYcCXEvvkr/BbuSkmuvJm/kLY7cnagD32ZgzI5VyY66Vbg6Ys7rTVJ1lynYCSteUh6OijXtE3cJvvRRZ1OKRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7yLaDG79HFEuVwsZa1RXytjXgY6/A+w48C8IjXPgh/XlaKElo
	cB5v1jnocxuOt1/PZe5Wq2EJS+x0aS3KozB1GftUi/oQBe9EA/BKwNvHqpJI58CTm+atnrfnLLP
	knZX/
X-Gm-Gg: ASbGnctizPJfuCITv4E2tSNqHOvQVmSd1S1kGUvmVqaxhqmpDCpBs/erKbqt4oExPfz
	N8ojsGHxGB1fHBhvcWNloeUGGCOXSObJDPleJl5y1b3V7ufQhD06dhmaSkaMRpoMtVDUaeV7Dpu
	FzCqSgjdzNgAY3AU7kF9ULl8W8hGGenPCX1/Tva5JLbuflELwr6StKXuCnHGZFNMeyBmYI5lmpy
	AP0Kf8yQnRxFsg0n+nuiQvYojaEatVojitvgjw/GcicuoxlgGje82B0Id+AU1+zT6yqvE23VDEv
	X6FSf37GEVSntqraGVTwNF0WHcVyuAQL2ng8vRkiR+JFuNYLoj+5D974XRnKS4JhDT/Ljg==
X-Google-Smtp-Source: AGHT+IFwefbh7k0nvQhczietm5nprEfi0G1/PBzQxhLLmXWhfFEBYvdG9Ik5OraSPjQQOjmjLaMTJA==
X-Received: by 2002:a05:6808:d4e:b0:3f9:76d2:e437 with SMTP id 5614622812f47-40b05bf2641mr317669b6e.20.1750789888699;
        Tue, 24 Jun 2025 11:31:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c30481sm1893573b6e.17.2025.06.24.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:31:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 21:31:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
 <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>

On Tue, Jun 24, 2025 at 08:49:36PM +0300, Abdelrahman Fekry wrote:
> On Tue, Jun 24, 2025 at 8:32 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> > > On Tue, Jun 24, 2025 at 7:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > > > >  int hmm_init(void)
> > > > >  {
> > > > >       int ret;
> > > > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > > > >        */
> > > > >       dummy_ptr = hmm_alloc(1);
> > > > >
> > > > > -     if (!ret) {
> > > > > -             ret = sysfs_create_group(&atomisp_dev->kobj,
> > > > > -                                      atomisp_attribute_group);
> > > > > -             if (ret)
> > > > > -                     dev_err(atomisp_dev,
> > > > > -                             "%s Failed to create sysfs\n", __func__);
> > > > > -     }
> > > > > -
> > > > >       return ret;
> > > >
> > > >
> > > > It's really unclear how this "return ret;" is supposed to work.  Was
> > > > that part of the sysfs_create_group()?
> > > >
> > > yes , but still it can be set by hmm_bo_device_init so even after removing
> > > sysfs_create_group , ret value depends on another function.
> > >
> >
> > You're in too big of a hurry.  Wait for a day between resending patches.
> > I have looked at this some more and it turns out that nothing checks the
> > error code so the "return ret;" doesn't work.  What do you think we
> > should do?
> >
> sorry , will keep the time issue in mind.
> regarding the "return ret", its now basically returning the error code of
> hmm_bo_device_init () inside the function , but outside the function
> scope like you mentioned, no function call to the hmm_init() checks
> the error code. Thats what you mean right ?

Yes.  Nothing is checking for if hmm_init() fails.  Step through the
code and verify that nothing crashes or bad happens as a result.

For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
yet." and return.  So that's kind of annoying but it's not a crash.
Search through the rest of the driver and verify how it will behave.

regards,
dan carpenter
