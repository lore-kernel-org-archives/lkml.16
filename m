Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E50212FA6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683112; cv=none; b=JMA1zVRkj25xUI9e9+9gQ5cj/R8/KmBFT7RoCj/KyMDP/SMLoE/wdgkcsCHVXRZ5rFIFp4KT6EBd1khXgtz5cMJR0t/1O6k/0m556D6qZX9/zdX3FaWHb9lJp37CN6L5PDqX5M+D6/vYfu+hgzO/gCxlYxGJqsM5v/Bu5wT8fnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683112; c=relaxed/simple;
	bh=y/HggLJSN+3EivXP89QktPNjxkoD2eOJwHrHJpo+/Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrd9LjXABhmPdxa42JTu6h7GVHkI3NJF2+HCYBewen1SN+JR6TjhukdGniscLAXhjk2IHINJsBqNZAhXP2B/dy/LJ6QJ98jnaIaZXBk6jQIq8bc6+4SFN6pkFUPYwrypDJhwEOw2ehjN1DMc/bBT9netTsWdZj9ylMiXs5HwshM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M4G6UFHW; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M4G6UFHW"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so506529785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738683109; x=1739287909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6vDogQZmhVzdQ5E+BOKChoBdDnjqfZw9znSsTvbUcs=;
        b=M4G6UFHWpy8gYFRXRRqfV1BKhkaycVWu2i+QczXlSxVjfIaexsh5y/IK9Bm7m3vz1e
         8L6EYrDNgYQd+CIJDXJbf9ahEVltQ77J7T0BKua1EImZI/eXHHnofhN1FdQ2bUuW8re6
         6tvGePcdgLcG2EM2yQ1OVNJ88Vgl4fD2pB6YYUZzexgAQwVvQMv/7/a+lqt8qEV7+glS
         sgXPaVNAUswg6kdjn5nj2LOSncFmGFa7QCAVfYyTWjKh0NkOvUDqr5Ap3kXk6QbKwW1Z
         hK1TpY4ZqaeF1R425YPx/t1+Jp0vijJtG+fTHnon9/UMttMtH+GXj+Xfbl0MxdtB9mgX
         eM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683109; x=1739287909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6vDogQZmhVzdQ5E+BOKChoBdDnjqfZw9znSsTvbUcs=;
        b=pokhAdk2dQlh2xmgwzZGxprlihd1rVm6CW0YNVi0wgliuOnEuWejnZZz379diu3CXh
         uGC1rmAXFtEYMXlyHSvJYXG/PexoD0X+tI0/x0kjyUBLI/xZukibwnT2euYwKsEgwS5y
         NN5PFuVwyIMb5QXPJL0KiTtX8FGDyKrV7sbam1hf0LBxs2GJbvbtVcGmITP4zrBLBaL3
         MSSwp8xhtE17EBePF65DE4yp1QmgJvZJdJxUJLF0Zs47nue5GtCOa0NKpt/0vlKgtHKz
         e6uxr26aHNmshOCLkWeEc7k9VpcQ4DQqolFJa/5MGkyb+ojS4jDVxlUxdH9jk1J6BwtE
         y8Aw==
X-Gm-Message-State: AOJu0YxVRm8Fenc3+BxjrWYR91rB8JnTvSyAHFY18pBavr5yCjSD4nYO
	iqiLYOrRoC+bwi3SOeHrQBVDMe+3jUNhgp4TH/ZzPneD7o08ofL0OlZ6HImMaA==
X-Gm-Gg: ASbGncvZPOHDf7iWlmiPC4bUPrJZTunu3fGbdqlAJ3Q7J432+Xk04p80vqdIkMayeFu
	chA/5v7KTYK7HZEeCDsliCO2vx+D+wN4Y8C2BBmgpaoVtmU3rhVJSaZ8Vqb8FOx/oO7Lkc6sJyV
	uGgzuOqVYEtwnmTeRJkKZsVliibHaU8orAjStlpY5pab+LzpMbuHSqeSehMNfbdWlPPEUJxk28V
	GMZY86fHbA8XBPNhXrC51AoFslRRiFjWpOPJ2/YJp2IWckHvI/Kde6CPs2NCvL0NKO7fFhEM5Mv
	gN1Fq8dqYYAuXWq3hkUCA9M5RK579yUTqg==
X-Google-Smtp-Source: AGHT+IGr16xztzaU5RVdUQ4EEpqABDmb/hiK2v/XZRwrNmn6sD1FtahgAqVWBvE/dHbzuTOuI+PQKA==
X-Received: by 2002:a05:6214:19e7:b0:6d8:a610:21cc with SMTP id 6a1803df08f44-6e243b8f713mr344012086d6.1.1738683109138;
        Tue, 04 Feb 2025 07:31:49 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e4168d91f4sm30300316d6.58.2025.02.04.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:31:48 -0800 (PST)
Date: Tue, 4 Feb 2025 10:31:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <28e9ed5a-9437-4a53-a099-a8df27ca8a91@rowland.harvard.edu>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>

On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---


> +/**
> + * faux_device_create - create and register a faux device and driver
> + * @name: name of the device and driver we are adding
> + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> + *
> + * Create a new faux device and driver, both with the same name, and
> + * register them in the driver core properly.

Along the same lines as Danilo's comment, this routine does not create a 
new driver any more.

Alan Stern
