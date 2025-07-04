Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42C28A41C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618483; cv=none; b=K5RmXdj4XajGBoA9mzqtNRwov7Nre3b80Re8SNYCRuC3UnjQMHd8G4di3QquQ5KNWh8k04MUusMkRbC59dLSHNF6YIswft7bPfQCAYwltTS5WIBnrUSU47mfhbTCmq8H+MYaXhOW+k8nKKM6BN136Mgi/SAZGaLCzj3nDLMLBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618483; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia9k8fCf/PI4mgdICxOlXaWiWIizX3ZKq6E72UGuT3clANXJUziC7IdoeOO8NdzTpHLlaVEP1NKcUPNRw7puCrc3MMnFMARuxG87iHmPflkXZmRp9RbW/LekO95OXCyXgEvBnAhXQ+k2DURAFDzcetJA42HbGlq8Y19hgIt5p7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iW9lnZtw; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iW9lnZtw"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso7413401fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618477; x=1752223277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=iW9lnZtwbzGhGmL6SK9Hwys4mO0RiShoGm7jSVjmc8/RygwBrfE7D+/cQ0ZUJqyo6W
         zLy25VY3nMnMT0hRksNaIEVv1I9SDshz+aIER2GUdHUHUBGmFxSbmSHnf+awm/ubCVz0
         60JNz/5srraSEaZ+AZNf/9CJ14z7oEAX1eJhg2RgEqhVCjsAkg8hL1EzXi0ioTjLwXQ8
         buTNc+3OqibXfPx5A5Q/ltfDnWypL6n+4DMHkPhLlWfegtPPcQvnw/1+v3rFv8nlCsEU
         lkR+dg/XYOm8S0N3XtH+ouSmoxB3IV5UC9M80Ru9B0NioJnv9lAWAN9Ui8yKdh99jXLS
         xQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618477; x=1752223277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=MUsu/cOoKxKelmvWjx/4n6xsW8PW45EIQ8/VC36Xw2gj9xSOUZB8u6HABjDX+EHig9
         dzlLgOWUOYtFi6nTdEcl0XsXHtS/gvQImlez0QrJRx+F8c5sEQ5GcvJxnq10CLzMABD4
         gu6PAEQWAL1iYmQsgaIfQqqJ2ChrzxVnoj2atKYo436TMDl8WPEBUlKA4miz2vneZ/js
         8Fbv+aA0Tmwr5rqgw9t7gXrNTnz4WIHbcJV+BZo7xtHbNHEjiSMhS/Q1eisaHQzOepaa
         5ZbhJGcWJGSkIcs7gO5sl0o8dkWh8VgSaY0lUE5u2HqXJtfG65FBWgur8V1coHLLyphp
         BEAg==
X-Forwarded-Encrypted: i=1; AJvYcCVIKIsDta9bGpd31YoYOWl3xQe6g+OEWlubYJb0mBbrIwUG1ueoWEmiSA/29c9UIob8HWgCMBw5JtudMKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+XCf3xhKd627sjQQCWb95feAJZJf3k3ouXa950SlSPsreSxLh
	+W/yBaG9ODqNFZjSB0Fv4aWdtmjV4+RlwxqaAbqoSHfyHyHHIS1f4pSYG0EXeaTF73Eb6f+0aTz
	4brykQGmv7URqMFq/Tc/YBjwx43T6YCmBT7aWHVHq3g==
X-Gm-Gg: ASbGncsWm4LZjGJVCdkqpEou0A+b7giLu3aAdye2bdNL5uqH2ExP/242jwEuJQU24sn
	IxtEb9Ok/Bhze7BlN4DaB8ZPX9jZN9YmDDOHe0qmwGWI7GLMXyhGM4Opf8cxyBgqz4evvOBoxuL
	GCrRggiiHNC1usqH1sIs8U6NW8Cdn7UGO19S0lDerZgrA=
X-Google-Smtp-Source: AGHT+IEjkMzfSLOYZgYGu/gC0rhugH3gtKCbGLeh9K4QRq1fR9qFAffWdxMFTkqp/Cs4KgSwpWDdcpA+BKTigHt31n0=
X-Received: by 2002:a05:651c:410e:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-32e5f61b6d5mr3915861fa.32.1751618477177; Fri, 04 Jul 2025
 01:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075405.3217535-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075405.3217535-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:41:06 +0200
X-Gm-Features: Ac12FXwSUe6_z6ImTsHNK6iIJFxrmJR6h51CXwInuWFdU4SXV4TvNlJsJxqlUJg
Message-ID: <CACRpkdZQGFEXU8iYreW1XHC6jbPB0v4JrqKAe5JDrOmD63hjgw@mail.gmail.com>
Subject: Re: [PATCH 12/80] dmaengine: ste_dma40: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
