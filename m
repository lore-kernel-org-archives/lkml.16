Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E396270838
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719366; cv=none; b=euFl6olB3fH2NBQKd8dXgraWyklw/eNHh79xMfsQxwYL5P9EiTUUJdpAVTnlnLoJ/wf4jqFKA0dUGdfkQFwUzEIRfaKEVb9O7Mn8ESZG0v/B4XcyWZPgBJJZhJ6S4NkIYrG8rwEjhoPo8azbwKL0oaZsuG9+340QOYcm2kpbQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719366; c=relaxed/simple;
	bh=gO+eL83KdifAzJPi0HCo9DgdX1PW4Hs4m00dnR5SKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jcz1hbh+yq1pHLgSOcl2/nMUZAW4o3dGLRZG6CFhyZdj3t8RiNHsMk0nfkPiXbm5R4PHPis5rN9ENrEwQnhvfaPDEm6fvpVdom5vlyvQqyBL6GKzb/AM5omI4eJ2clbYfDvaXYtHip1cPGlasMh1MFYT4L4gwxSi6Fgm0+3nGe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK1qWRxx; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK1qWRxx"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735a8be4ea9so1260284a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750719362; x=1751324162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCYGlmL5zX2bvvlJbBCCxMvXekeyhiCldD5Z4r6oMog=;
        b=fK1qWRxxFk8KoA9+HYzWPLHkjFtZFRBra9lBnYbWdMaj4sWY7PO4Yv4XgdxADr06iv
         15RJv35vb9BlFUgT4Avxvj+Lt7HmEIUuzmY0anbU1z4TiVNB1kUstDgjR0iqF7EiGtPG
         GaXPnKS+58dBGti5EI1tDKWNGYQNSaVcVx3NSZEXtaCrrL1hnZAuMJPmKhnSVd4jSRPZ
         cDW8AtlLCS4QWUBy1LPBlDMEjvean8CV9/2ajPpaZIoWD9///VCoRytUTg55SaiIwytA
         Y0vQb/nia6kOlXTKXSgwxC8/QbXSi++g9Moi0oJjrpQlCPBXXC8FSDNUdiDmCIXjiJKL
         73AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719362; x=1751324162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCYGlmL5zX2bvvlJbBCCxMvXekeyhiCldD5Z4r6oMog=;
        b=BIcjLCJyNpN/KmSEwlRY0GVIb6Oi+JJelwWOnC+kl5upaiHx2amvK7YTsgEiXm15xh
         MKrZcb6eJ46gDaNoaSvk2U3PBxzSYvEn+QkOvm9Kg6DAcgoVI62ByOUpHkiPTlynOtwT
         mTblmYXWkTrGsgrG4SBMvLREWf9TM9GvY2sPm3Qn362Cg3WkXNdJ5F8Tn3mJvkkOAgID
         XBQX3lQfaOxB9Xxinia/zmXZA0eo2u293LdOP4AVHk1OK+qxXN8s8c6lYskCs9eOzTc6
         MSnKhNuWLXdvI+6urt3ZIpL022aJP6spCpCxNlmoyXeVMlGFcZOqajWD78u3BmqH3Pdp
         iI0A==
X-Forwarded-Encrypted: i=1; AJvYcCV2yN+j5sue5L1pYou6SOSWS0qmDVbrQb5UqZn1tR3A9kv0t+xvc70bg3qmCOVGii6JnfWejmURlx1Ffw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy0QMFCVvN/qxlS9cLVjgU9jBfR+9fRwj6V6MItRkAJEPvbJRj
	lseDe/ciRvIbb0SwvfJVHwUIHNAlfvq917G5sJX7e9aAFpYoREXEhyscAhH2I8n4FXg=
X-Gm-Gg: ASbGnctsTp++n2FKC9XjbDIcV17Dd7FGdaPYfA4lF0XQD8fGPmB+yv/vLf/k/ha3cQi
	6weZDBiQnUPfUXOzlwh/VhNDzMDbM5xkodoE10c8z6NP2WGKjaml/hNS5Mze5Z7vJgA/v747u44
	DlPXjXePu3j1zaOvmzxL8aEU2c7mSL5OW8fx5xCwwYWUDxnf509auTvX3tIVmZhw0HWBCzWBssU
	g4sX2HIH67WzflEXwTYCuR2lzCzWq0YxmCYqMo+Xit3Ib086vmxs3h7N0d+hTDHmaOmPrNQgKUL
	IrPr0s0vSeo3RWSf8Kped0nRr6Tlw8qy2/grdv/kYJdpYMB2aX0NMEcNQ8TQUR57Gy7fcw==
X-Google-Smtp-Source: AGHT+IH2qJp3cfXp8vqsQfiwtJzTBVtR00oSUzJTlWLB1sUQjr8uuhV9Ojft3NeNTOmhlhWt7+2srA==
X-Received: by 2002:a05:6830:8104:b0:727:3664:ca3a with SMTP id 46e09a7af769-73a91870a2cmr8528739a34.0.1750719361986;
        Mon, 23 Jun 2025 15:56:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm1612798a34.0.2025.06.23.15.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:56:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:55:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: gpib: fix unset padding field copy back
 to userspace
Message-ID: <30c88178-173e-4432-ab2f-beb26ab9d0b7@suswa.mountain>
References: <20250623220958.280424-1-colin.i.king@gmail.com>
 <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>

On Tue, Jun 24, 2025 at 01:25:14AM +0300, Dan Carpenter wrote:
> On Mon, Jun 23, 2025 at 11:09:58PM +0100, Colin Ian King wrote:
> > The introduction of a padding field in the gpib_board_info_ioctl is
> > showing up as initialized data on the stack frame being copyied back
> > to userspace in function board_info_ioctl. The simplest fix is to
> > initialize the entire struct to zero to ensure all unassigned padding
> > fields are zero'd before being copied back to userspace.
> > 
> > Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> 
> The fix is good, but the bug has been there since the driver was
> introduced, it's only just now that the static checkers have started
> catching it.  Oddly/sadly Smatch doesn't catch this one.  I'll have to
> investigate.
> 
> Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
> 
> regards,
> dan carpenter

Fixed.

We should still print a warning about empty bits after a bitfield.
I bet fixing that will find a dozen bugs at least...

regards,
dan carpenter

--- >8 ---
[PATCH] rosenberg: warn about uninitialized bitfields

You could have a bitfield where not all the bits are set.  Warn about
that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 check_rosenberg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/check_rosenberg.c b/check_rosenberg.c
index 22df8a3e5b64..80e15f2cf5ec 100644
--- a/check_rosenberg.c
+++ b/check_rosenberg.c
@@ -221,8 +221,12 @@ static int member_uninitialized(char *name, struct symbol *outer, struct symbol
 	struct symbol *base;
 	struct sm_state *sm;
 
+	if (!member->ident)
+		return FALSE;
 	base = get_base_type(member);
-	if (!base || base->type != SYM_BASETYPE || !member->ident)
+	if (!base)
+		return FALSE;
+	if (base->type != SYM_BASETYPE && base->type != SYM_BITFIELD)
 		return FALSE;
 
 	if (pointer)
-- 
2.47.2

