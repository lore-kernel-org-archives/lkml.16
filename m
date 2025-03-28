Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711BA19AA5D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192507; cv=none; b=Yl4rbPVUeZhHMCesc5YbH1/autI8QP90JlvhhdIsMFCITZWyubVJfaPoNhtG9yWHJmSOpfHVz9l7Hb04R13LfGPgaZLvMAwrZRh4eW4qPZVvw7e8tl0HbEIZkkiKs5DIx7zCegtMpcPiGKmX9p+TTnZdg319CUgi6P5spD4jZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192507; c=relaxed/simple;
	bh=dOemWFZ2Ghac8mYDTTZBufb5X/5zUGve8J219pKC55c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7+As1Vr59zYv6ohP8fVcVyetdLhsCCQzKSRX61hlh7YMsBA8UQbeBGj+sgpzqGjj9hJ6qlPUKhM2tr7F0uqVYr748lcEFE+VABq8lxk9vmpeFJMeRYL8X0SEJ0qp3tq5FqIVJ7+sqeRNiGMQiKS4+jBZIYS8Pmgpqgqt3NwqXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA77C4CEE4;
	Fri, 28 Mar 2025 20:08:23 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: anshuman.khandual@arm.com,
	david@redhat.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	ardb@kernel.org,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	quic_cgoldswo@quicinc.com,
	quic_sudaraja@quicinc.com,
	akpm@linux-foundation.org,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH] arm64: mm: Correct the update of max_pfn
Date: Fri, 28 Mar 2025 20:08:21 +0000
Message-Id: <174319246799.4193737.10993641019327469518.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
References: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 21 Mar 2025 15:00:19 +0800, Zhenhua Huang wrote:
> Hotplugged memory can be smaller than the original memory. For example,
> on my target:
> 
> root@genericarmv8:~# cat /sys/kernel/debug/memblock/memory
>    0: 0x0000000064005000..0x0000000064023fff    0 NOMAP
>    1: 0x0000000064400000..0x00000000647fffff    0 NOMAP
>    2: 0x0000000068000000..0x000000006fffffff    0 DRV_MNG
>    3: 0x0000000088800000..0x0000000094ffefff    0 NONE
>    4: 0x0000000094fff000..0x0000000094ffffff    0 NOMAP
> max_pfn will affect read_page_owner. Therefore, it should first compare and
> then select the larger value for max_pfn.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: mm: Correct the update of max_pfn
      https://git.kernel.org/arm64/c/89f43e1ce6f6

-- 
Catalin

