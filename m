Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA3C22FF2B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917414; cv=none; b=omHjmmF6izp8wzkF2CPOjVj4xLI6/nHVglG7xlwiUQZemNwUylkz5DaIYgf1MQjxdKjsZ0HQUTgbPDliAQmImOzLhON4JkhZkoPoXUMUl/BmewXjAWwigMYVQy7M6HdFMOGNnVT49RD3gd3emnwo4jqIWDEoPB1a/B3AyQ5neA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917414; c=relaxed/simple;
	bh=hdYRP/ZlkZwZ6MgNBwKuzValqczEUy1hpGacpIQvX7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dktogRHjVu5B1olssjfv8+g6QzkXpiIIC6SsCUWQBnp+2oBtKqqqqmvtuBzp6Q9Gp/3LKiii7b7+9ZfOSQOrq/eKGCsLPE8sRts1mIf8+h1Bwb8F5VWEo1iXYTmyBKguTDKrT8Lbja2/fjIOW6XaV7qwi/GwSw0mJSA8YQPUbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5yIPK8h; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5yIPK8h"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3fa6c54cc1aso5302142b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747917411; x=1748522211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
        b=s5yIPK8hKKZYX4Om9GLNGNrBD7KRHd7APtqx7P6MOoqY4UwB2zKMjCdBYhnieLHavs
         qBFYuK61Za2x0HyXndR0me77wPbFcFN6pNxye+y6GsxihVME9CgwQsvMv0RkACnKf6XC
         nLspmnKqewWpyrGXBusRa6da6jhOC8SNrlGuGdEzyVchNn+dXC5RZ81oF8O9SfDDTDJb
         nzddAxujXGW6xBrrn3Wd8kqtrgOC9bjD2rGEkzKYj+OU3rasC5Ml8XHMRsjZrGTYNyzi
         sHMo85RLMdCPJL7fhMYc1IYsZY3FBXCr/9wbuBGfbWkNxvqBTpYjrh/4QtBmH3j7nXmi
         yTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917411; x=1748522211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
        b=HlRkV/PjQ6YEWLt8+tqfl5rX41dy9DsbviHnfNZQtFNT4S3hwTHYRmTsTdIniIwiQ0
         3XneuEHnbnI7gYSPyqWRbbU8gW8pfWFivF35GOW925EPs1IgxftiKLu/p4BqF52cfnN1
         RBA3ZAMyriT7Lbl2LiyD7w8xlTDy7LetjIoD1t52Up2sDC/TxqrY4Ta8sxQZ44K569zp
         XMs0zGjd7Sb+AKqEoTxRQrRa7ATrA8M+AHPu7vYbR5lrOYsy9V+Ds8Y+StFMx6NNRpCK
         82qKy5CJt5iGON6XooIIEoEoMVoaUNwkQDNpPQ/tf/q7ww9AxnzXWlS2O8VnDU50d300
         /qcQ==
X-Gm-Message-State: AOJu0YwYYtT0iHZnUG+UqjzxUV0MYW0bV5bQ2gE/IBWLi/UrgvclDETk
	fjxJ6axlgge9v/NvUxa4yfpvjot/7K8bbz//V9rL8c8eDs3kFC/Rl4GAmeE9wWJ8BMaoTfUqkQK
	4/lezPpcCzldZwApwSmQPG+XgWjv6nKSP3SKcumCscQ==
X-Gm-Gg: ASbGncuKQt2v8L+dqyvQjQrsNYfasJcMQDJqDL141kqa1/H2srIjbg9/U7mSvhN/e/r
	cifMQCzjCb+IeUe1zBGbW5y5le1akCfPs5D80IDEjq9y3fFHyfQ1wQyJUP0B6TYL3ReTLHqoRoA
	6Sr6/W03P34Fed+ETWXLCNuAszDHwAYVkp/g==
X-Google-Smtp-Source: AGHT+IFaxfBHByqapVV2RXkEPTMYtDPJFaizTF3QtPLs+N+jP8G9GyXQ9nHLQfE3byrCa1MQmfMacM+snhhkwuWXSyE=
X-Received: by 2002:a05:6808:338a:b0:3f6:a9d4:b7e4 with SMTP id
 5614622812f47-404d86f3f18mr17232381b6e.20.1747917411552; Thu, 22 May 2025
 05:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org> <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
 <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com> <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
In-Reply-To: <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 14:36:39 +0200
X-Gm-Features: AX0GCFtomK6Kj4MbJdPbWNPCFM5pduAepClCBqfPEiiU97RKWiikvixpOO2yK1w
Message-ID: <CAHUa44Hgu9DnmeGXAoFKkRBt6jFCAb6Mi5zzuuvVVSgsxDZQWA@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 1:52=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/22/25 08:56, Jens Wiklander wrote:
> > On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/20/25 17:16, Jens Wiklander wrote:
> >>> Export the dma-buf heap functions declared in <linux/dma-heap.h>.
> >>
> >> That is what this patch does and that should be obvious by looking at =
it. You need to explain why you do this.
> >>
> >> Looking at the rest of the series it's most likely ok, but this commit=
 message should really be improved.
> >
> > I'm considering something like this for the next version:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h> to all=
ow
> > them to be used by kernel modules. This will enable drivers like the OP=
-TEE
> > driver, to utilize these interfaces for registering and managing their
> > specific DMA heaps.
>
> Works for me, but it doesn't needs to be so detailed.
>
> Something like this here would be optimal I think:
>
> Export the dma-buf heap functions to allow them to be used by the OP-TEE =
driver.
> The OP-TEE driver wants to register and manage specific secure DMA heaps =
with it.

Great, I'll use that.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Thanks,
> > Jens
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>>  drivers/dma-buf/dma-heap.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >>> index 3cbe87d4a464..cdddf0e24dce 100644
> >>> --- a/drivers/dma-buf/dma-heap.c
> >>> +++ b/drivers/dma-buf/dma-heap.c
> >>> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >>>  {
> >>>       return heap->priv;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >>>
> >>>  /**
> >>>   * dma_heap_get_name - get heap name
> >>> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> >>>  {
> >>>       return heap->name;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_name);
> >>>
> >>>  /**
> >>>   * dma_heap_add - adds a heap to dmabuf heaps
> >>> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >>>       kfree(heap);
> >>>       return err_ret;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_add);
> >>>
> >>>  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> >>>  {
> >>
>
