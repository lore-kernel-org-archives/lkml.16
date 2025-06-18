Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914B13957E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259630; cv=none; b=bC5zUPu0mrjo9ZKfAdzo287h7S1eiEOblB+abAKWIz+Axnotc9PNUgLmoMfkwQyWVZ5Zb87DfZpelA9nTG1JgXFZfk5+eHzZ9wx6vP+TC6h96y5M2jpl026amKqqQenzHlfM86ey8uHQn29zZ0/6VOLxnXn7pp6t5BErxlHvHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259630; c=relaxed/simple;
	bh=Vn9iBRZx/9vbTN0sjYLHUj8pAqYVdflJQ14VCJDqr/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKh0mX6A6ESK3GyXknIHkk+kXbfrgkBoqCY37eZWi4GzE0Ornl5/hgQRCCEkuKV1GW3dIGLucYhRmLVXCrCStDzpErvfxwMVjBdcQqJO1t5i4RrbvHSwbt+lsBM+I+mckn4/Poh8twxTmAqhsHCSAJrLXoKE5lv7QR8IzDZYNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=3Hk42bHI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="3Hk42bHI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so1085346766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1750259628; x=1750864428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+F9qb0WoqT4O8g9mE9Zc/ggeTeVcLZ0CP5p+3+ztus=;
        b=3Hk42bHIdT8jPgeEuQ0o05zRHi6b+0+CdPEkcYgqnYRDXvN+FXh/R0204Ny+Ej3rEj
         2+YiWi0f4mDRssrYmSCmvzftRYaepNx7p0sQAqXEE6bk8EBaDuR1MyX7bg2oi6SbkGIt
         6dR1PbfYcTu79b5GUbyzNeaXQPFaNaM2WOmWPONcfSueOpb4PYzMH4IGyTfKnKy+1Cwm
         jLimWSFuXVv5VlOBu8wmAxBI+4lsU/MFY7JRygZRyRAlGxSgW+d7md9pEd29tBWzpwZD
         HPe8FvSfRARiJRWg4ghHwZZbsQA3QePa6mge04sdEu1Vt4u9CLXqBTAjpVVrKPotjPfj
         3/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259628; x=1750864428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+F9qb0WoqT4O8g9mE9Zc/ggeTeVcLZ0CP5p+3+ztus=;
        b=oG/8Jk6pYO8EE2CIylwlYWap6Es8fFAieQGLsJmzxJrdcPsWr/IWETI61ZHavSn8yr
         tZpvFCCKxsCFK4A9TDuWDWPn3TkhnDPyc1QlEXohSeA9IX0pttpJ4/gtBhfoJQIgsAr+
         TzrrthIw0RmdD9fTg71WfRHANJF5VV+nvpFu8QsVDhuwje07OezDmZtNMTKBDUvnNi69
         1C/NKlwwvwB3sMF/0EN8sYwrvnEdduuKwYc+FU7nEJ3jPYYpL0icrhQ+hNvr0zKCyp+r
         776Yxmz2Kqe+JVzQ3NzGpN7lutzHDRTFjlGCBh/EiU8KZy4cFRQf85yI+mBxqr0IF0EI
         o5+A==
X-Forwarded-Encrypted: i=1; AJvYcCU2bQ8jZFEKJBJPp+jD0d0pIpEVjyMOcG+NwG1Q9EGzZPtMK1R5eRi5FSIu5yPJusQk/cE/mCOjtkf3eI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWZFkYzcq+EetYhchfOZpzUPQBcKExgAE0RJI2i4Fn7vUjCIT
	WPkwgwpsuhJsvC98yXqVFB0MB4t1Qbi0YRx9h1UKTlu328EJWXobGElPRcy3yIlZ4Mg=
X-Gm-Gg: ASbGnctaTZbz/RtCUI3JdnpyRezV8Rj2Ul/tVhfgOSsfl4lnx+bI4he1u4YjWQFv2DE
	e8yVDAbKQAmtPsSWEftmTMiz0HmEN0NpCxFKAHOiSOiOSCpTAUobxaMRo4ftctBsfq0fb//gdZM
	GjaaCf8E/hRV25WAR0bv09+d58d7ZMtja0R+vngd8x6kN77kUYYLbuoLMZTPIJ4qklJRQllSdZE
	nJyFkYFMiltkmb89wteLImRDVZ0li1BYzwz7E3F8ce/vYxfxyb6XXOiU1zGHFNX44JNnc5NU4o2
	bhyRXtKM/dTxHnSE/W8Iqxw+a4m/p29FbiYr72BD6zGVOW4ECLU0Bbau82svGv4/N4Po15yIBcV
	jhZNSUS/cXFa13vORVw==
X-Google-Smtp-Source: AGHT+IFP5VYYTJdfIK01Sjykg0ObgRPDVxQKO2zjJ45JW2hF+daM15wGjp6eoU5BXmzHVJq/enFDkw==
X-Received: by 2002:a17:907:3c94:b0:ad5:5210:749c with SMTP id a640c23a62f3a-adfad3cda7dmr1548731566b.22.1750259627178;
        Wed, 18 Jun 2025 08:13:47 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe907sm1076757366b.93.2025.06.18.08.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:13:46 -0700 (PDT)
Message-ID: <82caca13-7970-4f44-a68f-1efcf3e9a0f9@blackwall.org>
Date: Wed, 18 Jun 2025 18:13:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 2/6] vxlan: drop sock_lock
To: Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, skalluru@marvell.com, manishc@marvell.com,
 andrew+netdev@lunn.ch, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com,
 somnath.kotur@broadcom.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, tariqt@nvidia.com, saeedm@nvidia.com,
 louis.peens@corigine.com, shshaikh@marvell.com,
 GR-Linux-NIC-Dev@marvell.com, ecree.xilinx@gmail.com, horms@kernel.org,
 dsahern@kernel.org, shuah@kernel.org, tglx@linutronix.de, mingo@kernel.org,
 ruanjinjie@huawei.com, idosch@nvidia.com, petrm@nvidia.com,
 kuniyu@google.com, sdf@fomichev.me, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 oss-drivers@corigine.com, linux-net-drivers@amd.com,
 linux-kselftest@vger.kernel.org, leon@kernel.org
References: <20250616162117.287806-1-stfomichev@gmail.com>
 <20250616162117.287806-3-stfomichev@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250616162117.287806-3-stfomichev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 19:21, Stanislav Fomichev wrote:
> We won't be able to sleep soon in vxlan_offload_rx_ports and won't be
> able to grab sock_lock. Instead of having separate spinlock to
> manage sockets, rely on rtnl lock. This is similar to how geneve
> manages its sockets.
> 
> Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>
> ---
>  drivers/net/vxlan/vxlan_core.c      | 35 ++++++++++++-----------------
>  drivers/net/vxlan/vxlan_private.h   |  2 +-
>  drivers/net/vxlan/vxlan_vnifilter.c | 18 ++++++---------
>  3 files changed, 22 insertions(+), 33 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

