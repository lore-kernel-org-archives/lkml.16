Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B41221FBB;
	Fri, 11 Apr 2025 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392344; cv=none; b=N1upitj5pcLtoSyNkBXD1n8LIcoPFhUx4lGFioQOzw70rLla/tSjxrhOGqReZWWkUNjojJCLbOcVA+y80B6fOZsIjbGYVye7jcHh+mHECThhay++G37t0LmvnXKTEpd4JgOF8CbYWwxVVqbMxM5B+r2K/CAmtW80yBXiuCYRAEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392344; c=relaxed/simple;
	bh=PhGA/PQRX8o20BNQzD1+8NpC24hiX8vnUQGbJ76M/qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhXN4feEh5kfjZn66pciDNWHW5w9FhsMCA2XcCOPK9rPyOZG8AJ92vaQsCZOtHax1+TMfW1ZYHNNSeSDEqan38sYQne4fQZthMpl2ic6DUybSh6tXs3Z/xYWl69x5UJ8DG3VE4SfWvO6W9PZpqDh0MGYxKjubimDb5blzvyu4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGGHDk57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGGHDk57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A93C4CEE7;
	Fri, 11 Apr 2025 17:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392343;
	bh=PhGA/PQRX8o20BNQzD1+8NpC24hiX8vnUQGbJ76M/qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGGHDk574nv3ggpHYgRFSGLnGML2SsK64FsA0AnH3svGUa+R2gw447BPw9YB3NEXm
	 kWv+YOEwLjMvVw5TBxnh3PoFiQMOp4E+bt+gmli1Tz3SxEHxu4dQKvmtnyg3fhSx6f
	 MdSiBM3YWeKsnP7vdR7tNXQiWHDbPgWRXbwXhprnOTuX5wGNBFPt0C7dWf9NbbMrPK
	 hzQN13bhaTGVmQpSyw/UIywWblC5Nlkl1QYdRRItCIXoIUp3z6TsWLbLwIKQq9I78P
	 IMTQyBjKBxAyzQnxrfc7pL9cHjyZi7xKjcblImmwNs5PenDU/T084xIbeteTl5uJXg
	 TF7QbMXcpISUQ==
Date: Fri, 11 Apr 2025 12:25:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	yong.wu@mediatek.com, kernel@collabora.com,
	linux-kernel@vger.kernel.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: memory: mtk-smi: Add support for
 MT6893
Message-ID: <174439234231.3571303.15777518966184683751.robh@kernel.org>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
 <20250410143958.475846-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410143958.475846-2-angelogioacchino.delregno@collabora.com>


On Thu, 10 Apr 2025 16:39:57 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the Smart Multimedia Interface's Common and Local
> Arbiter HW as found in the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

