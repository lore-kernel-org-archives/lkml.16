Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B318CC1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748855444; cv=none; b=ZMX1TXqlry87ZzSLzq3wvzZhpmdl1eq+bPcckFRI4/Tn1LewM0gNELuordMyrMeOeJhGdxJrxCT5D5XD16q/4TcAyL3ivVEVIzGY4AHnfAnBwC4M12edaiGi4pDb9w3HGTdOkXIwUIi5od0wMDpleuWLIQgX14GCdRWddJRUn68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748855444; c=relaxed/simple;
	bh=K1jqCpUlfAjL88g1hNKIPDP5Tg0z7iKn/nWwFx8Jpoo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HojnbAI4LuPTUPH9YjCrOLnyuUNRIPEHKPGbFIcxVDUmK3apCuld8BkrejViHaPPewFPKjDpWzK9sVRTz/YOrbeLiHT3aOo5TLaHqfaaVyL3YHTZt/WpsIGmzzRlD+tI9oXmG5OPKFGYpMY3Taf62vaWPpwqdH3ugMJnM+QQZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZi/4Wj/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZi/4Wj/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso40906685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748855441; x=1749460241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fz5WoLh7+2BqWFgE4Sn4NQbSlq+fXNwl5Sh5y2BFmQ=;
        b=iZi/4Wj/7PpSz/1VsrIYWp56DI4Ov+wLsuodLCg3DBqVXHoebwNy9g7KE9pwbi2R8p
         ZmG7FzGdkMKC7W5cklSRcrki5/n24C89iyvWEamK34ZnoDHfvFGpe3rFL0w3X02tohGr
         wuaA0f0mRRm9Sehje/SPSbIRTjOzhD/IW9qgnmtRobhSGCg09dhQN3Y+Sy0RpdB265HO
         xXBjd9bgW8uf5AAJexZRKdIeC7ANbFQUkjJpa1PEjqzFrwkDt3mx5qopvNIYgPN2YeTI
         RB7s8l04E1uNSPGNXpsHYX77pUHo+p+qX/fRWSuak/08UymNfzR5tZf0iyLkNgxJhREQ
         5Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855441; x=1749460241;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fz5WoLh7+2BqWFgE4Sn4NQbSlq+fXNwl5Sh5y2BFmQ=;
        b=rZu9062t6OPWRQ02SF2GcLWejYcQ+NiyI6pyeoP4pe/UhbimH5tWh4YsKzBkB2aXAW
         dfMl7t1MGdWFDQSRVI7gZ7HvFyEEzr1w22qKnJkUDIouY3G+lJ1Nhb9aW66BFRouR/So
         4tU31RB4cYO+cM2vr32MXbzF3pg8+UjQyN+wxh6CWrszW6lnbRj3PslHv7e5hbYIpjwR
         8O3FDhrOQDnob0yim31qEwHVHRzfk+AK4IzDrx6dxZGpjFpfnexq4YOT/Ivk11lKnfNi
         Jp4pyti5vQOy60B/eETCb376ofk10MZIvNioESnV3lxrQgqy37QH3dm5wvZ5deb/JUtY
         lWoA==
X-Forwarded-Encrypted: i=1; AJvYcCUYauxGDXB67qh+ejjzZiQqBWB6JGHqOT7mq9r5CxNQurPiHQiR6YfdkXiURU1oM405mVUzkRz4iGW75i8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5NbeeTdOFw4eZJpYXbb6k6hLtergeFuQHx4I+uIktsDkk/Rxs
	BfH9XvXUqUI1XLxw9B4OOTpFXx+5SPsTlgdMzAyjU8tWKoT4PylZE2hCZsuVYCT0Nzc=
X-Gm-Gg: ASbGncs8CvGZqCBMKF1LUuQSW7otK3Btvljrxyy38BiPm0N598o3K+WlbDxHwyd++Kg
	MtTE0l5uozJ2ATbN+e2oKhhKKAdwUEt1+B44chuNWhREmPxlo1c0ApGeec2DQa+7NFmGUw9IJoE
	rqLCZBxt/HYk1agRPI/K8t20PGEntudmteiLg5Pc6kB2N6guFXKfGiDU4OfL6+qimWOa0wt7KJ9
	Zf5MCSrije02ehRdPFutbCQ/SjlhgwgvomnRe4sIk1vj0JU7s4ZGL3Z4o2r8XgZnNLom7T9ohPb
	uHyfrgTaXmzISaW3LIHxwzj+cQ/Pu9RkKHrbWuLKfxZ5a+iStwahcBTZwZljpZK9uzjhKErdNQE
	+L7K6WFLcLhzmh5KjYAB4aruzxw==
