Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D021F1932
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433079; cv=none; b=MLzhIAlc2N3J9Yp70JSVyzF381uk+ODvL9cjzz1Ldx5r1ZMDKFLFSKQbdZ6nxA6zLISbZxkqDL5SRXBt7GL8CmV2e977qzRUroXta26KiNfZ9MwctGkUfd8btcHEmJpLXvE5mYeonZWZHYTZpk8KRiCKTDvoxo2NS9DrxybJjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433079; c=relaxed/simple;
	bh=Z9dQdXAKnf0aXMqacPVheeFOi8sC5KKmZmgMx4NYYTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euQBhBlvfbAb9EEAjiaq2YDGUfyPzqqtPOdWOKqqmFi7fDyYFBN9qB+xedGtVc4cVVyquvPMPsCWutiEvVwb6UpHzMbZS3VCypUOKJoFPX2bTZPxSkNcXAdXisUAdk7/B+/efW4vhJuouS21bbjx8JiqjoPj+hx/SFLrUM4V3wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=jwton1pZ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="jwton1pZ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58c2430edso67929751cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1751433075; x=1752037875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39A7riltgC/pMTMvbUJBbwdnMFL2POw3/zh411n1MtM=;
        b=jwton1pZ1vQrfCKQVzH4jCk+koAb2WmU2XoTDA6i0jltAOTfEirtF5hkgR4BsjLDeg
         DjtUxei+2lhj0trMDd2Juy5CiYLBUINC3HChbbenQyi3xjlaasWTGOjihdcyrurevyXF
         3IY6GpFi2mSwLm0jQU6Pa8Eva04EF+pcupJYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433075; x=1752037875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39A7riltgC/pMTMvbUJBbwdnMFL2POw3/zh411n1MtM=;
        b=XeGj1az5k7irMbDAdvrOacA7uWGgZrXyLLsj5roS/B9cozzuiruEgExEWdUnQ5mGey
         2Ybc1KxNnN0k/8xuaFiETR6SflcLTWonEEN9SSkVXOb4/earsmb0FTcPWTIB43c9S+J/
         Oy81tcniWAkU5P34q1KHU/+QgqPocvMvHTAeS6yOeokgj9wxZlFkWcttZ49jJMq942bt
         S8sKGEa5TT1EeSpnSS4OFk13vkmDgRZUID4A5WDTxZRBHEfhCbuJnAhTq+eTTz3cnPFd
         44HcuDfEOOLM0wf6besZGKbzvB7pKs9M4Zsi2/8wH5clRHcTfVZwQ6rLBaSUzO7NIxmJ
         tz+A==
X-Forwarded-Encrypted: i=1; AJvYcCUr+OKHcy9I8K3HHZLjVt82Ogr2auYJ+5vmK59o0Cqp4NuWYoXqClyFnnn38fGN6nzKK9tGQc4zZn02iNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FHkJiNNGgv1hsiM+rFhLgkzYJjP3r387vb7D7ENnT+C6ptXp
	/X9rlDEH5/q/UHtf8C722HeG8f6i4X1Fqi1z8E0xhg9TRZXKFyCMn2vSu3sDCzbvDU9P9fdkv7W
	wbRL+0UejPYKOCPd2TcaxHMq9rvIftAVgpr5nkyVhlg==
X-Gm-Gg: ASbGncvZLRKnlFd9LLzdsC/r4S1E/vnnfVtQluykjyYDYdFszM4PP499jJxKFV0WB1R
	w4pDTEDMBDw4GTGmtxNZsd3b8GQShOJuxHN6PiPQHpQOP0UPxihg3mC1yFMq0V6t1oe4ybMfbSG
	v0t2zPFxROgAzlS0MsAiICQkNv+kDzvvIlXuzDVPQJJUNCy734UpsFFz7DZUdrl4aB14ni98zfy
	pPrm3ftueQU1C4=
X-Google-Smtp-Source: AGHT+IFAZ2Ggt7L6FwNS6Sb0whPR01gwHwY7a3pdJQip0QYzrqFWmzBH2hoAm+Nnxnd0g7xLU5LUQ/ax/H6vCjPCsek=
X-Received: by 2002:a05:622a:4d0f:b0:4a7:23a3:c562 with SMTP id
 d75a77b69052e-4a9781f9fb4mr22045271cf.22.1751433075344; Tue, 01 Jul 2025
 22:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
 <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com>
 <CAC1kPDPWag5oaZH62YbF8c=g7dK2_AbFfYMK7EzgcegDHL829Q@mail.gmail.com>
 <CAJfpegu59imrvXSbkPYOSkn0k_FrE6nAK1JYWO2Gg==Ozk9KSg@mail.gmail.com>
 <CAOQ4uxgM+oJxp0Od=i=Twj9EN2v2+rFByEKabZybic=6gA0QgA@mail.gmail.com>
 <CAJfpegs-SbCUA-nGnnoHr=UUwzzNKuZ9fOB86+jgxM6RH4twAA@mail.gmail.com>
 <20250513-etage-dankbar-0d4e76980043@brauner> <CAJfpegsmvhsSGVGih=44tE6Ro7x3RzvOHuaREu+Abd2eZMR6Rw@mail.gmail.com>
 <CAC1kPDPZ5nw8qmvb5+b30BodNh+id=mHb8cTfJyomtL0nsVK=w@mail.gmail.com>
In-Reply-To: <CAC1kPDPZ5nw8qmvb5+b30BodNh+id=mHb8cTfJyomtL0nsVK=w@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Jul 2025 07:11:04 +0200
X-Gm-Features: Ac12FXxTBrVwpktrx3T9XvaGWoNpyxuO-t08Krlo0OOu04fSsoekxJo_XlJEBZo
Message-ID: <CAJfpegudqYye8=m=ZOMFnQ8u5tp0vsLPutV9ikM5_NLVOxMoUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Jun 2025 at 08:12, Chen Linxuan <chenlinxuan@uniontech.com> wrot=
e:

> In my opinion, adding relevant directories and nodes under procfs does no=
t seem
> to be much different from what I did in this patch by adding nodes
> under /sys/fs/fuse.
> This kind of solution would still be a somewhat =E2=80=9Cnon-generic=E2=
=80=9D approach.
> For io_uring, scm_rights, and fuse backing files,
> these newly added files or directories will eventually have their own
> specific names.

Why?  Name the attribute "hidden_files" and then it's generic.

The underlying problem is the overgrowth of fdinfo files.  It was
never meant to contain arrays, let alone hierarchies.

Thanks,
Miklos
