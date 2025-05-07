Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4DB4D599;
	Wed,  7 May 2025 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622954; cv=none; b=FeE9GQoB690sp9MqIIJdfbVWdCJjDg7YXhoTc6+pFt2+8lqa5zV8Tgt6astBUocVBhdUwJQ+zV2JPcNg/cAYf9f4RMWTwAKm6r6Qn5N8b575jWbBiycClTqIP9b8464oj5OXPSPxk6mS/BQLMR3y8BCRvrvhWzwl/6w4HbmS694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622954; c=relaxed/simple;
	bh=qE7M6OpUia9/onnQiSQoD75l22dxMM6R4Wm3VSbhC0I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DLGU1zwhdFDn6s4A6ZrSYxwKgOyoNgxuqOx1CZ0Iwuswseq0CjsBUsqSDfmSDvOCMfkCK0rMCcexvU8Tjcbh1oLqFmoNPjVRPmXARcZzmdWn1ApXm06nVBbkk+w4zYuyhy/MxtdLel4TLq8AdIWarvWCMN0akP/kHuSmaZRAAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwdBDLqx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwdBDLqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622953; x=1778158953;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qE7M6OpUia9/onnQiSQoD75l22dxMM6R4Wm3VSbhC0I=;
  b=RwdBDLqxpsZ2ba14T2SfQnjppGhPmZ75dXwPaHXsPP7+jtzY9nhqfEro
   hBDtbWzC5orD4A4tU3mWDDD06bGSQpqrtE7mZWkIdTKBnYMcYgkJBNnQI
   SDjJNch5GQWOZbZo2hfr/gXBBHI7hOY3dx2Q64GjEdyjciR9sJtR1RMzx
   KH5eIHxKnzsd9piPBr/25uczR1TIfH4S/Y/8acSgVwLKqkpKt2IFhm2tr
   CgbXzTylahrRu+eJPJ82uHeENJmiSlrxGqAeVolj9bhG3wfBRDG93XURX
   JJZCWwECG9jnpjdFOucxQQok1z4j12LKKm7VJPJmlszZWqoCV4a//fQSx
   Q==;
X-CSE-ConnectionGUID: a/rH2vNFQc+11plhLME0Ng==
X-CSE-MsgGUID: nbiGngS3QV+PZ2QUUtrjZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="35984727"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="35984727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:02:28 -0700
X-CSE-ConnectionGUID: xIwVlGjpQ7aPtyPIYbP3TA==
X-CSE-MsgGUID: j/vp/eawTISFxH490zN08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135815287"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:02:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 May 2025 16:02:22 +0300 (EEST)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] platform/x86/intel-uncore-freq: Add attributes
 to show agent types
In-Reply-To: <20250428170316.231353-2-srinivas.pandruvada@linux.intel.com>
Message-ID: <d80e1c91-64c4-8942-921a-91c78b6cbf05@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com> <20250428170316.231353-2-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Srinivas Pandruvada wrote:

> Currently, users need detailed hardware information to understand the
> scope of controls within each uncore domain. Uncore frequency controls
> manage subsystems such as core, cache, memory, and I/O. The UFS TPMI
> provides this information, which can be used to present the scope more
> clearly.
> 
> Each uncore domain consists of one or more agent types, with each agent
> type controlling one or more uncore hardware subsystems. For example, a
> single agent might control both the core and cache.
> 
> Introduce a new attribute called "agent_types." This attribute displays
> a list of agents, separated by space character.
> 
> The string representations for agent types are as follows:
> 	For core agent: core
> 	For cache agent: cache
> 	For memory agent: memory
> 	For I/O agent: io
> 
> These agent types are read during probe time for each cluster and stored
> as part of the struct uncore_data.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> v2:
> No change
> 
>  .../uncore-frequency-common.c                 | 24 ++++++++++++++++
>  .../uncore-frequency-common.h                 | 17 ++++++++++-
>  .../uncore-frequency/uncore-frequency-tpmi.c  | 28 +++++++++++++++++++
>  3 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index 4e2c6a2d7e6e..cfa3039a0e39 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -43,6 +43,28 @@ static ssize_t show_package_id(struct kobject *kobj, struct kobj_attribute *attr
>  	return sprintf(buf, "%u\n", data->package_id);
>  }
>  
> +static ssize_t show_agent_types(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct uncore_data *data = container_of(attr, struct uncore_data, agent_types_kobj_attr);
> +	int length = 0;
> +
> +	if (data->agent_type_mask & AGENT_TYPE_CORE)
> +		length += sysfs_emit_at(buf, length, "core ");
> +
> +	if (data->agent_type_mask & AGENT_TYPE_CACHE)
> +		length += sysfs_emit_at(buf, length, "cache ");
> +
> +	if (data->agent_type_mask & AGENT_TYPE_MEMORY)
> +		length += sysfs_emit_at(buf, length, "memory ");
> +
> +	if (data->agent_type_mask & AGENT_TYPE_IO)
> +		length += sysfs_emit_at(buf, length, "io ");

Is this set going to get expanded soon? It would feel more future proof to
do this mapping using a loop and array. You also chose the quick and dirty 
approach wrt. trailing spaces as getting rid of the extra space is a bit 
tedious when open coding the mapping like that ;-).

-- 
 i.

