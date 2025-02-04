Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04252080D7;
	Tue,  4 Feb 2025 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665484; cv=none; b=ZXwQKnY8kw5UmIMkCETiKCTI62JxShx81fEPHlIs8uvgqmOuWONgySUtNmlqNC8zgwgljUWxBchx1T0QPVPtoXFLi9HdSZbhtDflYTEbAly1HlNMey2dlhgkICU4njtMA9OqAfLb/wqM5MVj9Gqfst/5OmKGrEB/d34kgy+BA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665484; c=relaxed/simple;
	bh=iv/AVNgfSWY1/Vv/n1fXlzs30Cop06f31QI0gG5veQk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Du1gL+qJvGlmlkHW54n1yTXuX1ldfoArqYU2+wmU4sRaoVpZhGW7spTeGUmrfQgNA+lrNL5fRcJnDNwapNhXafAYRPe9wEZs+/DWd76Bj1cir8NarbznIKj0lcl9OZjl6frC9JKKjEJAZZOfkim8cWpBNGhyBRcp6+c9BYg5IDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwK9XeCL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwK9XeCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738665482; x=1770201482;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iv/AVNgfSWY1/Vv/n1fXlzs30Cop06f31QI0gG5veQk=;
  b=QwK9XeCLYXP2kaZYsOW1smFAvvUGnqJKM/qPuFPaEfaOe4ExF7BhiXzk
   StTRqKdN1E3TSjDYU3MKIJ1FeAgjxG5jQGbqX9yO+8l69icvfjK+1qyY7
   +2ybLJEZvTfAjho/C7TIlzkoxRIDS1HriDDQS1a31e6/23T1gEMGj8tmr
   qBMc49lM2pyLUqjUjttIdq4kM05T0JSwOXW5KnyZ+Zjb38uqRVjPMOQ9K
   ggOmCoJ6Kx5AMgInQvUrQSrmZFBxXM5RA5SEU5DRffedURLVhbn/wyZer
   OTYBmrXwIGbk6PkYu9sN2hJlEMeYHEn4B+bIlEiOrCdeov5EgSfUjGbL0
   g==;
X-CSE-ConnectionGUID: aO4sMm80TfaeEBXZrEnFnQ==
X-CSE-MsgGUID: qd3pou4HRi+On37tZ+y1CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38888121"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="38888121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:38:02 -0800
X-CSE-ConnectionGUID: /RIPVWf+SyeoojzmWMxnHQ==
X-CSE-MsgGUID: jvAVQjluRMuGqmhRlZUcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111407676"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:37:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Feb 2025 12:37:54 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: james@equiv.tech, markpearson@lenovo.com, jorge.lopez2@hp.com, 
    jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/7] platform/x86: hp-bioscfg: Use wmi_instance_count()
In-Reply-To: <20250203182322.384883-5-W_Armin@gmx.de>
Message-ID: <a02aa367-2ce8-ba6d-adc7-b91552566142@linux.intel.com>
References: <20250203182322.384883-1-W_Armin@gmx.de> <20250203182322.384883-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Feb 2025, Armin Wolf wrote:

> The WMI core already knows the instance count of a WMI guid.
> Use this information instead of querying all possible instances
> which is slow and might be unreliable.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 0b277b7e37dd..63c78b4d8258 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -388,16 +388,13 @@ union acpi_object *hp_get_wmiobj_pointer(int instance_id, const char *guid_strin
>   */
>  int hp_get_instance_count(const char *guid_string)
>  {
> -	union acpi_object *wmi_obj = NULL;
> -	int i = 0;
> +	int ret;
> 
> -	do {
> -		kfree(wmi_obj);
> -		wmi_obj = hp_get_wmiobj_pointer(i, guid_string);
> -		i++;
> -	} while (wmi_obj);
> +	ret = wmi_instance_count(guid_string);
> +	if (ret < 0)
> +		return 0;
> 
> -	return i - 1;
> +	return ret;
>  }

Hi Armin,

While it is the existing way of doing things, I don't like how the error 
is not properly passed on here. And if the error handling is pushed 
upwards to the calling sites, then this entire function becomes useless 
and wmi_instance_count() could be used directly in the callers.

-- 
 i.

