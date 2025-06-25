Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8F1DDC04
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852256; cv=none; b=YaGcXau+nggs/Jn8u8hXs/HKNssjdXjzDd/fH9mDx1A4fuISpaacL7O3eJQ37I5MhbBYP+VNSH4vydnKA9OwOLIyKpoqpt0nsqMz9xE1Af2tiGbshphOp1vFiG9gVMmjGEtONFwG2YOUHN4xd21LgGBRZ97QywR4DDMiH7VRjgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852256; c=relaxed/simple;
	bh=ccKVrwIbREFXa4j7XcS1J1dbdZcxku7g36ksBtNIWss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WinLi3teWSN1io2pq+wHGk0u8JxD0kvIW/aNadoxRX9/EHBnRZkIkI85KnZb63LtQUxKHf18B7fEQhjBUMgo0IQrm4SzvDvlnX3QXb5GjCc/EKHAkJcJcWcMNMqD9uXKuvL544qTk8dVp3uPIiAW7mrusZm9cmuNCwm2kAIGcG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcZ6Rw2i; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcZ6Rw2i"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73a5c1d9d93so5914102a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750852253; x=1751457053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoutNGAerTcoF/aenrsm72CtVJG212QTVx4YhnzRYkQ=;
        b=YcZ6Rw2iiUo0d/sP97IM92RZq4tDAZiQyKcL8QUOQfWN7APNa5yFR6WgvYJpTcRO/k
         S5C8mFIwpiY9hGlsnCX8IpoXA4E+hwJDQ9ZnBjQJJpbDKW8aSXY2Jr7ugztdh3/9r3U2
         SVaMIUAhZ/js61l9kg+xl1qSUPgJM/l9oW1qnQdwNbSEPbbHsg5jlxkzO9sV1K0F9qEf
         zj1qp97U5caV+Vuw4Gk/FJcPXggzduj/RcbBX6K5QBdKR5dIC88zCA+UPqH/QD/lsrnd
         PQOu6DqlA7U0ws6s7gwEpzFkbvWcXRdwvgMFtNIo7qoffzeyXXyZGepLQuh/BHqFFpbr
         s9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852253; x=1751457053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoutNGAerTcoF/aenrsm72CtVJG212QTVx4YhnzRYkQ=;
        b=KmfD2dKTrJYnjNylOagzU2HN5QrCFLBJyGmu1I4x7Wq+l7oWJq9wD3XtP4ZykVpQt5
         H5KgHIMf/dU+Zvg7gRIwpJ3wK7fRyimmGD2QEaegRTxQdJ+21x6DEDHWhXo93cx+sCHl
         ozoDrkE263D8lKUNFfM8n6oRRe0AYYViL75BclpRWtUWdvhgMYRFouiPpbXQa9fGhFgo
         D4xZkMNRnfldabX43kgGvhhx2a/MsVtOEFONnzzsajnGeiAH8zxkR0HOVmWJfRpMqJKC
         XwJkNIV17qiyNAosS60dTx3ZnhkmbFnG+vDQZYipFil3hVUWmiNi9psK9q8dOHIrmyzT
         uOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEFVJZrHsb24EvsHC1ACe06Qo8bv4YMfIaB50SmbGiLAkZEuqAGEidK5E0AlbvPMlQFLlZjfux9AO0AbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RWUfyf7NsUcsNgElgkoZSoKsOiiavg4/zpQ3E3uaaFxorb+m
	3xKInRui3kXu1lfiQEiX+MhpNCXfv/nQrUG5221egx1rwYQpi/NJ9CBm6vj+zIkTTiY=
X-Gm-Gg: ASbGncvoXUC0NYNXpQ4tX9GKYGOh3qKkcdnH9L6smEhZYRY4Dp02q9a+XxTpHZkarNv
	+Wa6FskC7dSkb2A8fEmihpjLWYc0Mb86PwoqcT4Ao5txatvlH6+kcooEY1hr6Bm70Z5C9vxUoYK
	1J8wWyR/BBw2CTJ/tToKsxcfTd5tWXryvEjXtINs3B98FA7qXnDPl/oR6w+PGkV5FGH23egnFoB
	O22ea99z6Wqet9aMPqylS1LYSnLvnmn5DOSzrXNSlyXCK7X2EXqOj22OfpmaJ6eRY5DryDYWly4
	wp29MmHfp06h02+9igmt6Hs8dHDVVHjKCIi134O/PZk0iXFxG3TNFGoJit4vuE2qdmud0S4SSUI
	v1wG8
X-Google-Smtp-Source: AGHT+IHhifNSUvdslHEt+i0G2mhKHrYMYK7cb4RljD3ks4W3/ayaA/WwVBmac+YjncuYOBkqkdy7sg==
X-Received: by 2002:a05:6871:2104:b0:29e:4ba5:4ddc with SMTP id 586e51a60fabf-2efb27645a8mr1809349fac.24.1750852253475;
        Wed, 25 Jun 2025 04:50:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efbd439555sm185735fac.25.2025.06.25.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:50:52 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:50:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ACPI: APEI: EINJ: Fix check and iounmap of
 uninitialized pointer p
Message-ID: <ba07c097-80e2-45e2-b579-fe270c04fabc@suswa.mountain>
References: <20250624202937.523013-1-colin.i.king@gmail.com>
 <31b6548f-8ff7-4bc5-8a2c-78a5a9d5eb40@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b6548f-8ff7-4bc5-8a2c-78a5a9d5eb40@suswa.mountain>

On Wed, Jun 25, 2025 at 12:31:10AM +0300, Dan Carpenter wrote:
> On Tue, Jun 24, 2025 at 09:29:37PM +0100, Colin Ian King wrote:
> > In the case where a request_mem_region call fails and pointer r is null
> > the error exit path via label 'out' will check for a non-null pointer
> > p and try to iounmap it. However, pointer p has not been assigned a
> > value at this point, so it may potentially contain any garbage value.
> > Fix this by ensuring pointer p is initialized to NULL.
> > 
> > Fixes: 1a35c88302a3 ("ACPI: APEI: EINJ: Fix kernel test sparse warnings")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> 
> Good catch.  Apparently this isn't in my allyesconfig.  It's weird the
> zero day bot didn't catch this either.

Never mind.  This is definitely in my allyesconfig.

regards,
dan carpenter

