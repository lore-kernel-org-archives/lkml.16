Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4DA12A177
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158274; cv=none; b=Xq0zOiJMo22fC7Dq7DWzSKoYyGUHeFSikUgaUPR6ivt9uobmdUbFqk/yHJzkVsCZFiyRpUP2CukGmqRn3gNgRpMyE1FskMNKBMAiixgdPm2K21HDiLjj4LhvEeP04uu3DSdlsp/7eRnrxgjn45Mhfw/+LrQbrPtkvPgWdkKeVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158274; c=relaxed/simple;
	bh=76A9PBO+S4wv2+n/JHC8Qbod4Dj92aF5P7rG4zB3pWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MomPynRSYFeVHg6SYrHnrPY8kMEme7crdIILTChlD2YogfmeRRmKDft2aSut8VypR/L1KFVPFsET8MPjHwgbf1gPou2I1kmC59IYEEBa+Dnnij589Kgq3H56g56/4d0dcA4ebfhME4x7yRtdOEats4mDmuBpBuB1PAXLfnzMv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKa+sQDs; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKa+sQDs"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so7138051a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 19:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739158273; x=1739763073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76A9PBO+S4wv2+n/JHC8Qbod4Dj92aF5P7rG4zB3pWI=;
        b=HKa+sQDsM3NbkN0hjde76MU312GB0kElNXSNFt5fbPvPDh69o5vtMjCLx+KorstHp3
         gpqu//zQ//nAsM2vGNBAgJGjbPXjk8HKS1j98L7KOcGWNJDxCbSp9wv0OxSjBMzWwQpO
         r5rjFivl8tlnP2auMevnwv+MJMoApRwTeVi8TafbqTKAkT+TkZZM6JD+Y3fvPWWOhZg8
         gt3SdPju14CzbMnWsEfmtG62Ub0g1Pha/E8mfuFBoU4uwQS5cpdoZ6wwJlYGWDcMgzmA
         f3kj1lU2gZ3EOfi3MN10T+BnumeyvAarfuQCZvH7VgVuDt3cIv2CWedhg4egt+TC7v9U
         RQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158273; x=1739763073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76A9PBO+S4wv2+n/JHC8Qbod4Dj92aF5P7rG4zB3pWI=;
        b=bRxQ442qcuteZt9oDgv0GVkdneRJZkeScnSy/o2NcAf4oSr6HRMqB8j770EP1TWVM3
         6KjUdj//hgMO1+5iGyI5O5O7BLWaJ11ZdwV9aMTZPRqRHkSrIFxdUGPvInqD1TyHpLAh
         yvR8nPKKLOGY2dDuJYuSKL4zwwo5URpj+WQVzGa/igfGTg3uRYhbSq5OaG+bL0hZ8feL
         7CzmZqgmq13D6M6HJIEx2Hi6TseCzUhPBhdcCpg3DFHVtYqtQOqxIBKXXCydEWpkXBfu
         Vx+NZtfiztzd4J+sdl1PGEQlR5cigyxKzZMTJ8mipyJZKMaubfHL7uksmtamqxN00lzj
         W2og==
X-Forwarded-Encrypted: i=1; AJvYcCUX3+ykSDtcQZXUmFueMK6Tj586bZS3sqSWko5aM1RztFsNLUIPc9uOUbkYbQHa9T5ixaJXuID9XfQpJ/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7jk8QO7EvLoAxdepPZhT/vbFc705sqgykzHouHnSdULnN/xJ
	WtDgC/5T/C+ckSPmfrJ2rfgTCPjZ/IQBfsCPLhGgdFr/FQPuTcT8X2D9MFk7vZ/PuDeqxJ5IfHj
	XB5HnME1fA4b7iYfy4DPxjQjhM8M=
X-Gm-Gg: ASbGnctGkrFoy+2zGcu0SZL4HkrpQiyYqoYvaz1XsKR0xOfNFeRnTXPcDHK1NbkG6z+
	cLMYWuhGtLHrqHYK2O8cSB9edVJeiea7FjP/TnKAKn1+gCfRFHu6jExuN4LMCi42bg/exyKzD
X-Google-Smtp-Source: AGHT+IGspnQFdMK07n9rreinJUGIQVxLJ190e4UhtTGJFBM9IuQKpq5qf7Y1KZrF2sPLKlDV9/Mx6+VaNYmth6g5N+s=
X-Received: by 2002:a17:90a:d443:b0:2f6:f32e:90ac with SMTP id
 98e67ed59e1d1-2fa24066820mr19017490a91.11.1739158272917; Sun, 09 Feb 2025
 19:31:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com> <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
In-Reply-To: <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 11:27:04 +0800
X-Gm-Features: AWEUYZmU6xSOnv0TV2wLY5Bey99PtaRVUwJAxIxTo7wIml2ZMdufwTYDyepL_MI
Message-ID: <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

Tudor Ambarus <tudor.ambarus@linaro.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=887=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:37=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi, Cheng,
>
> On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
> > Although certain Macronix NOR flash support the Quad Input Page Program
> > feature, the corresponding information in the 4-byte Address Instructio=
n
> > Table of these flash is not properly filled. As a result, this feature
> > cannot be enabled as expected.
>
> You need to prove that all the flashes that you touch need this fixup,
> i.e. dump their SFDP and show where's the wrong bit in the SFDP table.

Okay, I will dump the SFDP for each of them and point out the
specific errors in the SFDP tables.

>
> Identifying wrong bit in the SFDP tables would be easy to spot if we had
> a SFDP decoder. Something that we all agree that'd be a good thing to
> have, but nobody can allocate time to do it. Pratyush I remember has
> started a draft. Are you interested in introducing a SFDP decoder in
> mtd-utils?
>
> Also, if you touch all these flashes, will you please update them and
> get rid of the stray flash info fields? I'm thinking of name, size, and
> no_sfdp_flags.

No problem. Would removing these stray flash info fields from the
Macronix flash warrant a separate patch series, or should it be included
with the current changes?

>
> Cheers,
> ta

Thanks,
Cheng Ming Lin
