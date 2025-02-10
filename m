Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211F25C6EF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216956; cv=none; b=Jgpi00W4bUEFOCkKWGZThvjojz3pR3UKBC6wH8EKY+LYViwbO32K47rn8YO3vaH6XFBPUvOomKQDnK36SQGDlI4ZLeoHgQmybdn6OakgReKBS0TkUgWUEaJL0tK4s7zEHIC+Wkuux1Gga8j4TxsRcQBRgoL+vllgGWC8oelsqtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216956; c=relaxed/simple;
	bh=Ty6k5I1/hnJTjgA0qZmIAImp0Z7XZeXOKWP8irziz4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikaQMzN2udmSim2Kj53yuJRNUiQU7pL93s7q51Rwk80GH88BH/Uka0wutkfwdGRAljbSl/mK+qZh2Dhtlm2kgIi1jmzB9yuYq34q2dHt9cE18G3V3XloSBGoFOs2CvpWuq+TID6We5oyFtZG4e3/VftG4Rnb53KDp9PHIFhplIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7d7f0a2cfso63198266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216952; x=1739821752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95fC/C95p1+hJwvVm5h6wvO5Q4omEjar82baF+zynPs=;
        b=vTECfDQC8Ui4Ky0+O3N/WuCM/MR7P4/2lnMURC8Z8tsWHg4ti5hxQLJrxBHKrhZGfc
         eUdeNwakFCzR6KwDfXw2rxdaBNXcxJVm+csVTD/d5B+gHKq4ZFiqgS5ov+7uYjkQCqO9
         Ru36w6e18DBCq+NsoOVa5uWC5mS21F92L7kb17Zy/G61lOtjkhBbDUOMqfzmV02CZ3EA
         6h39jqWOd3emU9eX+8ywwkMx3SVbQC8NdE4m/gnNZjl+qg5eOeGYdBChZe+QUeeaKAa5
         fWw6X8becNvymnuVpvXnAV1eLwiOG4R/kVR57/99BJ3NgIZYcTM00MTdWeFzB/QhM1ZH
         vcuA==
X-Forwarded-Encrypted: i=1; AJvYcCXkUcdVTnSZN1LESKt8a1TatPs7zKuDNfhOIhEjZvALLQ4+oamAiKoWBGojCMsw6FAe11GhBQn5cvb4SIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8s46A+bClBLjpNkJ4hXvxcudlaR8+U6oxC1f6URaCEoyEhD9I
	Jw3GdE2uoD8kOnKKjt4h8MobVI0BS0AWZk1ECHh7ZAUSkyV9r6rxCqjP05kN5g8=
X-Gm-Gg: ASbGncvUvNih9UIBVJ4CoX2gNejYwnXHbckzOK3u4fBLBrpum7Hx5tsgB/2Zl9iNPyM
	NqMSXGCb72byNgtA1e0Y5ExGRgJh1V+WndBN8PZ3dvB9CugbzEK7gVvkYAGE7Qx9fh7DYdIC/QN
	KHG7d+5A+Vy7rY23Wv3OhBZWganiqrWhkhxv9vNVNDehT8yug3Q6yqlRiBfBA5Yrg3xpysno4Wk
	r+nj3COO/6THgt7a82KyyIE+EyGmC6QCvHKjqD+tqfe8HjnLoDphKc5kCpbKpK0D8AbYD8Z+pmC
	Cbl8KMFhZ6cNC2ucU5Jwr2M8Mae+Wtau7so9rZbZClBxwQ==
X-Google-Smtp-Source: AGHT+IFcScTYGJq80RSXa7Ft1lOZxTz6RFjl/DwtyGjCn+QwvrsleN4XHijhfme8q3TiFYNnFYwsAg==
X-Received: by 2002:a17:907:968c:b0:ab7:b390:5c67 with SMTP id a640c23a62f3a-ab7b3905d0emr644931566b.18.1739216952087;
        Mon, 10 Feb 2025 11:49:12 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773331db7sm917500066b.127.2025.02.10.11.49.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:49:11 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de5bf41652so4406378a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:49:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXa93wOfjS70lu2jDKQrIiSxechtVxdTmOM5JdjCxWrYfndnCmfrpX4HjyN7+3INo/kPkEWH/H7bbcqgAM=@vger.kernel.org
X-Received: by 2002:a05:6402:2106:b0:5dc:a44d:36bd with SMTP id
 4fb4d7f45d1cf-5de4500274cmr13498767a12.8.1739216951504; Mon, 10 Feb 2025
 11:49:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
In-Reply-To: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 10 Feb 2025 14:48:35 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9BskhHuehHLES=5WNPk2jjd=38207XsfEmFDMiF=b0bA@mail.gmail.com>
X-Gm-Features: AWEUYZnvFQWMfElhV3JVfcrxv5vOkguawqzwZra2J81VWXgm4X-CWu02f7-pmbw
Message-ID: <CAEg-Je9BskhHuehHLES=5WNPk2jjd=38207XsfEmFDMiF=b0bA@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu: apple-dart: Support locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 2:44=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> Some DARTs on Apple SoCs are "locked" at boot time, meaning we cannot
> write most of their configuration registers. Currently, we refuse to
> probe locked DARTs and do not include any in the upstream device trees.
> However, the DARTs used for the display controller are locked, so we
> need to handle locked DARTs as a prerequisite for a KMS driver.
>
> This series teaches the iommu/apple-dart driver about locked DARTs,
> preparing for a future upstream display driver. It has been extensively
> tested downstream with our work-in-progress display driver.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Alyssa Rosenzweig (5):
>       iommu/dart: Track if the DART is locked
>       iommu/dart: Skip reset for locked DARTs
>       iommu/dart: Set DMA domain for locked DARTs
>       iommu/dart: Reject identity domain for locked DARTs
>       iommu/dart: Assert !locked when configuring
>
>  drivers/iommu/apple-dart.c | 47 +++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250210-locked-dart-d7ece05f19a8
>
> Best regards,
> --
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>
>

Series LGTM, having looked over this many times as part of kernel
maintenance for Fedora Asahi Remix.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
