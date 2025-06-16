Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBF328642A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750094878; cv=none; b=Dz8ZQ1gB/ceQ3xTtW2NTB1tOSfWNc2q/8aZbbvcqxnd110AwOoZLj5GIBhx/1pnTjLH9YO6LVtC2dsStK+tScpKg5Lj4XvORaoMfCRbJyV6MRHadRIjXp71b6bZCVhu0WhPH3GlLi2kvhvTSosPqPnOu49ynwkBEXw2VINNQ6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750094878; c=relaxed/simple;
	bh=LelOrep8BFhkDNPGP79ngM80BpQG1itNZ9WdpzkFM5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sd5D9PwoYxS5mXPHaUHIq+oQ7gAqfl/GO3/Lhp60dLpmjJRig7MkMEWbSfteUNGtnI39099CVGsIBVDSHgXxHuQeYiPrmvE8Rn4CdJLJg5Xm0SUsp+IoticQUQ0jsLWRA6NzVqaIh+EzT8iC+1YY+i1MkfebCKk8Gv4SnNiSpgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B2dAcbLD; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B2dAcbLD"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faff792f9bso43483286d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750094875; x=1750699675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HCyyC5UYA2b8c4IzXsIvi20Ipr0wxqzS/03kE5MqM=;
        b=B2dAcbLDn3iVHi259XWF64J5zyF9AYhh+zQcXu0SqZHfcFo/PowCm64b1vrHPMfDNE
         KpwoV7W0PGm2hGR568bByuW+tEH2kgfy00mvGQ8xEe4z3AU+7oSpeRicazcxFyUUdaHJ
         heiSH+sVKjzZQpbUpD6ue/WnUzrtFccvoAUWq9mjiSgt+uUVcJkgiBV7qYXWpopLcJvl
         PkrjrmcCd25LHtEjT0+MMJc1MW1uUGu8lQ3HCH25PRdfiI7oXWzM95FgYsNVsCfcJKPX
         jDotIWG/Li9FV6UN0g10Pr06HKGVKUvvMRdHsPtZ0Ky9Lodoy/S7jbiP6zmyu2YaYvFc
         ey2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750094875; x=1750699675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7HCyyC5UYA2b8c4IzXsIvi20Ipr0wxqzS/03kE5MqM=;
        b=gWgibb3X0eIxQDYe+LZdmKPl4/0jHQXDw8tPEKZP8oLNit0GIvTP1ukr7327wtYj4u
         kBmdAmaE1YdpETbdjQd94UDVlYaO67A2IIQhXjX4CUkA0x8jpesIHPc80C/tUqdPQOVJ
         4XWeuxAbcTS4LwOswDxX1WXPJm9GEUeKrJZrh7+PbTowdmtnOv3dOlSKjsKDlhcHR1KW
         4F9dRKdqdUOxEj7JBfUQU23x2FReqlC/mNteotnTqyvIzpIsS7EiS/zLusdDfRYxrSFa
         GP7OPqRVd+ki9dRBf2jyG2fMvEk7txI4/42Mg6byBwsqKTMS6eUvdgrLZYfbcmKdf176
         2kyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMbwRVeOJ+kOvEhmKBUfUe+Si5myoAU362MYmpvzmxQPTEp7BW/aJHcnX8JI20BieriX620O1sSr5FFPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9lLIKY4JceTJjvLsM8VVjxGL7raFp7CnzbI17Sst1RsGxZbt
	HAeY2OQAQC8tTCLrYgsrqDNUT4SAboN1XfqUGWkgM79mwhGYVJFcpQ5HcAKDy4cEB10=
X-Gm-Gg: ASbGncthBC9+wK7JceJ4ckgag9f/xcPW8uX9uSyvIrRi+XjE49j0Hxn7EMcMQm6Rgz3
	1/BwQscBIZOxc33NQ1UzErzOwQvA7TAlryg3ZuVtq9oVQnCEHPKobmB97+GGYWukynErRPLt5M0
	qKZSLKYK4P4/q9mDY/RuxADfk97qlnGHVd8fYXkaawq3vYEXJencQrImXYTM6goTp806aS4eMyt
	zbpEVNBSX9ClhM0dut/lBTTiZnCl2IkGNsf8MX0SB0XmLVmgf/Prlnr/0R4uPX8qYg03ChL0veA
	nx0CmCAxFVn0hxbILJO4yplpWnbAzvq7VE6SSj+sQQbuL6MQdi73K4IbFJAaGiSLjwDU
X-Google-Smtp-Source: AGHT+IFTR01Y6+W1geCwjaW5IfCrLepVJGWaVvo70DuFbzxcMRNcEzZhf9yE9pfFqi8vBf06mSlbhg==
X-Received: by 2002:a05:6214:20a2:b0:6fa:bf2f:41ad with SMTP id 6a1803df08f44-6fb47736bbfmr161414176d6.19.1750094875589;
        Mon, 16 Jun 2025 10:27:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c72b17sm53505016d6.102.2025.06.16.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:27:55 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:27:53 -0500
From: Gregory Price <gourry@gourry.net>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-doc@vger.kernel.org, linux-cxl@vger.kernel.org, corbet@lwn.net,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	darren.kenny@oracle.com
Subject: Re: [PATCH] cxl: docs/devices Fix typos and clarify wording in
 device-types.rst
Message-ID: <aFBUGTM4fpwU749k@gourry-fedora-PF4VCD3F>
References: <20250616060737.1645393-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616060737.1645393-1-alok.a.tiwari@oracle.com>

On Sun, Jun 15, 2025 at 11:07:32PM -0700, Alok Tiwari wrote:
>  Documentation/driver-api/cxl/devices/device-types.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
...
>  
>  A Multi-Logical Device (MLD) is a device which may present multiple devices
> -to one or more devices.
> +to one or more hosts.

This is subtly incorrect.

A *Multi-Headed* MLD presents one or more devices to one or more hosts.

A *Multi-logical Device* presents one or more devices to one or more
upstream devices (such as a switch).

You can have a Single-Headed Multi-Logical Device that presents 2
"Logical Devices" to a single upstream device (host or switch).

So please change "one or more hosts" to "one or more upstream devices".


With that change you may add

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory
