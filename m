Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D226058B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638079; cv=none; b=o1OwuF55v8PZ0d6zKAUvdQHLxqmQ5CiiyReNhToaKTDN/avBh4AaXa3VhPl+jKUuTRqlD+x0aKK5OMOvTpOYfM6FdSVk5v8eTFbFv5YbsSbaXkhiElbrX8TefHvAFfzw+/mPrRWO/yhvQDdsNgOWgR0vePvPqnmM8xNEf6nYtMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638079; c=relaxed/simple;
	bh=Mn1Axfq/OrF1i4WMHy80DvXGqW6kMmHr9voI2qnyj5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7utYfNElpp3lwtsLM/zcAS0sd/9j5UHLhbrxDRM334rmcm7S0t4Mju0xc5aqJLEzTD1WXqYPqmh5cqu7LetxPGmeKph1XNuzi7lYvgoz/BawmhXm6pkcjPUWIzxyD8ewwMuKDLscNIE1w+jTPFMf5SzW8cw7vrJUwFNSRVdtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0+KFP+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0+KFP+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA55C4CEEE;
	Wed, 11 Jun 2025 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638079;
	bh=Mn1Axfq/OrF1i4WMHy80DvXGqW6kMmHr9voI2qnyj5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0+KFP+Bzv6fBs9MGnPODeY9aGUgVZVWMxz4T4I7791eV/LWyAIdV33s4fIaHO3tr
	 XGYDTUvR7Wr84+ckKUg7XzB3eDwABs9H34l2t4nTHgPj9ljBRQlxP5xPh8S3q07p0E
	 BfkFyhbdKDWmOVlUbsWBZWioMnk28sCffc6WP1HfotGIQj9So9HcPXq46vQaTXeFQE
	 7VuNDcbMvYfgcNCy9yObt863emB3cMr5/oSEGDd1HPeSOSVVgEDluLagRc103kKuxs
	 8Q/5eAAT1q8Q3XewlP7CQrzv4dNBcXY8e1FIJUCQDc67GZk0p7UteIXDRXQpkkv23V
	 RBeLlCMVzBx7A==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add generated modalias to modules.builtin.modinfo
Date: Wed, 11 Jun 2025 12:34:28 +0200
Message-ID: <cover.1749637146.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606041029.614348-1-masahiroy@kernel.org>
References: <20250606041029.614348-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If these changes will be applied, the patchset [1] that adds the modpost
generated aliases to modules.builtin.modinfo will look much smaller.

[1] https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/T/#m515563dbddb2f2fcd10b0f198db69aee533db088

Alexey Gladkov (3):
  scsi: Always define blogic_pci_tbl structure
  modpost: Add modname to mod_device_table alias
  modpost: Create modalias for builtin modules

 drivers/scsi/BusLogic.c  |  2 --
 include/linux/module.h   | 18 +++++++++++-------
 rust/kernel/device_id.rs |  8 ++++----
 scripts/Makefile.vmlinux |  5 ++++-
 scripts/mksysmap         |  3 +++
 scripts/mod/file2alias.c | 34 ++++++++++++++++++++++++++++++----
 scripts/mod/modpost.c    | 17 ++++++++++++++++-
 scripts/mod/modpost.h    |  2 ++
 8 files changed, 70 insertions(+), 19 deletions(-)

-- 
2.49.0

