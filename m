Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298542030A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947706; cv=none; b=cMQxc9PBUIBfVwlLe5IOd70dwJ3t03UV0jxBBdrDxUao/j5G53x1iE/wrD/fgqvs8mukU6X3hSl/wR1aFmlx0KbBj5nK98qjF1wAjjjpbMv6m9J7ePRR1pOfHGZ7VYtxOQPTvtRIjNNGbg+p7UErSWNXRKHR4u0bdheUsicMJm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947706; c=relaxed/simple;
	bh=reV/ulWDy/DyKi16GnhylTtbQP8Y5ucGrxZS5Mf5TNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5T360GbHEcH5ag0+3WyUlAAfSrBW1+4NNGkuKvAWd42UkbJFotwHVDPgLeNfUeTHkghKp8EEhuHoMM9+PnzJoyPvlyAd7y505DTM7XcoMXcpJgTGFF7rIdk2e8lKBdNQbwaPouQ3wo8SnsdiX3qGRFRdQ01zS5Kj9PC8ytCaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6qdCCJg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6qdCCJg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso213639f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747947703; x=1748552503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmxc7U9F+cJBQeI0dpr3Y24qRTDz7dLHdvIIP9zXYhQ=;
        b=J6qdCCJgebw2Spvo//TYkyvvjfJpg5N4B3hl/4AxgX1sxdJlr99TIm2+RxyduCIhY1
         WRO1bp+Ohseu7M9+7ZSotkD1J+VbL/A3T/+U8f3n8d1yNvPbwgAxwsFQtYgmIhYy7Cfp
         hxGeKWYvqtmqmBU2gzZaocNzS6LhTDQDkizu+9E7cq24mi0Vi/0L+z+T/hy8vfCo93Qk
         Zj8k58VUOulExxeYrQgEZzeY4Fm8LkASNZGkCGzEnbvYG9sSurtyBui4lm26Hxz/I1tP
         zeprQhv5gra6ziTL+GtM0tOc1183+lDZ407gWY0RNuWzd7HTXyDuqVWDVpBx+am0rm3/
         nnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947703; x=1748552503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmxc7U9F+cJBQeI0dpr3Y24qRTDz7dLHdvIIP9zXYhQ=;
        b=E66s1qReJBSfN5qVoXyKZCViCkSI80v/FAfoCXL2cjRWdPT/97DW6w8nmMHGuhaTeF
         E3BZsAiuQtDPfl4VWNknktRkICnENHcjO9JJU3yaz6FxfpHTTho7QsNYy8vsSgHawBNU
         N+q1emWy1NHttdrtgoLgwKXu/YdthDXrAjujZ+pMTSCRnD1/R1ZgmtwJ4RbzFbVrTvEk
         Fn2QO+6nuNDQAE1trcpSRahn+/7r58oOv3wnrQ+ZwJ8lB62FlM8z48O4/qRB0/PvVyUF
         NI0fvYS/ekS2rKEm6PyIx7M2qju34G+uKXWrClFbUFiUy5FhOcn3RxfRlWc57/Q+oIGN
         y2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVxDUfp3AvAChzyH421ofn9mTrzd7xZiy/0scfl6j0LezMtZ1/KLDSXosjXUaqjVRfYL1/ZBAcUYRvpHyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFC1WOQ6nINxfrE+O97onk0EGYNzIwxnaDAIbxkCj7KInIYfpI
	A5QrUgcAl9PQoeGvSTVUGGzQcufmK3/9IzuJGeFlbDD/798DHGOskNum
X-Gm-Gg: ASbGncsmHerCBcHpBvQgLc09ctl+fqFM+o6tW4A/5xfESxA/vLZ9IGCtWL06cgJY9s4
	N/mE4t2GvcseD4v4houIfD9wFfpWMR3XtW3Qx1TRWxiuiytWrla6J2xWhv0gxK8riFaSLVG4rIP
	k4JIrVCL+/KfKaHO1CJM2J714SzCeS2NuQd70rUkZdJz3vB7gRYxDukXdEdPfWVVFvyG1ELZWFe
	PBbRCSRy0s4ZHtq1My0tX0a5qY/SBVWr2LBuFLdFUr2Ri1yRD0NY8geplV8TFbX3JErzKiVlJNZ
	Pg/aYPNQpxzKa3niyKmixSIBRy28pUaAwonfkewlUgyS6cqV4phBZIeevXktEa3Q4tOaaz1Ne13
	jr6RhLHAMi1FRVg==
X-Google-Smtp-Source: AGHT+IHhoc6sQQhiDhlb/+WdGuYRV6eXFMEZBOxUMBvidadVFjtrBjtXAXReeAeyl2MwCIcNSCMzCQ==
X-Received: by 2002:a05:6000:2509:b0:3a3:5c12:f218 with SMTP id ffacd0b85a97d-3a4c1512fa5mr927741f8f.13.1747947703307;
        Thu, 22 May 2025 14:01:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88941sm24666809f8f.61.2025.05.22.14.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:01:43 -0700 (PDT)
Date: Thu, 22 May 2025 22:01:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <20250522220142.14876993@pumpkin>
In-Reply-To: <2025052121-drastic-hacker-aab6@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
	<aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
	<2025052000-widen-lip-350b@gregkh>
	<aCz9jlMcXDooqx0s@kekkonen.localdomain>
	<2025052138-carport-applaud-61b8@gregkh>
	<2025052121-drastic-hacker-aab6@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2025 15:31:36 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, May 21, 2025 at 03:27:19PM +0200, Greg Kroah-Hartman wrote:
...
> I tried it for the whole tree, and ugh, there are some real "errors" in
> there.  The nfs inode handling logic is crazy, passing in a const
> pointer and then setting fields in it.  So this will be some real work
> to unwind and fix in some places.

Perhaps change the really dodgy ones to container_of_deconst().
And fix the easy ones so they compile with the 'const' check.

Then most code will just contain container_of() and be fine and
not need churning.

So you'd have container_of_deconst() which is the old container_of() code
and contain_of_const() that preserves constness.
Then container_of() which is compile time selectable (for now) between them.
Get one of the build bots to enable it and things will slowly get fixed.

	David
