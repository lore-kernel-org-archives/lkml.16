Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629FA1F92A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751204017; cv=none; b=OehTKFueWiZafP9cDYKhVMmpQFk2TXxiaemBi8IiCG4BnQJOx3I3S3h19B4TamRDFUleRrmtJdamcTa4FHUunMws7VIh2TxmFxq8Lx13mho81wfwH0ruBltrs8dgSFdoX0NF9hcJqimdrbFhSTzdIIDae57kJztNYReLVLEaJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751204017; c=relaxed/simple;
	bh=Im7fHsFArK/1tFdJMR16F4bXojfNIYbHDtzJEM1VqZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOuuofDloX6f5VWfvLe3+RBU9PPvrqE8vOv+qLldNc77ifBikN3XdnM7JckN4cMH1kD1h8PmW7ELFy5to58whLIy0SsY32Lb82TQSE6XujFM/gsMFF0d/i9R1kdUO0nWaecsBN8S415MAkx7hGZstmmuoqYkfcBzOslEKkOOTZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CZDfRdZN; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CZDfRdZN"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a44b0ed780so16850591cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751204015; x=1751808815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Embj1Fy2DJouvQ91VRCrgqeiZxMI64cyuUrY1sXvYvw=;
        b=CZDfRdZN2A95SQSZVsuAWImwF9/7gR81ahHop1sadT9ha3dUnRuwtpmrnJan4lPVTC
         IhtNNYjK33ERpEIQPzMmBivYpRQKR/BTz/oPWrwgY7OBdFSYHCqv8TItTUpFa0GbeqSN
         2WyAX7suNJYmo6adFrrjDw1VZtC/QDsrTtRV1Q3SU1e539hKMOvqz8PAqOZjUz1gtiXA
         ALhhyhzi7J56IMwFh2mLqxXc/UP3QGTFskj3vk6vvIIaeVRGZ638y47AUzHtSY971eAA
         weIWs6HFf6Z8qddhn4YgYzrxt5Vj3pdil/AxJJhCRPciAHx+53k72tdAA8DSAqPpCERM
         wdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751204015; x=1751808815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Embj1Fy2DJouvQ91VRCrgqeiZxMI64cyuUrY1sXvYvw=;
        b=m+rwe+tNSyo3n7os3qJQEXnBT8Wa/9w9wqgaX4joMm2HB/wmJb8GEvf11xhCGrkfsx
         69Qj5A8QmAecuIZeFyYG3SPE+Tg/ACKrUcK2799NnOZn9F0Qj5xeFj9DML9rNxVf55NX
         /lWkdigFBxWOUN1OGECXo9mjrlqpY4OEt9onRN+SQJnyogGCFYks8eSDthuHmgeCxpYl
         QQYfUnx7KCHawKC7dIS9glAz9n9w2w5fXK50QMQ6T66PegpyaGkc/+g1CN75CCDfVg5s
         XzlTfJv3U+08vUM/HkSAZd7ufQyR/0RszBkRFhqrpNu9k09Na4wHM7w8isVkP/F/neUm
         XLIA==
X-Forwarded-Encrypted: i=1; AJvYcCUMHyZLW+nb9Dtnudh3Q6nhUEKjLLEvEnEmEFXGYDKyv2N2B+/OtrDTtm0D5vwmK3x7OuxauerOvWBvYyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFo6a7s0JifE5o1DfBqaPH4/pdKGQZdV6Sn6jETPe61bfVMPa
	0Pab+PwarkHSMZBUU5Ii/2wdWwS1LNradEN2ULt+mdXJsck8wDImiqG89AhEUZY35g==
X-Gm-Gg: ASbGncsb0btrs5XXIwrCVi4lcB5O5TB+msVcG7NMTpj+8jWRl+6M226tqjrdyDJHI1s
	0izgqeSZnR5FnHabL794O/eQKD/H0Tfrodj9G3w6akNc0pSoitrqW18wKAtqMXeYzfTKnSzPKnH
	Z2FtS2+fBZL7bXMNVQlA2/U4whFLKqblqhuVdiT7OiD7ACnDF9OqdOev/hiVSd/RXPtLVhpQI+L
	cjW+eAziqFr8PeFHWgOIiU4SvDR8dlDCWgVqWcmAKt++MC3NleauQE0NIoVQApzioooHzy+451f
	roKC/L22l93TszWRQEi+UEtQdnhAjZyZbuInXyEaAQVkZj1+eC9MIA2SDp6/dKk=
X-Google-Smtp-Source: AGHT+IFkWV3qQJluABPlEDQqfcYO9N9MbOOl5fdQgXXCIVkXvMlt7C0IXV6g9l8Mna1o+i4IA+YrEg==
X-Received: by 2002:a05:622a:2c9:b0:4a4:2d64:a7e4 with SMTP id d75a77b69052e-4a7fcaeecc0mr172064861cf.35.1751204015252;
        Sun, 29 Jun 2025 06:33:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::76d8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5a3b92sm42853481cf.76.2025.06.29.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:33:34 -0700 (PDT)
Date: Sun, 29 Jun 2025 09:33:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: m66592-udc: Ignore feature requests for EP0
Message-ID: <cca54de8-db74-4df0-abfa-7275f8f2a8ac@rowland.harvard.edu>
References: <20250629025951.17581-3-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629025951.17581-3-eeodqql09@gmail.com>

On Sat, Jun 28, 2025 at 10:59:53PM -0400, Seungjin Bae wrote:
> The `set_feature() and clear_feature() functions handle requests to set or clear the ENDPOINT_HALT feature.
> Currently, these requests are processed for any endpoint, including the control endpoint (EP0).
> 
> The ENDPOINT_HALT feature is not defined for control endpoints according to the USB specification 9.4.5.

Actually that's not correct.  What the spec says is:

	It is neither required nor recommended that the Halt feature be 
	implemented for the Default Control Pipe. However, devices may 
	set the Halt feature of the Default Control Pipe in order to 
	reflect a functional error condition. If the feature is set to 
	one, the device will return STALL in the Data and Status stages 
	of each standard request to the pipe except GetStatus(), 
	SetFeature(), and ClearFeature() requests. The device need not 
	return STALL for class-specific and vendor-specific requests.

Thus, it is valid for devices to support the ENDPOINT_HALT feature for 
control endpoints.

Alan Stern
