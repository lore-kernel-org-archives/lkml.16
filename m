Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90E28FFEE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150174; cv=none; b=oPbgYiRqFhZk5nHRmrvvFaK5QGKW6JvWXWx00ICw7FS3GaWjuqJszzI8Yw5JRm7xTY4AJ4oebN263Yz/aXK5yS25VsKD3YOlZ0x43oL7HJWhPOSn8w6v3tntMoKX3nqaB95XSAyLHg8xBoKAvmq/EX54NoHciVU+aBEtSbfQQ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150174; c=relaxed/simple;
	bh=Zb0FAtKn57hylXZbbwWlQKoYiVchTs5O181iCBXBun0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=SbRj811QxXJVIuiKK+EfYON8UmHAyo20e/GilmoPnD0I43TXnd+ELfNUJtl+ncUwaugw/ULh+Eg2uvj/fkWyKEIzzPMgUJQ7bDdwpA0WFUUvHegLe0y9c+el+Ik9GKSNHaQ5ZLq294ZUEGzE667oHPCQEDggcEnYWuPMpruO9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so71306955ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150170; x=1750754970;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W442XvOuTnKTzRsQQgphpGuH6koS5hmx6kx/lqAmOV8=;
        b=nlUU8Kt330xTHHHYbcmXzsW1eeHapl+Ib+zleaT4LKDag1Ybuf/O9Sv7B9kWY8Q1b0
         3bCHIHfIdQOXLcNDE/edhtqQHLeguffOWob5HZh65NRNx5QDK1/G6V0KaKb1P4/tMwZg
         5e8onz8UF+TVjeNDb/8dkHV8Yp68hds7RVwa4JcQr9r4r69z/Wm6j5J4bTEPPAFf0PQe
         o68DSxrcz8YPYOeJW6qupy2iTRtPFupc+Rmq2p2emXHRhe1LRrFcvjDdyVr2XqqEhguu
         Wfjqa8D/LyiiRFTXxT6X01Uw+m0q9KiOiueBNSCYdY7/SAkcktYrAuzVVVtx2q+i1Vs8
         IBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV/CjWS+ThVH9kwop7OFV7zma7noo2qXjXAaEEga4EMnGDCPDHIImr/PhgXqaGBKzfFvGtmJ8uJMUIADo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2U8OzTNpFsTBapKAtQNdrHr0EmzPFkl0gHTkoNDnicjZS5L9
	jQimhWqeuBE9cctVpkPTZpsqftkAgBsvtATtl4Q5jNO43vFOrupFJNAHDApC14jtJitBBPXvg9o
	pFbNLRMuOk0BozEdyViqCSoZeE2OFKQYMCsWBi6jVGuvJmz6KUeOyoyJq/n8=
X-Google-Smtp-Source: AGHT+IGvySCvRhjncevfuunYrJFN5T2vtn5B4bWW43XiuECltLl/7W0DgszhIuN7hV2wTxEYWN2zDUU5IjKQyZfhLL/drmW0e3JA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a43:b0:3dd:d653:5a05 with SMTP id
 e9e14a558f8ab-3de07d01da0mr148791545ab.3.1750150169938; Tue, 17 Jun 2025
 01:49:29 -0700 (PDT)
Date: Tue, 17 Jun 2025 01:49:29 -0700
In-Reply-To: <20250617104902.146e10919be1.I85f352ca4a2dce6f556e5ff45ceaa5f3769cb5ce@changeid>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68512c19.050a0220.2608ac.0014.GAE@google.com>
Subject: Re: [PATCH wireless] wifi: mac80211: don't WARN for late
 channel/color switch
From: syzbot <syzbot+468656785707b0e995df@syzkaller.appspotmail.com>
To: johannes@sipsolutions.net
Cc: johannes.berg@intel.com, johannes@sipsolutions.net, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> From: Johannes Berg <johannes.berg@intel.com>
>
> There's really no value in the WARN stack trace etc., the reason
> for this happening isn't directly related to the calling function
> anyway. Also, syzbot has been observing it constantly, and there's
> no way we can resolve it there - those systems are just slow.
>
> Instead print an error message (once) and add a comment about what
> really causes this message.
>
> Reported-by: syzbot+468656785707b0e995df@syzkaller.appspotmail.com
> Reported-by: syzbot+18c783c5cf6a781e3e2c@syzkaller.appspotmail.com
> Reported-by: syzbot+d5924d5cffddfccab68e@syzkaller.appspotmail.com
> Reported-by: syzbot+7d73d99525d1ff7752ef@syzkaller.appspotmail.com
> Reported-by: syzbot+8e6e002c74d1927edaf5@syzkaller.appspotmail.com
> Reported-by: syzbot+97254a3b10c541879a65@syzkaller.appspotmail.com
> Reported-by: syzbot+dfd1fd46a1960ad9c6ec@syzkaller.appspotmail.com
> Reported-by: syzbot+85e0b8d12d9ca877d806@syzkaller.appspotmail.com
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
> #syz test

