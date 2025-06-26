Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358E28CF56
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944288; cv=none; b=pQrCKPLZVLYxU7L1GnTjYRZmzUiVyJCTN2VFXIdPkhZf7ALfXY848BN/wqmUOLa47/4q5+hUAhjzgFXkMh9svPn4NyiPL3HA6mCRvfVMsckwZQqrwDlDSh/MsY6DWesOqOE7LlRGXh5XZV4w+LGow1clCP0QQr2COKmaisDV5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944288; c=relaxed/simple;
	bh=10uMTxglxknsiw2t3ZQh4FroAAiQNW+3m4lfHYqa4NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzIJ9dRNtfA5RaDYayOokIKNxU124+C+K2/swKiLk9P9bPdaoxP5MHQPhGgJtvJ2ZErlTvYvGDJ83T7mzaqjCPHgbJ0gLATVBX2j7aGnPr83rg/Zq1UVhWzmaA0oqO7/k+K/nKFCtja+Gw9RWT6U4VBluE6bSvuaN6cwOwndyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4zMmK/P; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4zMmK/P"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ea58f008e9so875969fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750944285; x=1751549085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZlXkSD04zlKolE5r+OxRCc3dIBq/n6l6fhQYaRGqmU=;
        b=K4zMmK/PpZJ4azhGeAaQBhjgVEqJqamRoMRpcyeRytdXTenaRYYzv3MYjqNjcr9AkG
         NRY9t97mD2jozLp+7XfaliZhhNdEvrA+zncMd/AM/6SrUrUIuJLS00ttSIa08WUv2wLE
         FbdXpDWZ+g4qdLQtoYmot1LKdMCbG2raltHnUnfQ9cEPSFA9m3+CXLdGdq5pCj5k6BsV
         qr9u2//c4d0CtnnmI5ZQnCNMdkXj/ZDoHuHbGyxPxTnvHFI6u77a/0kTk9I90C49Ok1X
         v3ZmzulW/dpXsYoOlI87JX7J7mfT23QqxYjdxJPyfxhYi9go1YIjg+sn03Z2TIUd3XJf
         AWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944285; x=1751549085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZlXkSD04zlKolE5r+OxRCc3dIBq/n6l6fhQYaRGqmU=;
        b=PbIZXOilVvNDS+Xc1q9+4o8fLTM4jJaz7DRwC2AEbTMcdSY9c02RXmJd0xYTpydPJ7
         n+UBhPvvhQ2+USln4FiagVCNwmA2SqxTY4oTJI0jNQBqrK1Yfx7LbpwQYI0YV3tLFIct
         Mjo0crdrMbpvufwpGX7cqrcuz91kesK6exSINM3q/eN1gE3um9+IxGK2QpiFpIepFPS7
         SIDeCJFIsrpq04doVAeTSnBvVfRFboifLFZjv8NvJyIiSjupWrtCmwk5IL673PhC7wuN
         5fRvASF2vftcOm05tyERtrXOtozmHjHnYo/cEMVBiws6RHV0wkkow5m9ZaIqmpkT5azQ
         M+EA==
X-Forwarded-Encrypted: i=1; AJvYcCXMJXTKaRFyvwJHODPGHK60j6lSFz/CDdeRp3Py6ugEHZnZMmw+2paW2oOA17lS4MkmNkFjzkHCcfSnLnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbdoG6fk2OKSaRFJK0LKNeMXCD0QbLWBZzFOppFFcnWLgiHdlj
	jlSfp4nyfVApL1l+XDjSqOKdh+zxXLXMtb+P2udJpxm1WYnD6hYPtX1T0xcoy2mINbA=
X-Gm-Gg: ASbGncvngC7EJovKosZ6l3DMIAl+0mHjwAlvopQ2pxwUJNqhRZFNULHqiwxJ1yfFUx8
	UqLrSs7oM8sdR0QS5baTyXZQ6xtnRqK+rg3nTq+dg16RRS90NzSbbRkue4kUKG8uu62VsbLRM2D
	EpiibmsUqbD3SR0BrlDFvMVSGBWVOOl8QUIrCwSL0IcQgV113jFfJlkeCvUMXrjUPJkRsHCbsuM
	79g1K/WxlO2Zcp4RBLxM+hsbnTHmuEI0PLx+qYNSsFal3QZ9DdF5Q6W1YbEQx2v/CYf2kmA/JHE
	c1lWFk04zMq1XlHrQ+g8+aftUdhnL/hdlr3Rafc0fMTltovKPx9we5H1btF7kd+H//4=
X-Google-Smtp-Source: AGHT+IGHmrXQmGgiM1O4FMJI4ioJnomDeQhk1q4uAMvdGJQNa+bA3kRfvZeSRk6fLbxwCVrLnDbVRA==
X-Received: by 2002:a05:6870:898e:b0:2e9:11c9:1093 with SMTP id 586e51a60fabf-2efb27ce26dmr4871522fac.31.1750944285390;
        Thu, 26 Jun 2025 06:24:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90c92150sm2575206a34.39.2025.06.26.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:24:44 -0700 (PDT)
Date: Thu, 26 Jun 2025 16:24:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] fs/proc/vmcore: a few cleanups for
 vmcore_add_device_dump
Message-ID: <e891bba8-9f67-47c6-8f84-a62abe35f837@suswa.mountain>
References: <20250626105440.1053139-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626105440.1053139-1-suhui@nfschina.com>

On Thu, Jun 26, 2025 at 06:54:41PM +0800, Su Hui wrote:
> There are two cleanups for vmcore_add_device_dump(). Return -ENOMEM
> directly rather than goto the label to simplify the code. Using
> scoped_guard() to simplify the lock/unlock code.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

