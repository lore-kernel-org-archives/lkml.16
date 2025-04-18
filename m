Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C7208A7;
	Fri, 18 Apr 2025 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745003274; cv=none; b=JGA6u9QonnGv1tHVs3lIwvGpJbCclSYLduAJ9C2Y/nmAR6lkSosWciuElgppbXx/aM3hzgD1OPRUDFYaTB80doOZWzFpLHR53Gnjoi9rhdEy4ZnqRlOP5+mIN5BTJYf9y4cn1Hsw1GIPJJn4uVIqpr2ujQbOR4Nm1T+voEc3Hzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745003274; c=relaxed/simple;
	bh=tqWcd10hixzs8wTyhtKKM4m2QhT7VikcJqhNN5F7h9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqNcpXeHBWy+to+AvTAppvQp0eu8v7wEiAi8nZXBSd6A24lblZ0ZLyMWvHcHcXCXBKgai1L5uD1vC6vpOCiO63Yh8ldrWXauR3g3kOovCNzdvy/HFPJw22nAy+M8JbJd1Dd3FS0eHEGWY2burDCoR5F+RFu60fxdQzHXZ/vGWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NLiwcJb/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NLiwcJb/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ejwPT+KQFt+bR8Yz3dt3U3XT2LV+JxzsHsZ1O+F9Yws=; b=NLiwcJb/hoOAq/ymhIge3e/w0r
	F8K6tz+TdUXRqBZAG7qCBfUA1fnUGMfn1HpaVrBiHPaz5bnNBFbNXgmtwdPYBo2sVbfjTDo2ZGrey
	reEk3AKkDko7ZKvHAPmMvIjxl6T2NQVQNsSWSqSzWoCRPRXtOfMZL1L10RQq6jT2uGWqxdwUOMKjh
	J+9M613f2MpbzFDOLXpYZ7rA17L7hUaYjrMeAEO2U/LS8XK2/9c52Y0718a5MthLCg9Blfn5QE5hf
	6wcFQ9lWEGmT6NuUR0g0rZLKCo5aqX1xBqhe0Ocu42hpbJLlLwI6Ufj3EIsr6sT8wGkpVq5P3jCis
	CV5mVxeA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5r3y-0000000Aeod-0vXg;
	Fri, 18 Apr 2025 19:07:47 +0000
Message-ID: <8807bdad-f41b-43d6-bbe0-af515f88abad@infradead.org>
Date: Fri, 18 Apr 2025 12:07:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: namespace: Tweak and reword resource control doc
To: Joel Savitz <jsavitz@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20250418152910.1121670-1-jsavitz@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250418152910.1121670-1-jsavitz@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/18/25 8:29 AM, Joel Savitz wrote:
> Fix the document title and reword the phrasing to active voice.
> 
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
>  .../namespaces/resource-control.rst           | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/Documentation/admin-guide/namespaces/resource-control.rst
> index 369556e00f0c..624f4dceea46 100644
> --- a/Documentation/admin-guide/namespaces/resource-control.rst
> +++ b/Documentation/admin-guide/namespaces/resource-control.rst
> @@ -1,17 +1,17 @@
> -===========================
> -Namespaces research control
> -===========================
> +====================================
> +User namespaces and resoruce control

                       resource

> +====================================
>  
> -There are a lot of kinds of objects in the kernel that don't have
> -individual limits or that have limits that are ineffective when a set
> -of processes is allowed to switch user ids.  With user namespaces
> -enabled in a kernel for people who don't trust their users or their
> -users programs to play nice this problems becomes more acute.
> +The kernel contains many kinds of objects that either don't have
> +individual limits or that have limits which are ineffective when
> +a set of processes is allowed to switch their UID. On a system
> +where there admins don't trust their users or their users' programs,
> +user namespaces expose the system to potential misuse of resources.
>  
> -Therefore it is recommended that memory control groups be enabled in
> -kernels that enable user namespaces, and it is further recommended
> -that userspace configure memory control groups to limit how much
> -memory user's they don't trust to play nice can use.
> +In order to mitigate this, we recommend that admins enable memory
> +control groups on any system that enables user namespaces.
> +Furthermore, we recommend that admins configure the memory control
> +groups to limit the maximum memory usable by any untrusted user.
>  
>  Memory control groups can be configured by installing the libcgroup
>  package present on most distros editing /etc/cgrules.conf,

-- 
~Randy

