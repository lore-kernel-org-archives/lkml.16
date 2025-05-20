Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86E24728A;
	Tue, 20 May 2025 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749722; cv=none; b=t8abUY6P2j5XInj3j1iXJLkyVuITsQqGdoBt2wGQ4WWS6cJ4ml+zo6riA1DSLW/O07QgD95IxjPA1w/d3q2L7z5eClmX+isT2A2GdvwZAtkh9klPJkPN7H3z+cuvql7ldyTjZch9NjynZGjHGH/js+ySLQpQXaLrqTxRSkGLAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749722; c=relaxed/simple;
	bh=iygAvbmKh6dIuYS33fv3jjQnxcbHrBReM73qTZx4BJ4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gj4oA1vvbvvoZzU4GTeJ4wcO+S0RqgzOpuxg1nm9r9Z4/yFXkuuou/gIhRXsPW1IX1UXogA11820VCxAXab3k+m0UCPuUnb7jyQT35N8KcCRtflrxN+822qCLgsQmjNoY7rgFddOSSBnTVrTgTE4ZkLxLFx7Yj9zzFiVSJ6RuTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7x5e5mJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7x5e5mJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747749720; x=1779285720;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iygAvbmKh6dIuYS33fv3jjQnxcbHrBReM73qTZx4BJ4=;
  b=H7x5e5mJnNYb6l6C9qjZ7kUP+P3PVtRWrqFwV6WEH3CUvU/lISnprx6E
   2xG3NS/UaL0PW22i8xjSCuYa4XO5hvPKk97H2Idt2mHDtPABVlTWd3yXZ
   eJkvQRQniErZTTxs3yyCewn2sEh7X/kfisQ0x5S6jGV02yakueMF4HI3V
   ATTGLDxmVb96mgOsp9EJl2FbNqnNuM61iDa3cxMv6wxhyEgc6O+aBpEsG
   PhwRPAi8SVUgk8UI+b8fVHHishexKKuNYu1EFbIJZ8CfiR9uWQy9H7X5m
   mWeJjQZX0V0Rl+SMCQN2GhSz5i4ECnDh/9sulq9VDmC/2Un/rMia6slxE
   g==;
X-CSE-ConnectionGUID: +myJu97yRJeKx+lHZfvmGw==
X-CSE-MsgGUID: XIf7ncS8QOWj4x0DraYaHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49669673"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49669673"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:01:59 -0700
X-CSE-ConnectionGUID: 44P5hnxsQ+GNkjwKcwFHTQ==
X-CSE-MsgGUID: n5hyRiSRSlSt5qEwKiZyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139586729"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:01:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 17:01:53 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 07/15] platform/x86/intel/vsec: Add new Discovery
 feature
In-Reply-To: <20250430212106.369208-8-david.e.box@linux.intel.com>
Message-ID: <56f56bdd-80be-d140-1b9b-6c1d75df252f@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <20250430212106.369208-8-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, David E. Box wrote:

> Add the PCIe VSEC ID for new Intel Platform Monitoring Technology
> Capability Discovery feature. Discovery provides detailed information for
> the various Intel VSEC features. Also make the driver a supplier for
> TPMI and Telemetry drivers which will use the information.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 26 ++++++++++++++++++++++++--
>  include/linux/intel_vsec.h        |  4 +++-
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 5374abef0b48..e3ec17a53e62 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -65,6 +65,9 @@ static const char *intel_vsec_name(enum intel_vsec_id id)
>  	case VSEC_ID_TPMI:
>  		return "tpmi";
>  
> +	case VSEC_ID_DISCOVERY:
> +		return "discovery";
> +
>  	default:
>  		return NULL;
>  	}
> @@ -83,6 +86,8 @@ static bool intel_vsec_supported(u16 id, unsigned long caps)
>  		return !!(caps & VSEC_CAP_SDSI);
>  	case VSEC_ID_TPMI:
>  		return !!(caps & VSEC_CAP_TPMI);
> +	case VSEC_ID_DISCOVERY:
> +		return !!(caps & VSEC_CAP_DISCOVERY);
>  	default:
>  		return false;
>  	}
> @@ -140,6 +145,8 @@ static bool vsec_driver_present(int cap_id)
>  		return IS_ENABLED(CONFIG_INTEL_SDSI);
>  	case VSEC_CAP_TPMI:
>  		return IS_ENABLED(CONFIG_INTEL_TPMI);
> +	case VSEC_CAP_DISCOVERY:
> +		return IS_ENABLED(CONFIG_INTEL_PMT_DISCOVERY);
>  	default:
>  		return false;
>  	}
> @@ -392,6 +399,9 @@ static int get_cap_id(u32 header_id, unsigned long *cap_id)
>  	case VSEC_ID_TPMI:
>  		*cap_id = ilog2(VSEC_CAP_TPMI);
>  		break;
> +	case VSEC_ID_DISCOVERY:
> +		*cap_id = ilog2(VSEC_CAP_DISCOVERY);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -677,14 +687,26 @@ static const struct intel_vsec_platform_info mtl_info = {
>  	.caps = VSEC_CAP_TELEMETRY,
>  };
>  
> +static const struct vsec_feature_dependency oobmsm_deps[] = {
> +	{
> +		.feature = VSEC_CAP_TELEMETRY,
> +		.supplier_bitmap = VSEC_CAP_DISCOVERY

Missing a comma.

> +	},
> +};
> +
>  /* OOBMSM info */
>  static const struct intel_vsec_platform_info oobmsm_info = {
> -	.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_SDSI | VSEC_CAP_TPMI,
> +	.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_SDSI | VSEC_CAP_TPMI |
> +		VSEC_CAP_DISCOVERY,
> +	.deps = oobmsm_deps,
> +	.num_deps = ARRAY_SIZE(oobmsm_deps),
>  };
>  
>  /* DMR OOBMSM info */
>  static const struct intel_vsec_platform_info dmr_oobmsm_info = {
> -	.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_TPMI,
> +	.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_TPMI | VSEC_CAP_DISCOVERY,
> +	.deps = oobmsm_deps,
> +	.num_deps = ARRAY_SIZE(oobmsm_deps),
>  };
>  
>  /* TGL info */
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 71067afaca99..a07796d7d43b 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -16,7 +16,8 @@
>  #define VSEC_CAP_CRASHLOG	BIT(3)
>  #define VSEC_CAP_SDSI		BIT(4)
>  #define VSEC_CAP_TPMI		BIT(5)
> -#define VSEC_FEATURE_COUNT	6
> +#define VSEC_CAP_DISCOVERY	BIT(6)
> +#define VSEC_FEATURE_COUNT	7
>  
>  /* Intel DVSEC offsets */
>  #define INTEL_DVSEC_ENTRIES		0xA
> @@ -33,6 +34,7 @@ enum intel_vsec_id {
>  	VSEC_ID_TELEMETRY	= 2,
>  	VSEC_ID_WATCHER		= 3,
>  	VSEC_ID_CRASHLOG	= 4,
> +	VSEC_ID_DISCOVERY	= 12,
>  	VSEC_ID_SDSI		= 65,
>  	VSEC_ID_TPMI		= 66,
>  };
> 

-- 
 i.

