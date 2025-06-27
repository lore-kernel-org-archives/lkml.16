Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B5E12E5D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045722; cv=none; b=rjuc1EL7kRfJgG9phkK7DBTdN2zGy8XP6uCeP8ZecpGksCGpSbkb7dnX4705k/ufj0xnyKi+ChAw8LkwPCzZ8oc7YbOKmB+cn4UkUHYXw5K0g4t4/IlunWuyfRZUscmFI7f8KY1F50vjmks5LsaAHglVjIICzwDnSvAAGIwl52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045722; c=relaxed/simple;
	bh=OOACCwPSww+nakVoXLJXnwuALHZbONvPwuZkfSXf220=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCrtcOnHtrBcQI7ei0lpH2x1VqQUU6yrEvIxTl9mP56hQMpJBhY7cXBXTaMmlBfnIK5mEPf7Ggqw/mLnFKqfGzWKNgr5COgpw6NfBWXGZa2aZEDyOo+icNE5E/T0C1etV3Kv1KpN29wE0midE/KUEIIhAGGT9iU+A+scfBVsLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3uPGaRI; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3uPGaRI"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-40ab5bd9088so1576701b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751045720; x=1751650520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kg2kWtBf4IBcW3c+iSCFB6Ml1Oao6RTyx5C3qf0IPM=;
        b=p3uPGaRIMXYhrRIv88zO6ViYQXKC6e52PuEQSBp+fH+F4pH8Bu9MNnpWu49w9Uz0sa
         0FenFSZ2hvuAp1znoPzEFAW+1jv4YuFVnegDb6MuImVwVmn1xev9U/sMbfOXyuKnwEJI
         /de7iQY+dg1CyRRQ9h70O3sptJUBJiP2LxQezcIVVNKM1DokGhdPGISpBga/eXtH/3yo
         ayBCT5MOBnS1mQb9twI/7+qUv7k9NXV+cRxg1jyNRbmD6iOxL2Z/9oYftP0RoT7rVfrY
         etCnh9dVPVQjAhLj3G3AjHIq4ON5C3SuW57h4Re2LE8HTOZ82STPNmd88KDCxxj/g7TE
         Jsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751045720; x=1751650520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kg2kWtBf4IBcW3c+iSCFB6Ml1Oao6RTyx5C3qf0IPM=;
        b=iFS68mbjneDO+6FXrKNd90Ku1gP0sQlrWJSm/IsK8G4Zf/Og8/3r6j+wq0KMowp1yO
         cDgaIXcs2Dk0JrrnXCzT8+53cRgOX8kAArRXL5F9vR2zeu/wHOgGpYaYWetfCWdsFVQ4
         8jxsp6s92QYESaBCa8QmOgrGpcNMmwhkgok4nzW451tj4dksrxsZ1fDDW85bLxBcNHWX
         Z9zr07d2vm9sIqfnuNSH8FjQ5orN9Z43gZSrpNQbsN9jGq6uCM6MEOH3W1hGdOWV9VPU
         p/WSAImkAv3OcFYsZHeg/NcyFknyrUlHmE1KrBfwe9kJZhKwFEeMGFJ1g8cJ7Fd0rN+D
         RNYg==
X-Forwarded-Encrypted: i=1; AJvYcCVbieNHspXZQVYI8v9tbP15dF8clC4AaTOPUVfmHptZ/0IyaLur7ilLAx+F2VPc7T59LEr1Wz3due7Ve7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqcfqYD+4VMqeSUynDUTrhZaweZAqvXEjxidwr0rRw/wEXNIju
	T/dGU6m3e8pW9YBcGYbdatTHm8xuz/vUR7rVNsAd43CKbsZuR2LfurxzRZhw2LU1L/Y=
X-Gm-Gg: ASbGncu30G2sQJN1JingK/725oh/ONl40FPRTNBa7S35/BJifTSmHHNT3TsKd0yNNRW
	l+P1tiyAwFRXDKIMflF5j9RCiqQmHE+4+cI9DmOzkDbWP+lct33kCKlRKk7be3QHM5PfhNipymg
	KxKwdNSAq2Hmdb8LgINI4IoatZ/zgBZULn3HwmDbaW7YBQybg0clxj+PJNmE3N6fs7qa1VRr2yy
	JXD4ww1H2HVujrsG7F2LRKfpbNOaL9RlLtiluaGbB1Cm7fn1FN/3QqsgkD0KyuOcKJ9/pYnLxBd
	0se6US2ylBhQCDxFnoWgpqIHW9WvVQP7Fh2v2/CC1YEnFRB4Jcnw10rQGBttL8cMktb2sA==
X-Google-Smtp-Source: AGHT+IFf5eWy1kO/K6jVYD16XsJwEx0QOq1FyauR/umecLHRc0ZN+z3ZkHsKlonhP8bD8EpUmoiswg==
X-Received: by 2002:a05:6808:2f11:b0:403:56f4:8780 with SMTP id 5614622812f47-40b33d7a583mr3749189b6e.9.1751045719766;
        Fri, 27 Jun 2025 10:35:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3240548csm429800b6e.28.2025.06.27.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 10:35:19 -0700 (PDT)
Date: Fri, 27 Jun 2025 20:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manish Kumar <manish1588@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode[] a read-only pointer
 array
Message-ID: <c8f5f917-8412-408d-9dd9-6635af8825a7@suswa.mountain>
References: <20250627173120.7639-1-manish1588@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627173120.7639-1-manish1588@gmail.com>

On Fri, Jun 27, 2025 at 11:01:20PM +0530, Manish Kumar wrote:
> This fixes a checkpatch warning by changing the declaration of g_fbmode[]
> from 'static const char *' to 'static const char * const', making both the
> string contents and the array elements read-only.
> 
> Signed-off-by: Manish Kumar <manish1588@gmail.com>

This breaks the build.  Now we can't change the pointer to anythine else
except NULL.

regards,
dan carpenter

