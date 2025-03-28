Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22DE4C83
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167717; cv=none; b=pvM+++BBhast2h/b4yADzi2dJKL5zSEG4WeOGOm5nJR0F0oIs9k5S7+SYr/L7jCkomZGYDUZalvyMw9qwy6Ouc4CtSHvODw1N5i9ozH3MDpvjeAN/KTNXyM1hv402C6AjoIqKSXjmvQ9lG14JSoWTsAjLk3jOeFf12ctKbWixoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167717; c=relaxed/simple;
	bh=JYGnLp0TGOJvpDU9M+j2GDHjeyyPOC5kt2WX0B2jov8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD0d3KsfjkPk8ioVbui/LitgyOCI0SotdB0t47w8ROAI6EJbRsZ4RV38d9TNk3VkyKBcNdsCP7DsvxXNi0vVvXTYqTE0/wVMsbXk3Yd3pvYKWJ8ly844TPijIwfXxDFvfJfxbgRyS7osC/3A5m2Pm63AtPoIvkMovPk/dEJk7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nq9YC6O8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nq9YC6O8"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0e135e953so233161885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743167714; x=1743772514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRj8ioRiebRI4JeEI/9NspVZnN/z9apivdHKZhtjWXI=;
        b=nq9YC6O8WtXcsgGUvgolYgTexVeFC9LLzBmKAViAzJzGhBbio24t53WxfQrq5UC5UK
         RFsYFoumautEq2UpKbeSerhCKJS/6znQWlx3d39UcNZrDJJbnUvDhoQR/UflmQFyXmae
         qcmivD8OHQU6FQ7uz7Qb2Tn4wefSXnE7G0+ue1qDxH03f1eIlTyK4fTW03u+NVo70GJr
         dc+pCHgjeSTaNBKTe3ApiVZvVqYgMOG9BIe3e0EAv/S34Rh9YLDGC/zeQasIHwezBo6m
         XHj2CLb1RJhSzUThmjX7vD/GgwG+7k5RHBUCee71KjQqmQbiloM+xsQED82yL/iLPSMJ
         +ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743167714; x=1743772514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRj8ioRiebRI4JeEI/9NspVZnN/z9apivdHKZhtjWXI=;
        b=c6dCYkvlDT2bumQIloROQ70eaxohblBrTH38T+CHhlPdTWGkXOfnlRoVFVOd64Xi5J
         nVXfQSaPSgZv/8Dvqm+l1ESpAJE6AK6OE5BGqZTMsAOHqieAa7H66tCAXAsD4vGSz907
         FoDBbXKGjumcoA1uflzsvz5J5y98xflkuMtY9mZ/U6Z9KyTuT+ipeSTTWLwwlZlsEp0g
         w0HnvVBlgXvk2i+C2Qp3QgkdxOWcNaNMC0WPjQUPLYke/eHXRKNKoHU7ccnhUWGqpgHo
         9Dxmyv2S91q1keLdjgtZuKepv/M+PpAFXnqxPRD4q0KHmtsXKaUh4jxPQ5FoQCi4PDcc
         GjMg==
X-Forwarded-Encrypted: i=1; AJvYcCX96riIT1RMYj5OM+nSZYpazGGcpe78jqXiNsmt5zMIIdFsjko0YEfukYCs9myFNW/9hmMvTXLrpohD9WM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdPncFbCdzztEYDPAL4letazkD0JCtTHF6ZkbJJl1rFF3T3TL
	WiY0qAjY9/zMVlidIxdNxW+7h5l4g00mKUhr3L+t8gv50ORSxb9gFsz6SnUKAl0=
X-Gm-Gg: ASbGncvHIHgkpFQT4SuoBarkxuTbaIfJnf7UIQ6r6VSAkYd5nelPQnknZUVixCfwXbj
	s6gQwzaShbsKxKlVUHu20ev27YkkVrh55swJucSMVtw41MBiBG3MuagCwciLNbQlR1q/OYqf0As
	t8lbNuc2Z3omkl2nkpRXviBCYEpZliT9qQocYURMVjeyCo6pOq35cmyWrwGTp7TosSJ3iHoKrTg
	kAau95wKbJmFjVTgjEoqgkRITBhBLOGmWPCFwnl9xouMv9J9iClzhaCcaUK3o7Fn4Qopl72JXuE
	fReObFLVjSkqEQz7xPXCq4tA/ebrNgVrxGvztyCQu7EC3C6HdDvDs0xWlkYVtPoJnLBdUg/EY5A
	xIVo62Lrmm3+eqxTxfxHo4W8=
X-Google-Smtp-Source: AGHT+IHiZVeroHAFbsoVkxOS1MajD2OVU1qJtDqYeoU+K++Vl/n9t5niY7i8b0f1RlqFrV3CylQWXA==
X-Received: by 2002:a05:620a:444c:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7c5eda82c93mr1166935485a.53.1743167714348;
        Fri, 28 Mar 2025 06:15:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764e55sm116187285a.89.2025.03.28.06.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:15:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ty9YH-000000005SN-1CtM;
	Fri, 28 Mar 2025 10:15:13 -0300
Date: Fri, 28 Mar 2025 10:15:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Patrisious Haddad <phaddad@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Bloch <mbloch@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
	Moshe Shemesh <moshe@nvidia.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/mlx5: hide unused code
Message-ID: <20250328131513.GB20836@ziepe.ca>
References: <20250328131022.452068-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328131022.452068-1-arnd@kernel.org>

On Fri, Mar 28, 2025 at 02:10:17PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After a recent rework, a few 'static const' objects have become unused:
> 
> In file included from drivers/infiniband/hw/mlx5/fs.c:27:
> drivers/infiniband/hw/mlx5/fs.c:26:28: error: 'mlx5_ib_object_MLX5_IB_OBJECT_STEERING_ANCHOR' defined but not used [-Werror=unused-const-variable=]
> include/rdma/uverbs_named_ioctl.h:52:47: note: in expansion of macro 'UVERBS_OBJECT'
>    52 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
>       |                                               ^~~~~~~~~~~~~
> drivers/infiniband/hw/mlx5/fs.c:3457:1: note: in expansion of macro 'DECLARE_UVERBS_NAMED_OBJECT'
>  3457 | DECLARE_UVERBS_NAMED_OBJECT(
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> drivers/infiniband/hw/mlx5/fs.c:26:28: error: 'mlx5_ib_object_MLX5_IB_OBJECT_FLOW_MATCHER' defined but not used [-Werror=unused-const-variable=]
> include/rdma/uverbs_named_ioctl.h:52:47: note: in expansion of macro 'UVERBS_OBJECT'
>    52 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
>       |                                               ^~~~~~~~~~~~~
> drivers/infiniband/hw/mlx5/fs.c:3429:1: note: in expansion of macro 'DECLARE_UVERBS_NAMED_OBJECT'
>  3429 | DECLARE_UVERBS_NAMED_OBJECT(MLX5_IB_OBJECT_FLOW_MATCHER,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> These come from a complex set of macros, and it would be possible to
> shut up the warnings here by adding __maybe_unused annotations inside
> of the macros, it seems cleaner in this case to have a large #ifdef block
> around all the unused parts of the file, in order to still be able to
> catch unused ones elsewhere.

IDK, I'm tempted to revert 36e0d433672f ("RDMA/mlx5: Compile fs.c
regardless of INFINIBAND_USER_ACCESS config")

I don't think that was so well thought out. The entire file was
designed to be USER_ACCESS only because it uses all this mechanism.

#ifdefing away half the file seems ugly.

Jason
