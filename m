Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212538B;
	Fri, 30 May 2025 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748592192; cv=none; b=TsnjNjgHGBl51aKW7er6nLkJUUlqjVkQumhMg50lyT+czwUN4cylGlrwqZff5o4EU63bprWjeqkpC8qnLCP2UkQA/D/uBLKooGwi2Hv/ZxXTkIJw11Bi0n845ZwlTkLyUxyCeW/zmy0b+AOnC07YelmBEc7in86l6k/V4opa29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748592192; c=relaxed/simple;
	bh=/3ip+9z66tdC7aFsRMDA8XFR3EVpsy2dAXc+wOoLdoU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HnpV9H69OVE1McxVEZkcQL9E+QQMwGNj0M/nmsMQANwoTe68Vb7syvKD1ejCRVyN22M1CKtW+NUKlU7V8B7JUCKRT2ELjv5RbVyogYB/E2IALJ7PKqoTNPw/JrNxAiw/csmgAvxrHMjMHBs3ETKxUJE+i3LjVWOr7vlpbl5oD4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7vGkx7Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7vGkx7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748592191; x=1780128191;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/3ip+9z66tdC7aFsRMDA8XFR3EVpsy2dAXc+wOoLdoU=;
  b=S7vGkx7QqJHiw/mhHK8wkbuPjVQXqXfOXw1P/hoZuYJx9dhhs+EvbfJB
   aJZy+ZM+aiYttJSgYTir8RzVHvK8QnBfBb+qUOn43rze6yMVAhcHSqyer
   1y4BofjOei660zfvDx08nBn3jzWrrPn6XCtgEkKNPPBYqqIWik7LVVqo0
   cS3UVp5HxX5pqV8VTqkG5skzXJUA80KmEdtHJDeU4P9muYEtpy+Lhxe1u
   nKy/zafeSM0msViUqoWX2GgLJq0yQLtfjAH/Stc5ZolI6QYVMB1YaPhGJ
   yvfRQaDnGutXWpx86/Ek6bXElzWEeOifdNp5Ne0Areg2Ytm/ki5ZThBbq
   A==;
X-CSE-ConnectionGUID: CJ1clejrT+CzSV7p2bA4lg==
X-CSE-MsgGUID: wfELXmiqSeKfdEdWqWOPFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50729804"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50729804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:03:10 -0700
X-CSE-ConnectionGUID: 4nNpK5sdSVSNZqrecFI/vA==
X-CSE-MsgGUID: 5t3IhpMQRV+GMqJKZurJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="166986441"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:03:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 May 2025 11:03:05 +0300 (EEST)
To: Stuart Hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86: dell_rbu: Stop overwriting data
 buffer
In-Reply-To: <20250529202758.8440-4-stuart.w.hayes@gmail.com>
Message-ID: <ad0301a0-f45f-900a-028d-dff5e08b9525@linux.intel.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com> <20250529202758.8440-4-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 May 2025, Stuart Hayes wrote:

> The dell_rbu driver will use memset() to clear the data held by each
> packet when it is no longer needed (when the driver is unloaded, the
> packet size is changed, etc).
> 
> The amount of memory that is cleared (before this patch) is the normal
> packet size. However, the last packet in the list may be smaller.
> 
> Fix this to only clear the memory actually used by each packet, to prevent
> it from writing past the end of data buffer.
> 
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

This still doesn't have Fixes tag? If it writes part the buffer, there 
certainly should be one in this one. Did you perhaps add it to a wrong 
patch?

> ---
>  drivers/platform/x86/dell/dell_rbu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index c03d4d55fcc1..7d5b26735a20 100644
> --- a/drivers/platform/x86/dell/dell_rbu.c
> +++ b/drivers/platform/x86/dell/dell_rbu.c
> @@ -322,7 +322,7 @@ static void packet_empty_list(void)
>  		 * zero out the RBU packet memory before freeing
>  		 * to make sure there are no stale RBU packets left in memory
>  		 */
> -		memset(newpacket->data, 0, rbu_data.packetsize);
> +		memset(newpacket->data, 0, newpacket->length);
>  		set_memory_wb((unsigned long)newpacket->data,
>  			1 << newpacket->ordernum);
>  		free_pages((unsigned long) newpacket->data,
> 

-- 
 i.

