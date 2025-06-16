Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2B277C98
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070452; cv=none; b=aCOIcWq4Wl56ZzPsXKwVB1QoyweP0+ecgkK8qfzVXhmu+Qp1nG4/4+UTBUo1n6CMhKMO0UHKeiLXIyOJ8krJj9L4tSN1ehsG6aElGz/Y8O7vw4xMHOV/q7KXsduZetAwqHi85a9SxvuuPojjOZqesDFi1lLFt9OXnW6vGdo6W1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070452; c=relaxed/simple;
	bh=8XMWvcD5dIXEwocCT7V0Ty4mO1xZ8Yq21hFRXXg+GQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdaTvkGFbDfOi4ggKXGFohKtEAsEJ/zFqq+DQD0jOJV8gmKn/HSLPGRrxKeZpXQTIgClHwEWU857pOZhLbc1TXSfKt2ozQcv2uf+IBfPGoQcFeFdb2c1c2hfsQhdV3VDaQkx5+ZWPEvL1YZub71Xn+7yiDL5cuo+oelDBvbKaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUy84jMq; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUy84jMq"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7949d9753so1420598137.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070449; x=1750675249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKcJBSl+Htuh3i5x90yiqO0jHstMNoYTds6WpGdMy9c=;
        b=ZUy84jMqExXoMlUwDXrFbzIY4UZeeFI3eQM+eDEAEbcojd2/bD1cJfN/TbfHJ63X7T
         60tX9W07Lkxpejp4e1K6co4mIAiKaMEQBdi0eZK1BLThlVdkXhz0YAWkbWzGTa3LJH7q
         /FH1rOdISvz89jYiVQm61p9dLyckJ2cJ3So+AJgA8Pkdh8kQklZ3Zf1fHLx6jz+I0Cal
         pwDKsRS7WlorN551ReiDASKc0TxBqleRBimwyIYlOMOv3me8C2h22rblNODnZ3abZ9YJ
         UimX0SJ+KHIrGpEfbLm3nycq6BSUNldhMa35xrqyT0IL0MtQbjcp+DYLvdo+sV8ecnmB
         LCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070449; x=1750675249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKcJBSl+Htuh3i5x90yiqO0jHstMNoYTds6WpGdMy9c=;
        b=DWpwKVotrGMEpLmb1QwBHcTE6PWkdhhst2njUPNVQu/bR60w/x4w8Zqs7SQ6nnY+tT
         r+zORY2/e87BTNKnK79uaTTZecOr1/QJtmvKocbu6kF8cFIyGeYs0nKKoloFXFkrWsXt
         n3QGp1dnnO1522adHL5sMKqGPJcf9A6r2q0fnPXtpbHA3VprX1Arr3bLQh6FH/X1x5pS
         DjUkziORBIZ22hnUdynVaBFcw8kV1GKW87OLbHc0/E5gDxBpLrkK3L0y5+1J0v4XyV5g
         PP/qhQ15F7iKv1U8DUu0e6YovyOSns6ejlPKjcucaahHBZZ+TpjLTHl6zBAjzvJ+hlPl
         R5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUlmke1AUZ4NmeZAtDRGagCQW1DqD/xvZsWthx9uIEo90CmsLkihHSE1bBkiaGg3DeMCwrwfyrzhaccylY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxfj09k7A7rBEMvUZy/TG9XzLJAUPxrirgqRfZtLqcJWwU/sm/
	o/BWr+4wrKNyPv4RaI3HnjolSQHhzBhM8yzATTcTj/xsJi6OVXHiH+V7H9TnB36HRoOUazKG1I0
	kIgzt2uR9pgnLG0rV8aLQYHkwuw2DQu1d5j1O
X-Gm-Gg: ASbGncsNmNHWVrrpr9Jh3rw3I8oxiH94cFit3TPGOdMp0CfSi3XXpNrzTOO8Otv39F2
	EfdF+hzyPJ23cdwWcrMtu7FSa7bIQfoljzpEuDv8F/IMqhXjUecHxKPbelZHqAwxC56FYIY5+re
	Oco77EIQeOB/8qOTpqyDTKdGeVrihx2img0RM6jsE+1tUe
X-Google-Smtp-Source: AGHT+IGyrVuaJSujsaH/Gb6IqSn1XaIFzPww+xgJhL0qSz46P+E9FU9vcP3CXBQsbgaUwh0W0CRlwO5C49KfqNRF7ss=
X-Received: by 2002:a05:6102:4bc5:b0:4e6:eaed:7e2 with SMTP id
 ada2fe7eead31-4e7f6188746mr5750214137.5.1750070449393; Mon, 16 Jun 2025
 03:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614143454.2927363-1-xiaqinxin@huawei.com>
 <20250614143454.2927363-2-xiaqinxin@huawei.com> <20250616105318.00001132@huawei.com>
In-Reply-To: <20250616105318.00001132@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 16 Jun 2025 22:40:38 +1200
X-Gm-Features: AX0GCFuFgGB6vPgX23Rf-5Mt2x4mXZwQlCu1ReuAWrQ4w8qJcActIkO0Jlw_fYo
Message-ID: <CAGsJ_4wOB+cmGzuzzacwJGeUYgGLuKg94wuWC+mA-_=r0TVuhQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/4] dma-mapping: benchmark: Add padding to
 ensure uABI remained consistent
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Qinxin Xia <xiaqinxin@huawei.com>, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	yangyicong@huawei.com, hch@lst.de, iommu@lists.linux.dev, 
	prime.zeng@huawei.com, fanghao11@huawei.com, linux-kernel@vger.kernel.org, 
	linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:53=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Sat, 14 Jun 2025 22:34:51 +0800
> Qinxin Xia <xiaqinxin@huawei.com> wrote:
>
> > The padding field in the structure was previously reserved to
> > maintain a stable interface for potential new fields, ensuring
> > compatibility with user-space shared data structures.
> > However,it was accidentally removed by tiantao in a prior commit,
> > which may lead to incompatibility between user space and the kernel.
> >
> > This patch reinstates the padding to restore the original structure
> > layout and preserve compatibility.
> >
> > Fixes: 8ddde07a3d28 ("dma-mapping: benchmark: extract a common header f=
ile for map_benchmark definition")
> > Cc: stable@vger.kernel.org
> > Acked-by: Barry Song <baohua@kernel.org>
> > Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
>
> FWIW I checked the patch above indeed accidentally dropped the padding an=
d the structure
> is copied to userspace so this fix is correct.  Given it's not in a uapi =
header this
> only really affects the selftest I think this is mostly a case of there p=
ossibly being
> out of tree tools with a local copy of this structure definition.

Somehow, I feel we have placed
tools/testing/selftests/dma/dma_map_benchmark.c in the wrong location.
As a selftest, it should have a mechanism to check kernel dependencies,
start properly and automatically, and report pass or fail.

dma_map_benchmark.c seems more like a tool that belongs in tools/dma,
rather than a test.

>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks
Barry
