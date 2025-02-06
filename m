Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C411EA7CA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849395; cv=none; b=Kv9NxzYW+kDKPKO56fFk0I3qAOLMZ6dc+ABp05YEKrDJf+5qC/ATJOiKWRQm1HDiILO+ymELWVtR35OHzg5Jx07M2MTPjvWhC767uLVdl5zSsOmz2nU0FGqxmwVn61BtNidj21BXbnPQnXvZ6Rt6X4ksuvhsgQhMTZigp/uq4dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849395; c=relaxed/simple;
	bh=6RGLl2JFFYtY8IxplsnsOh9d1unB4VVvbOxH/mVO0R8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uRtW9/8pDWSv1V/JLisx7VWOiR90QZH+O8/yf8gUzRemLkp6CPPQPA8AGhJyylczZoAvkxthYGDy34oVnDSPAwl9ig4EsZamBKlTqwjWf/XsmsGXLYMIA9FSKusPnl1BHhUGZ8NEo64kUBtIf20c/QU7Sd4y9nCIYwy0cCTNMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt0NA3R8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt0NA3R8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E74C4CEE2;
	Thu,  6 Feb 2025 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738849394;
	bh=6RGLl2JFFYtY8IxplsnsOh9d1unB4VVvbOxH/mVO0R8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bt0NA3R8+q+WQz7T6f7FWA9sRiHwT9uCtHOOngB1XMLJPNKMXnoKyk2fErja4tALZ
	 kMnQrrcbebiYr7R389m84ljswY8MuKtLIo+0qvOQuO1Ra7pX0OIbgijWk8vk+cpLn+
	 54RNgzRoxuPGiwstSIZfANyMNDMmmFND/gjqOKWE5FLVtYyum3sX3Uy3G2WkanV/c7
	 KSnN9dTflR+CdT2pwGJUCl1p7SvF2ziTo1Tix7RdydwMng65ByrHwfETzpKxZZ3Or2
	 NHT1DSHo6jrUdE3psZHOR1IFXh2+FnwUllXDhaNvdKNAAgxecPmCHkuoej2NSBZ5Cv
	 CBqbVUNTs6tJg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Hermes Wu <hermes.wu@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org
In-Reply-To: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
References: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
Subject: Re: [PATCH v4] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Message-Id: <173884939065.2456165.14279070736754086408.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 14:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 21 Jan 2025 15:01:51 +0800, Hermes Wu wrote:
> Fix a typo where V compare incorrectly compares av[] with av[] itself,
> which can result in HDCP failure.
> 
> The loop of V compare is expected to iterate for 5 times
> which compare V array form av[0][] to av[4][].
> It should check loop counter reach the last statement "i == 5"
> before return true
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: fix HDCP V match check is not performed correctly
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a5072fc77fb9



Rob


