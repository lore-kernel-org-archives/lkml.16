Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA926182D2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688395; cv=none; b=o11FAzwx4u70i/hoX2Y7fYGE52eWVXrC7S+zJTEqeYZzMKp8M41tnsMjYuYcdWpqJAjBtOapiXrROs4va+fRq5q3fRvOU70TtEWn6d7o7VwwM7xKr49NCM8IBeGU3NfkeY5T4sNDE7uYi9XYzKEbNbW2MyD8wASR5ukExLPevXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688395; c=relaxed/simple;
	bh=aKcZlk81D6jYjElCnOb0NSRjMfS+dLmya0lsVF4OKRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmqOHXl4P9mMlbUSDAvtpqsF+fkks+FfAURkBAy0OS494rGyzzCjuFHBYiO0fjK9rI+okR6JPrpwb28xl5+StB69NLUUEAr8k7WLNHqzlYDT63L0k89NsXkusqk1FXM1GO7WxCuH08q9vxp+797z3BQImLcDERPTDnz5bp3geFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ccN+0MLB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ccN+0MLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749688392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TS6xeWOYbwuk0JPVdBkaR1TmrwKUhB4JF9sI+e4AYoA=;
	b=ccN+0MLB1TfNC2oH3RlGisMA3AAFUo+QWGXcWr48owvGuv6kLRDHVDpo48Jo9n7+pML766
	nLnhWd2KppZPnYS6GoFc9r0cHupr4M/1N6IUMcMA00XeSOvg6bFX955u5LBk6StM3s6ffp
	MWmL1FffKScFC+iWUv1j6TjaJe8kpxY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-an9tA_wVNq-xB45VmJlz0w-1; Wed, 11 Jun 2025 20:33:11 -0400
X-MC-Unique: an9tA_wVNq-xB45VmJlz0w-1
X-Mimecast-MFC-AGG-ID: an9tA_wVNq-xB45VmJlz0w_1749688390
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313c3915345so19194a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688390; x=1750293190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS6xeWOYbwuk0JPVdBkaR1TmrwKUhB4JF9sI+e4AYoA=;
        b=rEXVnnaXfBCc2fYCI8mfeL95Kdfy09ukBfqehPW8e8UCjXvTRGA+5Oziq6CkCYz+Nk
         k68BhrBiwNtKp7NQeZyK8mdAD21lB/ZbHg898HfWAYafTxKJYKK5WLApUlsyZP/6GDHY
         rBjgGSMaEBBsc1sIbrQlXX4sS8sYBzoOt757bvL4HrdXevhIGUBiFXCdmUNbL6W5dC1k
         YKxxJqxDxLfJbE8QOFxq83rfTjfifL1Sg0qXYSiQiY07FxSNxYHWnne1Yl2+qX0e2xPZ
         dfX+oUJCJQWsxSAAqlePK4lQtzRuQMAjFU5+je5X+9LImXp9uvVQSY/SdV0Md4Nmw6+2
         6ejA==
X-Forwarded-Encrypted: i=1; AJvYcCUOKpR3cn58XozVXcgSOeAxe3HzxYjDZF9iz8WMa2MsmGdMhDCRgHh0Be1CaF5qBJaoCEYapZCTosUemEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAiFFz3ZBPb0FyvNQnxzs/CEVKY3V9ospH0Lfmwt0F6CsurCD2
	cXDY4qeMWrikCGPCVk5HpEqYUBLaZf/66glKK2nodQq5TEeznPVynY+44FxqcaweXtS/+ZkvCub
	X4IUDg8zqfzf3Q3IKrDUXf9hAVKnpJdDk07+fWH07dEdQTzXcRcNOMkByyNghkS1ZDXo5g0OXDd
	HEvUfhiNMdFSVplEsUTJ7UhUigerKEXzL+j4hRzsaw
X-Gm-Gg: ASbGncsE/TJr88fD3hyYVMnoeTF99+GHJEniVmC/j6N3Pp+d77XUV77Q81a1qusY7+T
	//XA/UM2Zl/pXCt/6lgOgVRkq/Ly6768MLAggOyZSS9nopCLkxEYZiaV9S9gObyl/LwZcOEr34H
	ylrGQ=
X-Received: by 2002:a17:90b:1f8f:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-313af13d310mr6918757a91.15.1749688390156;
        Wed, 11 Jun 2025 17:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyTRqaFYPvWVQTqrpEOkluJxidkvOIKGHZ1MkJaShZvIRpabjEj4Tf1il19yGArLA+fgk6YXwQIeTjVMDmEzQ=
X-Received: by 2002:a17:90b:1f8f:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-313af13d310mr6918736a91.15.1749688389856; Wed, 11 Jun 2025
 17:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-6-eperezma@redhat.com>
In-Reply-To: <20250606115012.1331551-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Jun 2025 08:32:58 +0800
X-Gm-Features: AX0GCFsr2F7qsKMnXy1FAK1w50k70g_-gMZWuqSAzDDQbugOoplGT_Ab_pzYiUo
Message-ID: <CACGkMEsoC9g5j+GDaQGaRdGZXaCorfgP7mdhsk3cOg4BFnCcpA@mail.gmail.com>
Subject: Re: [RFC 5/6] vduse: reset group asid in reset
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
>
> Is the expected behavior with vdpa_sim and mlx.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Should we squash this into patch 3?

Thanks

