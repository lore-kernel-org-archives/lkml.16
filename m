Received: from mail186-10.suw21.mandrillapp.com (mail186-10.suw21.mandrillapp.com [198.2.186.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478D1D6AA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.2.186.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279703; cv=none; b=GjLJ63hEU06VEHJFZGa0u9O1NsqMQLucbrIBY2jssAeJvXrUyeOk23Wlj1cNZd0a5bKsCC0NW6aiYZKEYgtbQ6sEEeXkiPrEDsYSaeJrjlzk6phCftaaL8mosIOJeyk0Ju9zLiFtpyhkslXeQ6ve9nHho8lz4u9yDDlszCJrOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279703; c=relaxed/simple;
	bh=F3s/p1/tiA0lO3K4wG3IXNfTFC5xpffPvlR7tUNwSy4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Date:
	 MIME-Version:Content-Type; b=Bh8RUPKA24c7k0NCqRoMF8dMLFDCtwUeOFAwdtATFoW8qwRRxML+ERuEGiBe3XiPG7l0bZTJ2ZkvApQmzlv3ZdywbpEDmEihs+c3m7fevxnQyRg1QoeQvuwb0/ONdu0s3cDFD/vA0jP/porwIqm3L2r1DaD68aH6KW2GhOK8eOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=bounce.vates.tech; dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b=Oz49rDZD; dkim=pass (2048-bit key) header.d=vates.tech header.i=ngoc-tu.dinh@vates.tech header.b=c/XYNGMv; arc=none smtp.client-ip=198.2.186.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b="Oz49rDZD";
	dkim=pass (2048-bit key) header.d=vates.tech header.i=ngoc-tu.dinh@vates.tech header.b="c/XYNGMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751279701; x=1751549701;
	bh=3W5WXPPkdn52aUe9Wy9HcVhwmubgY5+gcpH4c7xElaU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Oz49rDZDB8dajSArmDRZ7B2P2E84euvmNLeHUdBnZZKlm62f/DN+IsUTcOzV6ANFu
	 ycMmroNpqHqTdNG+cDa26xgzKHXXvAc+rPz/kfSE5n9hyLFuGFqwx49ENAre3M5JxE
	 PK3xhYsyXaRdnxJG0hLymX2igxWdBD3qfqzF6XjtjzYWrsoK5dvy5N4v2RZK3hck8P
	 6BT9aD4iJXt5j4vdsI25eBe1HcFDNoZLcicSrtgq7o2YvzqZ1/Zc6O/KaLvzIJBGLM
	 xzrp3Nf4vD2F0IBIFB7c+RFy9YdM0vRGBwsmOXAtrrVsL3KGvu10JiZqgtV/xePmUn
	 R9lkZsNaqtvRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751279701; x=1751540201; i=ngoc-tu.dinh@vates.tech;
	bh=3W5WXPPkdn52aUe9Wy9HcVhwmubgY5+gcpH4c7xElaU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=c/XYNGMvxburOxs7t5nBB3BBVYLw9aCgvxdVtVPlMEeHt+bPnGGNh0DQUQd6bAI0C
	 aGccB775XPgjar8+fY58/Rps8I4WSo1ZCKVlwPlvwmY9FainrhBfxTMLvPpBMbB4l+
	 DFWToViErRmspUsN0K+Vk+j/Qn5HJWOQX9RYzjgtqJffxzW5cERrIaxy/jFkFv7L4l
	 JmQrFlHb1bqtr5Vak3Js0QESRT3X6XbITPkoXlGgKKlaq/I8gmf/kKwpUm8sFAZtBk
	 5EThPMUQRfrxU2SE6CE0w0Nfs++Kd+tWYfzI4ZO64wvhgodzRZPHHGvCQhx0wIB9Y2
	 1ANNZ7rbtO6Lg==
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
	by mail186-10.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4bW2bn0fTGz5QkNKn
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:35:01 +0000 (GMT)
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20xen/gntdev:=20reduce=20stack=20usage=20by=20dynamically=20allocating=20gntdev=5Fcopy=5Fbatch?=
Received: from [37.26.189.201] by mandrillapp.com id bdd349c32e824d52a659923aa125c006; Mon, 30 Jun 2025 10:35:01 +0000
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751279699533
Message-Id: <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
To: "Abinash Singh" <abinashlalotra@gmail.com>, jgross@suse.com, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Abinash Singh" <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
In-Reply-To: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bdd349c32e824d52a659923aa125c006?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250630:md
Date: Mon, 30 Jun 2025 10:35:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/06/2025 06:54, Abinash Singh wrote:
> While building the kernel with LLVM, a warning was reported due to
> excessive stack usage in `gntdev_ioctl`:
> 
> 	drivers/xen/gntdev.c:991: warning: stack frame size (1160) exceeds limit (1024) in function 'gntdev_ioctl'
> 
> Further analysis revealed that the large stack frame was caused by
> `struct gntdev_copy_batch`, which was declared on the stack inside
> `gntdev_ioctl_grant_copy()`. Since this function was inlined into
> `gntdev_ioctl`, the stack usage was attributed to the latter.
> 
> This patch fixes the issue by dynamically allocating `gntdev_copy_batch`
> using `kmalloc()`, which significantly reduces the stack footprint and
> eliminates the warning.
> 
> This approach is consistent with similar fixes upstream, such as:
> 
> commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selftest device struct")
> 
> Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> The stack usage was confirmed using the `-fstack-usage`  flag and mannual analysis, which showed:
> 
>    drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
>    drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes
> 
> Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`, the total
> frame size exceeded 1024 bytes, triggering the warning.
> 
> This patch addresses the warning and keeps stack usage within acceptable limits.
> Is this patch fine or kmalloc may affect performance ?
> ---

Have you measured the performance impact? gntdev_ioctl_grant_copy is 
called quite often especially by the backend. I'm afraid calling the 
allocator here may cause even more slowdown than there already is, 
especially when memory is tight.

>   drivers/xen/gntdev.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 61faea1f0663..9811f3d7c87c 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_copy_batch *batch,
>   static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
>   {
>   	struct ioctl_gntdev_grant_copy copy;
> -	struct gntdev_copy_batch batch;
> +	struct gntdev_copy_batch *batch;
>   	unsigned int i;
>   	int ret = 0;
>   
>   	if (copy_from_user(&copy, u, sizeof(copy)))
>   		return -EFAULT;
> -
> -	batch.nr_ops = 0;
> -	batch.nr_pages = 0;
> +
> +	batch = kmalloc(sizeof(*batch), GFP_KERNEL);
> +	if (!batch)
> +		return -ENOMEM;
> +
> +	batch->nr_ops = 0;
> +	batch->nr_pages = 0;
>   
>   	for (i = 0; i < copy.count; i++) {
>   		struct gntdev_grant_copy_segment seg;
> @@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
>   			goto out;
>   		}
>   
> -		ret = gntdev_grant_copy_seg(&batch, &seg, &copy.segments[i].status);
> +		ret = gntdev_grant_copy_seg(batch, &seg, &copy.segments[i].status);
>   		if (ret < 0)
>   			goto out;
>   
>   		cond_resched();
>   	}
> -	if (batch.nr_ops)
> -		ret = gntdev_copy(&batch);
> -	return ret;
> +	if (batch->nr_ops)
> +		ret = gntdev_copy(batch);
> +	goto free_batch;
>   
>     out:
> -	gntdev_put_pages(&batch);
> +	gntdev_put_pages(batch);
> +  free_batch:
> +	kfree(batch);
>   	return ret;
>   }
>   



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

