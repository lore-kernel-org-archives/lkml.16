Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081D23B617
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142707; cv=none; b=Y3zWUHvQp0n0LERtVzohjj3s1oW8c/4H+9Rt6VOKJNIn55cLLW68V78M0H94VIRV7HQkFoaOgd1xNDwCBtEKAHk2DBaYKcCNOsfztvsffkvv54Ny+CqkjihTXekn9JO1sg5vOGwsh7kh1lPnwItGVqUlNiuE31FyAcBBMoYm3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142707; c=relaxed/simple;
	bh=DmsFAMmtpwmVgGx0Je0RRiWM3vNYCnbSc2OP4t62jY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/PV38fQzDhFO3uhZMNycbiMKS0i5MBLIiP6TSCBGGW5/keJECW7PI0UHRUfsHbDnGWWSZuV8t/1DO32q+Kwl94PJ9yXASdGfmdvmG22fqSvBrH2VbBAJYWL0MuIwXI66Pgy+EU+ysav1OCPmpokAzLtGmSl/nI3dvTSoHagHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20230601.gappssmtp.com header.i=@morsemicro-com.20230601.gappssmtp.com header.b=uK6QdXUu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20230601.gappssmtp.com header.i=@morsemicro-com.20230601.gappssmtp.com header.b="uK6QdXUu"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3139027b825so3729736a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20230601.gappssmtp.com; s=20230601; t=1750142705; x=1750747505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPhKJcx1HOF+kVcJCSO2cUU7Mi6rJoKJ/MYl26SUTME=;
        b=uK6QdXUuHMHCIN/ZKWR6DA9RZJWuwtdkcBIaR5HLmErigFo0/gcp/x7cSVVPUHhnye
         64ZKXvcHR3I0tS5CMIMXSzSZEgHNQEnGdG9oAjTOfTVDnKEp6BcAkqkupFy8jUs0U7CO
         T9O7NcVkUXel2YdmyPMvzAWQj3ubykrqbbZ38n5tvO4kwnby0vYzkyJpcqMuJ0V1SdSE
         LKEznsMQRo0jXYDfU3dd92tqE25NLhZTv5Rf8xiWFZCoHysWhb7MWRSDJkQFEDva/TxR
         00NAL+SUlwc2C7VNoiNW8dcxjaIBvxGBOv7A93Xbrw6uLWPrdtmz6exi5p4Q3y/7H08s
         xlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750142705; x=1750747505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPhKJcx1HOF+kVcJCSO2cUU7Mi6rJoKJ/MYl26SUTME=;
        b=VE2d+EgCKIDin3wNZWkvklJoPc5LJRUFmlkk3HyN9anfmRiPGivM4qoBKj5FNNahus
         KMTJO1l2qc6vdXUnAF+/6sMysv91nCQp6C489PUW4eF7+yrSBIq8k8skuLE8itYCe9Dm
         oC7kebVZyzHffPtHD9WTuI+KEEkIpsV/tDiLGByUq1if5C2akIq86i1QqCEHbxXD1BQf
         cHuPFzAfuWQPs8nG/vp0Cjq7y9QRNSn+Rur66AGgGYOthB03Ex602zu59P4Y7unEbyTB
         pxvgPnoUr338Emup7lieM4lrb7p0t8b9HENwDQtvsIVr/me183yr6+5WN2qwErHiB6WL
         +mKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwN51NH/yjWMgN3oo2+Z9DufFsZrPZ4SSGBZkSI5TDVyTyNd4LbjcEDgohDVMjVdMBCuYq5G7VwKBcEoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjWA7ExDdOHt3REzT9jcDH1KDK9k3h6Dj3sy/c2SazmCXTN26
	Hb0ZZLvXDhiZvU3yL/MYXDe59L18shVzoomESLLJ00dAyyfbE+JspVGFZkfEZiEpwhs=
X-Gm-Gg: ASbGncuchoIDRDy3JS/X12tMew0qlDFBiuRS6aRcs63ZMgID728a1v8xPzY+Hsw6Z+I
	6MN8nmp3JlvGE6gGUX9TI/e1otUZ10wf8NSiIrEugJVFBgb27R15DHBXPLgb+1tlFmxFpx7zD9e
	hF5gVwlli0zzRdqtadmnrBMDp7Lvrug2J+mg+3I5mYYsqYR9Slqj/7FsisoQ1Sb5UmN0NCeY+yY
	CCN6k2WIJccr7nO0eMZ+H8knf+QYShCFa4c+koz4j7hsSC5oblzek/rw8WicEmFRAt4fJrkuscA
	MFJnHNdI3q0iWPhCsA1z3UUfrKSwduSZ0OY3YXXAH4PvnTCw+vx+MmWBxUK0AkEoK1jADk0jTEA
	sNvTz0yzv1fhMLr9xV0YtkFj/mMY=
X-Google-Smtp-Source: AGHT+IEATTpuKdcXig3oDT5wGm1UAKIfH7oDvB2ZRnI/l3M4zOj0TS7tCEQdOdxUzUi1sdk/zyE10g==
X-Received: by 2002:a17:90b:2fd0:b0:313:33ca:3b8b with SMTP id 98e67ed59e1d1-313f1cc4bfcmr21367380a91.9.1750142704951;
        Mon, 16 Jun 2025 23:45:04 -0700 (PDT)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb887csm72372915ad.192.2025.06.16.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 23:45:04 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:45:02 +1000
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com, 
	johannes@sipsolutions.net, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] wifi: mac80211: fix oob in ieee80211_rx_mgmt_beacon
Message-ID: <7cgt3pqpucb6glnmvjzymfisc23i5lcnc5vulaxfenkfe7tqmh@epuecpytt4sf>
References: <68504add.a70a0220.395abc.01e7.GAE@google.com>
 <tencent_8DCFF079526DB42E796E5095C0E8E2EE1E0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8DCFF079526DB42E796E5095C0E8E2EE1E0A@qq.com>

On Tue, Jun 17, 2025 at 12:41:33PM +0800, Edward Adam Davis wrote:
> According to ieee80211_s1g_optional_len(), it can be clearly seen that the
> maximum size of variable is 4 and it is an array. Based on the above, the
> parsing of the frame control field and optional field is optimized.

Hi,

This is incorrect according to IEEE80211-2024 9.3.4.3. In addition, the 
undefined behaviour reported by the bot due to using zero length arrays
rather then variable length arrays already has a patch submitted by
Johanes - please see:

Link: https://patchwork.kernel.org/project/linux-wireless/patch/20250614003037.a3e82e882251.I2e8b58e56ff2a9f8b06c66f036578b7c1d4e4685@changeid/

lachlan
