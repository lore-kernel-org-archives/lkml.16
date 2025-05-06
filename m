Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86F25F98D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551470; cv=none; b=aIuZT9Z82zZveUV374q8UkZJzkqPRtAb3x7hn1UPVmUOMUKB8+yI6ibE+3OVsPWh4ILXCBZG+NrPX1KSfWghET6Fdp+RzU+fg3xdwQALopZneypTCJPFLaHLlD0l9MSFk30nqACb9MTK9gUjE3xbcfgP602UNu04GjHi2uBLbGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551470; c=relaxed/simple;
	bh=QE2Ly7S7LpjyXGGaHa2YzAh3QNFmE+CGwwC1949ZY9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqrM7/yn+SmjufAeMaaHtuk5ZjjKLfm0V1NBgACOgWJS8mIDc3j+sOX/7GF1LtCSKGxpjzgw09P95s8Ez/QYyARSqgUqNMt3qnzS4kOxtntmMn5yfFwW+a0R5uSJxtvl9mVMrRSbJAC58q0PfuCUsaHT00qYYQBbgWyN2eYTwhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4NrSReo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4NrSReo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE84FC4CEEF;
	Tue,  6 May 2025 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551470;
	bh=QE2Ly7S7LpjyXGGaHa2YzAh3QNFmE+CGwwC1949ZY9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4NrSReoUs14inEyAoreiPAi48NFXtd7PgILL0g2SXwCF1jUz7vYcBlUQa+n++jyh
	 UtXJ8NAOlZd2JzKRZbbQVJP35CxAv4KbK0GtFJhOV2pZSewYMrysfybWA9Ku/1IQbd
	 Jgnw2yYgn08VPppykbjHgBa+DG3pOw+GNDZesaq8okyVEvLD7n7du+ELp4Fzy6o3Zp
	 Pp9Ax+Eclu5jNsWszX2oUzne6yDlVBwGAvejWZoIpO89Q8PV2AVJ+CiZZSaMefKQhG
	 tvHPJ/kiJmghGSelZbuTwarZk4V3CDDFQkNWQSDQCfsCzYM2hMeHkBIkDJ+7nQk1pc
	 eW40Jknr/Qv5Q==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm,mm_init: Mark set_high_memory as _init
Date: Tue,  6 May 2025 20:10:59 +0300
Message-ID: <174655143462.33033.3077268455161877493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506111012.108743-1-osalvador@suse.de>
References: <20250506111012.108743-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Tue, 06 May 2025 13:10:12 +0200, Oscar Salvador wrote:
> set_high_memory() touches arch_zone_lowest_possible_pfn which is
> marked as _initdata, which creates a section mismatch.
> Since the only user of the function is free_area_init() which is also marked
> as _init, mark set_high_memory() as _init as well.
> 
> 

Applied to fixes branch of memblock.git tree, thanks!

[1/1] mm,mm_init: Mark set_high_memory as _init
      commit: 42e31f0daf80d9f7bc4ab4000f2795ec3ddf5206

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: fixes

--
Sincerely yours,
Mike.

