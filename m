Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E575284B29;
	Thu, 10 Apr 2025 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291528; cv=none; b=TQv6WONGbU/3jWuzoYsbTLj6rdcmq3BlD5Og2g+9xulRrq0RMFJXNv4eE8hdHeGNBWi7+WDlBmaF5YMlsL4Z6nNMrIjv8VaOfgECk3latIYyhopNpcRtLhfgtXm9USqwqWlL+FZoCLa6L2bMHllrXxPI0czFU7igBrIqaPsdVyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291528; c=relaxed/simple;
	bh=dI/wEl0KU6sxbpEO9chvi2t1lifThyh4pTu8Gp+7k8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahUjNm2QHA3tqxTMmZCIjc72sXtVJAYbrULW1LmScNi4A3zluf7XSFQ+E4zj9f8ku2jA4evCfOwJYa/6wqeLP41eitZg9++wrvRqQA8TEJy215v8IcWiVybKybGpl7JA54SQzz01BPFdPWuqOWHqgqZOUosAksBDD4bnSQjcYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vl4MQ/n6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vl4MQ/n6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D024EC4CEDD;
	Thu, 10 Apr 2025 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291528;
	bh=dI/wEl0KU6sxbpEO9chvi2t1lifThyh4pTu8Gp+7k8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vl4MQ/n6V50/JafK0WuWNvdTPzzMlY+Et3X7IbmVpWncca1SM4LO5SQyva/RnyBWJ
	 iaChh+CGvN1u0KLlrA/6aEBB3JBYnvWCmmcmEuTKFvIdVntfqOQlBtSCX5isOQ1EcS
	 7HE57wkTWBjjo5q01jm5ZlD/iySbjPsVEVxAu0FM6JFVIogNmrVfY20IvFHQB957C9
	 rklozdoBgaQUN1KVlS3Dd3qeLdmWe4AF4QGUnGI7OItHQk54B8XdXvRUkakGsbcX8c
	 iS69MAmK7dY4G2+ORjy2RzcWIF8OB5R8KO7L3pV67afBk7fZ4JrsAyefRYE4YS9t+O
	 7L7g0hnID6RMQ==
Date: Thu, 10 Apr 2025 08:25:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mripard@kernel.org, airlied@gmail.com, kernel@collabora.com,
	maarten.lankhorst@linux.intel.com, neil.armstrong@linaro.org,
	pablo.sun@mediatek.com, quic_jesszhan@quicinc.com,
	dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, simona@ffwll.ch, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly
 Technology Co., Ltd.
Message-ID: <174429152597.3712322.5500786245544647533.robh@kernel.org>
References: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
 <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>


On Thu, 10 Apr 2025 09:24:54 +0200, AngeloGioacchino Del Regno wrote:
> Aoly is a manufacturer of LCD/IPS displays based in Shenzhen,
> Mainland China.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

