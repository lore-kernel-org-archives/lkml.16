Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3184225C6F1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331832; cv=none; b=liiEDsvAPyQYKngP+harLz9AtYGJK+i+uh5uV4QE01RFBqSwOFPQwPyn+AlL5o+QREmv9X39HcCmAHwRgfwWwJS91bDSCcHCVrkF9in1vLiu7T5SuGXewtAo1dYLYOFbcoPX6YkJu/qmmC/qy8vyLleIsZllZ7epTJEg4180BIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331832; c=relaxed/simple;
	bh=9BcbDc+wMcjBAP8s9znmdve14URMaxqqhbuS6bJ9rzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE0Lmq6zwGqa/QkyW1LYVFlHLi8fUs1SanuiIn0c1imyVAka3upUiTij33fpX31BpbMEH8UMzznWxug6E8eSphA+JNt9G51tRP6IAmgsoSmGNVKsSjQZqdTHZSByYmM06QIpWwmXMC8XX5Vjh5ZZM1YWc8/xU5jj1wPfx54wNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8JVAlZW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8JVAlZW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1058675a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747331830; x=1747936630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPjC+F7Z8nPKiSwHWeFJrWQCprMTfRI349pBIPdGTYU=;
        b=w8JVAlZWn+GI5KIssYxEaRJirnUDINL0vltTUDhgsNWpxQhdFL4xtOD1yw26upDER2
         d14yJ3WPgBr0CbtEVHi6zX3uN64DygU35BOBbf7Kp/sGfGlRqE+LBRoTUsFgjwDT2Up5
         gAkZVCOAjtcEnTpOMFjRVt+OFdkfc/3LFC4f+/nfxaiQOxUZcg6cgf/knc0z+y8bnNFw
         SwWq6z2pNiCW+qFEFJqNHaB1M7GYTQFLJP0v9L6uzQ1sNn0aizvIqBGTFO4JO63Z7Ihz
         zIM7BpjV1Ngz1nrWs22NPapY1Z3UOZpPBBJ0uuYKot0yQ7rj4a+TfjTalvh5+/BF8k33
         aQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331830; x=1747936630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPjC+F7Z8nPKiSwHWeFJrWQCprMTfRI349pBIPdGTYU=;
        b=XtFa9e5gBUBWaZWmiKn2EQemovVTZqVsBA9tQcDzQUw39I/5JD93w9y1RYCk3IzGA2
         8rl4fYYLYkKiHP6BrAf62BMT3YiM3fE0HHCtIHY96UnI9r2LWuF/OXs1WBEHwdsDtFAB
         B56pSulxN83MEYGsoxpfyPn1m1we/MhQk4dzw2g/2q5K2Zwe7L0aKX0OEGBPK4qr2gr8
         AnF3arfosql86TIDONxYDW1+0wE1UhFL/zGWg9tnsw5szGbbNe21CykjSYvOFQBjTZKs
         xipmpjiRvII9nwDk6BKRLtdIDIhESHoYWE5+IfCAy+H4QzPZ70UZryfxe11a0DIYeKZ0
         koCg==
X-Forwarded-Encrypted: i=1; AJvYcCWa7sJYuHleXXPxKctj5llkmBKrIXynnIwIyNSLpbugqKC5lgqbLft3/u+kmUmnMJOtEYi6qE3GDUSuqo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9N9keEEFMBkFpBpeg/EqoVZOOaZN7BZbORX8ItK9dF+KdfDH
	rbvK9JM7FtBBFXlnLJtpp6dOH0YgB1TzjEP/jBSZEVs+pi0HhBW0m5MXz4vpJmC2OfZv+6N6Obq
	qaIV9
X-Gm-Gg: ASbGncumJoA/ONJCJ6Nn/5o91Oco2hDs/DzZXc7FIEOcCRTpdzepyj1S8A60/oY5SRB
	Vq1pf6T721xTemRh89r2jEoel/rYZ7hiN30ZATHkl64l8PemYpst5ahZodB2xwH1DYs/JwYsPCh
	yplCCIputbkBVrvrrEJEN8Qp2Y9SlhcwVcmNuz6vJAHwI3/UCJCoeoJuSf8NQlyz2VDfZwvBp4M
	2PVpfBsQ8tAHV9PaRmWl5Pc6X+8eMviQ7loyzi50ncRsihQTt7Pbka+wrhDzjJq6DvFzZzCOHvR
	PzC1w9E3q1/piKaUTMcP0rUSOr7DA9zP3qIMQjhjBlehN7YEw3BQZMI=
X-Google-Smtp-Source: AGHT+IF2ygCYFiNlQZ0QPfX5LxxiHLtfqUThk5JO/nc004InEVJCxglEaTN98IxZFKcVTGHlL7qmHw==
X-Received: by 2002:a17:903:1ace:b0:231:b405:c4cc with SMTP id d9443c01a7336-231d45a9b21mr5158125ad.41.1747331830399;
        Thu, 15 May 2025 10:57:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1d7a:b4f2:fe56:fa4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edb063sm577495ad.255.2025.05.15.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 10:57:09 -0700 (PDT)
Date: Thu, 15 May 2025 11:57:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "remoteproc: core: Clear table_sz when
 rproc_shutdown"
Message-ID: <aCYq8xAC7NAKhffK@p14s>
References: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>
 <e178418b-4ca3-4b43-82ce-32622ff19477@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e178418b-4ca3-4b43-82ce-32622ff19477@ti.com>

On Thu, May 15, 2025 at 12:21:14PM -0500, Andrew Davis wrote:
> On 5/13/25 10:52 AM, Bjorn Andersson wrote:
> > Clearing the table_sz on cleanup seemed reasonable, but further
> > discussions concluded that this merely working around the issue
> > and that the fix is incomplete.
> > 
> > As such, revert commit efdde3d73ab2 ("remoteproc: core: Clear table_sz
> > when rproc_shutdown") to avoid carrying a partial fix.
> > 
> 
> Setting table_sz to 0 still seems like a good idea from a defensive
> programming perspective. Both table_ptr and table_sz should be set
> and cleared together in all spots.
> 
> In addition to this, another fix would be to also update
> both table_ptr and table_sz to 0 when loading firmware without
> a resource table. Both should be done, no need to revert this.
>

As mentioned by Bjorn, this is a partial fix.  I'm all good with setting
table_sz to 0, but as long as the real solution to the problem is part of the
same work.  Once the patch is reverted, which I'm about to apply, work can
continue.

> Andrew
> 
> > Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 48d146e1fa560397c11eeb8f824ae0fb844a022b..81b2ccf988e852ac79cee375c7e3f118c2a4b41a 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2025,7 +2025,6 @@ int rproc_shutdown(struct rproc *rproc)
> >   	kfree(rproc->cached_table);
> >   	rproc->cached_table = NULL;
> >   	rproc->table_ptr = NULL;
> > -	rproc->table_sz = 0;
> >   out:
> >   	mutex_unlock(&rproc->lock);
> >   	return ret;
> > 
> > ---
> > base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> > change-id: 20250513-revert-rproc-table-sz-53ecf24726ae
> > 
> > Best regards,
