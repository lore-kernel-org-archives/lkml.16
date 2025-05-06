Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5EE24A061
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524177; cv=none; b=o2kZ5Z6K4qAvNUvNu07a9HbCzOmyTEx2r1YU7bwL68kO31yJNuWalsjuBRv2SUlF/LZihaKytb65Uc5JDyxSSgRDxoe9VWlzKEzFiAiE9k/Wb2ECsKkO/k9/TxrjXnn32EjEOBC1E5zHszUDWI6VE9dP+fLu3YVyk9PATvG34o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524177; c=relaxed/simple;
	bh=dNpNuDQZ0IRai5YOjti9o5t6K0rutdp8byO87u/mU+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oKE3304QiLSGR/es/mI5u+Gi8TpKGkUAMWYMY3tPGnvd3SJIHjn96t6cZFnDlXjCecWk3FN8KhmSe2mZIkIQVdWZn8+72IqSMCIHf5nJ2hi6yf00CJByZ+OeBwlFU/HrTr8kxLk3kWK+ofid7IZkF5vOse32F2dXMqzPP5Wz/DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWh0WXpk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWh0WXpk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30517C4CEE4;
	Tue,  6 May 2025 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746524175;
	bh=dNpNuDQZ0IRai5YOjti9o5t6K0rutdp8byO87u/mU+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LWh0WXpk22UQ1dyR6lV8NAtI8i+s5eHKqcpjlFUMtvg80E7iL/EFCX7Y4X0pn3PDq
	 nPLtPPPReJffm+4hx8jV/ds0XsGfi1Qavzzhe05dFKMmERDQd0VJFvn+KaQDifxqLn
	 4tocZ3aHAMtg3jc2blukpTdoJr3q98DVll1ygHIwo82qrQRPFTWciSG6plYyxRnVm+
	 pZzRR3S+RwORz1JliViMAfzQ5K1iKW2gtRVtkChM+370MduxN3cxeqKtiBWndJl9z4
	 rtqlEcIECEmKYaUF5/s+NKW0XwviX2JL8iTb3s3bPgn2zzWZdQv6KBsK9JXthUgumB
	 q5RcnIMK1aXiQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: macronix: Cleanup macronix flash info
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
Date: Tue, 06 May 2025 09:36:12 +0000
Message-ID: <mafs04ixy3wtv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 07 2025, Cheng Ming Lin wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> Organize Macronix flash information to make it more readable.

Series applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav
