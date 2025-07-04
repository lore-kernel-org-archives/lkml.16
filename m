Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B8D6D17;
	Fri,  4 Jul 2025 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588732; cv=none; b=GLTws+bKTx7HwClb+DfpmOn/rFn1iZt23raXbzOp+XmKldVmFErY1MDS24F6rZHOi1jDfPnOdMdcwDFU7nXJyIgmadQqI/zv7cGoI5zPAcyST31aW5IKIphyr8Z543Z67ZzAqbUSLNnyuw8t2gAkuTodMeJMGVzmJKkR0GQAWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588732; c=relaxed/simple;
	bh=E8Mos6/LrtQxYCj9mBaLwe6+10wBudiPbO+I5i1hz0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEftqcVIlMZNZ7Aac2LCKUocq9Hf+Akwe+pBB/o1r97yM99qlRj2RbQYXaH8XNhkZk+wpQVSRqssKXCRXgvyzOVV0AvadZw66Hh/hp3v5bYRK7yANnG7hX8FdzNG0WXJUbgAnEGWO4UOueitpXtolYAmSj+1ThCQkZaEbjpwBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Shfn/Web; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Shfn/Web"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235e1d710d8so6687995ad.1;
        Thu, 03 Jul 2025 17:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751588730; x=1752193530; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7v5gurrbmPldeiskIo+P7BWOKubUph5grmPZfX9X2Y=;
        b=Shfn/Web4qHHZXhncGQlf1izlxmMoZlRCj8ChoKImo6iO90yOdOMiFPkZjhflXTfwU
         lnJ+3PZpLMu0XhTdJ9sJT+2dmonpiB4QlkvfbWuxOFoTpIqUgaKpzXnHMrzzVdS7pd/U
         I6CrJoXxk0zxik5xFdbBbHLC43Qgf5/QrdRSzekO2T/FAIQQl0D78CUB8S+MlaDYb4Cv
         IDlGvCvY+DgsaN4t1mynh0K0D83iP7ONPi45NIqbqrd+y57M6rh4fActKb3MdexhsCX+
         rZeSJ/d+0zAdi0SXhus2GaPb9AvZ/16YwhtwZGLIFn2QCP8GjyRX50idCfuNS0Qxpw7I
         4urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751588730; x=1752193530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7v5gurrbmPldeiskIo+P7BWOKubUph5grmPZfX9X2Y=;
        b=KEl5OHMqqCl7hCXQOurrQP5EUYqC+7Ifvp4PCtph9QZkbXC+a/od/DO74+FzvFmBfY
         9LxQFwVUCd5cU7eI7JxLr4YmgG6IptSmGTttXwXqHGDsoy3Ma3lOx0RG2KJMN7zhO5ZW
         Vw/BfuOvnJmFS1olEhp4XsTjIadKCoDQ5aool9+QBurUgxJWMvT8neM4AFR1z/p3Jsv3
         I75yVSgSsWLMlczRmTr9dDYT6qLs1oB2/w2f7Ur/Nvnc+fYj1bxmvk5T24hbNpsIIHMQ
         PCl7tI8l9vOJEnekg2VP4Kw1ir82VdJVgK4KnQXsAxLnvM/t4Jj+C6nb59sOQWKbwLzM
         2R0w==
X-Forwarded-Encrypted: i=1; AJvYcCWC06hfPSWMPz7tQ35IWQXwrSHqqheVqWpICvUhKyFLe+su8zRR2aw0Dhxk1WIhG/qijNV+bqleZ5ibKiY=@vger.kernel.org, AJvYcCWCbC8ZuLotH6n62/ZKO27P/0wBj9dXqPnTw5i5nwzkz5jOx1hehrm2kAmuZRHmcctlPh0v+Doka320JCBg@vger.kernel.org, AJvYcCWqWVVkpyl+wjsNwjqqVc/ACzHmFQSMTNL2pgXNReoYzOSB9H6frNoFAi0pUKw+1esww61gYyorbZXB@vger.kernel.org, AJvYcCXegzAg9ewlM5OsDiI0QJ2NwA+6Kl+xIQkX/2lbvVgUo4K8dPWfZE41/M+e7EAZyr6z/vILvCR8usZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGVNXnd4ie7b99QJenTCBKIdrrHWCQYIas0fkwu8KWxNzH2Z1
	dbeyViFtxiMAwLALcXmDziql6khMeVErPzKLZz1ijKyJ/yEqdzMnYFa/y5zO6w==
X-Gm-Gg: ASbGncvWjr0BEEbQl88J/y/HTLC2Txd6sP2S8tOvk6JHG4qVjq86rYtvtr/BBPNgGj2
	RIvGqKoB8MP3gw+PmaSfzc/uGq3LDriaKIlPfnkzmNzp0RcXBPegFdbdyPUTxnu5J9BNe+q6pBS
	UMB/+Ky1ojLE5nF3qEXPujdYH8s4oAmRukZgfpssGM9m8rBTS0Fwo2gZkhdcv6Qv13hBewhTka/
	tMN8JSvQMR6xIG6Y6wOgmyDvxhnKKU18FXXEescuH65+3mNKKAog+yhRV/OEP5YA0e9ounvH6tU
	XVRhwFHc6KtlD+CZ+Hlk2O+LjorCCY3WjQvqD7BnVZb2PUM2to5FD0Ue5UDNqGon2lt6agMUuGk
	=
X-Google-Smtp-Source: AGHT+IGRwCEMCfziqd7AZLn6eRdp70jCSXDinw5sNQDRhQHK3Nrsi6Y+7oNCrXgKwrEh8fcVu5HCTg==
X-Received: by 2002:a17:903:1b4d:b0:23c:7c59:c74e with SMTP id d9443c01a7336-23c85f7b95emr10297305ad.0.1751588730600;
        Thu, 03 Jul 2025 17:25:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845be93esm6423975ad.247.2025.07.03.17.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 17:25:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Jul 2025 17:25:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jdelvare@suse.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] drivers: hwmon: add EMC2101 driver
Message-ID: <9df1cc49-34bd-42d4-96dc-ec9b512e0c5f@roeck-us.net>
References: <20250701181228.1196102-1-noltari@gmail.com>
 <20250701181228.1196102-4-noltari@gmail.com>
 <c893384d-4134-4510-be87-11a2c9ba6cc7@kernel.org>
 <CAKR-sGeSPHu5DiFL2sX=SdET_jzbepo30qguscUjzYkX-Aub0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKR-sGeSPHu5DiFL2sX=SdET_jzbepo30qguscUjzYkX-Aub0Q@mail.gmail.com>

On Thu, Jul 03, 2025 at 09:23:41AM +0200, Álvaro Fernández Rojas wrote:
> >
> > Add a comment describing what you are protecting here. It looks so far
> > like you could just use regmap and drop the mutex, but I didn't check
> > thoroughly.
> 
> The EMC2101 datasheet is explicit about the Look Up Table registers
> (REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED) being RO if FAN_LUT_DISABLE
> isn't set, so I believe that we need the mutex even if we switch to
> regmap.
> I will add an explanation with that in the next version.
> Should I still switch the implementation to regmap considering that we
> need a mutex?
> 
What does r/w vs. r/o register access have to do with locking ?

Guenter
