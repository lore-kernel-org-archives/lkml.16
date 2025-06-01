Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CF17BD9;
	Sun,  1 Jun 2025 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748776171; cv=none; b=RiIysVHt/RdS+jeAnarUOp4MWRVdnz8YKNRg9vkH7ydGnh77VN47qmSi7LcZ9mbWRJJTf7uS9h5FiD6LTbXOTqtQSrqHgkL6BLvF5pWCU5vcHXCY1i+qtpAnV2eoxq4YNVKGzo1AabaaPBUR/xxmxLQP5ZOlNa9lzxVhtEpiDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748776171; c=relaxed/simple;
	bh=mvq2HtKxL9Djp8aYgx6tbEmtPeVkOO+xhOisSP5eRXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPSwQ4vkOxqDKyL844MenQxoh36/1Wb1I41il/4AXpN7TIVp9Tg/amOaVYk2I+8DDbUL6ah2OjzxBl0mAOSuz+7dRZuNNXZn54ryMws6CKh+jG2+i8iJIZ8T5KXNITpAeNnGUN2QSvVIS7rt2cQYFkwB53iS3oAUJkGEGqy/C80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQiBx5Uj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQiBx5Uj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BB3C4CEE7;
	Sun,  1 Jun 2025 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748776170;
	bh=mvq2HtKxL9Djp8aYgx6tbEmtPeVkOO+xhOisSP5eRXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LQiBx5Uje8/tpMzCWvBg7oOD/QkD/nS3QMIL0RMDYA3BS5ZKk37XzG2BiBBl0QWvr
	 fUyheV7kYqiNXWb6CSi9hntuJF8mDTQY2FGcCkJ5cNHTIyysrtdc53xJKzubm2MtGp
	 cbsQ11qHoV3s0YOY9Wr5OF5jl81QVVKd324CcZ1lw7dLtGDPVda2esoUXtNIIRKgFL
	 J1ZStTfp3gDzFFK3r4ocUk3oDVBxjKNwRLLZTKn8YIJHNsyfbaY0fuGomYvwIU/5RK
	 dE0vLHjm82ybKZMrYQ7XWa3a3wrLOykFZwKvuo3ZuuQ0TDdVBgjaugX0sQA85oEBox
	 qiZlo7WVlLBMA==
Message-ID: <3dd0f1dc-441c-47e7-bfe5-bd2791c87895@kernel.org>
Date: Sun, 1 Jun 2025 13:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com,
 ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com,
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20250529110418.481756-1-j-choudhary@ti.com>
 <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2025 09:55, Geert Uytterhoeven wrote:
> Hi Jayesh,
> 
> CC devicetree
> 
> On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wrote:
>> On 29/05/25 16:34, Jayesh Choudhary wrote:
>>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
>>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
>>> call which was moved to other function calls subsequently.
>>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
>>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
>>> state always return 1 (always connected state).
>>>
>>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
>>> Since the HPD_STATE is reflected correctly only after waiting for debounce
>>> time (~100-400ms) and adding this delay in detect() is not feasible
>>> owing to the performace impact (glitches and frame drop), remove runtime
>>> calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
>>> calls, to detect hpd properly without any delay.
>>>
>>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>>>
>>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>
>>> Changelog v2->v3:
>>> - Change conditional based on no-hpd property to address [1]
>>> - Remove runtime calls in detect() with appropriate comments
>>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
>>> - Not picking up "Tested-by" tag as there are new changes
>>>
>>> v2 patch link:
>>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
>>>
>>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>
> 
> Thanks for your patch!
> 
>>> This would also require dts changes in all the nodes of sn65dsi86
>>> to ensure that they have no-hpd property.
>>
>> DTS patch is posted now:
>> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.com/>


This does not work like that. You cannot change DTS in other projects,
other users of this ABI. What's more, you cannot change old DTS, unless
you have a time machine.


Best regards,
Krzysztof
