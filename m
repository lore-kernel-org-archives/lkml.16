Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4A286885
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437979; cv=none; b=qk0AD4pK3EuYggfrDwtDxAS6dj2Va3YqrTMGvTAYxmgXo9jYFYaUgU4QcWOFWgKI1yRi2diVluSqX5LanlCHfJ57T3KbVJeSEbZtXfPuysyDDQT5/MHDShzEHqeWzS157A4HSuST3xrf8gB9DQZpu1nFW7udPdHzPqjy/G9dCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437979; c=relaxed/simple;
	bh=K6H2BFUCEi2QfQRKc29UYNQrKB2mTNx4SSTK6IFQD8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSwn4/cVmO0Hn1ipMFVJuC4bVRVjsaze3FbvaQ8yTKUNMdY4DAFDhhDpQUzedBVWobjeqwROON8q50v1CB8MvFXI/RdYWCMtJJDPk/Eg6wRzlDaTwEqQuM3uUzEX0Vet6wEGskVwr9wihI46uC1p2oz/GTfBcXQ1/xIt3dJQrJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RktasItC; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RktasItC"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so5598889a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748437976; x=1749042776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDxFHQvEkH1JIzWvj5qIpEsR4Lb7D0NeMUS03kwt69g=;
        b=RktasItCAwq7jpeMemmWWxE13GUpbsAU4UUl4g63ktfU/Ty/pRahof6To9QCVqkp+P
         NEoha9Ywd6IwmlUA1Fypli0iybtZpVpoA6DaeVPwUDTTU+bRQwEkHAkYPul7jqbx+zOv
         icS/M4+rU+nNcba8JdZBUl7plEFXxa5MZC6Cv7EfaaRzoDziyAB94N0/LYX/Tm3n+z8o
         7ktVapuhN1DOKxoHDbbUvocImWlQUQDdsipR1rJrzs0ZjqCZ7pkayEMNBUb3X+CDz/O3
         8eRmm0lGNDUavPIzf9hoWDWbofD22ReCdBZNisy8pjTO0b//vXZdcWjy2lwusH8+URMn
         uWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437976; x=1749042776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDxFHQvEkH1JIzWvj5qIpEsR4Lb7D0NeMUS03kwt69g=;
        b=HquaRdOIUcVxMSSlr9Yj8YzD6ISz2mmTp2WA7OhVUHQYJBNs2VjJEUUod/b6wIcTQ7
         +XH63QBQWKDjw5FTVO4QH/ldiYhmFr2wMBAy2cFm+ykojfFmmEyIRYg5LXh5UkCr3IDp
         lZrvYL+tieP7/U7Om6XJGpZmfU29qhykjul/YplebMmsTZuX1RTmNSO34GSWyprFV9xc
         C2Artmy2BYK8zlr4VP7vJlue076vpmWNaTTnsQRt2uwgqTaAIX0GB3fsw6ozkdsIsXNN
         E2s3KP5jnBq1OIgNbFycqs9odvsIQ7fCVKOWML6oVR6/WxD3KWeKXtZwi0ZsoeBY5nLp
         OVmQ==
X-Gm-Message-State: AOJu0Yxs229O4im4VC1yUMCWNxR3H2JgRKhbEAq/IqRTk944MMsP/p0Z
	sjRJw816moqGBDNcth1bTBy60mIPKu72qwrdux/tXZQ3LgPvM4dacBbxzfGIzYMWhtat9gSd3sQ
	++2LW5N1Dz1MPkx6Fee3U1rdI5nK/ZPU=
X-Gm-Gg: ASbGncucexovYwhKu1ObgzLOpdMyd6eMT5eMcl5ZV9F9kQlp27GCZscHnK7SzR52QhI
	9KodYJLJrQF33XbFIpMgOaHV17UMfE78ubWaZprLUYBINFiPhkoUsvrE9dU4XCaL5PNWsCxFzc2
	5dnqQ5iTOlw4oxmIYQQmLUHhCc75Z202o=
X-Google-Smtp-Source: AGHT+IFhkhDVGFAANmTtdUTChqLRW2O0erNbFgfxUTwqBrgn25zK3RMdSjfzeIrEwQHrkRWadm35PCO2q/W+U2IREXg=
X-Received: by 2002:a05:6402:90a:b0:601:9aeb:3d9 with SMTP id
 4fb4d7f45d1cf-602d9bf0911mr12054019a12.20.1748437976241; Wed, 28 May 2025
 06:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2e6ec46b8d5e6755be291cec8e2ec57ef286e97b.1748356035.git.mst@redhat.com>
In-Reply-To: <2e6ec46b8d5e6755be291cec8e2ec57ef286e97b.1748356035.git.mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 28 May 2025 09:12:42 -0400
X-Gm-Features: AX0GCFs6Nw5SDcEM0_7E5W7keZ9RJNrn9CqAZhQPdhLm4jHtE_pv_-tpv8ft8nI
Message-ID: <CAJSP0QV1OfRb8K1yA5rKe_SybpbdETanL+XgcGJ6hhpyHB8RBw@mail.gmail.com>
Subject: Re: [PATCH] virtio: document ENOSPC
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Parav Pandit <parav@nvidia.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 10:28=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> drivers handle ENOSPC specially since it's an error one can
> get from a working VQ. Document the semantics.
>
> Reported-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
