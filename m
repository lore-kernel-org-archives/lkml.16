Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47BA278E7E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222650; cv=none; b=ILhiIMKN5ipGgiZRvgS9ZwSqc/oDshhsk/XLfQywwGUGAn7ik9yn0pjO++He1cL6PTo4iSU8Lh2bbEu/I0L2Qri+qRjnTzxDMpp4JT00HBXp9RGjVcDTVXvdR0XSKeUG82Mh7O5AaDlnKhciE4TZecAF0alAdziJ3lNAbXSlXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222650; c=relaxed/simple;
	bh=BYLy4VG9xOVs94mC7wIDlxr88txhDai/COmTvrqUImI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=st1pnd6cZf0w/21K7pOKTZgLOdzWqPXyII5D9kE4dbo6FIQJc/a9c+uhfMTaFH1bpvbezXby5BMNefb2TWe/WaQjU+rihntMvewJymhUm6iR/GEco7P32qGTFW/S+SuaszTZ9EaMz2QzLUASDknDVEBJGAGCIj+z8cKXqh8b0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpCARnYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpCARnYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3D0C4CEF0;
	Wed, 14 May 2025 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222650;
	bh=BYLy4VG9xOVs94mC7wIDlxr88txhDai/COmTvrqUImI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QpCARnYHBCnmD9i8RUKRToT+x6HCADCEoMOlwLouPPWWEpr7kxNvnbuHOlV2pF4pN
	 Ey2SdjumPQLi3i4i5GUlSMU011+0l5LdTNc3LGslQkdfAFTBL/TWUgJbCISZV3teLC
	 LDCQBdHtj4pYur5raesDHyI8qrcneC5P9fd6ew9mc4gRbMjw/LNi++8hDWadBo6mPw
	 8T8UcyOmA2dSArMY0jV5jK7B47DYVVQH23bTtVeBHUrRCPYex80k6pgxElqbIwE7CV
	 ib+oB1MbDgFAtTSbB9hsovWsIfRQztKDU9GNfnkxzMY3BNVUaW2783HcgGGgcx7QdU
	 adTWIRyQ1o7kw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Mike Looijmans <mike.looijmans@topic.nl>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428063648.22034-1-mike.looijmans@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.298e943d-5a80-491d-b36f-77b3b9a86df9@emailsignatures365.codetwo.com>
 <20250428063648.22034-1-mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] phy-zynqmp: Postpone getting clock rate until
 actually needed
Message-Id: <174722264836.85510.7340097492825315236.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 08:35:47 +0200, Mike Looijmans wrote:
> At probe time the driver would display the following error and abort:
>   xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
> 
> At probe time, the associated GTR driver (e.g. SATA or PCIe) hasn't
> initialized the clock yet, so clk_get_rate() likely returns 0 if the clock
> is programmable. So this driver only works if the clock is fixed.
> 
> [...]

Applied, thanks!

[1/1] phy-zynqmp: Postpone getting clock rate until actually needed
      commit: 065d5885f6180c534b7b176847b3e008f4e11850

Best regards,
-- 
~Vinod


