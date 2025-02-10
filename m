Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6802318E1A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208538; cv=none; b=R6wuX0WnpFNnOIDUy9vst0U511y06FhkI7Lrnr59GeEIy6Cy2q1ocpPiAyMBBnXyHzth2z44+KY5AtXI7qMKfl6jJkeHoXWRT3CzE8cypCEOgrC3QwAJ9yqTiIEFq8kHYrwtjz7/7izuEEQeG9Ug0mAl83aM0eDiu1aOEqmBiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208538; c=relaxed/simple;
	bh=SNlP0Vp7IQfG2ay6PnU1hGNS3PsKO01hybakm6uRe3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3B5YBd1J1uubL6HbaTIokRw9Ish4ZLdemCtvq9KjIeK5tBsk6B4JBlPrxzqdTB2TzRqvRZ4aVTOGeRYYmyDwujH1J9bXCyWkJDATNuFhHEZNLYtzYREBiqk0KOUzT2DT8Qxr2Y2vaGrYGMhH5Vp2nopP9pvY1OpuIJsH7A23KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtkbJY4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtkbJY4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FD5C4CED1;
	Mon, 10 Feb 2025 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208537;
	bh=SNlP0Vp7IQfG2ay6PnU1hGNS3PsKO01hybakm6uRe3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtkbJY4qcc8NfJhOHQYCBsZvgpsRG1XaAzkD6PYWOA89sVfJ1HLB6zgHX7ipKcTmf
	 3zPT/FSiv/HrR07h3uLOD7F2erloMcuer/aivSdruLkyot7ca/4Hypzii5keCNoPUo
	 GdD1hed2D0hPeFihwN7smpRR/hlbVLIhVXP/Z8d471tspRr4yRTE3v0Y8oHfR9Yoj3
	 3BLJ+SDihLTTik8XPS3yKU5qEUEOTlSfxuvyiPvLRyBYXpcqJGupESs15UHtNnXQHg
	 aj8rCulM2GGC9ELEzJgfj0XRVDz6Adj4t7AyxGydisWglkKxL41uiha4BscyVX1T9z
	 oXoLSgGDc0Z1g==
Date: Mon, 10 Feb 2025 07:28:56 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Provides a sysfs 'events' to expose core
 event counters
Message-ID: <Z6o3WOGS5Pulha36@slm.duckdns.org>
References: <20250210143643.220994-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210143643.220994-1-changwoo@igalia.com>

Hello,

On Mon, Feb 10, 2025 at 11:36:43PM +0900, Changwoo Min wrote:
...
> +#define scx_attr_event_show(buf, at, events, kind) ({				\
> +	sysfs_emit_at(buf, at, "%40s: %16llu\n", #kind, (events)->kind);	\
> +})

It's nice to format things in tabular forms but things under /sys lean more
towards simpler formatting, so maybe just do "%s %16llu\n"?

>  static struct attribute *scx_global_attrs[] = {
>  	&scx_attr_state.attr,
>  	&scx_attr_switch_all.attr,
>  	&scx_attr_nr_rejected.attr,
>  	&scx_attr_hotplug_seq.attr,
>  	&scx_attr_enable_seq.attr,
> +	&scx_attr_events.attr,

This probably should belong to the root/ subdir as we'd probably want to
keep the event counter separate per scheduler instance in the
multi-scheduler future.

Thanks.

-- 
tejun
