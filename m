Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED676204F66
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518662; cv=none; b=cf9MjkA0qpIJtdK2HQ3vqwTqabj/oH3VQuTbmvlIqa3Z9tGdPga/8/IL6kz1yH+Z1lYfu7M7bz5hMGke0ZU2eSXRe7HXCu3JXBDiDijABGu/3six97vwiLbfLikQ+COW5OgSLPFx4lgO57zoYIZpNOxY2zFtLVgUArJeyc9tJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518662; c=relaxed/simple;
	bh=eiIdxMyFX8RWJTV9imHd+E2JMVAxGUjJHomwrwPuLMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytw/j3/ey/k2Yu7yTCg2pnFEm3QKumggE7/EJpXQxYjZ+YA4ECtuzEmo1CNzsgPPriCQ312iT3XqdL3gOy9KvTjurtmNmLYTUcn0ouS/pLyCvAifQgJg4OEZVCwKlax1EbC+tY6NO+nediC+voTwVHM/QHITcdfJdtnOSp0+uLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VUnYkLWm; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VUnYkLWm"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e39d1db2so331654485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743518660; x=1744123460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7FWXvvIBXjd612osNxdIWGLZO1JiputvQXiNVM/ceGs=;
        b=VUnYkLWmn8QDgsZ+Nc8mjvjH224Hz+qQkdxk1pv3o3plsYGLdJeEimY3rjvGUrfALo
         9eN6IHxSkodixx6gbRmAnNvwPmTf5NrcMfzuuaevFw/N3ZDqSG1fQNTCTAzU2C//fKKZ
         Zf4B6xQMAEp1R75FmS6j6g1bqjippmaRH/nRARNr/HsiFPnfpknMb9OqvF9nNLwFy6fU
         zx3a+fqEB+92AIyzJTuk+ms/HUyAh0hLofkdmtfVNkEsRO5X1X2SGPG0kERPfDAght98
         LNrrDy0o5pBegSgj53wijsBwj4TxCXaefQWFsEMdNR2u4ohtYiwqOziDEhgnAb4GDBWG
         nP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518660; x=1744123460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FWXvvIBXjd612osNxdIWGLZO1JiputvQXiNVM/ceGs=;
        b=w9RBOvLW5q7hXhY0hJus42RGsZlZSEJcmxLsJgHllKHsQkE/HAXgCJ86AslS0f9nLp
         zAKD8zV6R2DeXPEElezCWHVC0IKL1Byea9Bmcg9o1yoi14wcFuZvCAl6gdOAO4eaa02J
         I0VzIXU/4qU+rPqTMvlWAwe5cjb2ifklsxV4tAIM0FkD8xlm8lGVFo2jBDKQpf3Q83Dx
         1eaJAbPXuB1fhwHjYEc5bkfUX2Z+kmIOtv8o3Bb9IiTTFVm8jjMQgtZPg/PH2XlqEtOE
         5v6z5BnXMpa4KYPO52pzWgkCzLN8LP+vprTqVp1xZt5onEWvoOQ4ncEfQblHn4tZ1I2R
         uWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiLEMxfzH8CIzDqboTrQN5BNhGaQjt7MSLL3IKPhvdhkmea2gliWaF3lQ+cHAy2d/+DsLO2PNT/Ax/EAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/tUFjf+fEmMojK2Ak2w40/C70V58KahNoYIIxAvCm9dLR+fGh
	AanQr6qWOsxPbDYPTQ9TjjYTOqoWtmQzobPAXzanoGtvM3hqhz8M7ahkDX7JNJA=
X-Gm-Gg: ASbGncuWQQMUhmAsftKYQq2JOiz29YUUz9DeRrAMsOrPt4IaSJ7HKKsmn9WtC6uhDpk
	D5RLMhlUKo6xA3vx+PIoMXFapENW072RvlTOxM/rkW4QdjFg/AN55rsAlNd+AtSwoL/yJicvZH8
	9GQIf5oIpcBZrCkQF6TJWaYqefCyAjtOOYPa07WkRJjtdljaM06kPrE4zVOOxDEigVuP1QLhErX
	4ljeOpCNruhL/bE5fp54DIUlOLAyY6j+IUodzOUWFeMjRzGwNObpvjv1SVePCIGzqa8TO2BgpuH
	3ibSLD3HdX/o1HZYH/Y+/Z35wTPZTUjMyclaRb8nObmG5nhxh2DwkmjX8p/erKN6e26tQHSPPQG
	2sYf3IcgR6UkvHbhDQUw3xQbr6019pxHeBBkuPw==
X-Google-Smtp-Source: AGHT+IHWAViNpa9KNwFeFv6Mk2L5a71FCOjF9YatoVlMWR+lTPKcPhRsuUJPd37s2vaScZLIZyzR/g==
X-Received: by 2002:a05:620a:4492:b0:7c5:5286:4369 with SMTP id af79cd13be357-7c69072eecemr1663920685a.28.1743518659907;
        Tue, 01 Apr 2025 07:44:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9627e9bsm62509246d6.15.2025.04.01.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:44:19 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:44:17 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dan.j.williams@intel.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com
Subject: Re: [PATCH] DAX: warn when kmem regions are truncated for memory
 block alignment.
Message-ID: <Z-v7waimV3OZq_1H@gourry-fedora-PF4VCD3F>
References: <20250321180731.568460-1-gourry@gourry.net>
 <88bce46e-a703-4935-b10e-638e33ea91b3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bce46e-a703-4935-b10e-638e33ea91b3@redhat.com>

On Tue, Apr 01, 2025 at 11:47:32AM +0200, David Hildenbrand wrote:
> 
> Can't that be done a bit simpler?

Yes, this is better, lets do this.  Thank you!

> 
> diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
> index e97d47f42ee2e..23a68ff809cdf 100644
> --- a/drivers/dax/kmem.c
> +++ b/drivers/dax/kmem.c
> @@ -67,8 +67,8 @@ static void kmem_put_memory_types(void)
>  static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
>  {
> +       unsigned long total_len = 0, orig_len = 0;
>         struct device *dev = &dev_dax->dev;
> -       unsigned long total_len = 0;
>         struct dax_kmem_data *data;
>         struct memory_dev_type *mtype;
>         int i, rc, mapped = 0;
> @@ -97,6 +97,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
>         for (i = 0; i < dev_dax->nr_range; i++) {
>                 struct range range;
> +               orig_len += range_len(&dev_dax->ranges[i].range);
>                 rc = dax_kmem_range(dev_dax, i, &range);
>                 if (rc) {
>                         dev_info(dev, "mapping%d: %#llx-%#llx too small after alignment\n",
> @@ -109,6 +110,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
>         if (!total_len) {
>                 dev_warn(dev, "rejecting DAX region without any memory after alignment\n");
>                 return -EINVAL;
> +       } else if (total_len != orig_len) {
> +               dev_warn(dev, "DAX region truncated by %lu bytes due to alignment\n",
> +                        orig_len - total_len);
>         }
>         init_node_memory_type(numa_node, mtype);
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
