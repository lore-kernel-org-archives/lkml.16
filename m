Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D052D77E8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535004; cv=none; b=ifjwE07u1iXRows+eIkSI4mgeVijSfy+St8+o/XMZct/PBmT/FNQSUaHGfYpOQff3xWKu52wdbyo9WfLEvACsKjvjsVmnmLIni6VcA4dXpxHXdSLlcM3M9Yk/d6XICnpwd+JYgGIBmGOGhM137d5G5G0w0BRuFzrc7JVBVM+0f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535004; c=relaxed/simple;
	bh=NUbOO1LkhU4fqWdYniY0ngtGCX4mheJRlQgsq40wJm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8PaCDuDilPV51h2MdJzy5ztSkriLlIx00MLvbHzzD0/WNUakKKeiyuNfqlscoKsPo4OFR0U9dhfFU38qtcBn82Cs7Mm9j+P54GCY66b9w6g02Tc6aGGd0oNKFaN3zd/4SxU6or513rlW4BB6E/xxDKQhlDxMTxkwxrOPo0YcSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=uz0FWDvU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="uz0FWDvU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so1368301666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1751535000; x=1752139800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIWiG9dqFQFHdKj4M2wbUUNwQxdB0m9vMthTEJMZrmc=;
        b=uz0FWDvUXoXq5v64nPtdUhYogPICqd2o7D9WDNZPKgfUW+e/B40CVr7LwwVxS9KRkZ
         ksNUshvsWw55k6IwKYJ8oplhAnCkHhcfg1qfzCE8yli2+lOdCXMUUmvbrS9Fi5eCKZ8Y
         iXK8okeq1qf7CYnlSjAjoGS1E8IirziiMj307ItxLzdFxEBtVsf3bMTxStURIWzK7aaG
         jfhMnkpR7CLxETs4GfYAgqt1o1EKoSpBLIP+n3gT8S5I2uJ5tyM6IfAuC6DXSuPJg4f+
         2ufSmJjGxTR0nV8gShuh8j8Z+RniexXRD8jv78k+ULiJHagIB+0Q2bnXEIBJCcavd05/
         /Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535000; x=1752139800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIWiG9dqFQFHdKj4M2wbUUNwQxdB0m9vMthTEJMZrmc=;
        b=PFc+rNBOivQJlY1Md79FF464UiC+P/U0+83r3cnvskdHNKxm1B/++TI0JP8zh7EOSQ
         fE9dkL5gCaV5w6D8K3cf2Uj8YUP2i4dmN54KbPTupp/+dsqzI2DZsz4Ay3u4FABd1FJU
         dQCbqjVGkp9eUgDW063DDc4I3AYxF2XU3NhhjcQyw4IP39LnvWe8z3VerMoz3K8bBrz+
         U4OogQE5XLhduEFAhyHrzepbrtXdBO40MFhadvvGGvv96jDdrhkNFPaZNtDgPUSQXkaG
         z8Ld3JmUMUgqlQs16mCOVsQ3FwdDENF/i4UQPaHrlNVC2Lb+kqPhYMV6vyti0GZyJ+49
         SSsg==
X-Forwarded-Encrypted: i=1; AJvYcCVF1Lm+AG0bMFN5uzS9yy/nsgTk5z0QiuigpoVJolX46L0vj7ux0zj7QrRhisUy2TmttJ3hOVGNcuywYEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGo7biAtax0jr/bfALXChrmM0rnxU+xFoYw3PLh4ksE5nN8777
	FFtnypJuRL0Aq0ro4zq8TdG5czGmJJO6FgnYq6vaBTwYWQ4QypE8B4q4xVcA5Syd5N7AYmtye7B
	cV2FW
