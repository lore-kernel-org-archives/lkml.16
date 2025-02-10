Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17772528F5
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197505; cv=none; b=YbeSevWM5gW/bQRhKuoVaTbYmGAx+an5vcVL6QhISxHQfROB7Bh+xNRU8KQp2I2ug4LNtDh9NCrxCnF7kJM6YzBOvwZyGp6Afz06OH5Zi9fb7OEDjwuYeawjqtQrobj8oQ3XjXOc8/i7o8P6n04bMaDXeuJDJjlFesq6jFgMq4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197505; c=relaxed/simple;
	bh=h/IeOjVjoaRW9UO+T/EW60chDB0NewpW4cEEkREsLNg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iFBG+2+ReT5eceWlJ2BcJHfSgTvRgN0awh/RfOMZ5xHWmBHi+WxVHJ88PpIERm9SN8dJRVhruWSGdA1oSlgkTXC02dx/OcOO5JPYG/IsbUYe5+jrUeoYZxGoc6sQut0xVk8KcBXvnXBLXi4tMqxPhXtW93gsLN4+82fnD42ZRcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fn2rC5BX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fn2rC5BX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739197502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJKAhez1m+doD7I3EvCb7e/nWawQQdthz4duC3Ig2gI=;
	b=Fn2rC5BX3crJvMIXvmiRwTYRLWgySjsgiszv8q+9mEXXWDcQi1/uvA2XyjSJeaaPoBI5Hb
	GnYrBolU1tin80W+vgil/GRHLkxmN6/BnJRKQqLXu/ux2b7wRFmRUoPV5HFUB1F8AnxvJB
	r3FbJY0UcJCqsUA1XAEjZb1Umb8TjPA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-tK1r1HY9O0av-8f8rD1RWA-1; Mon, 10 Feb 2025 09:25:01 -0500
X-MC-Unique: tK1r1HY9O0av-8f8rD1RWA-1
X-Mimecast-MFC-AGG-ID: tK1r1HY9O0av-8f8rD1RWA
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c06607d3cbso51484085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197501; x=1739802301;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJKAhez1m+doD7I3EvCb7e/nWawQQdthz4duC3Ig2gI=;
        b=JxrYby3I/vzcKaKJYGlTcmwDM5EWvtAbxpTlQZrbor5nqVpIw4lqEc85JY//rXn4nQ
         kUuEZY+rUE8WvWbspCX8IRn9gVYhkjCub5izeh0MfmqzOKIzqrIAv5QB7DIJ82bNufrA
         K9DkuGAa70Ds1G2TaDwTdVRwTBaV1UC6o3vUiGdW2HNfxBflNfyiHlJ9mr+xPESBJMVO
         sr3JcuDZ2Sf0Q2+nNv1URYkPuqZMiTRrinjVAPG4YyFs63um33ywsuRpltyVN6maxOXq
         Y73aMwAHTwjxScu73qPZVp7x2/ODeRsQN1yiL2+LxzEwaPTOFlcWaSITe1jWeME8CQmJ
         uRLg==
X-Forwarded-Encrypted: i=1; AJvYcCVvsdGLSM3X21M3QEYMfagGs0sOJxNP3mFgNm+KFqqqq70EX9de9dOne5L/yg6mc3K/YoRsZs9js57alQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcsQeQR5rX2hDrhzanztbmbmM+h6ZGHGMdsGiKKtpDlOp95Gm
	IP/QR4lhb4X0vcp8k6482qiYIOtuV5g3QXaEoURMHQhCpd+sQTr9NzVIJAH/sa2FCVbD5NvJPgp
	zaXPrlVokwr8pu6EL2z7eHrHan3OjWwOWoy6lqLlF+HDqxFLEgS5Bes9JEHUcug==
X-Gm-Gg: ASbGncsZ/6K+gSJV4xgMVVbneuLhh8/KPqEkUxMEEyO3UxW329GF5M0jEqqK2w9O5Qh
	ZBiNwleJr8GB78MbkSoRa9ujSOffyuE/IvU6sdqeY8GGyx1rdSXecXDUcHiMGGcxjUoQxOwriku
	GcobBWiNlgvcZxGwUmVugtmTf3TKGC7CdPSogrxNNOJKy3pceQsWJ16nxT+Td2q4tUTEC27buyz
	8CDnt2caZMnl+lEm4xkSjBfIqR3+W0bqXmZ5Yqf05aK/HbwbDp0va8/r7h9dtO5qfWlu4QUB7Lt
	usDPoLlI7iLZ7GyOacETUFeNubG/uQ13UY+62K/p83IDHrnK
X-Received: by 2002:a05:620a:f06:b0:7b6:d6e5:ac62 with SMTP id af79cd13be357-7c047ba4f0dmr2335283785a.6.1739197500752;
        Mon, 10 Feb 2025 06:25:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi1LDEGhl8HBhMnW/YOmoweay5RpS4GhVIXoghEw/b5IHkSc7fOdBQnaiK6z1BtHDDgSyvdQ==
X-Received: by 2002:a05:620a:f06:b0:7b6:d6e5:ac62 with SMTP id af79cd13be357-7c047ba4f0dmr2335280185a.6.1739197500434;
        Mon, 10 Feb 2025 06:25:00 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0564ad890sm251294685a.109.2025.02.10.06.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:24:59 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <3008ca8d-e599-437b-8f1e-0dbe86202f38@redhat.com>
Date: Mon, 10 Feb 2025 09:24:58 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be
 truncated writing between 4 and 5 bytes into a region of size between 0 and
 15
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <202502101253.TDZbCYh6-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202502101253.TDZbCYh6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/25 11:44 PM, kernel test robot wrote:
> Hi Waiman,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a64dcfb451e254085a7daee5fe51bf22959d52d3
> commit: 925da92ba5cb0c82d07cdd5049a07e40f54e9c44 rcu: Avoid unneeded function call in rcu_read_unlock()
> date:   3 years, 5 months ago
> config: sparc-randconfig-r122-20240116 (https://download.01.org/0day-ci/archive/20250210/202502101253.TDZbCYh6-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101253.TDZbCYh6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502101253.TDZbCYh6-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     net/8021q/vlan.c: In function 'vlan_ioctl_handler':
>     net/8021q/vlan.c:253:46: warning: '%i' directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
>       253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
>           |                                              ^~
>     In function 'register_vlan_device',
>         inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
>     net/8021q/vlan.c:253:42: note: directive argument in the range [0, 65535]
>       253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
>           |                                          ^~~~~~~
>     net/8021q/vlan.c:253:17: note: 'snprintf' output between 3 and 22 bytes into a destination of size 16
>       253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     net/8021q/vlan.c: In function 'vlan_ioctl_handler':
>>> net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be truncated writing between 4 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
>       241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
>           |                                              ^~~~
>     In function 'register_vlan_device',
>         inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
>     net/8021q/vlan.c:241:42: note: directive argument in the range [0, 65535]
>       241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
>           |                                          ^~~~~~~~~
>     net/8021q/vlan.c:241:17: note: 'snprintf' output between 6 and 22 bytes into a destination of size 16
>       241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +241 net/8021q/vlan.c

Why me? I have never touched net/8021q/vlan.c and I don't believe commit 
925da92ba5cb ("rcu: Avoid unneeded function call in rcu_read_unlock()") 
has anything to do with the snprintf format warnings.

Regards,
Longman

