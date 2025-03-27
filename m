Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A11BC41;
	Thu, 27 Mar 2025 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081816; cv=none; b=T6BJIMfr8oEMTuINLurkrGhUhtRy/HYaknaY/3EuscTc6c+HaVX6DTURf0xOqeyV0rZj1LvQZjcpQdA9ZXOFwkD+j1wOjcXsoQbYzAxnzrYf7iwY+vghNRZ3upRb92Wa2E9Wjny7zvcwLyHauRNwlqEgDOlgaehACM8cNGMDsfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081816; c=relaxed/simple;
	bh=oT68pbFwtwzKN7fGk22TjufR6gyAhSIrzFAn1zKFd8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFPYWzQxGte846rwZ6lYtd7IKPcPP/bFsC9nEJmdbventc9vnNWtN4oEGttMQjPs7V3sUyX3By4kb2nq+KPDvYCcPsA/zF+9qmK18jjWeq4VKbgkbDEOMHFt64eq6tpwqHoNbo43FXTz7/GlWnU+0Do2YFcLzt0b6xtdGSg5G5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsxbGgyF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsxbGgyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743081815; x=1774617815;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oT68pbFwtwzKN7fGk22TjufR6gyAhSIrzFAn1zKFd8c=;
  b=lsxbGgyFIgvpXLiQiDkW5sLfabJ5dZK30kmdT8DSw5seV3X/XOL3pJoq
   11Fkr24G8oj8AOFs8QUm0qw/FyDWZ5rRdJDnzl1foVa/GO2Sw5mkAeGVV
   MCBGedZsIDwjYAX9NffYu3gH5/5TEutQu7FaSQ13W61bj1Adv9zeZeb47
   4dXMQ8tAPrTxgXzJckH+7JNhxOvQClJMyq28kQCOtiBOVRNINWdUFumMp
   FwAmC6EMz37i97wrV1v/u8JAyaFJ4ItIghd/VqSouBR0Rxii38fLILoRD
   EhbqVtvZHz3whf7QGdOxA6A98pfJdC0E841t9j5OWWb9WQuy5nqO/dwTN
   A==;
X-CSE-ConnectionGUID: wRQ14pj3REmId4I2uW1Ypg==
X-CSE-MsgGUID: uP2vtZK5TJGLN3o9Vn6CHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44329877"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44329877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:23:33 -0700
X-CSE-ConnectionGUID: tCjTDlEZRfiKruLwqj1QFg==
X-CSE-MsgGUID: vpXDOotEQDOQh8iiTpNjyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="156071402"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:23:31 -0700
Message-ID: <d38cc4f0-2018-46ee-93ff-d5dd76ad142b@linux.intel.com>
Date: Thu, 27 Mar 2025 14:23:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250327130012.3378732-1-ckeepax@opensource.cirrus.com>
 <20250327130012.3378732-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250327130012.3378732-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/2025 2:00 PM, Charles Keepax wrote:
> Use the previously parsed DisCo information from ACPI to create DAPM
> widgets and routes representing a SDCA Function. For the most part SDCA
> maps well to the DAPM abstractions.
> 
> The primary point of interest is the SDCA Power Domain Entities
> (PDEs), which actually control the power status of the device. Whilst
> these PDEs are the primary widgets the other parts of the SDCA graph
> are added to maintain a consistency with the hardware abstract,
> and allow routing to take effect. As for the PDEs themselves the
> code currently only handle PS0 and PS3 (basically on and off),
> the two intermediate power states are not commonly used and don't
> map well to ASoC/DAPM.
> 
> Other minor points of slightly complexity include, the Group Entities
> (GEs) these set the value of several other controls, typically
> Selector Units (SUs) for enabling a cetain jack configuration. Multiple
> SUs being controlled by a GE are easily modelled creating a single
> control and sharing it among the controlled muxes.
> 
> SDCA also has a slight habit of having fully connected paths, relying
> more on activating the PDEs to enable functionality. This doesn't
> map quite so perfectly to DAPM which considers the path a reason to
> power the PDE. Whilst in the current specification Mixer Units are
> defined as fixed-function, in DAPM we create a virtual control for
> each input (which defaults to connected). This allows paths to be
> connected/disconnected, providing a more ASoC style approach to
> managing the power. In the future PIN_SWITCHs might be added as
> well to give more flexibility, but that is left as future work.
> 
> A top level helper sdca_asoc_populate_component() is exported that
> counts and allocates everything, however, the intermediate counting and
> population functions are also exported. This will allow end drivers to
> do allocation and add custom handling, which is probably fairly likely
> for the early SDCA devices.
> 
> Clock muxes are currently not fully supported, so some future work will
> also be required there.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

...

> +
> +static int entity_early_parse_ge(struct device *dev,
> +				 struct sdca_function_data *function,
> +				 struct sdca_entity *entity)
> +{
> +	struct sdca_control_range *range;
> +	struct sdca_control *control;
> +	struct snd_kcontrol_new *kctl;
> +	struct soc_enum *soc_enum;
> +	const char *control_name;
> +	unsigned int *values;
> +	const char **texts;
> +	int i;
> +
> +	control = selector_find_control(entity, SDCA_CTL_GE_SELECTED_MODE);
> +	if (!control) {
> +		dev_err(dev, "%s: no selected mode control\n", entity->label);
> +		return -EINVAL;
> +	}
> +
> +	if (control->layers != SDCA_ACCESS_LAYER_CLASS)
> +		dev_warn(dev, "%s: unexpected access layer: %x\n",
> +			 entity->label, control->layers);
> +
> +	range = control_find_range(dev, entity, control, SDCA_SELECTED_MODE_NCOLS, 0);
> +	if (!range)
> +		return -EINVAL;
> +
> +	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
> +				      entity->label, control->label);
> +	if (!control_name)
> +		return -ENOMEM;
> +
> +	kctl = devm_kmalloc(dev, sizeof(*kctl), GFP_KERNEL);
> +	if (!kctl)
> +		return -ENOMEM;
> +
> +	soc_enum = devm_kmalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
> +	if (!soc_enum)
> +		return -ENOMEM;
> +
> +	texts = devm_kcalloc(dev, range->rows + 3, sizeof(*texts), GFP_KERNEL);
> +	if (!texts)
> +		return -ENOMEM;
> +
> +	values = devm_kcalloc(dev, range->rows + 3, sizeof(*values), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	texts[0] = "No Jack";
> +	texts[1] = "Jack Unknown";
> +	texts[2] = "Detection in Progress";
> +	values[0] = 0;
> +	values[1] = 1;
> +	values[2] = 2;
> +	for (i = 0; i < range->rows; i++) {
> +		enum sdca_terminal_type type;
> +
> +		type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, i);
> +
> +		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);
> +		texts[i + 3] = get_terminal_name(type);
> +		if (!texts[i + 3]) {
> +			dev_err(dev, "%s: Unrecognised terminal type: %#x\n",
> +				entity->label, type);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	soc_enum->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> +	soc_enum->items = range->rows + 3;
> +	soc_enum->mask = roundup_pow_of_two(soc_enum->items) - 1;
> +	soc_enum->texts = texts;

soc_enum->values = values; seems to be missing?

> +
> +	kctl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	kctl->name = control_name;
> +	kctl->info = snd_soc_info_enum_double;
> +	kctl->get = snd_soc_dapm_get_enum_double;
> +	kctl->put = snd_soc_dapm_put_enum_double;
> +	kctl->private_value = (unsigned long)soc_enum;
> +
> +	entity->ge.kctl = kctl;
> +
> +	return 0;
> +}
> +

...

