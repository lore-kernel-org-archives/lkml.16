Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E288253343
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050373; cv=none; b=SEruIAvdaFX3hv3fFMGOF6ZcTfFfMYRFxDefwzyd09OtJCVebPR30Os+G4UluHiftHIwX2AWTNA/QAUqMeIJymnmdOIv1xyk2fnrzqq9dZ8hGELtgbZcNSNURcAUFeERw1uZKekFwrvgJ5kCPGEQTu/pPfjOKxd2COMasznojTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050373; c=relaxed/simple;
	bh=+O62Pvw3dHm7xa/KPW2DkmES5HnPQW8Wq/sIkaCeTXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQeCptyrFctvXNhD0G2klYwpOMYZTkF1jqc+f9QXbPD+Pt0/85JfuMBZFnqWUlZkdNg1MLsC8/T1U7EmKIzp0nIZV9V1BwFWE4QsMCBsV1YTR3Y9bcwzrZTxyYU+fjVzseIUlwGrjU6tm3CJFq6G/QbHE0yfYiDBr8InvFUIv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kW7w8Fiw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kW7w8Fiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90282C4CEDD;
	Mon,  7 Apr 2025 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744050373;
	bh=+O62Pvw3dHm7xa/KPW2DkmES5HnPQW8Wq/sIkaCeTXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kW7w8FiwpU6hx0/hEDXP9OAA8cyu1BAM1kMal/MZPxQE5F00mXY8YnE+GJcgtFQNT
	 rMQk0iRtWrTDiWNMVzlhexerg8h63tQKCNK4EJ+B8/cYcBn2fZNGGbZNjy2WNfGeko
	 FCcFMWcGeWafe5nCXnXhyuibA7YVm7pj7Mh4yhgnb7tvWTVNL8PrnfkF+Xcj9r+fuz
	 4418E02GmN9Ydl6WR0YbNzX6BvacY5sCJIoyEvs8NSke9cY5VkBAB8lgf9MU1DVIbU
	 vvoXyjzqv97YJB4eyCSv8XBdK9Aw5FWOSyCJ/K5/SMCfIztOqVSL/b7Zjkc+uGg3fs
	 nhGpGRGvOtXFw==
Date: Mon, 7 Apr 2025 20:26:08 +0200
From: Ingo Molnar <mingo@kernel.org>
To: James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, babu.moger@amd.com,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of
 kernfs_node::name
Message-ID: <Z_QYwMn5dAcTOglC@gmail.com>
References: <20250213145023.2820193-7-bigeasy@linutronix.de>
 <20250407124637.2433230-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407124637.2433230-1-james.morse@arm.com>


* James Morse <james.morse@arm.com> wrote:

> +	/*
> +	 * Check the parent directory for a monitor group is a "mon_groups"
> +	 * directory.
> +	 */

This sentence probably wants to be a bit less linguistically ambiguous, 
via something like:

  s/Check the parent directory for a monitor group is a "mon_groups" directory.
   /Check that the parent directory for a monitor group is a "mon_groups" directory.

With that:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
