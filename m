Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B81D516F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480263; cv=none; b=VHU1oT8lr2SvwRaCwJ6R/YI+pIUKQxObAJZgpljzfIdvxhKHNiqTS7r7w2YnR2jBlu0c9BBRvCczTFfn98gsKW0fIXcrK/65e4MLbO1dzAoFfg38GQneI+itQCUw14fD06Mg7jg+7lj52MCO9SJfliLPrVQpm68K3r1TXOsKILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480263; c=relaxed/simple;
	bh=Yu/W+AFh+A1X5d1uPRObwJqkGChsK3QsBwdzVB+n5xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIipwEEf+/mgk5t7JZdwviChx/9GDSkG1dY1S3pz9GfPxDhqWfM877VFTlWHr61xxD+JVxpzHDPqhWscoOqR1Ia0dV7kYpRUQajzp2SZr2ggg4bddRr1FuMEvtViIQrQ/s96ulbbaCjU2vDdwx0Hy22Y0M6kNX3zGxRF+LIDvf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8bF8PUE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8bF8PUE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so1192850a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743480261; x=1744085061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UtwLR8ORea7cNawrzXxhQ8o0u2ZJRFEcgt33bJPEyGY=;
        b=I8bF8PUE0tV30oXt48acl4V/ciYgpIyuOa0yxIGOzaon9gBXO1Cm1tb5c4MqvuTYAO
         K3mzGZ7e6+B7UMSdbmRP9y8E07MY5t6SS0hrwFJW798GWz2HY7M4R9raM/xXiCSTlpZj
         YO+yVi/gGaOD/ZHpJdAZwirS78m6La84EJEx7v/raSKKeqwRmMBRVyh1Rgb0joRhUyTY
         zuQ13XdOJAS8TvVRYX2CSiE24UKG+/WA3tXCGlQVsjJUi4TjskXRZP5DYgvxYenIKaVu
         /VNwzihYNO4zZZUUOdCh1xTtMIjK2l2aB1ojxEDFjmKbrUnuzW6UvNiH4SwloqeHdbal
         XdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480261; x=1744085061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtwLR8ORea7cNawrzXxhQ8o0u2ZJRFEcgt33bJPEyGY=;
        b=oXOQZZQMnihjeixxrttYLoDRbzUaNfUlprXvN7PO9wxdCXn4E49js8KgSkB6jvwOTX
         CDRQ8bEwO68jtPEMlrbvPQ0angVG/DPU0fYhff/vcFykrPS4HO08au4kVT2b9gH5J6qp
         DfpLpK/O/AM6HDsNT/K2h0c7QZhmLx/2b8GYDwoPiys3el9hkFZOjYrK6DRJeVeZh8//
         MJCzWT2rcbLd2LeB3Enb9AJml1V69zT9g9Qgoc0CVu26aQNto8g543z6OTJQ7oghekWd
         /+wajl1GPTiV/npxLDNhsXcBflFy9dATM50ZTNTpKuZlzYBJDRn18PxAhyn0oUOmJV4t
         e7IA==
X-Forwarded-Encrypted: i=1; AJvYcCXFyTNiS3dklTxelZkmchzBZYYzYlIYAyOnQFQs8L4jknwr/Z43zSqTFu7OazBBuJJ8iaiDA0ghhXzODKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CReustbk+kVCrX+fQlPLyCmgIi8UyLyaJqshePki5BOG3BFR
	SlWwmLR0ZOELD2cGxXFsBJjT2PQlPn6yOLhLu2soMpabChoZnp86j1tzAHDXTGJNEjbJ7Av/ob8
	yS4T2EMM8ABk9V3Kqz8udsda0uVg=
X-Gm-Gg: ASbGncvbXkHDNIEmmw4C/Ekf2KFaSgDS90SxLav9DRc5ISFVtQHVdBQPlNW0hHiXFsm
	khMmn+aKkKyh2QkYaE8N0XUxUTud0tPtfCuxnOvBn6liG6xx0rP+mERUqMViy2qGBUq44mrz1iw
	PByN16tTPcCuwSMhjbMPbVKExlvA==
X-Google-Smtp-Source: AGHT+IEI6lJQFdOwLDCg6PLCnj6gYC0bpD1g9gY4BFNTadv36cQF5FqA/OceP8H8bv8Qzw645QzbYjy0OHyqd5p704M=
X-Received: by 2002:a17:90b:1b0a:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-30531e81acamr7177562a91.0.1743480260819; Mon, 31 Mar 2025
 21:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com>
 <D8UG6DGW1FKI.HZ5UFH4EVY9R@gmail.com> <f63160cde06665bc4bf0e0a18402074e3843f9eb.camel@sapience.com>
 <D8UKVCL4JHTO.1SFF4L6LPUE3O@gmail.com> <ead550cacbdaca4667bd67ca0d353863c41c14e8.camel@sapience.com>
In-Reply-To: <ead550cacbdaca4667bd67ca0d353863c41c14e8.camel@sapience.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Tue, 1 Apr 2025 12:04:09 +0800
X-Gm-Features: AQ5f1Jo4tg8WGpTyA-2-paTwlF0x_mDBkatEGmXDGxfDGIh487H5FZLtvrUUyAY
Message-ID: <CAAJw_ZvZZ8M3im67nD9Z818c2_TrTnwe9pz1EiZ7FEwW8d+vVA@mail.gmail.com>
Subject: Re: platform/x86: thinkpad_acpi causing kernel oops commit 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
To: Genes Lists <lists@sapience.com>
Cc: Kurt Borja <kuurtb@gmail.com>, lkml <linux-kernel@vger.kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon Mar 31, 2025 at 12:05 PM -03, Genes Lists wrote:
> On Mon, 2025-03-31 at 09:24 -0300, Kurt Borja wrote:
>>
>> I submitted a fix for this that you can test here:
>>
>>   https://lore.kernel.org/platf orm-driver-x86/20250330-thinkp ad-fix-v1-1-4906b3fe6b74@ gmail.com/
>>
> On Mon, 2025-03-31 at 13:04 -0300, Kurt Borja wrote:
> > On Mon Mar 31, 2025 at 12:05 PM -03, Genes Lists wrote:
> > ...
> > Are all this driver's features present before the regression still
> > present after the fix?
>
> Fixed the crash and machine seems to function normally.
>
> >
> > Also would you mind re-sending your Tested-by tag to the patch
> > thread?
>
> Done.
>
> thanks  for fixing !
> Gene

Tested and that fixed the crash during boot!

Thank you!

Jeff