> +
> +	length += sysfs_emit_at(buf, length, "\n");
> +
> +	return length;
> +}
> +
>  static ssize_t show_attr(struct uncore_data *data, char *buf, enum uncore_index index)
>  {
>  	unsigned int value;
> @@ -179,6 +201,8 @@ static int create_attr_group(struct uncore_data *data, char *name)
>  		data->uncore_attrs[index++] = &data->fabric_cluster_id_kobj_attr.attr;
>  		init_attribute_root_ro(package_id);
>  		data->uncore_attrs[index++] = &data->package_id_kobj_attr.attr;
> +		init_attribute_ro(agent_types);
> +		data->uncore_attrs[index++] = &data->agent_types_kobj_attr.attr;
>  	}
>  
>  	data->uncore_attrs[index++] = &data->max_freq_khz_kobj_attr.attr;
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
> index 26c854cd5d97..197ca2ad327f 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
> @@ -11,6 +11,17 @@
>  
>  #include <linux/device.h>
>  
> +/*
> + * Define uncore agents, which are under uncore frequency control.
> + * It is possible that there are common uncore frequency control to more than
> + * one agents. So these defines are used as a bit mask.
> + */
> +#define	AGENT_TYPE_NONE		0
> +#define AGENT_TYPE_CORE		0x01
> +#define	AGENT_TYPE_CACHE	0x02
> +#define	AGENT_TYPE_MEMORY	0x04
> +#define	AGENT_TYPE_IO		0x08
> +
>  /**
>   * struct uncore_data - Encapsulate all uncore data
>   * @stored_uncore_data: Last user changed MSR 620 value, which will be restored
> @@ -25,6 +36,7 @@
>   * @cluster_id:		cluster id in a domain
>   * @instance_id:	Unique instance id to append to directory name
>   * @name:		Sysfs entry name for this instance
> + * @agent_type_mask:	Bit mask of all hardware agents for this domain
>   * @uncore_attr_group:	Attribute group storage
>   * @max_freq_khz_kobj_attr: Storage for kobject attribute max_freq_khz
>   * @mix_freq_khz_kobj_attr: Storage for kobject attribute min_freq_khz
> @@ -41,6 +53,7 @@
>   * @elc_high_threshold_enable_kobj_attr:
>  		Storage for kobject attribute elc_high_threshold_enable
>   * @elc_floor_freq_khz_kobj_attr: Storage for kobject attribute elc_floor_freq_khz
> + * @agent_types_kobj_attr: Storage for kobject attribute agent_type
>   * @uncore_attrs:	Attribute storage for group creation
>   *
>   * This structure is used to encapsulate all data related to uncore sysfs
> @@ -58,6 +71,7 @@ struct uncore_data {
>  	int cluster_id;
>  	int instance_id;
>  	char name[32];
> +	u16  agent_type_mask;
>  
>  	struct attribute_group uncore_attr_group;
>  	struct kobj_attribute max_freq_khz_kobj_attr;
> @@ -72,7 +86,8 @@ struct uncore_data {
>  	struct kobj_attribute elc_high_threshold_percent_kobj_attr;
>  	struct kobj_attribute elc_high_threshold_enable_kobj_attr;
>  	struct kobj_attribute elc_floor_freq_khz_kobj_attr;
> -	struct attribute *uncore_attrs[13];
> +	struct kobj_attribute agent_types_kobj_attr;
> +	struct attribute *uncore_attrs[14];
>  };
>  
>  #define UNCORE_DOMAIN_ID_INVALID	-1
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> index 4aa6c227ec82..70415d80773c 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> @@ -74,6 +74,12 @@ struct tpmi_uncore_struct {
>  /* Bit definitions for STATUS register */
>  #define UNCORE_CURRENT_RATIO_MASK			GENMASK_ULL(6, 0)
>  
> +/* Uncore agent type bits */
> +#define UNCORE_CORE_PRESENT				BIT(23)
> +#define UNCORE_CACHE_PRESENT				BIT(24)
> +#define UNCORE_MEMORY_PRESENT				BIT(25)
> +#define UNCORE_IO_PRESENT				BIT(26)
> +
>  /* Bit definitions for CONTROL register */
>  #define UNCORE_MAX_RATIO_MASK				GENMASK_ULL(14, 8)
>  #define UNCORE_MIN_RATIO_MASK				GENMASK_ULL(21, 15)
> @@ -347,6 +353,26 @@ static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
>  	return 0;
>  }
>  
> +/* Helper function to read agent type over MMIO and set the agent type */
> +static void uncore_set_agent_type(struct tpmi_uncore_cluster_info *cluster_info)
> +{
> +	u64 status;
> +
> +	status = readq((u8 __iomem *)cluster_info->cluster_base + UNCORE_STATUS_INDEX);
> +
> +	if (status & UNCORE_CORE_PRESENT)
> +		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_CORE;
> +
> +	if (status & UNCORE_CACHE_PRESENT)
> +		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_CACHE;
> +
> +	if (status & UNCORE_MEMORY_PRESENT)
> +		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_MEMORY;
> +
> +	if (status & UNCORE_IO_PRESENT)
> +		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_IO;
> +}
> +
>  /* Callback for sysfs read for TPMI uncore values. Called under mutex locks. */
>  static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncore_index index)
>  {
> @@ -552,6 +578,8 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
>  
>  			cluster_info->cluster_base = pd_info->uncore_base + mask;
>  
> +			uncore_set_agent_type(cluster_info);
> +
>  			cluster_info->uncore_data.package_id = pkg;
>  			/* There are no dies like Cascade Lake */
>  			cluster_info->uncore_data.die_id = 0;
> 
