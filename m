Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551D2AE6F;
	Fri, 30 May 2025 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591677; cv=none; b=gj1lMwo2qsQ/V9jBMYTas+i5hDR4ig7VkFmzcVG0NaZKyjn8IuC5HCJI52/KZxHQWhkS2UnmgwFogc4P9/9lz/9BBsvKokX4OHyqCZ2VQ0bh0jpNvAwVT/qNxa+KejW2qImBSaBE5z/Mc7QHrriRju30RBLQCKBHSBur9Vs14xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591677; c=relaxed/simple;
	bh=eJk6U97j4Cdh5nBfahL6CHsEtxMaisXTKlbSbz6RKnU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iuivLjJvS6QruZpqK21GRdE9KkGdkpUjFvXM6kbJWKxyTOAACHxjdQGDCudvBA43/U25KBtIYTCkxF513Pkh22ZfWjeYQ+iaRXmcVhHpIzjE7qwMwcV1z52e6ZKCzODnHxmxdUXVB9gDQpT1y8lppmOJhc99tYBWmjQW+sPL9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eln8R0q6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eln8R0q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748591675; x=1780127675;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eJk6U97j4Cdh5nBfahL6CHsEtxMaisXTKlbSbz6RKnU=;
  b=Eln8R0q6E+eM+1lBigc7XFKLU/vgxKfpuSmJc52CVFe6J7dG+DuEX+Kv
   Muige0tyVlUzsYTXKFf7LaBK96scpZPEh04nWCj9n8EtMt5458AcBgIjw
   gQkEwlEZidV5VNhsZO3xw4i0LH2zJO5z6/h475YmN+1YyE/MEn4zV1nKs
   Y8f4Ms2/mSVwumKir+lGgdhyMG2JuAPMvxIH0OnluFQB0eMdWriY5N0H3
   ysvrE/MYjwL5KFbfB6DUwguLzwSKN9wVkT29mflFJKxRe56viB7QdTbBR
   P6bvJvGuLiEpsRMoUnlRMKdIdu8vOAIVIqMDuhxhwC79GeScczPQ/JFF7
   w==;
X-CSE-ConnectionGUID: RoF1p9/zThayUxceRmN2wg==
X-CSE-MsgGUID: dfkeFuGHQvOFLScCLOXypA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50373970"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50373970"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 00:54:34 -0700
X-CSE-ConnectionGUID: G1YyP1mfQjG7cWX7/6GdDA==
X-CSE-MsgGUID: RIdpZUmwTpy8E6dWJCtpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148951718"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 00:54:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 May 2025 10:54:30 +0300 (EEST)
To: Stuart Hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/4] platform/x86: dell_rbu: Fix list usage
In-Reply-To: <20250529202758.8440-3-stuart.w.hayes@gmail.com>
Message-ID: <d7adf2ca-0cd7-99eb-9be1-a2b37fa8445e@linux.intel.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com> <20250529202758.8440-3-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 May 2025, Stuart Hayes wrote:

> Stop using an entire struct packet_data just for the embedded list_head,
> and fix usage of that list_head.
> 
> Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code list_for_each_entry*()")
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

Isn't this just refactor so Fixes tag for this commit is not warranted?

> ---
>  drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index 7b019fb72e86..c03d4d55fcc1 100644
> --- a/drivers/platform/x86/dell/dell_rbu.c
> +++ b/drivers/platform/x86/dell/dell_rbu.c
> @@ -77,14 +77,14 @@ struct packet_data {
>  	int ordernum;
>  };
>  
> -static struct packet_data packet_data_head;
> +static struct list_head packet_data_list;
>  
>  static struct platform_device *rbu_device;
>  static int context;
>  
>  static void init_packet_head(void)
>  {
> -	INIT_LIST_HEAD(&packet_data_head.list);
> +	INIT_LIST_HEAD(&packet_data_list);
>  	rbu_data.packet_read_count = 0;
>  	rbu_data.num_packets = 0;
>  	rbu_data.packetsize = 0;
> @@ -183,7 +183,7 @@ static int create_packet(void *data, size_t length) __must_hold(&rbu_data.lock)
>  
>  	/* initialize the newly created packet headers */
>  	INIT_LIST_HEAD(&newpacket->list);
> -	list_add_tail(&newpacket->list, &packet_data_head.list);
> +	list_add_tail(&newpacket->list, &packet_data_list);
>  
>  	memcpy(newpacket->data, data, length);
>  
> @@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t * pread_length)
>  	remaining_bytes = *pread_length;
>  	bytes_read = rbu_data.packet_read_count;
>  
> -	list_for_each_entry(newpacket, (&packet_data_head.list)->next, list) {
> +	list_for_each_entry(newpacket, &packet_data_list, list) {
>  		bytes_copied = do_packet_read(pdest, newpacket,
>  			remaining_bytes, bytes_read, &temp_count);
>  		remaining_bytes -= bytes_copied;
> @@ -315,7 +315,7 @@ static void packet_empty_list(void)
>  {
>  	struct packet_data *newpacket, *tmp;
>  
> -	list_for_each_entry_safe(newpacket, tmp, (&packet_data_head.list)->next, list) {
> +	list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list) {
>  		list_del(&newpacket->list);
>  
>  		/*
> 

-- 
 i.