X-Google-Smtp-Source: AGHT+IFgXm1kiT1/u4BnrJPjc8ieuDz8ucVyVOvChbk/+t0uNwDZBVqk29ONf2+4k4cHgunUmSrG/Q==
X-Received: by 2002:a05:600c:1c8f:b0:450:cf00:20f5 with SMTP id 5b1f17b1804b1-4511ecc2a46mr72379895e9.9.1748855440595;
        Mon, 02 Jun 2025 02:10:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:cb6:30c6:d7ab:d145? ([2a01:e0a:3d9:2080:cb6:30c6:d7ab:d145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73fbcsm14074099f8f.48.2025.06.02.02.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 02:10:40 -0700 (PDT)
Message-ID: <b5ac79e5-22d9-4929-9131-28f4396658d6@linaro.org>
Date: Mon, 2 Jun 2025 11:10:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: use per-PHY lockdep keys
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.or, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250529-phy-subinit-v1-1-b74cadf366b8@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250529-phy-subinit-v1-1-b74cadf366b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2025 23:29, Dmitry Baryshkov wrote:
> If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
> repeaters are represented as PHYs), then it would trigger the following
> lockdep splat because all PHYs use a single static lockdep key and thus
> lockdep can not identify whether there is a dependency or not and
> reports a false positive.
> 
> Make PHY subsystem use dynamic lockdep keys, assigning each driver a
> separate key. This way lockdep can correctly identify dependency graph
> between mutexes.

Nice solution !

> 
>   ============================================
>   WARNING: possible recursive locking detected
>   6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 Not tainted
>   --------------------------------------------
>   kworker/u51:0/78 is trying to acquire lock:
>   ffff0008116554f0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>   but task is already holding lock:
>   ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>   other info that might help us debug this:
>    Possible unsafe locking scenario:
> 
>          CPU0
>          ----
>     lock(&phy->mutex);
>     lock(&phy->mutex);
> 
>    *** DEADLOCK ***
> 
>    May be due to missing lock nesting notation
> 
>   4 locks held by kworker/u51:0/78:
>    #0: ffff000800010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x18c/0x5ec
>    #1: ffff80008036bdb0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1b4/0x5ec
>    #2: ffff0008094ac8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x188
>    #3: ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>   stack backtrace:
>   CPU: 0 UID: 0 PID: 78 Comm: kworker/u51:0 Not tainted 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 PREEMPT
>   Hardware name: Qualcomm CRD, BIOS 6.0.240904.BOOT.MXF.2.4-00528.1-HAMOA-1 09/ 4/2024
>   Workqueue: events_unbound deferred_probe_work_func
>   Call trace:
>    show_stack+0x18/0x24 (C)
>    dump_stack_lvl+0x90/0xd0
>    dump_stack+0x18/0x24
>    print_deadlock_bug+0x258/0x348
>    __lock_acquire+0x10fc/0x1f84
>    lock_acquire+0x1c8/0x338
>    __mutex_lock+0xb8/0x59c
>    mutex_lock_nested+0x24/0x30
>    phy_init+0x4c/0x12c
>    snps_eusb2_hsphy_init+0x54/0x1a0
>    phy_init+0xe0/0x12c
>    dwc3_core_init+0x450/0x10b4
>    dwc3_core_probe+0xce4/0x15fc
>    dwc3_probe+0x64/0xb0
>    platform_probe+0x68/0xc4
>    really_probe+0xbc/0x298
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0x3c/0x160
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x84/0xe0
>    __device_attach+0x9c/0x188
>    device_initial_probe+0x14/0x20
>    bus_probe_device+0xac/0xb0
>    deferred_probe_work_func+0x8c/0xc8
>    process_one_work+0x208/0x5ec
>    worker_thread+0x1c0/0x368
>    kthread+0x14c/0x20c
>    ret_from_fork+0x10/0x20
> 
> Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: I've used a Fixes tag pointing to the commit which actually
> started using nested PHYs. If you think that it's incorrect, I'm fine
> with dropping it.

In fact, other drivers were using sub-phys before:
./amlogic/phy-meson-axg-pcie.c
./amlogic/phy-meson-axg-mipi-dphy.c

(yeah I know, my bad !)

so it should be:
Fixes: e2463559ff1d ("phy: amlogic: Add Amlogic AXG PCIE PHY Driver")

> 
> Note2: I've tried using mutex_lock_nested, however that didn't play
> well. We can not store nest level in the struct phy (as it can be used
> by different drivers), so using mutex_lock_nested() would require us to
> change and wrap all PHY APIs which take a lock internally. Using dynamic
> lockdep keys looks like a more ellegant solution, especially granted
> that there is no extra impact if lockdep is disabled.
> ---
>   drivers/phy/phy-core.c  | 5 ++++-
>   include/linux/phy/phy.h | 2 ++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 8e2daea81666bf8a76d9c936c1a16d6318105c91..04a5a34e7a950ae94fae915673c25d476fc071c1 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -994,7 +994,8 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
>   	}
>   
>   	device_initialize(&phy->dev);
> -	mutex_init(&phy->mutex);
> +	lockdep_register_key(&phy->lockdep_key);
> +	mutex_init_with_key(&phy->mutex, &phy->lockdep_key);
>   
>   	phy->dev.class = &phy_class;
>   	phy->dev.parent = dev;
> @@ -1259,6 +1260,8 @@ static void phy_release(struct device *dev)
>   	dev_vdbg(dev, "releasing '%s'\n", dev_name(dev));
>   	debugfs_remove_recursive(phy->debugfs);
>   	regulator_put(phy->pwr);
> +	mutex_destroy(&phy->mutex);
> +	lockdep_unregister_key(&phy->lockdep_key);
>   	ida_free(&phy_ida, phy->id);
>   	kfree(phy);
>   }
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 437769e061b7030105c9ea4e9b0da9d32b6fa158..13add0c2c40721fe9ca3f0350d13c035cd25af45 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -154,6 +154,7 @@ struct phy_attrs {
>    * @id: id of the phy device
>    * @ops: function pointers for performing phy operations
>    * @mutex: mutex to protect phy_ops
> + * @lockdep_key: lockdep information for this mutex
>    * @init_count: used to protect when the PHY is used by multiple consumers
>    * @power_count: used to protect when the PHY is used by multiple consumers
>    * @attrs: used to specify PHY specific attributes
> @@ -165,6 +166,7 @@ struct phy {
>   	int			id;
>   	const struct phy_ops	*ops;
>   	struct mutex		mutex;
> +	struct lock_class_key	lockdep_key;
>   	int			init_count;
>   	int			power_count;
>   	struct phy_attrs	attrs;
> 
> ---
> base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
> change-id: 20250528-phy-subinit-42c988a12b6c
> 
> Best regards,

With the Fixes changed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