X-Gm-Gg: ASbGncvMQrlAGTvWzTPDwE6AVQho4gr6WbkmHJZCN9LsTf9VQnMY7Zg3f2RzZuFCDOi
	2mnoSX5TF8vCCNLGiHLGuRVEDPcDTxgxQyxMMcnxiZ6ebnvljlW2ScjvVN6NX4Y8PLBN8MYeF5t
	ekLwRyuhM6LjKsisJ+6r43+Gizy74H3PxrjyDcdXSPUWxgMGoUblIP/ev3HZQxQoEHp0vUil019
	xcZPtx3x1HlkkYHC5ab4sJpk+jg6kflJEDwh8wuCsEJtErTQE/0esN39snhPMJxYjd1QsS0QU1L
	xOu4LBpldrmeY0r9aGm1BW4w2jUQ3UtK3J+r9zlcMf8JUwEwO2t+cYw3ZN75wR80lNPX5pwIHiu
	AdZZdJGhTPOiNoBkLdaWJl3HP7+E=
X-Google-Smtp-Source: AGHT+IF6ggB54PB58WsdUlPptBXf+B1DdD84f3tx0QpZNb0Gubfb/YJFRtUnI7TT/jSbgpB2+0kCpA==
X-Received: by 2002:a17:907:a088:b0:adb:4143:4c8 with SMTP id a640c23a62f3a-ae3d83c0c05mr192246666b.8.1751534999498;
        Thu, 03 Jul 2025 02:29:59 -0700 (PDT)
Received: from somecomputer (85-127-104-84.dsl.dynamic.surfer.at. [85.127.104.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a021sm1256411366b.54.2025.07.03.02.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:29:59 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Damien Le Moal <dlemoal@kernel.org>, upstream@sigma-star.at
Cc: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, kch@nvidia.com, sagi@grimberg.me, hch@lst.de,
 upstream+nvme@sigma-star.at, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] nvmet: Make blksize_shift configurable
Date: Thu, 03 Jul 2025 11:29:58 +0200
Message-ID: <2880421.FSEd18e0ET@nailgun>
In-Reply-To: <20250703085451.GA4459@lst.de>
References:
 <20250630191341.1263000-1-richard@nod.at>
 <132c1bdf-e100-4e3a-883f-27f9e9b78020@kernel.org>
 <20250703085451.GA4459@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Donnerstag, 3. Juli 2025 10:54 Christoph Hellwig wrote:
> On Tue, Jul 01, 2025 at 09:34:00AM +0900, Damien Le Moal wrote:
> > Even if internally you use the block size bit shift, I think it would b=
e better
> > if the user facing interface is the block size as that is much easier to
> > manipulate without having to remember the exponent for powers of 2 valu=
es :)
>=20
> Yeah, block sizes are probably a nice user interface indeed.

Ok!

>=20
> > 		pr_err("Configured blksize needs to be at least %u for device %s\n",
> > 			bdev_logical_block_size(ns->bdev),
> > 			ns->device_path);
> > 		return -EINVAL;
> > 	}
> >=20
> > Also, if the backend is an HDD, do we want to allow the user to configu=
re a
> > block size that is less than the *physical* block size ? Performance wi=
ll
> > suffer on regular HDDs and writes may fail with SMR HDDs.
>=20
> I don't think we should babysit the user like that, just like we allow
> creating file systems with block size smaller than the physical block
> size.

I'm fine with either way.

>=20
> > > +			if (!vfs_getattr(&ns->file->f_path, &st, STATX_DIOALIGN, 0) &&
> > > +			    (st.result_mask & STATX_DIOALIGN) &&
> > > +			    (1 << ns->blksize_shift) < st.dio_offset_align)
> > > +				return -EINVAL;
> > > +
> > > +			if (sb_bdev && (1 << ns->blksize_shift < bdev_logical_block_size(=
sb_bdev)))
> > > +				return -EINVAL;
> >=20
> > I am confused... This is going to check both... But if you got STATX_DI=
OALIGN
> > and it is OK, you do not need (and probably should not) do the second i=
f, no ?
> >=20
> > Also, the second condition of the second if is essentially the same che=
ck as
> > for the block dev case. So maybe reuse that by creating a small helper =
function ?
>=20
> This code is copy and pasted from loop, so it's originally my fault.
> It just missed the comment that explains why it is there:
>=20
> 	/*
>          * In a perfect world this wouldn't be needed, but as of Linux 6.=
13 only
>          * a handful of file systems support the STATX_DIOALIGN flag.
>          */

Well, my code is the other way around. I checks the logical block size of a=
 device
even if STATX_DIOALIGN succeeded, which is a bit too paranoid I guess.

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y


