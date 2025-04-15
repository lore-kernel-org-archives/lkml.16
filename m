Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8C1275860;
	Tue, 15 Apr 2025 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706325; cv=none; b=ngmOc3b/jjMXOzVTIIOAt5NIw4ZxZovES9pCydiELybA4EmtZ5dzhW/JieNZok05RJF5R+Q9UU0PWG43Pu6z87wjpI5w+QYtTgCyphs1t6JY4UBGJpdD+oDM12YvGcHE9jOV4BjScZyQtk7MlRnk5fddyH+JcG6gc6kKXQtO2N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706325; c=relaxed/simple;
	bh=p6lNgLXXnJnkgPksuJwkrwC1kmRezIDpASiMPRBkp9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKSMH6ohCtGXvgVmkQDDYT4f0gmPtZQ0eqS4lw5sQuSthLCEF0y8r59K4oXsiPwYGihFdHQ36aoHOJjFoslARMnoPpNgTuySp8/gjkOIeX35RMN9i/WnQuM/Yojv8VkLG4uOzsRm7wG6JUV4tVYmUcEZWzwpMoPw02H7xED9hUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZz81hLK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZz81hLK"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db3f3c907so52839511fa.1;
        Tue, 15 Apr 2025 01:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744706321; x=1745311121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBq0ZDqkg4pbNccP0Ihn/78nmmrSJRBewKH8ih2acX8=;
        b=PZz81hLKMvkPESsdTLp3A0oAfZRt2V/yHH3yBK5mp2kvzuzsVlqRhNX52Yg7U9jtHR
         8QO7s1C/i2ytizL5n3bgpdkwLn30KQxkqhqxG/pdHJ/JOj9+UFzac7lnkGkfSwQ/eNfO
         Dv7JWBnQfQErX1TUqzoi2UZXYGQJF1neniGEsSgT05ZMw0eF/uJvLecSUarZSeo/vuko
         siCU74IRYqeDfiXhe9ve7VOfKmsjGFYLCSzdF37rY/23m3D5ABHOEgYBdMKdW5qFho6m
         WFazU3+73ljuSg5QfzjKXyXQLhWhWr7Ld4RaD+14Cfbda+P0t2S8M71/5+rknl9t65QR
         XGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706321; x=1745311121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBq0ZDqkg4pbNccP0Ihn/78nmmrSJRBewKH8ih2acX8=;
        b=GkWNg5rLmwB/s9ms9inq14bVrp1hEmKpcUq2kuMa6TxI0WLBrP1BNUCdjOYKB0zpa9
         aE/WhYhSdag2hDwKYvncWtj2aIkbQe7GMOiVdWFef3LE3vQY8gPVQTAFqRfWi+Ve6LGf
         l7X5pio9PyZNlnotIOQQVCWf3kyIMppqxtGKyO2wUNdKLXcs/nH79A6LJRQNSJ/VRfOb
         /XSieq5c4XtfRxmD2fjGCyWy9ocEuCp4lPzIr020LI+8SpZNOQkhMAVZ6mtxXjDB8/n0
         O+7fSSjYR6c68zPTc4s1PiqMhXGQgW6rC9sDaYFHC36nK/a/5klzVV1h5f7GdAJi177Z
         BDVA==
X-Forwarded-Encrypted: i=1; AJvYcCU1jFHuu5pK/pawyPMmYQDgCBwwU08zXJmhdd9IiydkS4WB65rK+ApgqrSJvZme2qR81IQJ0lubt3MX01I=@vger.kernel.org, AJvYcCUYoT6gOr9eFUcOCnuvPAFWTsJ6kk+2fStDlWD/j9RbIwL/+H/YDWd7j3lPtKeaqADUJAeZADkJiR9S@vger.kernel.org
X-Gm-Message-State: AOJu0YzqW9UsYWSm2LgWF3ymC9jz0Wq0cX6yJ4Qxgrpk6/I0y22xMEYU
	bhszFx9Kf33hPDhy8cznbstH1iC5UlBtGnHVqGdfl4ZQhXryRXx8
