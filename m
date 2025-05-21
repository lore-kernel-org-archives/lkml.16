Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37823816F;
	Wed, 21 May 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818257; cv=none; b=sFvyePN8GicoJ1JYlcmH9FJ6884NljeVHBRTOd6/p294SQB2P+WT4P+2QnlbQhF1/YWYHqRTh2LV+tMVxkv26XOLOV33hEsbRcMwtFvQQi++BOwaFZ41UMtoGbZ82uCO+hXoAPR9rWH+R7a5Ao5sRuQVGRW1peHgjeem67J0UH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818257; c=relaxed/simple;
	bh=/OVUEBvGvRPAZGd3SzU8JAylUHgP7ABuQxE9pS/k7ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEQkDFcilDybBcb/ZP0boDDfudt8kTprXi0Q6NrK1Glgn/SWDGySCuEK1McDPB9x0+E1cNgD5DM2mF7KX9JY/A0RlXASNlvyuFfuV/oZ9CElubssCd2CFeh+d21G5Q5KV0vP8XwMw0+HYevT+PpHBwPAfe+VV8S1TVwaPlYYADM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAX9/Ubb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAX9/Ubb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDD3C4CEE4;
	Wed, 21 May 2025 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818256;
	bh=/OVUEBvGvRPAZGd3SzU8JAylUHgP7ABuQxE9pS/k7ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAX9/Ubb83+qxDDSeFV7H0dd+Xne8eZrKi/rhRD5AO7cU6QO73W+kSVbaO+jsX2kD
	 S8AOnhpHbgwVppIvj9a5oMTy+M2sTJInqMi2gy1WbxsQJ4eLoVMkyCmjLexnsdLetz
	 Q5OEdslcsSLXO1lMxNTxMjol3RF4U37NL8v12My3fpexungpEjaXY+eS++BF0BHBj5
	 igHZskp/HxLAvbF72Yk8qTstafdFX04GTI20vcKOOCo10prH2nv6MHZm0yB8EkQZPY
	 FGeMq7ov1dxkwDMBLCUUbRkYU4saHCYTPIcOdQPbh2KfkL7AqVg/nbmE4vPjYM657V
	 APPiGas4xR3+A==
Date: Wed, 21 May 2025 11:04:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0
 bindings
Message-ID: <20250521-strange-ammonite-of-domination-b5e4aa@kuoka>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>

On Wed, May 14, 2025 at 10:09:01PM GMT, Han Gao wrote:
> Add DT binding documentation for the Sophgo SG2042_EVB_V2.0 board [1].
> 
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index 6c82f89b56ca..cbfd07cc053d 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -35,6 +35,7 @@ properties:
>            - enum:
>                - milkv,pioneer
>                - sophgo,sg2042-evb-v1
> +              - sophgo,sg2042-evb-v2

Comment from v1 looks ignored. Squash the patch.

Best regards,
Krzysztof