This crash does not have a reproducer. I cannot test it.

> ---
>  net/mac80211/debug.h |  5 ++++-
>  net/mac80211/tx.c    | 29 +++++++++++++++++++++--------
>  2 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/net/mac80211/debug.h b/net/mac80211/debug.h
> index 5b81998cb0c9..ef7c1a68d88d 100644
> --- a/net/mac80211/debug.h
> +++ b/net/mac80211/debug.h
> @@ -1,10 +1,11 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Portions
> - * Copyright (C) 2022 - 2024 Intel Corporation
> + * Copyright (C) 2022 - 2025 Intel Corporation
>   */
>  #ifndef __MAC80211_DEBUG_H
>  #define __MAC80211_DEBUG_H
> +#include <linux/once_lite.h>
>  #include <net/cfg80211.h>
>  
>  #ifdef CONFIG_MAC80211_OCB_DEBUG
> @@ -152,6 +153,8 @@ do {									\
>  		else							\
>  			_sdata_err((link)->sdata, fmt, ##__VA_ARGS__);	\
>  	} while (0)
> +#define link_err_once(link, fmt, ...)					\
> +	DO_ONCE_LITE(link_err, link, fmt, ##__VA_ARGS__)
>  #define link_id_info(sdata, link_id, fmt, ...)				\
>  	do {								\
>  		if (ieee80211_vif_is_mld(&sdata->vif))			\
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index d8d4f3d7d7f2..d58b80813bdd 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -5,7 +5,7 @@
>   * Copyright 2006-2007	Jiri Benc <jbenc@suse.cz>
>   * Copyright 2007	Johannes Berg <johannes@sipsolutions.net>
>   * Copyright 2013-2014  Intel Mobile Communications GmbH
> - * Copyright (C) 2018-2024 Intel Corporation
> + * Copyright (C) 2018-2025 Intel Corporation
>   *
>   * Transmit and frame generation functions.
>   */
> @@ -5016,12 +5016,25 @@ static void ieee80211_set_beacon_cntdwn(struct ieee80211_sub_if_data *sdata,
>  	}
>  }
>  
> -static u8 __ieee80211_beacon_update_cntdwn(struct beacon_data *beacon)
> +static u8 __ieee80211_beacon_update_cntdwn(struct ieee80211_link_data *link,
> +					   struct beacon_data *beacon)
>  {
> -	beacon->cntdwn_current_counter--;
> +	if (beacon->cntdwn_current_counter == 1) {
> +		/*
> +		 * Channel switch handling is done by a worker thread while
> +		 * beacons get pulled from hardware timers. It's therefore
> +		 * possible that software threads are slow enough to not be
> +		 * able to complete CSA handling in a single beacon interval,
> +		 * in which case we get here. There isn't much to do about
> +		 * it, other than letting the user know that the AP isn't
> +		 * behaving correctly.
> +		 */
> +		link_err_once(link,
> +			      "beacon TX faster than countdown (channel/color switch) completion\n");
> +		return 0;
> +	}
>  
> -	/* the counter should never reach 0 */
> -	WARN_ON_ONCE(!beacon->cntdwn_current_counter);
> +	beacon->cntdwn_current_counter--;
>  
>  	return beacon->cntdwn_current_counter;
>  }
> @@ -5052,7 +5065,7 @@ u8 ieee80211_beacon_update_cntdwn(struct ieee80211_vif *vif, unsigned int link_i
>  	if (!beacon)
>  		goto unlock;
>  
> -	count = __ieee80211_beacon_update_cntdwn(beacon);
> +	count = __ieee80211_beacon_update_cntdwn(link, beacon);
>  
>  unlock:
>  	rcu_read_unlock();
> @@ -5450,7 +5463,7 @@ __ieee80211_beacon_get(struct ieee80211_hw *hw,
>  
>  		if (beacon->cntdwn_counter_offsets[0]) {
>  			if (!is_template)
> -				__ieee80211_beacon_update_cntdwn(beacon);
> +				__ieee80211_beacon_update_cntdwn(link, beacon);
>  
>  			ieee80211_set_beacon_cntdwn(sdata, beacon, link);
>  		}
> @@ -5482,7 +5495,7 @@ __ieee80211_beacon_get(struct ieee80211_hw *hw,
>  				 * for now we leave it consistent with overall
>  				 * mac80211's behavior.
>  				 */
> -				__ieee80211_beacon_update_cntdwn(beacon);
> +				__ieee80211_beacon_update_cntdwn(link, beacon);
>  
>  			ieee80211_set_beacon_cntdwn(sdata, beacon, link);
>  		}
> -- 
> 2.49.0
>