X-Gm-Gg: ASbGncsCG2rtez/zb3/0jdpMy+n94KXqRhT0WR4vmdVQqWKjns8EFr+cOZn2tHca4SN
	cBRQ+kbCiQ/qoUN+NGRYIkzpLEJsX90QB6dhN47QDiUbCMQRD0qRBQCAyP/0Wuyy13D9R8XEQMV
	X6if+BnTqkNYsjt/1jc2lgA+n2wJn2HDpj4UpW24wlLF4U/+ZAG6wLGgXXKFW75IvO9hvDCoOhI
	qujISIwCCqH0Qrizu/DtSEVn8lNdJFPIIjaWWKQyjf/bE0f12uvRUEi5hpxudEd9zePIrceYGkh
	++pmdw+wIJsA+dghX54f1HSptXzZIye/fodTXNawgjZnltUDcaYoocQ6/g==
X-Google-Smtp-Source: AGHT+IGqoLFL5p4zyXwCtJN828QtlDhgXwvIW4fjwGHCI9exDHrzY3rVpFJFkjYyuqYJwDHh8P5lbQ==
X-Received: by 2002:a2e:a815:0:b0:30b:f469:47ef with SMTP id 38308e7fff4ca-31049a1cdc9mr42087631fa.23.1744706321126;
        Tue, 15 Apr 2025 01:38:41 -0700 (PDT)
Received: from foxbook (adtk197.neoplus.adsl.tpnet.pl. [79.185.222.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4fabsm19136471fa.70.2025.04.15.01.38.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Apr 2025 01:38:40 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:38:36 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <20250415103836.0f748d63@foxbook>
In-Reply-To: <657969a0-08c1-431a-b459-089c6d316a0f@rowland.harvard.edu>
References: <20250406002311.2a76fc64@foxbook>
	<ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
	<20250406095008.0dbfd586@foxbook>
	<20250406175032.12b7d284@foxbook>
	<14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
	<20250407074905.2d236fb9@foxbook>
	<3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
	<20250408121817.6ae8defd@foxbook>
	<357368ff-0c49-4f22-a03d-fd9560c22dae@linux.intel.com>
	<20250409121819.64db23a0@foxbook>
	<657969a0-08c1-431a-b459-089c6d316a0f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 10:13:50 -0400, Alan Stern wrote:
> The core does not explicitly flush endpoints before resetting a
> device. However, it does notify the class drivers' pre_reset
> callback, which is supposed to unlink all the URBs used by that
> driver.  If a driver doesn't have a pre_reset callback, the core
> unbinds it from the device (which will unlink all its URBs).  _If_
> everything is working properly, there shouldn't be any outstanding
> URBs when the reset takes place.

Thank you for clarification. This doesn't look too bad and I currently
have no concrete cases of the mechanism failing to work.
 
> Either way, though, the core doesn't invoke the HCD's endpoint_reset
> or endpoint_disable callback before the reset.  If you think the core
> needs to do more, or needs to issue the callbacks in a different
> order, let me know.

The problem is a matter of mismatched expectations: the core treats
endpoint_disable() as temporary, because "classic" HCDs free their
ep->hcpriv and recreate it quietly on the next URBs submission. And
their endpoint_reset() during this time simply does nothing.

But xhci considers it more permanent, like the last thing before
drop_endpoint(). It too clears ep->hcpriv, but here hcpriv is not
the endpoint state, it's usb_device pointer saved by add_endpoint()
and required for operation. The driver drops it and it's screwed.

Moving all usb_disable_interface() calls before their corresponding
usb_hcd_alloc_bandwidth() would meet xhci expectations, but IDK if
it would work in general. As far as I see in usb_set_interface() for
example, the control request is only done after successful bandwidth
allocation and the interface swap only after a successful request.

My patch addresses the problem from xhci side, by adapting to core
expectations. As far as I see, only xhci_endpoint_reset() is broken
by this add_endpoint() -> endpoint_disable() sequence, so I fix it
by removing the dependence on ep->hcpriv. Alternatively, we could
stop clearing ep->hcpriv, but I'm not sure if it's reliable. No HCD
depends on ep->hcpriv being preserved after endpoint_disable().

I will do a v2 because Mathias expressed interest in this patch for
cleanup's sake alone, but the kernel test robot found build issues.

Regards,
Michal
