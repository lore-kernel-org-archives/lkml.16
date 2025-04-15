Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5352957C3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723083; cv=none; b=tIOAbl56UK9JkdmUkwlE8Bvalxbaxnf9TL42T8xkQoLan0HxnrN5tKEQJOOtwSNInhbX5ENz23NGHFEMVCTDVUnNHrIlFNB6UpvDz+KIGcoNa+2HpUuXsChw4j4A4p4yRnn2wogYWZPD5DF6epVhPucNWvk0YdoHAXM3bCY1/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723083; c=relaxed/simple;
	bh=YKRCwj43kdLgyJIswP/nVoskXSrbbRada0HA08biQHU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ADQKT+2mE6ZNahgRNfPI+mDePo5IfUasZTBWnmKW4HP7qZSu+B9QpjH/YZ6HJdRcgcbXigpsd3eXJTD9yPLFDNsjsG1Ypu187l495rScdWwacY6wHAxjSspeyEOfwRMg7h0Mohmr5XY/VJsEwrY1MWrFFtAWs+wYahwpexVto8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kFYPz35u; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kFYPz35u"
Message-ID: <774119f2-390a-465e-9333-1e528472c7a4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744723079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMsxHbYeegh93C22sfD2m+jKY8+ksqcqK9PZ3B22rQY=;
	b=kFYPz35u3LPoVbRFEUHRksVixWvizx4ribn+/xYuSf5559Ozdh5plaJWUzAIfS2BOeA76V
	nCsSOZmHGbAZ4DbfvuuSLCRgQskLYAVgPpnzQx7OXvXDQZryUc6eK5w1roQ3hF5dmMJQKB
	RXzBJh2QYx1Ca5+AZ+jymq5r37hgpAY=
Date: Tue, 15 Apr 2025 18:47:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 06/17] drm/bridge: cdns-dsi: Remove extra line at the
 end of the file
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-6-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-6-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 14/04/25 16:41, Tomi Valkeinen wrote:
> Remove extra line at the end of the file.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

