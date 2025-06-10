Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70521A45A;
	Tue, 10 Jun 2025 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541981; cv=none; b=NPk20FaqjQG2ZipMYbYAKK/xnEgCbffc8cJvhMxwhqI1r/YhQFUgROzi6L017XrS+gaXbJRb7q4harI0JYGTpfYok1fHJKr0JFVdFmWAvHXGgs4MqMFUizDy18ZgXgOfZKP9vImSpkRVfryBE00oBworRISzcTTXn4oJeVHxdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541981; c=relaxed/simple;
	bh=WxR0KR9ErKpBzoUXcX0a3OjV7mTHm2qY5pjDC2BeBxs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n0GBXxX6DL9XAJmMln1II+Z8bh7sn2sCqKH7qFPvLAhF/2RMkw/ZLIo0NiJCRPkIyL+zG2SAJBygCITel+sg7b78BDJxgWLqWqNACP1SE0AnkWl+lWDeWli3cs7fsEGEW/ITg5eucwgsojAs5fB5XkaqgaOZvAtpr+2GHHKZYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJpzbZRo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJpzbZRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749541980; x=1781077980;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WxR0KR9ErKpBzoUXcX0a3OjV7mTHm2qY5pjDC2BeBxs=;
  b=AJpzbZRoCyGroRnMyAHo+rxSkPj6KRxsueV5mTyoKcCCf3dbIouCot1t
   1voNVLvcPHpOmd4AAvV6jVBOSfRSha48wVbKkmBMxQEjQoFeDtIoFFiCK
   OjkWr26oFVIMDdGRD1TiUYncAJQKeA6AyqmZGm6hZHhdcPiq3iDLHDetQ
   qak2FCXYmrpIp8j5GxkJw3DPA8NzQE36NTfMn3qQaQghXJsz+kRc5jb+e
   sYggYdelLRg5l78tIqkqoDTmFW6YyQ7k54sBpCIZi9RlE9Sf7KaTiG08j
   Txycp79EbDPge1mW8mohsyKvEpIFYVixWaurb1oC8tYY2eMtfN2J9rTUn
   g==;
X-CSE-ConnectionGUID: 54by2huDQK2ad4luPzU4fA==
X-CSE-MsgGUID: CewC3RAtR4ucDGlJza+IuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51780769"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51780769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:53:00 -0700
X-CSE-ConnectionGUID: 5R9dk+TPSG27Wl3G5E5ZtQ==
X-CSE-MsgGUID: saZMdOTqSlyXR6neMriIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151569291"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:52:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 10:52:55 +0300 (EEST)
To: Stuart Hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 3/5] platform/x86: dell_rbu: Remove unused struct
In-Reply-To: <20250609184659.7210-4-stuart.w.hayes@gmail.com>
Message-ID: <b2e456bb-8988-aa63-3a10-d37ba95ea786@linux.intel.com>
References: <20250609184659.7210-1-stuart.w.hayes@gmail.com> <20250609184659.7210-4-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jun 2025, Stuart Hayes wrote:

> Stop using an entire struct packet_data just for its embedded list_head.
> 
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

Thanks for the update.

I've applied all but this patch 3 now into the review-ilpo-fixes branch. 
As this patch is for-next material and I can only apply it once I've 
merged the fixes branch into the for-next branch somewhere later in the 
cycle (it'll sit in patchwork in the meantime, so I won't be forget
it :-)).

--
 i.

> ---
>  drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index 722979b19e0e..c03d4d55fcc1 100644
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
> -	list_for_each_entry(newpacket, &packet_data_head.list, list) {
> +	list_for_each_entry(newpacket, &packet_data_list, list) {
>  		bytes_copied = do_packet_read(pdest, newpacket,
>  			remaining_bytes, bytes_read, &temp_count);
>  		remaining_bytes -= bytes_copied;
> @@ -315,7 +315,7 @@ static void packet_empty_list(void)
>  {
>  	struct packet_data *newpacket, *tmp;
>  
> -	list_for_each_entry_safe(newpacket, tmp, &packet_data_head.list, list) {
> +	list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list) {
>  		list_del(&newpacket->list);
>  
>  		/*
> 
